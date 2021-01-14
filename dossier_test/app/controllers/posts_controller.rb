class PostsController < ApplicationController
  def index
#AFFICHAGE DE TOUT LES POSTS http://localhost:3000/posts
    @posts = Post.all
  end
  
  def show
#Permet de récupérer l'article (Post.find) et lui demander de récupérer le posts qui correspond au paramètre qui est passé (params[:id]) http://localhost:3000/posts/4
    @post = Post.find(params[:id])
  end
  
  def edit
#Récupération de nos articles pour les éditer (edit.html.erb) http://localhost:3000/posts/3/edit
    @post = Post.find(params[:id])
  end
  
  def update
#Une fois le post valider (avec edit.html.erb), nous sommes renvoyer vers la page update.
#Mais d'abord il faut récupérer le post que nous voulons modifier puis utiliser la méthode update
    @post = Post.find(params[:id]) 
#Permet de voir ce qu'il y a dans params
    #puts "€" * 60
    #puts params.inspect
    #puts "€" * 60
#permet de verifier les infos de post
    #puts "$" * 60
    #puts params.require(:post).inspect
    #puts "$" * 60
#Authoriser manuellement les champ que l'on veut accepter et les inspecter (permitted: true au lieu de false comme les 2 exemples ci dessus.)
    #puts "£" * 60
    #puts params.require(:post).permit(:author, :content).inspect
    #puts "£" * 60
#une fois ces paramètres autorisés, et le POST MODIFIER on peut les envoyer au model c'est OK!
    puts "%" * 60
    #post_params = params.require(:post).permit(:author, :content)
    #@post.update(post_params)
    @post.update(the_method_post_params)
    puts "%" * 60
#Une fois celà fait on redirige le user vers la page de tout les posts (index) (@posts) grâce redirect_to + un paramètre(URL)
    redirect_to posts_path
  end
  
  def new
#http://localhost:3000/posts/new
#créer un formulaire vide
    @post = Post.new
  end
  
  def create
#permet de créer un nouveau post (via le formulaire qui ce trouve dans la view new) Attentoin de NE PAS se répéter, donc on créer un méthode qui peut faire la même opération que "post_params = params.require(:post).permit(:author, :content)"
    post = Post.create(the_method_post_params)
#Rediriger vers la page du post qui viens d'être créé.
    redirect_to post_path(post.id)
#http://localhost:3000/posts/12
  end
  
  def destroy
#Récupère le post au fonction du paramètre qui est passé!
    @post = Post.find(params[:id])
#Puis on le détruit dans la BDD
    @post.destroy
#Ensuite le rediriger vers ma page index
    redirect_to posts_path
  end
  
#Attentoin de NE PAS se répéter, donc on créer un méthode qui peut faire la même opération que "post_params = params.require(:post).permit(:author, :content)"
  private

  def the_method_post_params
    params.require(:post).permit(:author, :content)
  end
end






















