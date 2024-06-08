
mkdir $HOME/scala/cs
cd $HOME/scala/cs

if [ -f ./cs ]; then
  echo "Taking a backup of coursier to: cs.$(date +%F)"
  mv cs "cs.$(date +%F)"
fi


#Main download site
curl -fL "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" | gzip -d > cs

#Workaround because of lacking library
#curl -fL "https://github.com/coursier/launchers/raw/5bdab238b9286cca183e162e860b193220deae4a/cs-x86_64-pc-linux.gz" | gzip -d > cs
chmod u+x cs
./cs setup

#Set ThisBuild / scalaVersion from sbt shell 
#sbt:foo-build> set ThisBuild / scalaVersion := "3.2.2"
#sbt:foo-build> scalaVersion

cs install bloop
#cs install sbt-bloop

# cs install scala:3.2.2 scalac:3.2.2
# cs install sbt:1.8.2

cs install scala:3.3.3 scalac:3.3.3
cs install scala:3.4.1 scalac:3.4.1
cs install sbt:1.9.9
