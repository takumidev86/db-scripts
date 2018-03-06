# Add secure-file-priv="<output_path>" under [mysqld] in my.ini or /etc/mysql/mysql.conf.d/mysqld.cnf
# to allow file export to that directory. Windows paths without backslashes, e.g., F:/Temp
# Alternatively, disable secure-file-priv by setting it to ""
# If AppArmor is activated for MySQL, the MySQL profile has to be modified to allow accessing /data/tmp/:
#  sudo nano /etc/apparmor.d/local/usr.sbin.mysqld
#  # Site-specific additions and overrides for usr.sbin.mysqld.
#  # For more details, please see /etc/apparmor.d/local/README.
#  /data/tmp/ r,
#  /data/tmp/** rwk,
#  sudo service apparmor reload
# Alternative: Temporarily disable AppArmor for MySQL
# (see, e.g., https://www.cyberciti.biz/faq/ubuntu-linux-howto-disable-apparmor-commands/)

USE `sotorrent17_12`;

SELECT PostId, PostHistoryId, PredPostBlockVersionId, PostBlockVersionId, PostBlockDiffOperationId, Text
INTO OUTFILE 'F:/Temp/PostBlockDiff.csv' 
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
ESCAPED BY '\"'
LINES TERMINATED BY '\n'
FROM `PostBlockDiff`;

SELECT PostId, PostHistoryId, PostTypeId, CreationDate, PredPostHistoryId, SuccPostHistoryId
INTO OUTFILE 'F:/Temp/PostVersion.csv' 
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
ESCAPED BY '\"'
LINES TERMINATED BY '\n'
FROM `PostVersion`;

SELECT PostVersionId, PostId, PostHistoryId, PostBlockTypeId, LocalId, Content, Length, LineCount, RootPostBlockId, PredPostBlockId, PredEqual, PredSimilarity, PredCount, SuccCount
INTO OUTFILE 'F:/Temp/PostBlockVersion.csv' 
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
ESCAPED BY '\"'
LINES TERMINATED BY '\n'
FROM `PostBlockVersion`;

SELECT Id, PostId, PostHistoryId, PostBlockVersionId, Url
INTO OUTFILE 'F:/Temp/PostVersionUrl.csv' 
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
ESCAPED BY '\"'
LINES TERMINATED BY '\n'
FROM `PostVersionUrl`;