#! /bin/bash
# msg=${1}
# if [ "${msg}" = "" ]
# then
#     echo 'WARN:   ============提交备注没写==========='
#     exit -1
# fi
# echo '==================》   git add . (cxl)'
# git add .
# echo '==================》   git ci -m "'${msg}'"(cxl)'
# git ci -m "${msg}"
# echo '==================》   git co dev'
# git co dev 
# echo '==================》   git pull (dev)'
# git pull
# echo '==================》   git merge cxl'
# git merge cxl
# echo '==================》   git push (dev)'
# git push
# echo '==================》   git co cxl'
# git co cxl
# echo '==================》   git merge dev'
# git merge dev
# echo '==================》   git push origin cxl'
# git push origin cxl

msg=${1}
if [ "${msg}" = "" ]
then
    echo 'WARN:   ============提交备注没写==========='
    exit -1
fi
echo '==================》   git add . (cxl)'
git add .
echo '==================》   git ci -m "'${msg}'"(cxl)'
git ci -m "${msg}"
echo '==================》   git co master'
git co master 
echo '==================》   git pull (master)'
git pull
echo '==================》   git co cxl'
git co cxl
echo '==================》   git merge master'
git merge master
echo '==================》   git push origin cxl'
git push origin cxl
echo '==================》   git co master'
git co master 
echo '==================》   git merge cxl'
git merge cxl
echo '==================》   git push (master)'
git push
echo '==================》   git co cxl'
git co cxl