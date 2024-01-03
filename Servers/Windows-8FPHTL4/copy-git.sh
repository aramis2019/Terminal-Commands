

### PriceMaster main
cd d:/Projects/bitbucket.pal.com/PRIMA/main
git status
git pull

#git remote add gitlab-docker http://localhost:1095/broadridge/prima/main.git
git push --set-upstream gitlab-docker --all


### PriceMaster infrastructure
cd d:/Projects/bitbucket.pal.com/PRIMA/infrastructure
git remote add gitlab-docker http://localhost:1095/broadridge/prima/infrastructure.git
git status
git push --set-upstream gitlab-docker --all
git pull


### DQ main
cd D:/Projects/bitbucket.pal.com/DQ/main
git status
git pull
#git remote add gitlab-docker http://localhost:1095/broadridge/dq/main.git
git push --set-upstream gitlab-docker --all

