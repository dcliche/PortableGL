# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = gcc
endif

ifndef CXX
  CXX = g++
endif

ifndef AR
  AR = ar
endif

ifeq ($(config),debug)
  OBJDIR     = obj/Debug/perf_tests
  TARGETDIR  = .
  TARGET     = $(TARGETDIR)/perf_tests
  DEFINES   += -DDEBUG -DUSING_PORTABLEGL
  INCLUDES  += -I.. -I../glcommon -I/usr/include/SDL2
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -ffp-contract=off -fno-rtti -fno-exceptions -fno-strict-aliasing -Wunused-variable -Wreturn-type -fsanitize=address,undefined
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -fsanitize=address,undefined
  LIBS      += -lSDL2 -lm
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release)
  OBJDIR     = obj/Release/perf_tests
  TARGETDIR  = .
  TARGET     = $(TARGETDIR)/perf_tests
  DEFINES   += -DNDEBUG -DUSING_PORTABLEGL
  INCLUDES  += -I.. -I../glcommon -I/usr/include/SDL2
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -ffp-contract=off -fno-rtti -fno-exceptions -fno-strict-aliasing -Wunused-variable -Wreturn-type -O3
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -s
  LIBS      += -lSDL2 -lm
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/performance_tests.o \
	$(OBJDIR)/rsw_math.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking perf_tests
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning perf_tests
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
	-$(SILENT) cp $< $(OBJDIR)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
endif

$(OBJDIR)/performance_tests.o: performance_tests.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/rsw_math.o: ../glcommon/rsw_math.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)
