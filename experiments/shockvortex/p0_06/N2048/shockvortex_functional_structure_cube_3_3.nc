CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            [/cluster/scratch/klye/single_sample_structure_functions/experiments/shockvortex/p0_06/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-040          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190712T212420        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080       ,alsvinn_report.cudaProperties.totalGlobalMem          
8513978368         /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1733500        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             20         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           1          alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_dash_experiments_dash_shockvortex_dash_p0_06_dash_N2048_dash_shockvortex_DOT_py           �
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



         �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_dash_experiments_dash_shockvortex_dash_p0_06_dash_N2048_dash_shockvortex_DOT_xml          |<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
      shockvortex
    </name>
    <platform>cpu</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
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
    <writer>
      <type>netcdf</type>
      <basename>shockvortex</basename>
      <numberOfSaves>1</numberOfSaves>
    </writer>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>64</numberOfH>
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
        <numberOfH>64</numberOfH>
        <timeRadius>7.000000000000001e-05</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
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
        <numberOfH>64</numberOfH>
        <timeRadius>7.000000000000001e-05</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
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
        <numberOfH>64</numberOfH>
        <timeRadius>7.000000000000001e-05</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1</samples>
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
        <numberOfH>64</numberOfH>
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
        <numberOfH>64</numberOfH>
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
        <numberOfH>64</numberOfH>
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
       alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false                    time                                           ,        sample_0_rho                                                        ,       sample_0_mx                                                         .       sample_0_my                                                         0       
sample_0_E                                                          2                                                            ?U�$�/        >�J�W��U>��F���e?����#�?� i�>?"YMqJ�j?*��y���?2��Y��?8r����??:U�-;�?Cv�u�p�?G˵Iy�h?L��pó�?P��L�`w?S���]��?V�%g-N?Y���vb?\�k���?`�v���?a�9��'?c��L�[?e�m{�X?g�^(�Ԡ?i�$<#�P?l�X#`k?ng@�� ?pp��L�?q�|��3?sҗ�?t������?v)لs%?x(ÿ�"�?z�a�f�?}!��ӑj?�s��}�?�C�=
�?��Hc��?��>���?�v,Ć��?������?�B6���?���L�iU?�AS0�?��?A ��?�'<�?���y�d�?��K}6 ?�b��cA?�5d�d?�u^�!�?��!$��=?���>��{?��)71��?��F�l?�}��K�M?�m$2�\?�_�Z�?�T��3��?�J��e5�?�=ؤpQ?�,U,O=�?�B.�7?���e���?��|�l-        >�w��g=(>�k��	B?,��d�	?-�W�wd?<��ݧ�?G�v�3?R69,ÿ?Y��?m��?a�����?f�I|�1�?l����?q�gk���?uZ?Yh	�?yVi�2�?}���a��?��Et�?�j�dnS?�జ:Z�?�u|�f��?�0���?����?������)?�@Z�g�??���p�?�����?��x�:OY?��-Ju�[?�����g?���c�$?���c�\?�+z��B�?�KwUl?�m&�z?��΢�z�?��x�P�?����F� ?���Z�S�?��x�C?���iOZ�?��Jp�<�?���-���?����-E?���\��?���%�E�?��׎8q8?�O���ʭ?���J?�M��3?���w���?�I�4�q�?��x��?�AG���?����5&�?�5[�Q�?���uPJ?�'� P�?����ꪛ?��!ު�?�zf���?�٪C�m?�.�S'?�y�A�?�������        =���Y=	>#A�>�>$�@ۤ�?>=z��G�>P��"f��>`�tU�)m>n"-dB~>y꿜�V>���)װs>�������>�~�PQ�m>�%����>����>�~��Н>� ����>�,wE!�>�bh-�I[>�aȧdk4>ƹ�ֻ7!>���n���>�Ԓ�Q�>�4[Vx�e>�]�Ũ9>�p�n�%>���,�>�z!;�Z>�l�H�I>�b�vn>��,�4�>���p��>�py�h�>�h��0)>��w��>��m���>�N)�R.?{P��T�?v��O�?�#�9w?찷�߬?
k��=�?\Ѹ?���	�"?�Q�)?-���?�f}S�?�jO��?�XI��y?�h`�b0?-�mTB�?��E�D?!�@�-?"a�ֆ#A?#�3��)?%HT*?&���N�Y?(�Ӿ�5?*=�3��?,�m=�>?-�)��AF?/�u��'?1(��sb?2&6k��?3M:��uC        ?glۘ\�?+��قCv?D0{fa?UR���&?b����1�?m׳ڼKS?u�k�gy?}�v�Z: ?�����}?��gPj?�H�N�?�T��-�?��qd?��F�	�?�an?�����\�?���)k�?��}J�f�?�N�Q�?����@?�����$A?��7���?�q[h� y?� ����S?��@/��S?���F���?���[)A�?��@^+?��67��[?������?�b�2s�?��kf�Do?�|�(P�e?�(��}�?���r��?ɘ���?�JT��l�?��fI�7?Ί�N_�S?�T�!<y?��uP<�r?њ���Ch?�a�4�ģ?�,6n:aZ?��楐��?����t�?բ�H܊3?�}̬w�*?�Z�>�׌?�9�ųD
?�ŬE�?��l�@)�?����?n?���!?��?ܨn�׀?ݐ��%8�?�w�O���?�Y���?�n��G�?�{��L�?���~4��?�*H��??�}��Q