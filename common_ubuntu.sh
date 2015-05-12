
sudo ntpdate ntp1.jst.mfeed.ad.jp 

sudo apt-get -y update
sudo apt-get -y install language-pack-ja

export LC_CTYPE="ja_JP.UTF-8"
export LC_ALL="ja_JP.UTF-8"

sudo update-locale LANG=ja_JP.UTF-8
sudo update-locale LANGUAGE=ja_JP
sudo update-locale LC_CTYPE=ja_JP.UTF-8
sudo update-locale LC_ALL=ja_JP.UTF-8

echo "Asia/Tokyo" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata 

