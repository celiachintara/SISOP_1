awk '(/cron/ || /CRON/) && (!/sudo/) && (NF<13) {print}' /var/log/syslog >> /home/celiachintara/SISOP/prak1/soal5.log
