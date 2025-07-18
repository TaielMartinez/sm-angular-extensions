echo "-Borrando dist"
# Borra el paquete existe
del *.vsix

echo "-Update version"
node updateVersion.js

echo "-Generando paquete"
vsce package

echo "-Publicando npm"
npm publish --access public

echo "-Publicando azure"
vsce publish

cd ..
echo "Subiendo a git"
git add .
git commit -m "Sync"
git push
