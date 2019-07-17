vpath %.cpp src #文件搜索的位置vpath <patern> <diretory>

include=-I include 
cflag= -std=c++11 -g
cc=g++

#命令开头的@代表的是不再makefile编译时显示这个命令
#$@：目标
#$^：所有依赖
#$<：第一个依赖

myapp:main.o fuck.o
	@echo "compiling fuck"
	@$(cc) -o $@ $^ $(include) $(cflag)
	-@rm *.o
	-@mkdir exec
	@mv $@ exec
	@echo "compiled complete!"
fuck.o:fuck.cpp
	@echo "compiling fuck.o"
	$(cc) -c $^ -o $@ $(include) $(cflag)
main.o:main.cpp
	@echo "compiling main.o"
	@$(cc) -c $< -o $@ $(include) $(cflag)

.PHONY:clean #虚拟命令
clean:
	-@rm *.o || true
	-@rm -rf exec || true
	@echo "clean OK!"