CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            R/cluster/scratch/klye/single_sample_structure_functions/experiments/rm/p0_06/N2048         alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190712T142614        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           1          alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_dash_experiments_dash_rm_dash_p0_06_dash_N2048_dash_richtmeyermeshkov_DOT_py          �
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



         �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_dash_experiments_dash_rm_dash_p0_06_dash_N2048_dash_richtmeyermeshkov_DOT_xml         �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    rm
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
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
    <writer>
      <type>netcdf</type>
      <basename>rm</basename>
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
          <basename>rm_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
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
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
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
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>rm_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <sampleStart>0</sampleStart>
    <samples>1</samples>
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
        <numberOfH>64</numberOfH>
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
        <numberOfH>64</numberOfH>
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
        <numberOfH>64</numberOfH>
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
         alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false                    time                                           *        sample_0_rho                                                        *       sample_0_mx                                                         ,       sample_0_my                                                         .       
sample_0_E                                                          0                        ?�              ?��-�vI?�����?ۧ���$�?�U��#�?�w���a@s��+�@�P���@���>�x@� L�@dM���@G��1͚@!C��yp@$�H�}�@'\�\��@*&NYҬ@-k�k7;@0j�T�9@21>���@4�Zp�@5����@7�a�æ@9�� A@<�~ޞ�@>$T#k.�@@)q���5@AG�}��@Bj�C��"@C�N��~N@D�T)|��@E�^�n�@G/𧢨�@Hl�v�|@I��uX�@J�cA�@L7��a�@M��7�dK@N��~�@P��5j@P��D��@Q`�:�q�@RM����@R���j8@Sd�q@TX��7�@T�����Q@Ur�*��I@V%j���)@V�Fo��t@W��|�B�@XE'��o�@X�"�5@Y��9�@Zqe��T�@[-��@i@[�~ʅ+@\��2\J@]j�U�y@^+�!��@^�C��C@_���U�@`;vr�a@`���B�@aW���        ?L>zK���?v!�)�?�.���?���GJ�?��s��?�.췴�?���'�Y?�S�d1��?��x�a�?��C�2�?����?�����?� �
�?�.�'7D�?�� ��r?�Bɤ�*?�d�9&�L?�ЌDa��?�d��T�?��ü?�����?�����@=�2��@�օ/�@dTc���@$A�@\�@�1[Ѵ>@	�_
(�$@����L@�@-�ic@���@יlR�@����@�N�,t@�n�M@���*�@3�"�u@R�\�cl@uI��@��݋}�@�^�@��*<<Y@ �j���@Q���w�@���=5@ \���غ@ �����]@!�o����@"0���@"͋9H��@#k��� �@$Dst�@$����~�@%L�n��N@%��W!m@&�M���z@'4COC��@'�|c��@(z�5�@)d6@)����@*c�VMO @+c�E�&        ?N#ֆD�J?uOs�d�0?��ouw�?���SZ?��=����?���0�?�ϠW�آ?��]ʟ�?�
�͕:?Ң�4A�?�O�W��?܍��8��?�-̤���?�\�J�?�����K?닟����?�����0?���4�?�(��3?���u.��?��d~�?����/��?�m)����@ �`��&W@"�Fu"@�I�'�f@Gt�)b@����@��ʥ��@
_j��?�@)��rQ�@�DX'@�PX��@䵈}�,@ނ ��9@��6�@�0Ѧ�@�F`�QM@�����@���j��@>�&M@�D�b�@5�PW[�@N���Sk@i��^B�@��S��@��'in�@�����@ wA��@!
uȜ!@!����3�@"2�aA1@"�)�Z)@#^MU(@#�4��^U@$�ъ(G@%% �%��@%� ��#�@&W�>u�@&�4^��@'�D��� @()V��@(�r�5�        ?�1R|��?�=F�M>?��]?��x#��@7��Nu�@fe�k@;YY4X@�?R[��@ ���$+@$�-�E�W@)W�˃��@.nb��%@1�.���@4����N�@88�"[@;�<�<=Z@?Y�c�D@A�����@C��N�b@E��*�%@H"�ځe/@J�����@M\�(�@O�����@Q*�-)@R�vK"@TkP��@U��c��@W���k@X��x<��@Ze��R3�@\���zD@]��0�B�@_�x���8@`�^1&s@a���q�@b�:�5H�@c��\j�	@d�r�{�~@e�	
{�@f�~@g����e0@i	lo��@jA��RT@kl�#���@l����@m��K��O@og+��+@p'��l�@p�.~&�@qq]b��
@rU�Mnt@r�m��@st�k�:�@t%ބ��B@t��=@u������@vJ�6�@wMP�O�@w�;4Q)@x��*q<h@yKH���M@zh�$�