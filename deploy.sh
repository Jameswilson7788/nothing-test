set -e
npm run build
cd dist
git init 
git add -A
git commit -m 'deploy'
git push -f https://github.com/Jameswilson7788/preview-test.git master:gh-pages
git push -f https://github.com/Jameswilson7788/preview-test.git master
cd -