### 通过yum 更新gcc 到5.2 的命令
	* yum install centos-release-scl -y
	* yum install devtoolset-4-toolchain -y
	scl enable devtoolset-4 bash
	gcc --version

