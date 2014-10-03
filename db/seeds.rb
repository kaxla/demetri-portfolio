@editor = User.create(email: "editor@editor.com",
                      password: "password",
                      password_confirmation: "password",
                      role: "editor")

@author = User.create(email: "author@author.com",
                      password: "password",
                      password_confirmation: "password",
                      role: "author")
@published = Article.create(title: "The more you ignore him the closer he gets",
                         body: "love, Morrissey",
                         author_id: "1",
                         published: true)

@unpublished = Article.create(title: "there is a light that never goes out",
                           body: "you just lost the morrissey game",
                           author_id: "2",
                           published: false)
