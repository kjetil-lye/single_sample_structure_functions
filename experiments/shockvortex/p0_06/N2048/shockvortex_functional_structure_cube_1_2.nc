CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            [/cluster/scratch/klye/single_sample_structure_functions/experiments/shockvortex/p0_06/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-040          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190712T191114        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080       ,alsvinn_report.cudaProperties.totalGlobalMem          
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
sample_0_E                                                          2                                                            ?L�1&�y        ?m�E�QKx?�ā "�e?�����pJ?�T{�i?���ܧ?�!�2�?�E�����?�
�^�?��jB&�?�����?�"�5�?����}?���)0��?�٢Ѧ�C?�**L�?�>�o��4?�*����?�����?��,��Xt?���J�?�Apy��?܈
�'�?��OjO`?�
z_�?���a)�=?�?�14�@?䚸�4|?��/0�?�u)H|
�?���
��?ꁑ����?�: �?�?�����=�?�nv����?�V�9j�?�}�m��?�l`��?�^;��{�?�X`;_�.?�V͊��?�]4���?�g����?�yre�|?��q�?����*�?������?���wr�?�$�`T�?�Y(��d�@ I;�I)@ 脺�P�@���(B5@..�z��@�v7�s�@�3F��@+����@�,�B�1@�:��@8�=�`@�m�g@�j�&��@Lt�С�@��`#Vu        ?y�ɨ�>?���W���?���|��?����*B�?������U?�0jOk?��:�DK?�E�F��?�NP%��@?�yv�%]?�;�pqKV?ѐ�
�r\?�I4�_�?�Ǧ<^?��JQZ?��r_"?�#U#�&�?���6��?�z��jr?�ܗ��?羡k���?����up�?�����?�h�e�$?�d��~��?�Q=�d�?����H#?�2;?���?��MK��?���]	p�?�s�I�%?��@�#�?�n���s�?��?EH�?�rw����?�����.@ �-v�3�@t�<�@1�� ��@�S$��@������@q�Lp�@7��XJv@��[&B@���)�@�D�1�@c���@	3�"�~@
�nk��@
�h�f:�@�#��$@��;�b@cx�PZ@@@���@���`@�Id!J�@k6�T{�@��x���@GI�1]@���u4@	�HE�@��b�S@��ݛ8        ?3E�3�!?Pn9�@A?a|���?n3��}T�?w.Y��?�}�s;��?�@�=���?��;����?�-�F�Ҥ?�Y� �J?���s�?���<�i�?�������?�����b3?��x��?�3�!�?�ə�;�?��n����?��pK^ I?���|�\a?�#z*>�?�wu�~4?���4~?�q9�U?�y�� ?�k����?������?�U�l<�0?�޳��_�?�u_���D?��R�[�?��:�X�g?͊`u��%?�V�'0>�?И�_@9{?ь:v.%w?҆��H�K?Ӈ�P��?ԏ��Z�?՝����m?ֳ�۾?���j'��?��!k�'�?�QĮ�?�I����?��zk�+?ݼ�觲�?��я|��?�$���?���D�?�xqR+�V?�'!�v4�?���o�?�;��?�F�R�Y?�>�a��?�����?��!�?�HTِ��?�����P?��V3�oe?�)�'?�}�]!        ?��0��?��Z��?�P��@�?�2$۰��?��1�T�c?�y�?����_��?ͣ���?�'�d�<?՜�u�T ?ق"���Y?݌2p�?��f0f?�W9���?��G����?�]?̼z?��m+V?���3?�R�/�ˁ?�؂�vI�?�&vUh?�7D�G$?� ��@�?��9F�A?��.���	?���y/D?��S�@ d� ���@|�"���@��ǩ@�v���h@������@;u��(@���d@�Z�9D@
'W��@ae<_�@�pUQ@E2)M1E@�NG�s7@��؈@Sc�g�@����@ݏ"d@�]�t<�@u��N/@H<����@���@�GAB�@Ԯ�7r@�\�{�4@��_\��@}΅�x@h�)>��@T6�7@A"J�T<@1����@"q�D�@ 
5�g�@ �?�JϠ@ ��sxͷ@!o���@!��Z��*