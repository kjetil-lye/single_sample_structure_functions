CDF           
              t                 x                  y                 z                    l       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.4          &alsvinn_report.currentWorkingDirectory            c/scratch/snx3000/klye/single_sample_structure_functions/experiments_multiple_samples/rm/p0_06/N1024        alsvinn_report.operatingSystem            `Linux: Linux 4.4.103-6.38_4.0.153-cray_ari_c #1 SMP Thu Nov 1 16:05:05 UTC 2018 (6ef8fef) x86_64       alsvinn_report.username           klye       alsvinn_report.host           nid02329       alsvinn_report.standardCLibrary           GNU libc 2.22 stable       alsvinn_report.generatedAt            20190930T200904        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2690 v3 @ 2.60GHz          alsvinn_report.revision           (617004f7d7728b42656c53eec72f8439c0aaa5b0       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60  -gencode arch=compute_61,code=sm_61          alsvinn_report.cudaVersion            9.2        alsvinn_report.cxxCompiler            	GNU 6.2.0          alsvinn_report.cudaCompiler           NVIDIA 9.2.148         "alsvinn_report.boost.BOOST_VERSION            107000         &alsvinn_report.boost.BOOST_LIB_VERSION            1_70       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           *GNU C++ version 6.2.0 20160822 (Cray Inc.)         ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60200          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20160822         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            Tesla P100-PCIE-16GB       ,alsvinn_report.cudaProperties.totalGlobalMem          17071734784        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           0          'alsvinn_report.cudaProperties.clockRate           1328500        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             56         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          1          &alsvinn_report.cudaProperties.pciBusID            2          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           128        alsvinn_report.mpiVersion             �MPI VERSION    : CRAY MPICH version 7.7.2 (ANL base 3.2)
MPI BUILD INFO : Built Thu Jul 19 20:01:04 2018 (git hash 5d705bad2) MT-G         alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_scratch_dash_snx3000_dash_klye_dash_single_sample_structure_functions_dash_experiments_multiple_samples_dash_rm_dash_p0_06_dash_N1024_dash_richtmeyermeshkov_DOT_py         �
xc = x - 0.5
yc = y - 0.5
phi = atan2(yc, xc) if abs(xc) > 0 else 0

if phi < 0:
    phi += 2*pi

N = len(a)//2

a1 = a[:10]

b1 = a[10:20]

normalization = sum(a1)

if abs(normalization) < 1e-8:
    normalization = N

perturbation = epsilon * sum([a1[n] * cos(phi+2*pi*b1[n]) for n in range(N)]) / normalization

r = sqrt((x-0.5)**2+(y-0.5)**2)
if r < 0.1:
    p = 20
else:
    p = 1

if r < 0.25 + perturbation:
    rho = 2
else:
    rho = 1
ux = 0
uy = 0



         �alsvinn_report.loadedTextFiles._dash_scratch_dash_snx3000_dash_klye_dash_single_sample_structure_functions_dash_experiments_multiple_samples_dash_rm_dash_p0_06_dash_N1024_dash_richtmeyermeshkov_DOT_xml            �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    rm
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>1024 1024 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>HLL3</flux>
    <endTime>4</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>mc</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>richtmeyermeshkov.py</python>
      <parameters>
        <parameter>
          <name>a</name>
          <length>40</length>
          <values>
            <value>0</value>
          </values>
        </parameter>
        <parameter>
          <name>epsilon</name>
          <length>1</length>
          <value>0.06</value>
        </parameter>
      </parameters>
    </initialData>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>3.92</time>
        <numberOfH>32</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>3.92</time>
        <numberOfH>32</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>3.92</time>
        <numberOfH>32</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <time>3.92</time>
        <numberOfH>32</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_time_integrated_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <time>3.92</time>
        <numberOfH>32</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_time_integrated_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <time>3.92</time>
        <numberOfH>32</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_time_integrated_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_structure_cube_7</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <time>3.92</time>
        <numberOfH>32</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_time_integrated_structure_cube_7</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <sampleStart>0</sampleStart>
    <samples>1024</samples>
    <generator>auto</generator>
    <parameters>
      <parameter>
        <name>a</name>
        <length>20</length>
        <type>uniform</type>
      </parameter>
    </parameters>
    <stats>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>32</numberOfH>
        <p>1</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>rm</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>32</numberOfH>
        <p>2</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>rm</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>32</numberOfH>
        <p>3</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>rm</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
        alsvinn_report.pythonVersion          fRuntime: 3.6.5 (default, Oct  8 2018, 17:39:55) 
[GCC 7.3.0 20180125 (Cray Inc.)], compile time: 3.6.5         alsvinn_report.alsvinnInDocker            false          uqAttributes.fvm.name             

    rm
           uqAttributes.fvm.platform             cuda       !uqAttributes.fvm.grid.lowerCorner             0 0 0          !uqAttributes.fvm.grid.upperCorner             1 1 0          uqAttributes.fvm.grid.dimension           1024 1024 1        uqAttributes.fvm.boundary             periodic       uqAttributes.fvm.flux             HLL3       uqAttributes.fvm.endTime          4          uqAttributes.fvm.equation             euler2         )uqAttributes.fvm.equationParameters.gamma             1.4        uqAttributes.fvm.reconstruction           mc         uqAttributes.fvm.cfl          auto       uqAttributes.fvm.integrator           auto       #uqAttributes.fvm.initialData.python           richtmeyermeshkov.py       6uqAttributes.fvm.initialData.parameters.parameter.name            epsilon        8uqAttributes.fvm.initialData.parameters.parameter.length          1          >uqAttributes.fvm.initialData.parameters.parameter.values.value            0          7uqAttributes.fvm.initialData.parameters.parameter.value           0.06       ,uqAttributes.fvm.functionals.functional.name          structure_cube         )uqAttributes.fvm.functionals.functional.p             7          1uqAttributes.fvm.functionals.functional.numberOfH             32         5uqAttributes.fvm.functionals.functional.numberOfSaves             8          3uqAttributes.fvm.functionals.functional.writer.type           netcdf         7uqAttributes.fvm.functionals.functional.writer.basename           .rm_functional_time_integrated_structure_cube_7         ,uqAttributes.fvm.functionals.functional.time          3.92       2uqAttributes.fvm.functionals.functional.timeRadius            0.08       uqAttributes.uq.sampleStart           0          uqAttributes.uq.samples           1024       uqAttributes.uq.generator             auto       )uqAttributes.uq.parameters.parameter.name             a          +uqAttributes.uq.parameters.parameter.length           20         )uqAttributes.uq.parameters.parameter.type             uniform        uqAttributes.uq.stats.stat.name           
	structure_cube
              (uqAttributes.uq.stats.stat.numberOfSaves          1          $uqAttributes.uq.stats.stat.numberOfH          32         uqAttributes.uq.stats.stat.p          3          /uqAttributes.uq.stats.stat.writeInitialTimestep           true       &uqAttributes.uq.stats.stat.writer.type            netcdf         *uqAttributes.uq.stats.stat.writer.basename            rm                   time                                           >        rho                                                         >       mx                                                          ?       my                                                          @       E                                                           A                                                                                                                                                                                            ?��{����?�r��-k�?�������?�j�W�0�?�K�w]C(?�>��%]�?� ;��M�?�u/�ţ?�~�"�Q�?�.BVj?�'�{sl?�� �f�?�7T:m�?�.���;@ ����"@���	�@h�����@�]�:o@
�4�vW8@���I�@B��r�@�峁O@yS����@0?�t�@����A@Ռ�ؾ�@�����@��Xm��@�~�d@ ~�l�.@!�	-q��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        @'���,O@C����y@T֣��vi@a��� @k�I�X�i@s���p�@za=j���@����s\@����k@�x$�ɯ@�������@�����@�(�c֑@��W�>�(@�`��m�v@������	@�͗�0l�@���A�@�l�w�@���Y��N@��}҇;�@�Kn[���@���e��@���l*�@�%���@����3b@�u��C�@�5�T��H@�?�:��@��Ɍ�@��.��