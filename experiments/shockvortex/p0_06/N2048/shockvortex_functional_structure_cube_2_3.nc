CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            [/cluster/scratch/klye/single_sample_structure_functions/experiments/shockvortex/p0_06/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-040          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190712T205650        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080       ,alsvinn_report.cudaProperties.totalGlobalMem          
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
sample_0_E                                                          2                                                            ?U�$�/        ?0���7?1�Ѣ��?E0�ڌ?�?S<�e���?^A�ǥ�?e���)�a?mf�F��?s>	6�c?w���MP?}y����O?��z�?� @��x�?��7*[8?��+Rc�/?�V�8��%?�sͿ�Z|?���,�}?���O��?�n��bF�?��(�?���Won?�� E�ZY?�S��r�?��ܲ��?��0_�\?�:v,)�]?���n�<X?�Њn��?��:���O?��>���?����Jp�?���0��?�#��qL?�~Q݂A\?�႕q��?�M^
�	?������?�<6��@�?�����{?�G<��l?����	W}?�9�+B�Q?�p�9z,?��1S�?���@�#�?ã����?Ċ���Y:?�w\Z�G?�i�-?�_��r�?�[��K�z?�[��F�8?�`�fe�t?�jDs?�wv�Uӣ?͈�P��?Μ���mz?ϲ)>i@?�c݊"Nk?��/�;�g?�w���z?����VI?ҋR���%        ?@}t"�?6�9�K?P�C?`��U��?l���r�?v;l��?�R��~?���#��?��~ ��?�*�_1O�?�ySqIE?�9�ӄ?�4�x��5?����H?����W�?� ��P?�i��b�?��d�D�,?��l1ɿ?��j{EB�?���=5�T?����c?�v��TN?��dph�?�~�B�r ?��¯K?�v�"�~*?����D�?�^;��0?��,�Yj?�r���?�
y�;}?˦p��/�?�A�'��?��4I�#�?�3 ͋�4?��R����?ѳ�J[�?�o��U6?�*y�@�[?��(5m@�?ԝ��b�w?�XfߟA
?�Y:wm�?�� c�f?ב��n
;?�R��M ?��ȹR"?��̝�?ڟ,]e�_?�e�J9b?�+H8��.?����ʚ	?ݸqQ�?�~]�Ѿ?�B�����?�� �O�?�_�>
;?��a\w?���5
 ?�^��\Hg?���}�?��؏�        >|�@1�{3>�&�8>�nQ�Y�>�x
{%K>�fڎrh>�JqT8>�&�}>��Inh�d?B��1I�?A�׀>�?��p�G@?�WXd��? L[���?$B{*�f??(Ќ�J �?.OڿJ?1�57d�?59���d]?8�˦��?<�� k`?@�Yӻ�?C/b�~��?E�^��K?HΕ���o?K��죜�?Ol˗��D?Q��m�IV?S�
4�;G?U�
�S%?W�#Jά?Zk��iRO?]}� d�?_�*�6�?aZb����?b�?��w?d������?fE����?h�Q?j�?l�`�j?n$\���?p-�Nh�?qWi�?r���=�?s�@��?u$�5��?v�삜�?w�ǳW�?ytwR�~?{V�@o�?|��ni*�?~L�����?�Ώ}�d?��`]|�?��)A�0�?��G�+�'?���O��?���kUO?���}��o?�ple
n?�%��:|?�Q�4��?��.��4a        ?3�Qxz�N?X�h�3��?o��쀍I?~���tX�?���D��?��kctu?������-?���ȴ@?�~�YwWh?��}�Yz�?�C�Bh��?�u)�A 6?���X?�� �SZ�?�s#���?�=��y�?�Xg�zn?Ō)
�]�?��9�f?�W����a?���H�#?Ͼ��d?�T���R?��RGQ��?�o_��pf?��K�@?���p_��?ه�҂^?�aV�Ð�?�_���]?߇�65�)?��Dpn�?���p�?�Z,c�1?������?�߄=��?�"�<`�?�eP��I�?驉6�O�?�𑷢��?�:�u��?��#�4?���L�r�?�S����?�Ζ��\?񃇈��n?�<H))��?���ݧ� ?���h�?�zZ��=8?�?y�W��?�����?����*�?��iH�Ќ?�k��s?�;��R?�
�\��?��,�۹�?���_�~�?�aݜ���?�sAJUX?��̸�t
?��(b|��