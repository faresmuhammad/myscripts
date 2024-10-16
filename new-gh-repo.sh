#!/bin/bash


owner="faresmuhammad"

public='false'
private='true'
remote='true'
add_files='false'
commit='false'
commit_message="First Commit"

usage(){
	echo "Usage - Creating new local git repository and github remote repository"
	echo "Options:"
	echo "-h, --help      Show breif help"
	echo "-n, --name      Define the name of remote repository e.g. test-laravel"
	echo "--private       Specify the remote repository as a private one [Default]"
	echo "--public        Specify the remote repository as a public one"
	echo "--no-remote     Don't create a remote repository"
	echo "--add           Stage all the file in the local repositpry"
	echo "--commit        Commit the satged files"
	echo "--m-commit      Define the commit message [Default: First Commit]"
}

while test $# -gt 0; do
	case $1 in
		-h | --help)
			usage
			shift
			;;
		-n | --name)
			shift
			repo_name=$1
			shift
			;;
		--private)
			private='true'
			public='false'
			shift
			;;
		--public)
			public='true'
			private='false'
			shift
			;;
		--no-remote)
			remote='false'
			shift
			;;

		--add)
			add_files='true'
			shift
			;;
		--commit)
			if [ $add_files ]
		       	then
				commit='true'
			fi
			shift
			;;
		--m-commit)
			shift
			commit_message=$1
			shift
			;;
		*)
			echo "Unsupported flag"
			echo ""
			usage
			shift
			;;
	esac
done

echo "Summary:"
echo ""
echo "Repository Name: $repo_name"
if $private
then
echo "Private: $private"
fi

if $public
then
echo "Public: $public"
fi

if $remote
then
echo "Remote Repository: https://github.com/$owner/$repo_name.git"
fi

create_local(){
	echo "Creating Local Git Repository"
	git init $PWD

	echo "Renaming the default branch to main"
	git branch -M main                        
	echo ""
}




create_remote(){
echo "Creating Remote Repository"
if $private
then
	gh repo create $repo_name --private
else
	gh repo create $repo_name --public
fi

git remote add origin "https://github.com/$owner/$repo_name.git"

echo ""
}

add_commit(){
echo "Staging an commiting"
if $add
then
	git add --all
fi

if $commit
then
	git commit -m $commit_message
fi
echo ""
}

read -r -p "Are you sure? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    create_local
    create_remote
    add_commit
else
    exit 0
fi










