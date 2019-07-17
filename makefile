vpath %.cpp src

include=-I include 
cflag= -std=c++11 -g
cc=g++


myapp:main.o fuck.o
	@echo "compiling fuck"
	@$(cc) -o $@ $^ $(include) $(cflag)
	-@rm *.o
	-@mkdir exec
	@mv $@ exec
	@echo "compiled complete!"
fuck.o:fuck.cpp
	@echo "compiling fuck.o"
	@$(cc) -c $< -o $@ $(include) $(cflag)
main.o:main.cpp
	@echo "compiling main.o"
	@$(cc) -c $< -o $@ $(include) $(cflag)

.PHONY:clean
clean:
	-@rm *.o || true
	-@rm -rf exec || true
	@echo "clean OK!"