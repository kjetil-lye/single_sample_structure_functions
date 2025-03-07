CDF           
              t                 x                  y                 z                    m       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.4          &alsvinn_report.currentWorkingDirectory            l/scratch/snx3000/klye/single_sample_structure_functions/experiments_multiple_samples/shockvortex/p0_06/N1024       alsvinn_report.operatingSystem            `Linux: Linux 4.4.103-6.38_4.0.153-cray_ari_c #1 SMP Thu Nov 1 16:05:05 UTC 2018 (6ef8fef) x86_64       alsvinn_report.username           klye       alsvinn_report.host           nid01931       alsvinn_report.standardCLibrary           GNU libc 2.22 stable       alsvinn_report.generatedAt            20191001T214349        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2690 v3 @ 2.60GHz          alsvinn_report.revision           (617004f7d7728b42656c53eec72f8439c0aaa5b0       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60  -gencode arch=compute_61,code=sm_61          alsvinn_report.cudaVersion            9.2        alsvinn_report.cxxCompiler            	GNU 6.2.0          alsvinn_report.cudaCompiler           NVIDIA 9.2.148         "alsvinn_report.boost.BOOST_VERSION            107000         &alsvinn_report.boost.BOOST_LIB_VERSION            1_70       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           *GNU C++ version 6.2.0 20160822 (Cray Inc.)         ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60200          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20160822         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            Tesla P100-PCIE-16GB       ,alsvinn_report.cudaProperties.totalGlobalMem          17071734784        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           0          'alsvinn_report.cudaProperties.clockRate           1328500        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             56         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          1          &alsvinn_report.cudaProperties.pciBusID            2          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           1024       alsvinn_report.mpiVersion             �MPI VERSION    : CRAY MPICH version 7.7.2 (ANL base 3.2)
MPI BUILD INFO : Built Thu Jul 19 20:01:04 2018 (git hash 5d705bad2) MT-G         alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_scratch_dash_snx3000_dash_klye_dash_single_sample_structure_functions_dash_experiments_multiple_samples_dash_shockvortex_dash_p0_06_dash_N1024_dash_shockvortex_DOT_py          �
GAMMA=1.66666666666667

r_c = 0.05
alpha = 0.204
x_c = 0.25
y_c = 0.5
M = 1.1



# shock part
if  x < 0.5 + epsilon * X: 
    rho = 1.0;
    ux = sqrt(GAMMA);
    uy = 0.0;
    p = 1.0;
else:
    rho = 1.0 / 1.1;
    ux = 1.1 * sqrt(GAMMA);
    uy = 0.0;
    p = 1 - 0.1 * GAMMA;



# vortex part
if x < 0.5:
    tau = sqrt(pow(x - x_c, 2) + pow(y - y_c, 2)) / r_c;
    sin_theta = (y - y_c) / (tau * r_c);
    cos_theta = (x - x_c) / (tau * r_c);

    ux += epsilon * tau * exp(alpha*(1 - pow(tau, 2))) * sin_theta;
    uy += -epsilon * tau * exp(alpha*(1 - pow(tau, 2))) * cos_theta;
    p += -(GAMMA - 1) * pow(epsilon, 2) * exp(2 * alpha*(1 - pow(tau, 2))) / (4 * alpha * GAMMA) * rho;



         �alsvinn_report.loadedTextFiles._dash_scratch_dash_snx3000_dash_klye_dash_single_sample_structure_functions_dash_experiments_multiple_samples_dash_shockvortex_dash_p0_06_dash_N1024_dash_shockvortex_DOT_xml         `<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
      shockvortex
    </name>
    <platform>cpu</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>1024 1024 1</dimension>
    </grid>
    <boundary>neumann</boundary>
    <flux>HLL3</flux>
    <endTime>0.0035</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.66666666666667</gamma>
    </equationParameters>
    <reconstruction>weno2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>shockvortex.py</python>
      <parameters>
        <parameter>
          <name>X</name>
          <length>1</length>
          <value>0</value>
        </parameter>
        <parameter>
          <name>epsilon</name>
          <length>1</length>
          <value>0.06</value>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>0.00343</time>
        <numberOfH>32</numberOfH>
        <timeRadius>7.000000000000001e-05</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>0.00343</time>
        <numberOfH>32</numberOfH>
        <timeRadius>7.000000000000001e-05</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>0.00343</time>
        <numberOfH>32</numberOfH>
        <timeRadius>7.000000000000001e-05</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <time>0.00343</time>
        <numberOfH>32</numberOfH>
        <timeRadius>7.000000000000001e-05</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_time_integrated_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <time>0.00343</time>
        <numberOfH>32</numberOfH>
        <timeRadius>7.000000000000001e-05</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_time_integrated_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <time>0.00343</time>
        <numberOfH>32</numberOfH>
        <timeRadius>7.000000000000001e-05</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_time_integrated_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_structure_cube_7</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <time>0.00343</time>
        <numberOfH>32</numberOfH>
        <timeRadius>7.000000000000001e-05</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_time_integrated_structure_cube_7</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1024</samples>
    <sampleStart>0</sampleStart>
    <generator>auto</generator>
    <parameters>
      <parameter>
        <name>X</name>
        <length>1</length>
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
          <basename>shockvortex</basename>
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
          <basename>shockvortex</basename>
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
          <basename>shockvortex</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
       alsvinn_report.pythonVersion          fRuntime: 3.6.5 (default, Oct  8 2018, 17:39:55) 
[GCC 7.3.0 20180125 (Cray Inc.)], compile time: 3.6.5         alsvinn_report.alsvinnInDocker            false          uqAttributes.fvm.name             
      shockvortex
            uqAttributes.fvm.platform             cpu        !uqAttributes.fvm.grid.lowerCorner             0 0 0          !uqAttributes.fvm.grid.upperCorner             1 1 0          uqAttributes.fvm.grid.dimension           1024 1024 1        uqAttributes.fvm.boundary             neumann        uqAttributes.fvm.flux             HLL3       uqAttributes.fvm.endTime          0.0035         uqAttributes.fvm.equation             euler2         )uqAttributes.fvm.equationParameters.gamma             1.66666666666667       uqAttributes.fvm.reconstruction           weno2          uqAttributes.fvm.cfl          auto       uqAttributes.fvm.integrator           auto       #uqAttributes.fvm.initialData.python           shockvortex.py         6uqAttributes.fvm.initialData.parameters.parameter.name            epsilon        8uqAttributes.fvm.initialData.parameters.parameter.length          1          7uqAttributes.fvm.initialData.parameters.parameter.value           0.06       uqAttributes.fvm.diffusion.name           none       )uqAttributes.fvm.diffusion.reconstruction             none       ,uqAttributes.fvm.functionals.functional.name          structure_cube         )uqAttributes.fvm.functionals.functional.p             7          1uqAttributes.fvm.functionals.functional.numberOfH             32         5uqAttributes.fvm.functionals.functional.numberOfSaves             8          3uqAttributes.fvm.functionals.functional.writer.type           netcdf         7uqAttributes.fvm.functionals.functional.writer.basename           7shockvortex_functional_time_integrated_structure_cube_7        ,uqAttributes.fvm.functionals.functional.time          0.00343        2uqAttributes.fvm.functionals.functional.timeRadius            7.000000000000001e-05          uqAttributes.uq.samples           1024       uqAttributes.uq.sampleStart           0          uqAttributes.uq.generator             auto       )uqAttributes.uq.parameters.parameter.name             X          +uqAttributes.uq.parameters.parameter.length           1          )uqAttributes.uq.parameters.parameter.type             uniform        uqAttributes.uq.stats.stat.name           
	structure_cube
              (uqAttributes.uq.stats.stat.numberOfSaves          1          $uqAttributes.uq.stats.stat.numberOfH          32         uqAttributes.uq.stats.stat.p          3          /uqAttributes.uq.stats.stat.writeInitialTimestep           true       &uqAttributes.uq.stats.stat.writer.type            netcdf         *uqAttributes.uq.stats.stat.writer.basename            shockvortex                  time                                           B        rho                                                         B       mx                                                          C       my                                                          D       E                                                           E                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ?l�1&�y        ?d=H8��x?�Mx�ɏ?���b��?�Ք�U	'?�2fH��?��!RN?�@UI6|?�K�u�?�����_3?�d�{N?�qx�Y-�?Лnw]�?�'ټ}��?���"�~{?ؿ�H<��?��;w�ss?����ez?�,V!uG?����	�?��d��1?�c��x?�Y9�0?��A�]�?���Q��?�
��S�?�y��?��_6�M?��h�?�?q\�?���7��?����_)        ?i�:X�{z?��81I?���T�r?�濥���?���6S�N?�`��I��?�"���z?���&�T?ȯ�s?�ڡ@��?ѱ����?ԡb�m��?׺�ڨ?����'s?�[L���?����4'�?⺵$��?䒽z��m?�t��Tn?�^���n?�Pol�Y�?�H�8z��?�G��qD:?�&�N�?�,�v��u?�5�6-�?�B"]m?�Q�H�ȹ?�c��$�b?�x�p5*l?��͜�6�        ?C"3�&8�?`cܥ7�?q���! ?~Q�Y�H?�D����1?�����?�Tk>|��?��>V�8?�<�?�i�`���?��R</0?�Nq��?��ye��?��'V"�O?��6e�^?�:�� i�?����)��?�̖��(�?�̜����?��lK*q�?���I��?�m?��h?�ך�A��?�\�w��^?���d݈?�Z�l/��?��O}�Q?�:���v?־��.T�?�N���4�?��	H��         ?|��w>��?�	��'��?�Y0�1?��t�?��:m�?��Z]>�?����S+?ִ�_n�?��Q�%_?���0�m�?�ꂨ}�&?�5�м�?껍d�<?�z�W i?�8ɇ��T?�N�� T�?�}�S�^�?��T�ţ?�$K���?��^��?�'1�:�@ ��1yڠ@A$pe/@���^�O@�G
�@�����@`��Wx@	�V�O?�@D5�$y�@���@��L�