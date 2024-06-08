rm -rf $HOME/.cache/coursier
rm -rf $HOME/.cache/metals
rm -rf $HOME/.metals

rm -rf $HOME/.local/share/coursier
rm -rf $HOME/.cache/bloop
rm -rf $HOME/.cache/scalacli
rm -rf $HOME/.sbt
rm -rf $HOME/.scala_history
rm -rf $HOME/.g8
rm -rf $HOME/.ivy*
rm -rf $HOME/.bloop
rm -rf $HOME/.local/share/bloop
rm -rf $HOME/.bsp

rm -rf $HOME/.local/share/Trash/files/coursie*
rm -rf $HOME/.local/share/Trash/files/bloop
echo "Cleans Code"
rm -rf $HOME/.config/bloop
rm -rf $HOME/.config/Code
rm -rf $HOME/.config/Code/CachedExtensionVSIXs/scalameta*
rm -rf $HOME/.local/share/Trash/files/.vscode/extensions/scalameta*
rm -rf $HOME/.config/Code/CachedExtensionVSIXs/scalameta*

rm -rf $HOME/scala/cs/

#Remote VSCode extensions, lauch with code --extensions-dir <dir> to have full control over the location of your extensions
rm -rf $HOME/.vscode
