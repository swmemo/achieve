class Poem < ActiveResource::Base #ActiveRecord::Baseから変更する
 # ただし5月14日作業時ではまだ下記URLは機能していないrails c
 self.site = "https://shielded-peak-10512.herokuapp.com/"
end