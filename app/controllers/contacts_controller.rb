class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    if params[:back]
      @contact = Contact.new(contacts_params)
    else
      @contact = Contact.new
    end
  end

  def confirm
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
  end
  
  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      # DIVE04課題にて新規追加：トップに遷移して問い合わせメッセージを表示。
      redirect_to root_path, notice: "問い合わせしました"
      ContactMailer.sendmail_contact(@contact).deliver
      # DIVE04課題にてold化：一覧画面へ遷移して"問い合わせしました"とメッセージを表示します。
      # redirect_to new_contact_path, notice: "問い合わせしました"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end
    # dive15ajax
    # respond_toは、クライアントからの要求に応じてレスポンスのフォーマットを変更します。
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました。' }
        # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
      end
    end

  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end

end
