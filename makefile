vpath %.cpp src #文件搜索的位置vpath <patern> <diretory>

include=-I include
lib=-L lib 
cflag= -std=c++11 -g
cc=g++

#命令开头的@代表的是不再makefile编译时显示这个命令
#$@：目标
#$^：所有依赖
#$<：第一个依赖

#filter的用法$(filter <patern> <patern>...,<string>)

myapp:libfuck.a main.o
	@echo "compiling fuck"
	@$(cc) -o $@ $(filter %.o,$^) $(include) $(cflag) $(lib) -lfuck
	-@rm *.o
	-@mkdir exec
	@mv $@ exec
	@echo "compiled complete!"
fuck.o:fuck.cpp
	@echo "compiling fuck.o"
	@$(cc) -c $^ -o $@ $(include) $(cflag)
libfuck.a:fuck.o
	@echo "making the fuck lib"
	-@mkdir lib
	@ar -rc $@ $^
	@mv $@ lib
main.o:main.cpp
	@echo "compiling main.o"
	@$(cc) -c $< -o $@ $(include) $(cflag)

.PHONY:clean #虚拟命令
clean:
	-@rm *.o || true
	-@rm -rf exec || true
	-@rm -rf lib || true
	@echo "clean OK!"