#! /bin/zsh

#Automatic Project Creator.


echo "Welcome! ---- ---Create a Project"
#Your Github Accesstoken

export GITHUB_TOKEN="YOURGITHUBACCESSTOKEN"


echo "Enter the project name: "

read project_name

mkdir $project_name

echo "Hurray! ------>>>>>> $project_name Project Created"

cd $project_name

echo "Do you want to add README.md file: "

read READMEYESNO

case "$READMEYESNO" in
    [yY] | [yY][eE][sS])
    touch README.md
    echo "Add a Starting Description:"
    read Description
    echo "$Description" >> README.md
    ;;
    [nN] | [nN][oO])
    ;;
    *)
    echo "Please Enter Yes or No"
    ;;
esac


echo "Do You Want to intialize a git repository & push code ? : "

read GITYESNO

case "$GITYESNO" in
    [yY] | [yY][eE][sS])
    git init 
    touch .gitignore
    git add .
    git status
    echo "Your First Commit Message : "
    read Commit
    git commit -m $Commit
    echo "Do you wanted your repositiory to be private ? true or false :"
    read Private
# GITHUB_TOKEN is ACCESSTOKEN
    curl -u $GITHUB_TOKEN:x-oauth-basic https://api.github.com/user/repos -d '{"name":"'"$project_name"'","description":"'"$Description"'","private":'"$Private"'}'
    git remote add origin git@github.com:USERNAME/$project_name.git
    git branch -M main
    git push -u origin main
    echo "Git & GitHub Repo's Created"
    ;;
    [nN] | [nN][oO])
    ;;
    *)
    echo "Please Enter Yes or No"
    ;;
esac


#Configure your ssh key & merge with the Github ssh keys in settings.


echo "DONE -------------GOOD TO GO"

tree .




