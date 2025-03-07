CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            R/cluster/scratch/klye/single_sample_structure_functions/experiments/rm/p0_06/N2048         alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190712T145341        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
sample_0_E                                                          0                        @              ?�qw���?�$��6ڡ?�D,�;C?���_�T<@^��~��@�-���@�i2�@%b�tK@_���P@���z��@!�8�FVg@#�J ��@&e����y@(�Df�ӛ@+c%w�-@-��o��@0K��'��@1���|�e@2�1 ��@4]N���@5����N�@7*0w��@8��"�7@:g�J@;||�$�@<�˞(�@>qf��e�@?���)@@������@A~ ��B@BB�i{{M@C	1V&.�@C���n�@D�{��@Ed����@F0�&v�S@F��q}�@G��
��n@H�|���@Ip�m5��@JD;L�@Kl,Q!@K�Dה�$@LƠ;:{z@M�5��rn@Ny��XN@OT09��+@P@���	@P���@P�(��@Qeڭ	=�@Q�2���@RF��u�@R��٠�@S)�M �2@S��vC]@T��c��@T�%���@T���y*@Uj�[@U���FC@VU�|�1@V���5        ?�ƈX�Q�?�Ⱥ���?դXT�fG?�����?��T?���?�J&H?�s�;�	?�⧬6U*@�yc��@����@
�!���@jK�Q�@��S��@+�1{h@�Bh��@:�d�E�@��qs��@�;�\3c@ Ã�/��@";�� �@#����@%I�vuJ@&�%�7��@(}lvE�@*$R�B��@+ӋSc��@-���!}@/I��#@0�A��@1n�f�&-@2Y>�-�@3F��-2@47��+:d@5+�ٴ��@6"r�Kr5@74+��@8��%X�@9�I�٨@:���	@;�{{$@<$���}@=-�����@>8��$;@?Fl���@@+�8�0@@�݀�\d@A=�`?��@A�v�l�@BT)��@B���]�@Cn<2դ�@C��Ϗ��@D�� R��@E�q���@E�sT�i�@F=��O�H@F�A&EdG@GcB�4�s@G�����@H�d@�f�@I x_߼<@I�1/pb @JL��Ϣ�        ?��$���/?�Q ��v�?��,��t{?ᓉ���G?�,$Q��?����?��Q{�2?�����x@_����@
j.
7}@	��p�^B@(<ϭp@>Z*���@��F�k�@�X��t@mC���@7,�~�@�w΃q@ 8���]�@!��N2��@#i<�@$���A�@&��e"@'�4c�@)IM{@*����@,��u"3@.C��4U@/�v`SU@0��*��@1�B<v�1@2����� @3���d@4xL�Y�@5e��g�T@6V!��~$@7H�ĵ�@8=��Μ�@95_9A@:.�<�,�@;*�}C�@<(!�6Ƚ@='�1x�K@>(�1j @?+��d@@��T@@��n(K@A����@A�:%�2@B(M*N��@B���{@C4Q)�(@C�2�I�R@DB���@Dʋ�Q&�@ER�M�"�@E�ӣ5za@Fe&/3�T@F��|P�@Gy�3a@H���30@H��U�y~@I!��        ?�o�A��?�k8PD�N?�DU>-X�?�0Jn�I?��x)�@a�n6 @�.�6�O@BV]��@��S�{�@a)��M�@_�L$a�@��	��B@!���A��@#��k_@&7~�2@�@(�!����@+E�`�l@-��eI�J@0RÂr�@1��dJX�@3(+Ÿ��@4�9L	ݹ@6 �
�&@7��kx�L@9:�`�'L@:�=3��@<sy�o�3@>�oY
@?���`�@@��
���@A� &�H@B�?��@Cd�@�0�@DL�����@E8U�/�Z@F&���}@Gt�z��@H!'I�@I�,_ @I���\.�@J�;V@K�ޝ|�@Mq���@N����@ODl�&�@P�r�fA@P�;F�@Q4SM@Q�_� ��@R4��r_
@R��>��@SP6'��@Sߥ��@Tpv�Z�V@U��K�E@U��H�@V*����@V�b.R	@WW~���@W��	T��@X�u����@Y$U'>L�@Y�z��	n