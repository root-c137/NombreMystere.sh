#!/bin/bash 

Title="\n\n========== PLUS OU MOINS ==========\n\n"
Menu="JOUER (1)\nQUITTER (2)\n"


Game() {
  clear
  vie=10
  proposition=0
  nbMystere=$(( (RANDOM % 100) + 1))
  
  while [ "$vie" -gt 0 ] && [ "$proposition" != "$nbMystere" ]; do
	  printf "# Il vous rest ${vie} vies"
	  printf "\n# Quel est le nombre mystère (entre 1 et 100 inclus) ?\n"
	  printf "Proposition  : "
	  read proposition

	  if [ "$proposition" -lt "$nbMystere" ]; then
		  printf "\n====== C\'est plus ! ======\n"
	  elif [ "$proposition" -gt "$nbMystere" ]; then
		  printf "\n====== C\'est moins ! ======\n"
	  else
		  clear 
		  printf "\n\n========== GAGNÉ !!! ==========\n\n"
		  printf "# Le nombre mystère était bien : ${nbMystere}"
		  Menu
	  fi
 
	  vie=$(($vie - 1))

  done

  printf "\n\n========== PERDU !! ==========\n\n"
  printf "# Le nombre mystère était : ${nbMystere}"
  Menu
}

Menu(){


printf "$Title"
printf "$Menu"

choix=0
while [ "$choix" != 2 ]; do
	printf ": " 
	read choix

	if [ "$choix" == 1 ]; then
	  Game
	elif [ "$choix" == 2 ]; then
	  echo "Ok au revoir !"
	else
	  echo "C'est 1 ou 2 hein (pas compliqué)..."
	fi
done
}


Menu
