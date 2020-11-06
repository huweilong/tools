#!/bin/bash

echo -e "主进程加载中3..."
sleep 1
echo -e "主进程加载中2..."
sleep 1
echo -e "主进程加载中1..."
sleep 1

echo -e "====================================================="
echo -e "|         *         *         *******     *     *   |"
echo -e "|        * *        *         *            *   *    |"
echo -e "|       *   *       *         *             * *     |"
echo -e "|      *     *      *         *****          *      |"
echo -e "|     *********     *         *             * *     |"
echo -e "|    *         *    *         *            *   *    |"
echo -e "|   *           *   *******   *******     *     *   |"
echo -e "====================================================="
echo -e "|-----------欢迎使用Linux软件自动安装服务-----------|"
echo -e "|---------------- 请按照以下方式操作----------------|"
echo -e "|----------如有问题，请联系：166-2106-1236.----------|"
echo -e "|----------E-mail：Alex_2713@126.com---------|"
echo -e "====================================================="

isFinish=0

read -p "按任意键继续"
echo -e "正在为您分析系统属性信息"
sleep 2
echo -e "-----------------------"
echo -e "系统内核版本"
sleep 1
uname -sr
sleep 1
uname -a
sleep 1
cat /proc/version
sleep 1
echo -e "-----------------------"
echo -e "系统发行版本"
sleep 1
cat /etc/redhat-release
sleep 1
echo -e "-----------------------"
echo -e "CPU信息"
sleep 1
grep "model name" /proc/cpuinfo | cut -f2 -d:

read -p "按任意键进入安装主程序"
echo -e "正在为您初始化必要的插件"
sleep 1
yum -y install vim wget links net-tools yum-utils device-mapper-persistent-data lvm2 lrzsz zip unzip

while [ ${isFinish} -eq 0 ] ;do
    echo -e "\t"
    echo -e "\t"
    echo -e "=========================================="
    echo -e "请输入要安装的应用程序id，输入-1则退出安装"
    echo -e "1: 基本配置             2: 防火墙配置"
    echo -e "3: JDK的安装            4: MySQL的安装"
    echo -e "5: Maven的安装          6: git的安装"
    echo -e "7: Docker的安装         8: Jenkins的安装"
    echo -e "9: Nginx的安装              10: PHP的安装"
    echo -e "------------------------------------------"
    read -p "请输入:" projectId
	
    # 1 基本配置
    if [ ${projectId} -eq 1 ]
        then
        jbpz=0
        while [ ${jbpz} -eq 0 ] ;do
            echo -e "\t"
            echo -e "\t"
            echo -e "\t======================================"
            echo -e "\t选择服务,-1退出"
            echo -e "\t\t 1: 升级系统              2: 设置主机名"
            echo -e "\t\t 3: 配置阿里云加速"
            echo -e "\t\t------------------------------------"
            read -p "请输入:" baseOpt

            if [ ${baseOpt} -eq -1 ]
                then
                jbpz=1
            fi

            if [ ${baseOpt} -eq 1 ]
                then
                yum -y update && yum -y upgrade
                read -p "系统升级成功，按任意键继续"
            fi

            if [ ${baseOpt} -eq 2 ]
                then
                echo -e "当前主机名为：" ${HOSTNAME}
                read -p "请输入新主机名:" newHostName
                hostnamectl set-hostname ${newHostName}
                read -p "修改成功，重启后生效，是否现在重启?Y/N::" isReboot
                if [ ${isReboot} = "Y" ]
                    then
                        reboot
                fi
                if [ ${isReboot} = "y" ]
                    then
                    reboot
                fi
            fi
            if [ ${baseOpt} -eq 3 ]
                then
                sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
                read -p "配置阿里云加速成功，按任意键继续"
            fi
        done
    fi

    # 2. 防火墙配置
    if [ ${projectId} -eq 2 ]
        then
        fhqlx=0
        while [ ${fhqlx} -eq 0 ] ;do
            echo -e "\t"
            echo -e "\t"
            echo -e "\t================================"
            echo -e "\t选择防火墙类型,-1退出"
            echo -e "\t\t 1: iptable类型防火墙          2: firewalld类型防火墙"
            echo -e "\t\t------------------------------"
            read -p "请输入:" firewallType

            if [ ${firewallType} -eq -1 ]
                then
                fhqlx=1
            fi

            if [ ${firewallType} -eq 1 ]
                then
                read -p "功能开发中，按任意键继续:"
            fi

            if [ ${firewallType} -eq 2 ]
                then
                fhqcz=0
                while [ ${fhqcz} -eq 0 ] ;do
                    echo -e "\t"
                    echo -e "\t"
                    echo -e "\t==================================="
                    echo -e "\t选择操作类型,-1退出"
                    echo -e "\t\t 1: 查看状态            2: 重启防火墙"
                    echo -e "\t\t 3: 打开防火墙          4: 关闭防火墙"
                    echo -e "\t\t 5: 设为开机启动        6: 取消开机启动"
                    echo -e "\t\t 7: 开放端口            8: 关闭端口"
                    echo -e "\t\t 9: 查看开放的端口"
                    echo -e "\t\t---------------------------------"
                    read -p "请输入:" firewallOperation
                    
                    if [ ${firewallOperation} -eq -1 ]
                        then
                        fhqcz=1
                    fi
                    
                    if [ ${firewallOperation} -eq 1 ]
                        then
                        systemctl status firewalld.service
                        read -p "按任意键继续"
                    fi
                    
                    if [ ${firewallOperation} -eq 2 ]
                        then
                        systemctl restart firewalld.service
                        read -p "按任意键继续"
                    fi
                    
                    if [ ${firewallOperation} -eq 3 ]
                        then
                        systemctl start firewalld.service
                        read -p "按任意键继续"
                    fi
                    
                    if [ ${firewallOperation} -eq 4 ]
                        then
                        systemctl stop firewalld.service
                        read -p "按任意键继续"
                    fi
                    
                    if [ ${firewallOperation} -eq 5 ]
                        then
                        systemctl enable firewalld.service
                        read -p "按任意键继续"
                    fi
                    
                    if [ ${firewallOperation} -eq 6 ]
                        then
                        systemctl disable firewalld.service
                        read -p "按任意键继续"
                    fi
                    
                    if [ ${firewallOperation} -eq 7 ]
                        then
                        read -p "开放的端口号:" openPort
                        firewall-cmd --zone=public --add-port=${openPort}/tcp --permanent
                        firewall-cmd --reload
                        read -p "按任意键继续"
                    fi
                    
                    if [ ${firewallOperation} -eq 8 ]
                        then
                        read -p "关闭的端口号:" closePort
                        firewall-cmd --zone=public --remove-port=${closePort}/tcp --permanent
                        firewall-cmd --reload
                        read -p "按任意键继续"
                    fi
                    
                    if [ ${firewallOperation} -eq 9 ]
                        then
                        firewall-cmd --zone=public --list-ports
                        read -p "按任意键继续"
                    fi
                done
            fi
        done
    fi

    # 3. JDK的安装
    if [ ${projectId} -eq 3 ]
        then
        echo -e "\t"
        echo -e "\t"
        echo -e "\t======================"
        echo -e "\t请选择JDK的版本"
        echo -e "\t\t 1: JDK 1.7         2: JDK 1.8"
        echo -e "\t\t--------------------"
        read -p "请输入:" jdkVersion
		
        if [ ${jdkVersion} -eq 1 ]
            then
            echo -e "正在自动化安装JDK 1.7，请稍后..."
			
            echo -e "正在卸载系统自带的open-jdk"
            rpm -qa |grep java
            rpm -qa |grep jdk
            rpm -qa |grep gcj
			
            echo -e "检索包含java的列表"
            yum list java*
			
            echo -e "安装1.7.0的所有文件"
            yum install java-1.7.0-openjdk* -y
			
            echo -e "配置环境变量"
			
            reg_str="^\s*export\s*JAVA_HOME=/usr/lib/jvm/java"
			
            if grep -q $reg_str /etc/profile
                then
                    echo $JAVA_HOME 已在配置文件中,跳过配置
            else			 
                echo defined JAVA_HOME variable
                # 直接在profile末尾添加新行 
                echo 'export JAVA_HOME=/usr/lib/jvm/java' >> /etc/profile
                echo 'export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/jre/lib/rt.jar' >> /etc/profile
                echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile	

                echo -e "环境变量已配置完成"
                grep $reg_str /etc/profile
				
                echo -e "重载配置文件，使环境变量生效"
                source /etc/profile
                echo -e "环境变量已生效"
            fi
				
            echo -e "检查是否安装成功"
            java -version
		
            echo -e "-----------------------------------------------"
            echo -e "JDK 1.7 安装完成"
            
            read -p "按任意键继续"
        fi

        if [ ${jdkVersion} -eq 2 ]
            then
            echo -e "正在自动化安装JDK 1.8，请稍后..."

            echo -e "正在检查系统有没有自带open-jdk"
            rpm -qa |grep java
            rpm -qa |grep jdk
            rpm -qa |grep gcj

            echo -e "检索包含java的列表"
            yum list java*

            echo -e "安装1.8.0的所有文件"
            yum install java-1.8.0-openjdk* -y
                
            echo -e "配置环境变量"
			
            reg_str="^\s*export\s*JAVA_HOME=/usr/lib/jvm/java"
			
            if grep -q $reg_str /etc/profile
                then
                echo $JAVA_HOME 已在配置文件中,跳过配置
            else			 
                echo defined JAVA_HOME variable
                # 直接在profile末尾添加新行 
                echo 'export JAVA_HOME=/usr/lib/jvm/java' >> /etc/profile
                echo 'export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/jre/lib/rt.jar' >> /etc/profile
                echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile	
			    
                echo -e "环境变量已配置完成"
                grep $reg_str /etc/profile
				
                echo -e "重载配置文件，使环境变量生效"
                source /etc/profile
                echo -e "环境变量已生效"
            fi

            echo -e "检查是否安装成功"
            java -version

            echo -e "-----------------------------------------------"
            echo -e "JDK 1.8 安装完成"
            
            read -p "按任意键继续"
        fi
    fi

    # 4. MySQL的安装
    if [ ${projectId} -eq 4 ]
        then
        echo -e "\t"
        echo -e "\t"
        echo -e "\t======================"
        echo -e "\t请选择MySQL的版本"
        echo -e "\t\t 1: MySQL 5.6         2: MySQL 5.7"
        echo -e "\t\t--------------------"
        read -p "请输入:" mySQLVersion

        if [ ${mySQLVersion} -eq 2 ]
            then
            echo -e "正在自动化安装MySQL 5.7，请稍后..."
			
            echo -e "进入本机的源文件目录"
            cd /usr/local/src
			
            echo -e "下载官方yum源的rpm包"
            wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
            echo -e "安装rpm包"
            rpm -ivh mysql57-community-release-el7-11.noarch.rpm
			
            echo -e "使用yum来安装mysql-server"
            yum install -y mysql-server
			
            echo -e "MySQL启动"
            systemctl start mysqld
			
            echo -e "查看是否启动成功"
            ps aux|grep mysqld

            echo -e "----------------------------------------------"
			
            echo -e "MySQL 安装完成，请继续操作"
            echo -e "MySQL 的初始密码如下，请及时修改"
            cat /var/log/mysqld.log|grep 'A temporary password'
			
            read -p "是否修改root密码?Y/N:" isUpdateRootPwd
            if [ ${isUpdateRootPwd} = "Y" -o ${isUpdateRootPwd} = "y" ]
                then
                echo -e "\t\t\t请输入默认密码进入mysql数据库"
                echo -e "\t\t\t执行修改命令：alter user 'root'@'localhost' identified by 'passwd';。修改密码，其中passwd为新密码"
                echo -e "\t\t\t执行命令：flush privileges; 数据使修改命令生效"
                echo -e "\t\t\t执行命令：exit; 退出mysql数据库，完成后见"
                mysql -u root -p
            fi
            
            read -p "是否创建外网访问用户?Y/N:" isNetworkUser
            if [ ${isNetworkUser} = "Y" -o ${isNetworkUser} = "y" ]
                then
                echo -e "\t\t\t请输入root密码进入mysql数据库"
                echo -e "\t\t\t执行创建命令：GRANT ALL PRIVILEGES ON *.* TO 'username'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;。创建用户，其中username为数据库登录名，password为数据库登录密码"
                echo -e "\t\t\t执行命令：flush privileges; 使创建的用户生效"
                echo -e "\t\t\t执行命令：exit; 退出mysql数据库，完成后见"
                mysql -u root -p
                echo -e "外网访问用户创建成功，请回主菜单根据提示开放3306端口"
            fi

            echo -e "正在设置UTF-8字符集"
            sed -i '/innodb_buffer_pool_size/a\character_set_server =  utf8' /etc/my.cnf
            service mysqld restart
            echo -e "UTF-8字符集设置成功"

            read -p "是否开机启动?Y/N:" rebootStart
            if [ ${rebootStart} = "Y" -o ${rebootStart} = "y" ]
                then
                systemctl enable mysqld
            fi
            
            echo -e "已添加开启启动"
            
            echo -e "-----------------------------------------------"
            echo -e "MySQL 5.7 安装完成"
            
            read -p "按任意键继续"
        fi
    fi
    
    # 5. Maven的安装
    if [ ${projectId} -eq 5 ]
        then
        echo -e "\t"
        echo -e "\t"
        echo -e "\t======================"
        echo -e "\t请选择maven的版本"
        echo -e "\t\t 1: Maven 3.6.3"
        echo -e "\t\t--------------------"
        read -p "请输入:" mavenVersion
		
        if [ ${mavenVersion} -eq 1 ]
            then
            echo -e "正在自动化安装maven 3.6.3，请稍后..."

            echo -e "进入本机的源文件目录"
            cd /usr/local/src
			
            echo -e "下载官方文件包"
            wget -O /usr/local/src/maven.tar.gz https://mirrors.bfsu.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
            
            echo -e "创建maven目录并解压官方文件包"
            mkdir -p /usr/local/maven && tar -xzvf /usr/local/src/maven.tar.gz -C /usr/local/maven --strip-components 1
            			
            echo -e "配置环境变量"
            reg_str="^\s*export\s*MAVEN_HOME=/usr/local/maven"
			
            if grep -q $reg_str /etc/profile
                then
                    echo $MAVEN_HOME 已在配置文件中,跳过配置
            else			 
                echo defined MAVEN_HOME variable
                # 直接在profile末尾添加新行 
                echo 'export MAVEN_HOME=/usr/local/maven' >> /etc/profile
                echo 'export PATH=$PATH:$MAVEN_HOME/bin' >> /etc/profile	

                echo -e "环境变量已配置完成"
                grep $reg_str /etc/profile
				
                echo -e "重载配置文件，使环境变量生效"
                source /etc/profile
                echo -e "环境变量已生效"
            fi
				
            echo -e "检查是否安装成功"
            mvn -version
		
            echo -e "-----------------------------------------------"
            echo -e "maven 3.6.3 安装完成"
            
            read -p "按任意键继续"
        fi
    fi
    
    # 6. git的安装
    if [ ${projectId} -eq 6 ]
        then		
        echo -e "正在自动化安装git，请稍后..."

        sudo yum install -y git
         				
        echo -e "检查是否安装成功"
        git --version

        echo -e "-----------------------------------------------"
        echo -e "git 安装完成"
            
        read -p "按任意键继续"
    fi
    
    # 7. docker的安装
    if [ ${projectId} -eq 7 ]
        then		
        echo -e "正在自动化安装docker，请稍后..."

        sudo yum remove docker  docker-common docker-selinux docker-engine -y
        sudo yum install docker -y
        sudo systemctl start docker
        
        read -p "是否开机启动?Y/N:" rebootStart
        if [ ${rebootStart} = "Y" -o ${rebootStart} = "y" ]
            then
            sudo systemctl enable docker
        fi
            
        echo -e "已添加开启启动"
        
        read -p "是否配置阿里云镜像加速?Y/N:" isAliyunSpeed
        
        if [ ${isAliyunSpeed} = "Y" -o ${isAliyunSpeed} = "y" ]
            then
            sudo mkdir -p /etc/docker
            echo '{' >> /etc/docker/daemon.json
            echo '"registry-mirrors": ["https://7wzuxqa5.mirror.aliyuncs.com"]' >> /etc/docker/daemon.json
            echo '}' >> /etc/docker/daemon.json
            sudo systemctl daemon-reload
            sudo systemctl restart docker
        fi
            
        echo -e "已添加阿里云镜像加速"
        
        		
        echo -e "检查是否安装成功"
        docker --version
		
        echo -e "-----------------------------------------------"
        echo -e "docker 安装完成"
            
        read -p "按任意键继续"
    fi
    
    # 8. Jenkins的安装
    if [ ${projectId} -eq 8 ]
        then
        
        echo -e "\t"
        echo -e "\t"
        echo -e "\t======================"
        echo -e "\t特别说明：Jenkins的安装需要依赖jdk运行环境，如未安装请到首页先安装JDK"
        echo -e "\t请选择安装方式"
        echo -e "\t\t 1: yum在线安装         2: jar文件下载安装"
        echo -e "\t\t--------------------"
        read -p "请输入:" installType
		
        if [ ${installType} -eq 1 ]
            then
            echo -e "特别说明，在线安装无法修改端口号，请务必保证8080端口未被占用"
            
            read -p "是否继续:?Y/N:" isAccess
            
            if [ ${isAccess} = "Y" -o ${isAccess} = "y" ]
                then
                echo -e "正在自动化安装Jenkins，请稍后..."

                echo -e "进入本机的源文件目录"
                cd /usr/local/src
			
                echo -e "下载官方yum源的rpm包"
                sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
                sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
        
                echo -e "安装Jenkins"
                yum install -y jenkins
        
                echo -e "启动Jenkins"
                sudo systemctl start jenkins
                
                read -p "是否开机启动?Y/N:" rebootStart
                if [ ${rebootStart} = "Y" -o ${rebootStart} = "y" ]
                    then
                    sudo systemctl enable jenkins
                fi
            
                echo -e "已添加开启启动"        
        		
                echo -e "检查是否安装成功"
                sudo systemctl status jenkins
		
                echo -e "-----------------------------------------------"
                echo -e "jenkins 安装完成，请回主菜单根据提示开放8080端口"
            
                read -p "按任意键继续"
            fi
        fi

        if [ ${installType} -eq 2 ]
            then
            echo -e "正在自动化安装Jenkins，请稍后..."

            echo -e "进入本机的源文件目录"
            cd /usr/local/src
			
            echo -e "下载官方文件包"
            wget -O /usr/local/src/jenkins.war https://mirrors.tuna.tsinghua.edu.cn/jenkins/war-stable/2.249.1/jenkins.war
            
            echo -e "创建jenkins目录并复制官方文件包"
            mkdir -p /usr/local/jenkins && cp /usr/local/src/jenkins.war /usr/local/jenkins/
            			
            echo -e "启动jenkins"
            read -p "请输入运行时的端口:" runPost
            nohup java -jar /usr/local/jenkins/jenkins.war --httpPort=${runPost} > /usr/local/jenkins/console.out 2>&1 &
            
            echo -e "jenkins启动中,启动日志位于/usr/local/jenkins/console.out中，请自行查看"
            sleep 5
            		
            echo -e "-----------------------------------------------"
            echo -e "jenkins 安装完成，请回主菜单根据提示开放" ${runPost} "端口"
            
            read -p "按任意键继续"
        fi
    fi
    
    # 9. nginx的安装
    if [ ${projectId} -eq 9 ]
        then		
        echo -e "正在自动化安装ngnx，请稍后..."
        
        echo -e "添加源"
        sudo rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

        echo -e "安装Nginx"
        sudo yum install -y nginx

        echo -e "启动Nginx"
        sudo systemctl start nginx.service
        
        read -p "是否开机启动?Y/N:" rebootStart
        if [ ${rebootStart} = "Y" -o ${rebootStart} = "y" ]
            then
            sudo systemctl enable nginx.service
        fi
            
        echo -e "已添加开启启动"
        		
        echo -e "检查是否安装成功"
        nginx -v
		
        echo -e "-----------------------------------------------"
        echo -e "nginx 安装完成"
            
        read -p "按任意键继续"
    fi
    
    # 10. PHP的安装
    if [ ${projectId} -eq 10 ]
        then		
        echo -e "正在自动化安装php，请稍后..."
        
        echo -e "安装默认版本的php"
        yum install -y php php-deve
                		
        echo -e "检查是否安装成功"
        php -v
		
        echo -e "-----------------------------------------------"
        echo -e "php 安装完成"
            
        read -p "按任意键继续"
    fi
    
    # 10. 禅道的安装
    if [ ${projectId} -eq 10 ]
        then
        echo -e "\t"
        echo -e "\t"
        echo -e "\t======================"
        echo -e "\t请选择禅道的版本"
        echo -e "\t\t 1: Maven 3.6.3"
        echo -e "\t\t--------------------"
        read -p "请输入:" mavenVersion
		
        if [ ${mavenVersion} -eq 1 ]
            then
            echo -e "正在自动化安装maven 3.6.3，请稍后..."

            echo -e "进入本机的源文件目录"
            cd /usr/local/src
			
            echo -e "下载官方文件包"
            wget -O /usr/local/src/maven.tar.gz https://mirrors.bfsu.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
            
            echo -e "创建maven目录并解压官方文件包"
            mkdir -p /usr/local/maven && tar -xzvf /usr/local/src/maven.tar.gz -C /usr/local/maven --strip-components 1
            			
            echo -e "配置环境变量"
            reg_str="^\s*export\s*MAVEN_HOME=/usr/local/maven"
			
            if grep -q $reg_str /etc/profile
                then
                    echo $MAVEN_HOME 已在配置文件中,跳过配置
            else			 
                echo defined MAVEN_HOME variable
                # 直接在profile末尾添加新行 
                echo 'export MAVEN_HOME=/usr/local/maven' >> /etc/profile
                echo 'export PATH=$PATH:$MAVEN_HOME/bin' >> /etc/profile	

                echo -e "环境变量已配置完成"
                grep $reg_str /etc/profile
				
                echo -e "重载配置文件，使环境变量生效"
                source /etc/profile
                echo -e "环境变量已生效"
            fi
				
            echo -e "检查是否安装成功"
            mvn -version
		
            echo -e "-----------------------------------------------"
            echo -e "maven 3.6.3 安装完成"
            
            read -p "按任意键继续"
        fi
    fi

    # 退出
    if [ ${projectId} -eq -1 ]
        then
        isFinish=1
    else
        echo -e "无效指令"
    fi
done
