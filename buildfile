
cxx.poptions="-I$(src_root)/include"

if ($cxx.target.class != "windows")
{
  cxx.libs += -lpthread
}

./: {test/ bench/}

