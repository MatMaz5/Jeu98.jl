include("mvt_cartes.jl")
include("tests_anti_erreurs.jl")

# using Random
# using JLD
# /-> Déjà dans mvt_cartes.jl donc pas besoin de les rappeler ?

# Création des mains des joueurs (et de la pioche par extension) :
function distribution(paquet::Paquet)
    joueur = Paquet(Carte[])
    for i in 1:5
        joueur = push!(joueur, pop!(paquet))
    end
    joueur
end


# Mise en place du jeu "98" :
function mise_en_place(nb_jr)
    Jeu_98 = Dict()
    Jeu_98["pioche"] = shuffle!(Paquet52())
    Jeu_98["defausse"] = Paquet(Carte[])
    Jeu_98["compteur"] = Ref(0)
    if 2 <= nb_jr <= 5
        for i in 1:nb_jr
            Jeu_98[i] = distribution(Jeu_98["pioche"])
        end
        println("Nombre de joueurs correct. Lancement du jeu.")
    else
        println("Nombre de joueurs incorrect. Veuillez changez.")
        nb_jr = nombre()
    end
    Jeu_98
end

Jeu_98 = mise_en_place(4)