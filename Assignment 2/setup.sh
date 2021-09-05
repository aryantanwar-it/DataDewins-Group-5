if  [ ! -d "/root/bin" ]
then
	cd ~
	mkdir bin
	cd ~/bin
	touch setup.sh
fi

if [ ! -d "/root/data" ]
then
	cd ~
	mkdir data
fi

if [ ! -d "/root/tmp"  ]
then
	cd ~
	mkdir tmp
fi

cd ~/data/
touch packages.list
printf 'vim\ngtypist\nmdp\ngit\n'>packages.list
touch users.list
printf 'user1\nuser2\nuser3\n'>users.list

apt-get update
file="packages.list"
package=$(cat $file)
for pack in $package
do
	apt-get install $pack -y
done

if [ "$EUID" -eq 0 ]
then
	file1="users.list"
	user=$(cat $file1)
	for us in $user
	do
		k=$(grep -c $us /etc/passwd)
		if [ $k -eq 0 ] 
		then 
			useradd -m $us
		fi
	done
fi
if [ "$1" = "help" ]
then
	echo "help for $0"
fi

if [ "$1" = "suid_audit" ]
then
	cd ~
	lis=$(find . -perm /4000)
	cd ~/tmp/
	touch suid_audit.txt
	echo "$lis" >suid_audit.txt
fi
