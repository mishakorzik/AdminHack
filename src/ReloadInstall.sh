clear
sleep 1
echo Reinstalling tool.
rm -rf python2
rm -rf ncurses-util
sleep 1
echo Reloading AdminHack
pkg install python2
python2 AnimationLoad.py
sleep 1
cd
cd AdminHack
rm -rf README.md
rm -rf LICENSE
sleep 1
echo Installing packages...
pkg install ncurses-util
pkg install toilet
sleep 1
echo Reloading succesfull!
toilet -F gay Done

