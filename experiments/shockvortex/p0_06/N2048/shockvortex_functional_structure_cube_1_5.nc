CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            [/cluster/scratch/klye/single_sample_structure_functions/experiments/shockvortex/p0_06/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-040          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190712T231023        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080       ,alsvinn_report.cudaProperties.totalGlobalMem          
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
sample_0_E                                                          2                                                            ?a��Q�        ?Y)�ݙ�?w�JS�?���w�?�/�ʤp?�ז�%�6?��|�?��'��1?�6|r�?�@�Q�?�U ��?��Iq�g?����1?��B1?�[I"?���f�?�@�d�R?�+vpv�?�-p�H �?�IW)��?�~^gP>A?�����O�?�)�qw�?�P�T7�?����?��u�'2�?�@(�M�?�ʩ�_�?�J��p?蝕`+?�.{��j?�Ϋ���?�}<�'�?�9�}��?�����9?�k��̜?�[�G�@|?�R��h�?�P)��߲?�S�z��?�]�u�݊?�n?��/�?��֟���?���4_
�?���J��?��Mg�Q�?����	%?�S.� q�?��.`ʅ@ gX�1
�@
g�a�@�D�@X+��v%@D\Zq@�L-�ը@\����@
���C@��mZ�@l�Ug}]@ O��#G@�WA}w@��ϼ9�@	B�ݿQz@	� ���z        ?a����p?��
�':?����vo�?��H����?��Oi;?�����?�Q��x�?���׬��?��[썉?�ߓ�ꕟ?�&kf�qr?���xo�?�ݝ��T0?Ԇz��"G?�^!)�2?�_�R�e�?݊�<�Q�?�sUN�cz?�=[ݡ�p?�!�H��t?���x�L?�,��'�M?�P`�F�?�4���?�͚�gg?�kV��?�Ĩ+k�p?�����?�Q�w2?��y�_~�?�I��[?�yl��n�?����?�^�\�Tn?�ְ�	��?�N���CU?�ĭL؅@ ��3#d@Y�(4t@d�%W@ԟ"\>0@�/��*j@XS~�T@ ���E@��ڬ@��_;�F@j�Z n@O~\o\�@	!�=KD�@	��O�@
����}@�s�&/@{�B��|@S����e@*�;��@ e{�٘@�P"���@R�[�i�@���0��@#��B@��_��7@�%�燀@Y, ��I        ?3��x?Pn�r���?a}N?n��?n4����?w.�V�-?�~2��`�?�AO��l�?���
c�s?�.=^�|�?�Z0�"?��0"�{�?��-�{�?����m?����o/�?��� ��_?�3o���?����ȡ?�˞%C(�?�ͣ]s�?��K�r�?�#�Ϙ�?�w�xK�i?�����?�q�Y�*?����9?�l�_�(?�� ��݊?�U��з8?���Gچ?�u��7]�?�����?��p�Hz?͊�!��X?�W5y`(?И�dND?ьZ�a�}?҆�md�&?Ӈ�E��?ԏ��05?՞5�%?ֳ5TU�??����m^�?��Lc=�?�D뾹�?�I��T�?��se�?ݼ����?� 
M�d?�$�p�?����.?�x���y�?�'??t4�?��.��p?�[��?�F���T�?�`=C��?��576"~?�>U�e?�Hys�nd?��i3�=?��}\��?�ADԻ?�}.-:^�        ?rdUF��^?�@u@��N?�����8�?�����?���2��!?�V�!���?�+i(���?ͽ��Y>?�}�{��t?�^���%?ڀ�_��?��!{~R?�ʕ�7˙?�?��Q�?�ѥK���?�R�P�?�L@()6?�8�(�qI?�&�$h�?�š�xk?�xz���?�?����$?���2�i?���_N�?�뗳uF�?��KXZ�?��ݥ=@	`�m��@'�l��g@U��hW@��+,x@ϧ��C�@i�]�@l���S@	�4�|34@%�!Ԭ�@�6L�	�@���}��@jX,j�!@r�R�͢@4��[Uk@�l�V�@�p!��.@���%�V@dʝH�Z@;%�6��@zAP�`@��@U@����4@��D���@�欮b�@��-��@�8`�@p��r�K@bR7k�@U��BP@H5����@ ��e8x@ ���@!��NB@!�L��=0@"g�V@"�W�^&