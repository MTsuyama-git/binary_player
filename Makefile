ifeq ($(shell uname -s),Linux)
ifeq ($(shell uname -m),armv6l)
PREFIX := 
else 
PREFIX		:=	arm-linux-gnueabi-
endif
else
PREFIX		:=	arm-linux-gnueabi-
endif
CXX		:=	$(PREFIX)g++
CC		:=	$(PREFIX)gcc
CXX_FLAGS	:=	-O3 -c 
CFLAGS		:=	-O3 -c `pkg-config --cflags libjpeg`
LDFLAGS		:=	`pkg-config --libs-only-L libjpeg`
LDLIBS		:=	`pkg-config --libs-only-l libjpeg`
TARGET		:= bin/playBinary
TARGET1		:= bin/playJpeg
VPATH		:= ./src:./obj

all: $(TARGET) $(TARGET1)

$(TARGET): obj/playBinary.o
	@mkdir -p $(dir $@)
	$(CXX) -o $@ $(LDFLAGS) $^ $(LDLIBS)
$(TARGET1): obj/playJpeg.o
	@mkdir -p $(dir $@)
	$(CXX) -o $@ $(LDFLAGS) $^ $(LDLIBS)
obj/%.o:%.cpp
	@mkdir -p $(dir $@)
	$(CXX) -o $@ $(CXX_FLAGS) $< 
obj/%.o:%.c
	@mkdir -p $(dir $@)
	$(CC) -o $@ $(CFLAGS) $< 
.PHONY: clean
clean:
	@rm -rfv bin/ obj/ $(shell find . -name *~)
