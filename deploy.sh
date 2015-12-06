echo "Deploying public folder..." 

echo "Generating theme with url" 
hugo -b http://albertoimpl.com -t crisp

echo "Copying public folder to the github.io one"
cp -R public/  ../albertoimpl.github.io

cd ../albertoimpl.github.io
git add -A
git commit -m "Deploying public folder"
git push origin master