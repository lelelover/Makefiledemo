cc=gcc
SUBDIRS=f1 \
        f2 \
        main \
        obj  \
OBJS=f1.o f2.o main.o
#目录
BIN=myapp
OBJS_DIR=obj
BIN_DIR=bin

export CC OBJS BIN OBJS_DIR BIN_DIR  #用于把各个目录变量应用于次级目录中的Makefile中
#嵌套
all:CHECK_DIR $(SUBDIRS)

CHECK_DIR:
    mkdir -p $(BIN_DIR)
$(SUBDIRS):ECHO
    make -C $@
ECHO:
    @echo $(SUBDIRS)   #加@，是为了在执行命令时，不打印echo
    @echo begin compile
    
CLEAN:
    $(RM) $(OBJ_DIR)/*.o   #RM 是预定义变量
    @rm -rf $(BIN_DIR)
