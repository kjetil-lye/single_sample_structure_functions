CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T102119        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_py           �import scipy.stats

# Uses fbmpy from https://github.com/kjetil-lye/fractional_brownian_motion
# (this is also a part of alsvinn)
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
    MAX_RESOLUTION=2048
    
    Y = scipy.stats.norm.ppf(X)

    # Note that we skip the random variables for higher resolutions, this
    # is to make sure we get a convergent sequence (there are other ways of doing this, but this is by far the simplest)
    start_dux = 0
    end_dux = (MAX_RESOLUTION-1)**2
    
    dux = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_dux:end_dux]).reshape(nx+1, nx+1)

    start_duy = end_dux
    end_duy = 2*(MAX_RESOLUTION-1)**2
    duy = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_duy:end_duy]).reshape(nx+1, nx+1)
    rho[:,:,0] = 4*ones_like(rho[:,:,0])
    ux[:,:,0] = dux[:-1,:-1]
    uy[:,:,0] = duy[:-1,:-1]
    p[:,:,0] = 2.5*ones_like(rho[:,:,0])



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_xml          �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    euler_fbb
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>hll3</flux>
    <endTime>4</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>wenof2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>euler_fbb.py</python>
      <parameters>
        <parameter>
          <name>hurst_index</name>
          <length>1</length>
          <value>0.125</value>
        </parameter>
        <parameter>
          <name>X</name>
          <length>8380418</length>
          <values>
            <value>0</value>
          </values>
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
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_1</basename>
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
          <basename>euler_fbb_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_2</basename>
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
          <basename>euler_fbb_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_3</basename>
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
          <basename>euler_fbb_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_7</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_7</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1024</samples>
    <generator>auto</generator>
    <sampleStart>0</sampleStart>
    <parameters>
      <parameter>
        <name>X</name>
        <length>8380418</length>
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
          <basename>euler_fbb</basename>
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
          <basename>euler_fbb</basename>
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
          <basename>euler_fbb</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
          alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?��l��@)��l��@F�k6q:N@Z`7�j@g�(A�X3@r�bA�v@{r�
J��@���(�� @�P��@��)킛@����9Nz@��:� �@�Z�/<\�@��ø�@�ã��՞@���ȣr`@�Ǝu@�@�#R���@�����[#@�����}�@��¬��Z@��:ǟ�@�F���(�@��/����@�+�'�q@�����e�@�>���Y�@¦8^$/@�k���@ŘWX@.�@�#R��.@Ⱥ���V @�_�2���@�$̙��@��i����@ϡ=�Y��@п����@Ѷ��5S�@Ҷ��(!@Ӿ)�x�o@��E��G@���6��@��X��@�8�B���@�ldǯ�X@ڨ�<�@�����$�@�8x���:@ގ2gfX@��wK��@�C2�4@�d��gl�@�#4*z��@�����	@�k���@�}{oxU@�Q�S�@�*?-�@�	9<�w�@��0��@��e��cr@��Nې3@�Æ���        ?�*�ޢ@�,��4@7u�ޞ@NP�G�=#@`��u�Z@nN�|��t@zXR9�{@�p>��n @����"@�K1Xj7�@�3��Ow@����"�@��ֹ Y]@��b6C�V@�X�'-�@�� �ڋ.@Ěm�\l%@�@��@ΖNMo��@�U��'7j@��v5�@٨���]�@�Җ*�@�n̩�@���,	�@��L)@�b�35�@���9eJ@���'�1@���#��@�r���<@����r�@��ʕ�(@�����A e���u�A���Aܛz�L-A��-}��A�@���A	�q�z>%A��?A]�����Ab��T��A��6�7�A�ݾ�^AI�j��+A�g�d	&A!%���A�5��A)��@�A��j'lA`�B!�AH��C�A c�AHeeA!E���0yA"-�v�@�A#in��A$4N��AA%	=���gA&	�_g-�A'diA(u�Z�A)53�|'�        @5�I�@C���+�,@_�+1|p�@p��-i#m@|؜pr�@��o�6�K@�#�j�^@�~X�@�����ɖ@����]�@�;J��@�@��Y0�@�&�m���@�#Kds�@�p1�.��@��b^���@�[L+@��Z���@�T˅��(@����o|�@�g�@G��@�� ���@�-m���@�𼋘�@��յ���@��QK��A@�E&X@��Yu�0A���56A�݁�A.a�=B�A�q�3�Al�2��AK��FsA�$��gADdg��A��g��A��t�,�A������A��.�xA�1��BA��١��A�L���A!��h�GA"I}�}H�A#���`ɍA$�2q	A&�}`6�A'i)�#�[A(�����yA*2N�ڏaA+��t��-A-"�HZ�A.����A0d���A0����n�A1� ��CA2��D���A3y�e]��A4^ݹ�?A5Io�kN�A69���9�A7/m.9�        @���Z{��@�[���f�AP�*�\A$IGLgA1��[�A:����M:AB�F����AI�ߐAO���)AS��d�9*AW���"A[�c�y.A`CG�2�$Ab�ag&�Aet�9�b�AhQ��K�Ak^��ZS�An��%��Aq�Y�"�Ar��σ�!At�=�@@�Av���lV9Ax��d6A{"y}��~A}mܔ��CA�v�ŖAA���Q��A�V2��JxA������A��8��A�1b���A����d��A�����A�ka��A����hOA��.9�A�+8�V\{A�o���MA�Q�8E�A�;g�A�+e\�-�A�"�C��A�!=	���A�&g!�QA�2H3��AA�E	���%A�^�k�*GA��]�'�A������yA��I�'�uA�����A�X��G�2A�R�N9W1A���~b�[A���ޖ��A�\����SA�B!�~UA���v�lA����|��A�F[T�A�b�xA���v��A����        ?�B��# @"�2�l;�@>Q�B��I@P{����b@]D�^M�@g"�d�(�@p�d�g�@w�N��t@�^q�`I@�beHk�@���+"�@�Rr��˳@�����0@�+�}Dr%@��t ��@����)h@�ߓ|��@�0�P'Z@�Zw��Qf@��>ȝ��@�b��X@&@�=���\@� k�͞�@��{n���@�D��r@��%�ZG@�t�nX@�;�c�9@���r.@��Ȼ%�
@��7%�թ@���c4�@�L�az�@�'���E@�N/�Jj�@Ă����@�ŗ=\1@������@�x�~��@��!�@�d �Ԉ�@��~KQ�2@΃�G��t@��5/�@���G#�@��M���@Ҩe�Y3Q@ӏ�)^�@�|�ũ�e@�n�J��>@�e _�+|@�_�/��/@�^nd�w@�`��*Q�@�f�˽�@�psiv
@�}��@ݏ+��l@ޤ4��^_@߽��s@�l���l�@���^��@�A�qf�        ?�<wޔ@l+� �(@2� ����@E�
b�@TW�U�by@`�x>B5Y@j���p@ta��c@}i;%�}@�6}��@��Q�P�@�8��Ơ�@�@P��A@����	`@��T�f2�@��-yjsw@��̞_&@�՟!ȯ@��0���@�0���:�@�O�(e�S@����n��@ʽ�zj�@�*��#�@��c���@�|��G��@�F�!{�}@�E���am@�|?[4�d@�u��l�@�J�"nR�@�?0���@�S�j���@���bv�@��$�)@�c��/��@��|��Z@�h.�^)1@�����@�hN��@��
X{�@���'$s@�o�M]�@�@[��B@�#7rU�@���F��A �h����A�.��A���'�<A�G�_z�A�o1f�A8� ސ�Ay5�k�;A�*p�bA
�$�vAz�>iAA�q�<AZ�2��A���]�A��\�j�A}MT'm�AL�O6�A �|{�5        ?ֹxH�@�@	#�j��@'d��,A@=
���z>@ND��@�@\#����.@h3Gٰ�@s�ζV��@~y�.�@��8��@�pՉ2D�@���e�@����`�d@�:ׂ�@�����]@��&��9@�x�_��@����nE�@�7��(X@Ĩ�`@�@ȡG/&R~@��p�7@��{�}@Ӆ���fu@�W@���C@�^��Z@ܜ��j�G@�	����@��
�Ő8@��w�R�G@�� �Q�@�#��Sg@�z� ~i�@��� �@�!z���@�*b�x��@��&J({@�&����@��NAL�@�q�����@�5�E@��<-�2@�����]�@��$�w��A �k�ZeA��d;BA�c��M A�̫�rA�O]&AP����A�ׅp�TA�l�L��A
<p���A��A��A	7�I��A~U)�@A���SvAÌ��(cA���38A\�Y�ȣA1��ijA�t!�fA�bUdc�        @��n@���@�l��1S�@��,^@�xA
����[A����صA"X��U&�A*B��73�A1��D��A7�>�2A<�e�QAA����AE(Jz>��AH�4>z�AL�W-HuAP�v�r�AR�7ں�lAUJ�ч�AW�H��AZ{'�8��A]F��h�A`�`��Aa�&���Ac;�T�aiAd�Eg3{0Af�nD�5Ahf��r=Aj;a�	�Al6�f�4An�~Y!Ap��BE�Aq~�=%QAr�v��WAs8�tLcAt]R��!~Au����Avͥ��VAx�T#0Ayy��V�Az���h\A|ed���A}�`�ϒA�|ڶ�A�����A�rT��_�A�Q+��{A�5X�N�A��_���A� _�$kA� Cc�~A��h*���A��G߀�A��v_0͡A��o�@bA��q�zڜA� kn��A�Sv�A�&��sA�)�4.A�A���CA�A��ɾ)<�A�6<p���A��ׇaVA�SK�rQ        ?�s�K�:@ż<@1A@��ʞ@C����oW@Q��ӯ�k@\a�.��I@d��W(~@m&�m�@sK���w@x�mtݜ~@��N@�
����@��m���@�TX�>�4@���tL�@��1�!7=@��n�t�y@��)��@�
[�@&�@��`>�I(@������@��e���g@���50�i@���0Uw@�u�4vM�@��e����@�u�w�@�!g�g@�p���1�@����k1@�\z_-��@���e�B�@�~�!I�<@�$��m��@�ؕb,
;@���2n=Z@�j�'2(�@��Vq:@��G��vN@��<@Ú��K��@Ĥ�s�bt@Ŷ4�<��@��i����@��aX�@��0X7@�?�ŵ�@@�q��S�@̩�-�j�@���uG@�)�g�ڟ@�9��(�@��e���@ы
��]@�9&4;>@����0�/@Ӡ�o�w@�X��=2@�l�(Fx@�Ռ�G�@֙U���@�`ȼϏ@�+�G<        ?�=46
@8|�>/�@+�J�	p@B�2�N@R����#@a�}Hְ:@o[K����@z�Sd�@�����Q<@����_P�@�Qi:�k@����"@�=fѡl�@��
�L"$@��)�qu�@�\P�#@�3���7@�xG��@�]q���@�����m8@�-m�/@րr�uq@�IA���@�ip���@�p�Qc�@�ش�$O�@�k�]�3�@�)�2�2�@�5H��@� �t�ױ@�,E��t*@��{o���@����h�@�s�qq�)@�\�S�UL@�Y���g@�kvR�P�@��Q�� A gE|��A�	r.�A���XEA	�Y8TFAZd��A��˦WA%�߱�\A	����~�A+�`�7A���tjAlU����A�LG�iA���[�A�aX:bAƖ8k�A�?==:�A�7���A����~sA�u �-<A��@"�A�<���A��,�h�Aፗ#�LA����A�7B9        ?�����@(�)�n�@E�����@YҘm�<@hBq��@t:[�I@~�g!��7@� tznb�@���q��9@���@��@��b	&�@�g���7i@��g�Pe@�	e��/�@����~E@�-,<�T@�B���J@�	fEG��@�R�o�~@�i��@���@�T !^��@��h٦@Քݏ�V@ؕɑ'jQ@����v)6@�p��k^�@ᩓg��@��4F��@�߭��&@�3�2��@�0��.��@�ͤ,�@��ޤu@�:���@	@�EL�r@��Hk3v=@��|m^��@�<rj��@�e��}��@��ˈ.�FA ��.��yA�0�QA�:�A
�HeݽA��)�0TAI�J_�A
ݍu�,A�`��*A��o�G�A��qD�AւfNc�A�<��A�#7�;ARU[�AJ�}U��A���O�A���sK�A��['(AdH�_/3A��	�A-��̓A�����        @��8��Q�@��Sl_��@�6��]1@�(��w�A�x#@�@A�a_�AɾK�FA"�8����A(e����A/w�P�vA3V��1��A7�@�i��A<H$��"A@�K���AC�����AF�A�AJN�:�AM���SAP�/��ѳAR��KrAU|��AWp
,�AY���R�A\yY''�YA_-^G�KsAa /�NF�Abx՞׎�Ad P���1Ae�lc�s�Ag;{G-Ah�sPIOAj��f1.Al�7��FAnc0b��bAp)�*��Aq*&̟��Ar2a�'��AsB����+At[#�+�Au{���Av��X"'uAw�7��Ay(PFK�AzR�)1�IA{�3����A|��PS�A~M�O��A����lpA���&-�vA�DzΉ
�A���i�|cA���lPA�|o�?6}A�@�A�3\�uA����FA���&�P�A�s�,]�A�J�øtA�%Ю}�A���mA��~��+A����_3        ?���?C��@�3u�Q@%�R�ѣ�@9Y� +�@G��'���@SF	��@\���&�@d-���@j�tn�@qD���%@u���L�@z�J�9�@�1�����@�T�5�?&@���.=@����mж@��?��)@����)�@�E���*@�+Ok�@�kY�@�g@��9�ú@��Qf��@�@}��@�����ln@�Ne�bO@�&&'"�@�63a]�Y@��6�oV�@��׭���@�c-��C@�a[�B�@�}�8�v@����B��@��+x�!@�����@�t
�.@�iy�!0�@����<@�H��~��@��>��)@�_O�a�F@���fC��@˪�b�@�c��[	@�(8 ���@�|9���@@�i��^��@�]aơ@�U�᰺�@�S_�(^"@�VG�o@�^J��<N@�kS�h��@�}?]_�@ٓ�Q���@گk�,@�Ϊ�Q�J@��¶�w@��5�@�H0-�YK@�=��@�ز��8        ?��6\��?���I���@!�'N��@9��Ȝ��@Mn:��X@]N�:��/@j��0�B]@v��;3@�������@�)��b�@���i@����50@��9��3@�����@�r�CX+�@�bV���@�f̽�°@�i����&@�G]��@���{��@��զ�nA@�:-��F@��c��@�<k��@�1d����@�k�H�w�@���4!��@�A&��@�ߦ@8G@�	�ǎ��@�X�c�w@��Z��!�@�e�lz�@�$�(��A �K���<A�."�A��維AR(#b+�A��V�7A�f^���A
͇��Z�A��0�~sA����M-A{���A�D�wJ�A��{���A�{8�1�A"2aAuTAe
QEPsA�ɠ�A	k��*�Ak9w+��A׬�AN��-S`A�I�,��A /s���yA ��g�4A!΍�`A"�2p�3A#�36��ZA$k�:OA%XGt���A&K���%i        ?�P�jK�@ �D���@#����V@?�tw9@TǛ��H@g����d@w�o��u@������@�%�o��@��	�0��@�7�+��1@���U��@�F��-�T@�KU4j�@��0�m@��O���l@�BH���@�T׉d�d@������@ѣ�O]@Ԯ�;y�@�+�Zo@�&�|�ù@�V����@��w�Kj@���f���@��<�p�@�l:8@���s�D@�-�3���@�d��J�@��r��[�@�F�����@��V,��z@��<ס��A �*�Aw
�U�A#���A����A���J�rA	�*iy�A�^�jsA�q�R#hA�y��AO��Y�A�Ю�#�A�N+��A>�ppHA���)A.`�J(A����0Ab�����A����A�[A��|A [r~�A!P�>�9A"N�ҨW�A#U�]�.A$e]��A%}�j�	3A&���:��A'Ǩ��A(���T�<        @x���)�@�c��@ΫXs��@�P6ǵ��@�=n�vb@�0m�=yAdM�;�A��Q��=A���5A�ɃA Xpv��A$SXӑ4 A(�\]�cA.���1A1��ޖm�A5E[3��3A8��OMh+A=2���A@�K��dACO��<h+AFV9AIb��@ALP�V��AO���ɉAQ�b�O�AS��?�LAU�>�X�AX+��zN�AZ��w ��A]$�ⲧA_�d�I��Aa]����Ab���Adx�����Af"�j�Ag�'�瑈Ai����8Ak�s`��"Amy�k)�Aow�5u�Ap��0�	Aq�M����Ar�x?�B�As�QO��Au�K��AvGMԥD�Awuؖ%�Ax��4��Ay��`<A{!�ȧCcA|f��-TA}�r �=A~�1�Q�A�)=T��A��  U,�A����qA�2t��0=A��]D�BA���0�zYA�ML�W�EA�0%���A��|�B�A�|i�3�B        ?�^�Jx@ ��?�g�@<o��5@O�]i-@\�CZQ��@f�G�i@pT�dţ�@vR��T�/@}<@���=@�������@��ޓV�@�����i@�����@�j3w���@�����Ǒ@���DG@���O��@��jw�$e@��>vb�@����$�@�6�1��{@���$�{@����@���;>)B@��4ru5@�"y�#U�@���d��b@� ����n@��,AJD@�XC<.�@�
T~S�6@�˚ |�@��:Үc@�|a22$ @��3Q�bF@��r@]��@¿H�/@��	�Ն@���g@����~@�>�[p�7@�w��.m@ɺ�U{%�@��9��@�bK����@���OC�@�9�R��@�\8m<j@�"
�'@��m�^(�@��o�nx�@ӛ��:�@�{\t��@�b%�v+@�OG䉼@�B�t���@�;�uT^�@�:���@�?KP��D@�It���@�Y�eYT@�n'�L�@ވZT�e        @[��fZ9@9�ڱ�v}@W�T�q�+@k̭0f2@y�Te��@�d�q�6�@�S�C��}@��65 <@��s/�w!@���9>��@��aN��@�zi�m@���H~M@����p�@è�4�@�.hl[D@�bos*��@ѧ��F@����9�S@ؾ�۵�M@��,�?�@��@��@�VO̯��@�'�Gz��@�?�2�S@좼1n��@�)�9 �	@�*JT�tg@�S��͜@���{�oZ@� �&�@��^-^�k@������A ÷���AT)x��/A�o 6�A��S�g}A�)���1A	t"���FAu
���"A� ��A�����A09�J�A/�v�4uAi�a*A���SadA�TE��AXk{�QNA��(>�A*��M؉A�ؑ�QA"$z >A�(\���A r�v��A ��է��A!����9^A"��Rߋ�A#q4���A$RȥMM�A%9���5A&&�r9~VA'��!jA(5 �Fw        ?���Q �@&\E�G7�@D����r@Y �5D�@h5�q>�@t.��N~k@~�Zw��@�X�z�p�@��y�U�/@�цs�rZ@�[7���@���4�	�@�g�m�@��&��2@�]\q �@�Aґ���@����$�0@�����w�@�j |�I�@ż���@�v�Ha�@͜�ԝ@��)�/@ӡʃ�@�e�ӌ|@�j��q�@ܲ�2��@�m**@�	�I䐁@�O]��@�Q�N(�l@貿3���@�?Gˌ�)@�����3�@�q�p��@� *)m��@��^S�@�l�[��A@�M�,�8�@�Kg�T�@�g=C`(@��U���@���w���A8:Z?�A��\�� A�*a6��AD�/R�A�c�}�AF kh�A	��Ȓ*�A�ZW�AH���	�A�g� �A~}S�Az���nA�o|�Z�A�+��?�A�>u�)�A��aA�W�QANC��4A�~˽A��{��        @�������@����f"�@�<�",<�A�n;y�A__��!)A(�mLw�A1����-}A7�ޕA?$�셚9AC�}��AH�^*AM����AQ1�Cp�lATD�ˤAW0'���yAZ}��|L�A]�6
���A`����R�Ab���E��Ad�"�M0SAf��[j�oAi7�?@$Ak��h��An}w���Ap\I�ڴmAq�{��XAs5Z�/��At���0VVAvX�
-}NAx��G�Ay�Gl��A{�&�6�A}n5U��AY���BA��"`��A���A��A����}�A�ζ����A���Z���A�M	���A�<�D�LA�sCxj�7A��ri���A������A�R2��P&A���<y�A�IO���A�I8�/v�A�
.R1A��fЈ�A���_<�A�p�t��QA�H�}�A�&ͩ�cQA�
#f�C(A�����A��N��A�ң�nݐA��v�pA�ďQ
�A�ü~�SA������A��f����        @���^:@@��&\H�@Xˎ�ۣ�@i�_ ޡ�@u��o.��@��I�}�r@�:ǵ�J@�����,�@���:���@�����x@�Ƃ�z�@���J���@�~ʹ�@�/��A�@��I��P�@��)��E�@�����@���D�@�v�h��S@�Y�w��@��Z�J��@����i��@�l�L�8@�Y1 Ƚ'@�Y��>[�@�n�e�ٖ@�̊wN�}@���@�.�to�@�Jׄ�q�@Ŋm�y@�Ճ s� @�,��7��@ɑ�3b!�@���N��@̈n-���@���E4�@ϻX6c��@д�kz H@ёX�O_�@�s�µ��@�[� ��@�I�b�L@@�=^���@@�6�.��@�6���^{@�<���*@�H�շ��@�Z��9��@�r�3�Gw@ܐw'��"@ݳ	2���@��Rf~�@���n�@���tz�@�3��I�@��a� �x@�lpR�	@����@�/�H�@�\��C�@�
���@廤�+f        @#��E��2@P��l�H�@h����Ѓ@x�ҟ�@�{wQ��@��X;}WJ@��68eb@@�|����*@���~Om@�W�R���@�52q��@�y"���@���	g�@��"	r�@�sb�[��@ǵȼ.�@̴�϶-@�Ei>��@Ԫ-"��@ؔ�q�.L@���@�W� �4@��(�9�@� �k;�@�7�0Y�@�P��@�}T��/@���_2R�@��t�Ⱦ�@�e뙨l@������R@��\r�F�A��nN^2A��9��A��=��AAI�j'��A
��x�~=A^R`�tAA���QA����A����A�p1�eAm,���CA5�@U�vA���qAU*��Ab>{A �t�cA!"���FA"@���A#g��uUA$�����HA%�+���A'�t�xA(_c�YA)���#�A+H&m]�A,{�[�I�A-���`A/k����A0y��݅A1C��A2B�09�        @
1p�4ܟ@3�6�Ud@M�ݩ�q~@_#��
�s@kP�Hx@u�%��w%@�.�hDSr@�EMZ	�@�E����@�BM����@�����S�@���P��@��j|��0@�S"�3��@���kW@������{@�sY���@��[��@��R9�@�;Cca@E@��y8
@Һ$&�z@մ��R(�@��N�c@ܒAq2��@�<�o�y�@�ZwR��@�-����@�e��m�@黓h�20@�:��j@����:@�dO�[�D@���o9@��Q�	�@����Z~@��Pu� @��X�@�V�j�d@����S�A$ě�OAz�Q�1A�;4��AW>JB�gA�+�jgAw�"��KA
!# ��Aڔ�A��V;h�A|^سʠA�݀��A��N�^A�R�Ύ�A��I?�A�@нAA�4�֎�A�h}FD�A�?�a�A>���|Am�z��A�I��cA�"��;OA(���        @裛g�A]5Ξv�A*�{B�ȾA:�2��1�AF(I^g�cAPnA�돥AV�����1A]��Q�_Ab��WDAf�9�+ӣAjψ�=�Ao?��`��Aq�Y�AtTP;�QAv��wRAyit�o�A|�.&�A~�gN��A��̃�%A�}gj��A�8P~g�A��Wq�c�A����ɓA�c�&��A�Me�U�uA�KO
�U"A�]m���A���p�sA�ݙ�.A���A�0�:j:NA�h�*A��E��A�����3A�H��L^�A����hA�bdb~A�zc�IA��oJhA�.�F8��A��x��A����`�A�]�PYqA�}C�=jA��gg��A��I�Ԕ�A�U��\;A�A��U�A�߲_��zA��T
|}A�u��2ݦA�F��$YA�	�
�;A���+wySA��n��A���G~��A��\$��A��TN)>	A��y[�'uA�_UF��A���%7�"A��^�r�eA�/m��!        ?�mŌ��@ �c���E@=z�ڊ�@P���ʫs@^5��y�#@h
����0@q�ʄRЀ@xc ����@�.����@���7N/�@���B]R,@����R��@�٠UA�@�&FѬO@������@�dWߙ.�@���@�f�@����C�@���W�k@�T�#�|�@����U�@�m�nT�@�0x��;@�o �-�@��Q�}�@�0��%T�@�㻍Z˜@���S�@���2Ԟ@���)��@����N��@��4���~@�'oS3@�Eiǐ��@Ç)4o�I@������@�1C�	f @ǘw`x��@�Rh�@ʈ��+@�)ԱH@ͦ�IVi,@�G�0��@�zPOWi�@�V�
�.�@�9s��d�@�!�)�͸@�?���#@�z,���@���x��	@��>���@�!P�i@��gރN@�(Yn��@�D��r��@�h��e��@ݔ�n��_@�Ǌ���@� ����7@�,k�ͬ@�E%�s}@���~/��@�K[��        ?�Uy�׵�@#4��*�@EM>��Z�@][p9U@oa���\@|ۑ*)�@��X�._1@��zX	S�@���A��r@��L�$��@�1��C:�@�w�	���@��	ӵ+�@�U�k��@�њ�v#�@��<Y��4@�dp�;�@Ӧѐ��@�D��-|�@�A
5��@ߠ��(�A@�4MT��A@����p@�& LB@��a�9�@�4��f�@���F�O�@��8�~J@��Yj1�@�4.}��@�����\@�9i;��@���P[�A �p�b�A��%��FA'�-k�A�݄��A����ƐA	�M7�mA��6�kNA��hv��A�V��A'��	z�A\�3�ҭA�n5@�A�7��AG��k�A���\N�A$p_��A�	lF��A4/J�{2Aή�2I�Au3���A ����PA!rvO��A"V���4�A#@^��z�A$/=��KA%#;��b�A&>�0t�A'.J��BA(��6�A)$L��        ?�N�:-m&@'o��h@2*\�Y�@II�H
@[Ǹ�#�f@k4b�%1@xM�I�W3@�d�钃{@�-��z�@�mCl$�@��ģ�u@�~<F>�C@�mC�4�@�c"��_�@�'�0@�@��6�{@Ğ%���
@���7�5@̓35@�@�\V�=��@�=HG�^@�h}��[�@��cf��@ޯ�84�1@�k��)@�b���@�!��_O�@�ʎ�֚?@��3ju@����M�@�ȃά�@�ٱ'��J@��(��ft@��H6@��@��߶n� @�@���=@���	}��A j�/�Ag�����A�	%pA4����fA��7�NA8P���A���UA
p�8/lDA���4A�|��A�)-BA�{!"ЮA��@A��I�uNA�����A����EZA����tA���fmA����ZA���.�;A���Z�CA�q��:A��3xEA0��Im�AX��N1�A�&��f�        @�r����@�DxA,�A@���V�AQ���ݦA���f7�A#�΢�P�A-GS1(A4E�8W�+A:�K]+�AA/�z7AEZ D��;AI�L�:A[AN��8}2AQ�"�{K�AT��kw��AW� VOAZ��sN0,A]����.A`��M��Ab_.��PGAdB����TAfCpf .Ahd����Aj��p�݁Amq�F��Ao�XtGAq6� �R�Ar��w�WAt=�)QyAAu�����:Aw����[Ayp�5�N1A{TAZʎbA}I�AMt���A��$��,A��V Z��A���RVA��ɲV�A���5;�A�?�{\��A�oօ�l]A����HqoA��Дv��A�)�A7''A�v.L�*A��#�J0A�"���WA�A����rA���J&��A�����h�A�j ,�A�*�B?��A��B�bp�A����	 cA����͞�A�i� 14�A�H��{\tA�-f%ϕ1A�F����A�C;��A��YB�H�A��*�>0        @Tׂ�&@5�x��!@R%i���@cŹ�&T[@qh����@{ n����@��5��A@����7�]@����(�@�T��yn�@���k�
W@��w��@�X[x�P@�"W��U�@�T�'���@�yd�O*�@�����[@������@��Ba��|@����4N@�M��+@�?�����@��8�M�@��a��@�6��p@�xDɵ۴@��㹬%�@�i>j�&@Ћˤ�@���7�@�iT����@������@։g��,@�3Bw}i@��qr��w@ۻ�D"�;@ݛEqn�|@ߍ�!p[�@�ɨHA��@�ֻ�6��@��>�;�@���T!#@�@�:`�
@�|͸�^E@��'R �@��h�n@ꄀ�j�j@����y@�����7@� ��A�@�h�.��N@�KEY�@�8RA�8;@�0�1��@�2'|��@�>
��G5@�Su��8�@�q��G@��F�l:L@�����g#@� 6M�-�@�>�z��@���W.jA        @�h�\fu@:Ǜ1�@YΜ�}6C@p��Ŕ�@��Ⱦ�c@�$� ��@����ꔖ@��1�H�@��r�g�@�Ӂ�9�@ǭ�z�fM@��ŭV��@�gs^�a@ߚu�H�f@�� E�F�@�	���a3@�6�e�@��=d��@����ҔJA N����A��b��A�*A�s�A�ٔ��MAL�K��A����A�|���A��x�-�AZ�&0��A���ak�A!� ]q[vA#���Ij�A&$�l� A(pd2!�%A*ܽ�l#�A-j�}@��A0�7J�IA1w�jb��A2�6�A4�F=zA6 ����A7�_��t�A9�̴գ�A;Yᯛu�A=1�Sװ�A?"ߞ�A@}�ݽ�~AAsn��֮ABitR��AC\2r ��ADJ�-W� AE2�a��?AF�C��AF�޺�d�AG�y�>]�AHm�d�AIoz�2xAIUPk�AJZ�?Vv'AJ�в"WAKk�`�AK�x̻Q�ALZ���ALǖM��Q        @-2��R��@W<��/�d@sM+��@�f^؃��@�0m��@��+Hɐ�@�4�I��x@��")==@���P�\v@»ӛ��@��P�� R@�%�r#i@�h�1 @ي�d��@�~�e2:@�*{���@�w�:�@�{���@�<�ֹA�@�O|-@�0���k@���b��@��U j>A �砪&�AF��- A�@�w�A� O"A��/�OA�`�}p�A*�	gA�T���Aj�=�AF��n��A�è��/A"\�YަAϣ����A �~b��A"X�;A#�E~�oA%�-]�A'tU�(5A)[�r��=A+]/���A-y|�iA/�S���A0��ƸͧA23޼C��A3s`ݫR�A4������A6ǌ�^�A7d��wU`A8����A:���f6A;vNd��9A<������A>&{?��A?x��0�sA@b���{=AA���a�AA�x��gcABE]�M��AB���Q��ACy�-�J�        @ʥ*�X�p@�p�W�fA�J�A,{��$A96�����AC�|�bAL��R�AS��6NAZ/� �A`�4���AeU�q�>Ai�F��Ao4� nVAr�vL'ΩAu�PШd�Ayt:� yEA}Z�	r�A�ǅ��A����A�g`����A���IЅA���q��{A�e��|M�A�1g��f�A��([�]A�u3fnwA�<��#�A��/�?aA���>X�A�%Y{ �LA�M7��,A����HX�A���[�EA�%7N��A�e�^�RA���c��A�؈�*A�e`]��A���M��A�J�z�'A��_{�nA�e����A�	`��~A�]����gA�?w����A�)�U�AA�}dr&~A�*��UA�#�*�YA�7����|A�X�m
��A����o>�A����ܵ�A��C3k�A�p�/|�6A���oH~�A�WZ>���A�o��s?,A�9�t�SA�	���A�޵��f1Aø�ڎ�1AĖ�.D �        @��4@F���V"@aO��<�@r<ɂ@�@8�RB��@���4x�@�� ��)Q@�\P�~��@���g��M@����R4J@��1{N�@�^���X�@�1Z�cE@�8?��4c@�[oH��@� ��^|@�UMǯ@��ޜ&@�7��e|@�#Q�@t@�'���ex@�CT�t�@�u�8���@˽~���@�'��	,@�EB�m�@ц���{?@��(^�6d@�&��aZ|@Մ�AL�P@��V2�/�@�]�B�$@��P�A΄@�\s�'@��z�U�@�z��@� ��$M@��n�d��@Ṿ��@�3�d4�@�u0S���@�Z=DF�@�D�'d}@�6����@�-�8�@�,w	�%@�1��F@�=�k�+�@�P��`��@�kp�9�@�cE��h@�Iau7@����@�6���@�;�mz9@�����4@���5@�B۪�@��dc�@��ATC�@�h�l��@�%ڱ���@��h�7�        ?��f̷@2Qv$q�@P���pn[@d Ex��l@s�6TH@�1����@��wQ��-@�7M��@��p���@��׫6,�@�̽�X��@��o\��@�K�dy�m@��O`%�4@ş�~Վ@���K@�ƀ�A��@������@��J�w�@ݖ���}�@�q�zK�@����q@����]9�@���@￧?���@�!T-�@��,e:�@�Gw��1�@�0�a�7@�UI2bÏA [7����A*|+J�A�	��qA%�<ߚAR98v�xA
�d<��A ^)�A���T�^A�z��Az��u�A���Q�Ad�qthA������A�3�s��A'��3�A؇�s�A����şA^��v�A �e�ΌA!��,�$A"}��lA#u�|�sA$r��u�<A%s�0*��A&w��ەA'tn魗A(�,Ά�UA)��*��A*���A+�#7Y˕A,���s�A-�vL]$A/��7�m        @�Ib��o@NzR\��@m��/^@��gb��F@�!��6d?@��4���@��[G�L@� �o!J@�t\�d'@���/��e@�~ՙ�3@���US)�@�U��|�[@��Fo	@ےpW׶�@�B���;@�������@��[X�@����_e�@�M�%�x@�p��7@��ϥ��@��� 
@����V�A`� �A���f`EA��J��Aa|���A��}UA��\�A�5�TA�d6�Aʩ����A�cG�]9A[Ǖ>�(A9��DA$g� �gA��\aZA��ũA �|q�ͪA!��T�%A"���H��A#�s��A$���'qA%�B��A&�v���A(�	-�A);��Zp�A*\I��SA+}����A,���НA-^��A.�I�(\^A0�����A0�v��EEA1.����kA1Ÿ��w*A2^�a��wA2�x�guA3��>�,�A49��`AA4�J���A5��w        @�;�ZoA�E��9?A&.���zA7���AD�< ӽPAP.�D*��AW�l��A_�D/�Ad��<MAi j�K`An��CTKAra���Au���P�Ay2ye�y�A|��9���A�|%�f:,A���Uޗ�A�����A�"�'U��A�����zA�����ZA����'��A������A�X�Г�A�i����A�ط9��UA�O��71A��Q>6�{A�W�zrk+A��+�X�TA��ôpA�(\���A�ժj�PA���Z��
A�����~A����,�dA�nɥJ�A�Yj� ��A�G���]A�:��.�A�05
�iA�*1 �A�(��YA�)�����A�/��VA�9���n}A�G��`�A�Zm륁�A�s2���A�I�j��A���L�A�z/���wA��P�,A�Đ�5��A�sa£�PA�'�v�boA����?5CA���I��A�^�.A�"'TXA��+���A��`?�"�A���q�        ?���򲗐@��f2��@/� ��@B!�j��@Pt?�=m�@Z�9 @b��V��@jxtOn@q"-�Y�@uќI�VA@{))�}C@�����+�@��A����@�e�(j�@�^�q���@���-�L @�:z�@��[����@���l=�@��y�=�z@�Ñյ}�@��/��d�@�k1ؓ�@�Z�;�/n@�gMz1`�@��(�jTD@��wf|��@�Ae@ǎ+@��6�|�@�:��'}	@��Bk�@��B�_@����m�]@�L졜;�@����@��
��@��?L8k@����[�@�Q�&�C@�\({1w@�ob�K��@Ëø���@ı����@��Ϊ<�:@��^��&@�br�9~@ɴCr�.@���	�@�~$`sk@��A�e�f@�~ei2��@Љ��p��@�\X��*@�5m�|dE@��F�m�@�����@��D���@�٣���@�ϼ�S@��(���i@�ȕ��2@����>@���-c��        ?ʵ��_C@���-�@(�L�@?�hZ�>@P=��=\@]a^|
\�@h�����(@sh�8H
�@}go��@�w�{��@�Z�b��@��:�星@��|����@�C=�pG�@�f���	@�pٻ�_�@�:74��@�CC��@�ߥ{�D@����@�?��1@�\�X�G@�ѐ���@�H�
�I�@�vKG=M�@�W7��0@�צ#<�@��0t�T@�I��"\@�w]�hc�@�o	�Ð?@�0����@��ק�d@�7�+	�@��!,a+@�z�)$.�@�d�;�G@�*z:��@��Y��@�c���wN@�"&�T�@�� �~�s@��y��,@������@��`�hk�A p��L�,A���q_�A��o.+"A��ͶA9�":�A;�^�A}�2���A�2��A
�Ҋ�AqҰ���A����A;��j�(A�o;��A��	���ASE���KA$p�� A�W��A��qY0W        ?�\�ޤu)@!�,(�@@^rD@S�Hi1)�@cDA����@pƕz�Ve@{Uu�@�CXQ3@��Д�p�@��uа�@���[@���{�d@���V��@�J����@�� ���]@�a1]q1�@�<嫻\,@Ħ;1l��@�n���@̙3�f@Гf]i��@��,Fl@նj@ؑ$}�"@ۜ���@�ؾ��O�@�"��xh@��Ԍ�A@�����8�@��	̃�@����4�@�?�}�8@��~��1@��y?�@�_�>�+@���Fɝ�@�5��`#�@����{+�@�VO=9@���|�v@��87���@��{��j@�n�-A /�B�UTA1]�0,A<[�HK�AP�{� QAnof�ٟA���M�~A��,}��A������A	8�ߘO�A
}���d�A��W�t~A�"�Ar�o�A�\��A�%؃�AMB0���A�-9	IA��~�CAx&��A5�ǲ��        @�xR�ߪ@��,����@�
2���^@�����A�ɥ!NeA�]��5�A�A�=��A �?��~�A%l�k�T�A*����A0FzNC_A3{���]SA6���ܘA:ϓ�'��A>�]&�qAA��$�ADP��_AF��w���AItג�8�ALd��u�AO��8�9\AQm���AS1�x��AU�s7AW��?VAY'ŰV��A[`���A]�E談�A`��ՎAagc����AbƿP��Ad8���Ae�?�(��AgS�.AAh�s��_Aj�g|�Al��I��Ano0�rw�Ap.��4��Aq,��L�Ar2UoI��As?�*�SAtU�IJ�Aut��8�Av������Aw�ib��_Ay	�ml�VAzNÇ(�pA{���oA|�]WS�A~Ye�bHA��6�,A���g�A�a��\-A�)�\}�A��.�)A�Ź ��A��M~�O9A�r���T�A�Nbd���A�-|�E�LA���j��A���-gx�        ?��G[�ԏ@$MP��M@AB�i��@S)�[�@a�(u��@j���@s�e��$x@{+d&�y@�����@�`�d��L@���(<�@�B.����@� w�\�t@�TZPI�%@�ձ���/@�ҭ�[@�e�-�/@�)�j=@�#�N�\I@�WUe�l�@�c�I���@�;�R9@�1X�&o@�G-ꃄ�@�}lk�
*@��zl�?@�Q����@��2�<\�@�]+w��o@��/`�&@�a�9��@� a���T@ǲ�{�j@�w^|��@�N�ɛݯ@�8"Q��@�4i�3	�@С�<�*�@ѳ4�$��@�Ηl` |@��G�yho@�$n�1d�@�_�RZ�@ף�kg�h@���P�A�@�K��`�<@ۮt	�d@�����b@ޓ���(�@�kY^�@�����@�@�mk"d@�tJ;ω@�M�}И�@�-��� @����@� �>´7@��Yx��@���M�V@���Яm@�����pM@��a�X�@�
�V���        ?�h}l���@'B�:��@Hcm�;Z�@_�y���@n�K7+�x@zE�2L�@����@�O�xf��@�a�}ԯV@�(f��4@�S�h[�@��(��@���.���@���N���@��#3p��@��.�Z@�j_�r@���)@�J�t��@�ӱIg�@Ϊ��mG�@�j�G�@өpyi��@�_R�{�@د��Zd�@�y��{��@�t��s�@��Ns�)�@₪^O`�@�O�L/��@�:w1D|@�CJ�@�m3�@�@�WJ�O�@�)	&O�@�޶^��@�;����@��T�@�1�<l�@�̐�:p@�~MT�b�@�H���@�,�8�}@�,���A $�^�gAA��AfnAnF9ץA���.�A��'��+AN���hWA��M��A	0:|�A
���d�AN}.Q�A������A���5nA�Gn��fA��Ǆ�fA�~�8x�A�?���OA�+�$�A��B z`A¾�-[8        @��IIg.@O��!�'@k��"���@~n�Y?�	@���br@��Ͱ�az@���n�@���!=@�M.F.:@�����@�@����QV@�\��9@��&i�P�@��l1��@�P1�y@�٧@Y�|@��+',>@Ѓ�s4@��"�Y@�d�ۀ@�%��m3@�q�۸W@�PV���@��S<ĴZ@��],K@䘙#��@朣�꾍@蹹iܤ�@��R���@�A��x�L@�Dm'b@���i;�@�s�ס*C@��[�4t�@�T�w�|�@��O��n@����?�@�3�b�;@���g2	�@�՟�Ou@�œ	���A 僺�n�A� &&�CA��>&A.V3�9�A[�s�A��S�4�A�'~-�A	Z��QA
c˨s�A�+7xuA|ۗG\Aw��B�nA�x��_A���ߔ.Af??�cA&O�n:A�����A�U��sA|�hD�AM�M�n�A#ߺG��A $w}E        @����[�@�#��sD�AK9劁A ��`Y]A-)���yA6Ksj�#mA?i6��[wAD�n>�<AJ��Cf�:AP�����AT9���mAXz�k(A\-��4�A`F}r��Ab�l��lAelezaAg�rq�iAj2\R_Al��n�Ao�%�^�#Aqa�߿�TAr�5:j�At�DJ�ՅAv(I�?��Aw��>9e%Ay�v��A{��P*��A}�4�
�A� $
�A�ۛm���A���G�@A�&�ݥ�A�^`��A������A���o,�A�Ixy���A��G���A��7=) A����#ުA�&U\��CA��4z.~A���:�	A���{&�A�t��7שA�b?w �[A�X|8&�A�W��p�FA�`:��A�qة�@�A��j�!A������iA���;��A�%�c�A�[�����A��@I�J�A��O���A��p�>�A�e�=ڹ#A���`ܪA�ޣi��LA���A�i�_���A�6���p        @��s�=@4���X*@Q[bib�@cI2�J�y@q=��ר@{�*�]@����7@���UZ�@��e�n@�L����@��<|W%|@�͖k�̫@�;�e�@���tK�@��`Q��Z@���^��@�8��Nfu@���N�`�@�A���@��5�J@����<�i@�����{@��c�m�C@�Q�E�@�]�V�@���'{ @��P���;@��l��s@���(��R@�)�+R�@еa .��@��[�:k�@�����c@�^�A��!@հǘ�>@�����@�{�2�=@��U��o,@�t�6��r@��šФ@ޛf�!9'@��R�F@���AK�o@�հ���@⹚(��~@㣭���@�	�",f@劬�e�_@�xO��@�Bߖ9>@��6���@�s .��@굸:��@�ϕ�Z��@���4ߋm@�''�/@�<, E�@�4�3�@��W*�T@�g���@����j�@��L�B�@�?�]f��        @�--!T@FJ!���@fp�T�+�@|5�l�H�@� �i�8�@��w���@�Bw�1��@�z��Q�@�oF66��@��ОY��@�/M��N@����@�#��Q��@قdC�g�@ߜV���@�7*�{@���2�@�~|�@�n3J��@�	$s���@�x��
!g@�<|��-@��-k<�@�Y�Fxs@�#��$�A {!�?]Aw�_\�CA����A}_�ԝA%�q��A�A�*rGA
=$�&��A�KՔ�A��ވhlAF"aCtA�sN�Af8LW�AN���:;A<5O�GA/��8�A*u�A,� ��A8P�AM,�mNAl���=A�r*�WAūe(A����%?A?-��wA������A gS����A!�G�pA!����A"\�_��A#����A#� ��A$K�,�e�A$�z��dA%��б�A&0b�aA&�#qQ�5A'p��>BA(!EH�7        @#.��tU]@Ut�xڝ�@s�l����@�4z��@�C�մ|@����a�@�Y=.B#@�;�q�E�@����f@�g�B�+/@ҼǄ �q@��P4Ҕ@�3�=��@���{5@�x΅{��@��'��r�@�s'�1��@�F	Q�*�@�
����@�m�Z@�O�J;q@��ة�|mA[\�@DAt[���~A��0�E A=�UgA
��D�f�A���S�A��\лVAa-ɱ�AM3�Ͱ{Aa��C��A���
OA�f�A��eP�A "`�\i�A!�o3PK]A#	#r�z8A$�f7�A&.6�>lA'հec"A)�]f�IA+Jn�KA-@mB<A.�ɦx�~A0f��e<�A1[^]�IjA2T!�#]{A3Pv���	A4O�x��A5Q�'QA6U�d�O�A7[.����A8a(oâjA9gKN��A:m)�a�A;rx��.�A<w(�=�A={rj-CA>�2�A?��BT��A@F��0�A@�0�g��        @�j�����A!�fNA������A0˳�y�_A>���|GAH_� ��AQԆ�E�AX��QҋA`9����Ad�e�ɗAi�x;@��Ao|�3Õ�Arު)I��AvC����Ay�9 �PA}��ћ��A��}0�A�^���yA�W�K�5�A����]��A�[N/ ttA�����A�	6����A���D���A�H�a���A���W��A����OV{A��t;8�A�#�£��A�jՍD�vA���� �rA�4G���A������A�Q$6��A��2H�k�A�2��i7�A���z���A����}�A��.�,(0A�r��g�A�6b|���A�;C8A�H:n8�TA�]n�?A�{ ��f�A���t�A��,�H6�A�Pue�A�B�y�&�A��Tj���A���:|1�A�"8U�;�A�wp�7��A�� �~�A��A��SA�G���tA��)|1�FA«�-�(gA�^���o#A���r�A��D7؛�A�x�A�߄A�,?a���        ?�����\@��:�4_@8c�m�@J-��=
@W����@a�nu\�@i�:�6o@q�}�K-�@w ����@}lpN4&@�J=��d@�SB�C@��WF���@��)�m��@���C�z@��G+���@�6M�m�E@��D���@�w$.	�@��m�7��@���{R��@�������@�1�2fQ�@��V�u�@����W@�����S@�l�t�)@�B8:$�	@�2�C�@�?���@�h�E=^]@��U���@�S%�8@�H<��N@� �/4@��%�`��@�j� ��e@��|���@ȍ7����@�>�����@���X�@���_F�x@�ߩkM�$@����uz@�����@�1[���@�`%7ڌd@՛�8 @��L5�>�@�5�`��G@ٕ���@��{�s@�|�{K�`@�גFn@ߗ�X}��@��@ ���@�r�<�@�O��!�@�2���F�@��}��@�
��<��@��q�eV@����՝�        ?���:��@&����Q@D��w0@Z���%@l�X���@|���0v_@�a9a_s@���ِ@�K�?R�@�ş|ǡe@����Y�@�HR����@Ȇ����@���u:V@�~@e@�3�9)l@�{y#[[�@��L���@����IQ@�pD�4�@�3e�G�@���9�@�ΟL֡@�6 9Ѭ�@�k|��:A]s��y~Akg�A�
@���A�-ɍ=�A�pT�A
���B=A���0OA�҄�56A�|�R|4A���DA�͕j�A1v�y� A|�2P^�A���<�A-��3�A�u="�A���4��Ak���Y�A�l_\�dAb_tڛqA t��)�A!<{d^�A"	F4�A"�y�;�A#����K�A$��עeA%vV��A&a�I?!~A'S]d�q�A(KӲ�dA)J�&�(A*P�)0MA+]+�9y/A,p,	AɃA-������A.�C��dtA/��J� DA0}Z��        ?ւ�2��]@
mj=�iY@-R:Y߂@Fc`��@\)�{��@n��F�r�@}������@���ޠ�	@�/[�@�Xpu��C@��۔���@�M�I��@�2e�ҏ@���@�wt@ũڛ�*@˃�c)�$@�&�Q���@�
��#�@�u!X&UC@�lÛh@������S@�XbyA@�xz�T�@�6Z$�MK@�'�=?�@�d}o@���'R�B@�w���p@�R����@�fE���A Y=,��A�Vl�'A���W�mA�}�}�CALvS��A
->1�Ak���A�Z@<mTA�㱫$�A��K&A_����AD���A�,(CA�k�W��A&��MBAz�q��A��g��$A/�?���A�[Y%��A��1���A 1�k��gA �_�N�BA!��tD�2A"d.�RA#%�����A#�N��jA$��hf�A%��+ A&N��^8#A'"<us^A'�A�4k1A(Ԃ o$,A)��N3�W        @�Z*� @����2�@��<l	�A�"���gA����A��eVA!1$z+A'jZ���$A.��7���A3��1!�A8�P�|4�A>M��DtABt ��k$AF8����AJymʘ��AO8�x��AR<�U�3�AU}���0AXA�����A[��'@WA_@̐�0Aa��U+x�Ac��[*��Ae�c�?�zAh� �Aj��L��Am�l?��Ao�.��A,AqS�:�wAr�� �AtZ6W:QAu����c�Aw��>�KcAybyѹ!A{68��yA} W�܈�A#lI�A��W7>�A��v6�
A����)A�%ي��A�r�ܰqBA��UUr��A�?|��{A��½���A�P��bMA�� ����A��w���wA�2���h�A��
I'A��L_uA�w�W-�A��T2VA���IӴA�(7�)\A�E��+�!A�l�4A�;A��! �PA��?H��A�a��A�k�����A��>'�h�A���AG0        ?�A��-@3����|@1�]���@Dc�+�u�@R����]Q@]�H݀�@e��]sT@na�0���@t0QE�FC@z4�
��@�Y	�:�@�#�M�K�@�c�p��@�r���@�!ˇIء@��霴�@�����@�Q%�4�@����gP@��՛��n@�ޞߠ�@��.]_'@�N�P���@����>�@�;1�$@�������@��=��i�@�9\S��.@��Y���J@�7�ݙ�@�ɥ�5@�g���(@���Se"@�Ǘ�+5G@��F����@�Vx���@��~\�@��^�V@�>�9@�~:����@āva�@Ŋ�t�I�@ƚ<N�@ǰ-��t@��?��Y�@���A���@�ڨ �@�G#+E��@�|��	W�@θ*�T @���l��@Р�:ۼ@�G!E�@��m���y@Ҝfv/�P@�J�,Z�L@����XQ@ԯJW��@�d�-܋�@���i]@����Y�@ד
C]n@�Q>07��        ?�D1���@�7�@?����X@S�\�",m@b������@o0	�t�C@x���@����U'�@����q@�惫�"z@�~�1Q@�Dm��@�����"@�p��0��@�.[�7�@��F]~z�@�q��S#�@��D���@�{-r�@���$4�@��a�x�2@�R��͓�@�k+�Z@�;94�@�U<�x��@��m{�<�@ׅ���)�@�}o@p��@ݺ��� �@����@⎱�ۗ�@�(hb @��/�B�@�[�	@���q=�9@�Ȁ�G��@����drG@�s|.��Y@��˦{�@��b�D�%@���>�2�@��!f�4"@���Ͳ,t@��o���@��)���A+Z|ٚ-Ag��XA�	ɘ�tA�OI.�Aw ���A����EA	|��vA#Z6��A�f�X��A������A*�Ji�A�D�aA�Mf��A=x}5oA���A%d�W�A9?�4�IAS*OV        ?���U2�@&�v�	}@D�1ym@X_���@fE��j�@r�uy��@z�k����@�˟Ԫ�@�p�y��@��\�? @��(X&@�K�;���@�o�%�R@���|�@��2����@����`�_@��ja�Cb@��{�g!@�7ӓ@���3�@��A+��@ĸ+>@8@��M]�@�fғ_Q"@�Gc�p��@��Bމ;@��^�>9@֦s����@�k,&1'@�k}<��@ߪ2��4@�!7���@�wf��@�}�9QgA@�N�7+l@��{l��_@�x�E��`@� ��;vp@���!��@�|\���u@�P肦�@��BJs�A@�����=n@�|�EہD@�~g�sX?@��{����@�Ԫ5��>AhI�(AO~g�A�5Kg�;A�@�[;A^_�o�\A�c���A	k&?��A�m�l�A�n�Ψ6A��<��2A;��=`A8�Ǽ��AA�s>��AV����Ax�D6@9A�9ԉX`        @�*e�D�P@ͫ�Y�@���up0@�F"V��A�]=0��A� �2��A U�Џ A&;5CnDA,���A2?����A6i��1p�A:��ԁ(�A?�,	Z��AB��1��AE��I�JAH���}��AK�R��S�AOi7ׁ�AQ�E���AS��G�AU��I�xAW��+��MAZ��K�A\z�3�}8A^�77z�9A`Ʀ���Ab���0wAc�-8��qAd�����aAfr�Dz�JAg����Ai��G�@>Ak8X�m�cAl��M An�����Ap5A���Aq[;p�/Ar[}^As<[��As���fAt�p�R<�Au�S�;s\Aw	�Pp�Ax3�PAy.�khAzH0IC��A{g�;�80A|�"A�,A}�ޘ��A~�sop�A�:0�LA��}=2��A�F�ơ^�A�癪x�A��.<�;�A�.�ڞl�A����h��A�}J\f�A�&�F��SA�Ҙy��A�ދ[T_A�.���A���ɢ        @�Y��@J��V���@f7|@�@xQX�Vޥ@�d!R�-@����x�3@��*���@���Kֆ�@�mL`X�t@���sJ@�*�ͦ#d@���E���@�	���y�@����j�)@���7k�A@�1
e�@Ê��E�@�0s�>�@�mѪ2M@�#��f��@�u���1[@ф,A�T@�n�Na�@�y�����@ץɔ�8@�������@�a^�D�@�������@��?G-�@�J��k
J@���c��u@�|oI�i/@�A*w%�@�"�9@�:��X@� {Y���@�45~� @�-n2��@�ծ��Q@��b�f�9@���]=܂@��ؼ�@�5"d�3�@�_��5@���\ö�@��N:�$@�����@�Hg�}�@�����@���_t�A %�Z�s�A �v��=�A���Z��ARO��3�Ag��HA�11XA���`�Az���AO�����A*(Y3mA�PIQA��Ps'�A	��E|�V        @B���(a@M�R9�bn@i��Y�-�@��3g@��O{�WQ@� �TVaO@�O�͂�?@�N6}|*@��zJ�_1@�G�_�e@�V�,%xQ@ة|/�.�@���.��@�oS,��f@�]�};��@���K�m@�k�Y�P@���v��@��8�4�@��tx��[A `�M�A�&�4)A��:�czAf���(A
3$5�y>AF
��
ARs��ŽA*H�FA+ٕ<�SAYm���	A��� �JA?�Z��A��*�4A v���|A"	���˘A#��*�L�A%}�%�fA']��^��A)V��˚A+g��{�A-���$�A/�Y��9A1�r$�A2H����gA3�!21?A4��퐐A6$�ҿ�A7}���A8ڟ_� �A:<��pA;�I�'�.A=+�cx�A>l�lcF~A?�-�sFA@��0�ѧAAQ��ZcEAB��bH�AB���~ACn����AD#ݷrg[AD�[���AE�ac�AFD����#        @k�E0�Il@������@��X�H@Ű
��]@�F�_
��@�	UE�@����u@����
7@��7����@��Bѥm@�dQ}��@��ư��@���1���A Zdf
Ae�w���Ay�Źs A�A�C�!A�w��E�A
ʹBz�A늱��A����A����g�A���Sl�A�D�7A�Z�lAW{��EA�A��A�h1��Ad����A��z��AK,�K��A��A��WAF]?��A gɦ�e�A!1�>��A"@P�A"��YϝA#�~��9bA$� v�>A%��*�V�A&o��<0gA'f�U#A(fY���gA)o�B��A*�Cz �A+����*.A,�vBǂ`A.����A/Z/����A0[G�	��A1Mq�x$A1�w���aA2����-A3n��Q\�A4J��4��A5/��u�"A6�����A7B� EiA8u��5A9ͮl��A:(�>6�A;=���ьA<Z	qn        A���v�AE�$�X�Aa\ڝ�IArK�!:�A~��Z/��A����iWA��	����A���-�
�A�F�sA������A���g�YjA�u�}0�QA���{FA���\��A��eL�߁A�ͅek�A�mwX>A�ӥ���A��l5��yA��F@X{A��a*\�A�<ȕ�A��]��jA�f<��A�es�Z6.A��3��A�+CGe]Aş�R�^A�kR  �AȪ��	��A�@�~��A��F�=��A͏�
'?A�Jh;���AЉKz)�A�t_���>A�f_ZjiA�_@/�cA�^!#p3A�c%��<7A�m��'ՔA�}z �Aؒ*p�	�A٫��Aw�A��
0>A��L��"�A��`���A�C_�b4�A�vw�R!�A�W��9�fA���R��A�V��cA�?�p��A��S���A�H#oɌA�F ��#AA���j��A峬�MA�pH�
��A�0�d֛�A��ʍ�|A輄�D�A��g��        ?�� ��#@$qk-�L@AG.�g@S4�&�+$@a�Ge@jϩ�އ�@sNi��h@zA����@�Ԡ��N@��tI�@��7�5@���q@�%��k�@�SAT&�@�ӳ.4Pa@��UVj@��|^b��@����S�a@�5$1�Z@���}p�@�'n�_�@��CB%��@�����@�K���@����|�g@�w4�HU@�*0���@��#�JX"@��C���/@��6�T�@@���'��@��Q��@�6�LU@�>We�/@�rU]Z��@Ĳ�d��@���u��n@�Z��w��@��)��މ@�<�qN�@���Is@�X�/��@����p�@�X�ٌ�@�8ߛ;�@� ���D@�_��Ѥ@� <��@�';;��@�
���~@�^q'�Z@�+ZGd@u@�F�}���@�iK" @ے��+�@��=ʚwS@���y@�=t��@�BxB\�|@��iߥ�6@ᖸca�@�G�ζ�U@���+j        @	
1�gq{@Dq�Hg�@e+�>�:@zr�f�6�@���ON�@��졵@��B-�@�,1{��@�*�Dx/@����0�H@���`(й@�LgI9�@�S����@՗�|�@�Fjts@���h�@�U҆�J@���mL�}@��#d[<#@�k�5Z@����$�@�[J��y@�X6��&�A��/�gA��c�
�AM���|�A�C�ی�A;[���A���	�TAA�f�l�A���\�A�l{+�A��_�lA��B A�""��AD.�͛(A�&`��A�q�'A҄ŊXvA q��O�A!�C>VA"�,�D	A#ցY�B�A%
�	��A&E]���"A'��HJ)�A(àk�iA*�!9bA+C8�οA,�]��A-��e�aA.�YガA0�$vx	A0���1U�A1=_e9)�A1���	mA2a;��A2�)k�A3�P.D��A4tp��OA4�U�3;A5B.c��A5�R�#b        ?��/���>@1PA,�@P ��)�M@c���w�Q@s���]@�&�H��@��v��@�O�@ʂ�@��z�Ԋ�@�X���@����#8�@���b@��b�r�@����K�@�u/�.x@�8�@�󛷢�n@�r��E��@ϡ"]qs�@�ȗ�Z?�@�+�H���@��F��_@�c�#�}@�0T -p@�w%�G3V@��_L�B@�+�����@�'SԬ�S@�̂"��|@�C!x{�:@���U�h @��9Cr[@�GE�wDA B�^ {SA���[3A�4�s�EA���r��AW�꫐A
=��hAAz(�k�+A�d��	A��/hAǫ�#�ARx/AG�-�١A���� �A��e�hA<��g�A���H�@A����An�\�X�A�k�G�4A\�A�	,A n�@�L A!3!f�ITA!��.�A"��{�:A#�@�
A$k^�p)�A%C����A& �5��A'y����A'�ʓ�>        @�5����@�<��k�A�-����A�*>q�A)��`mGA4�غ.�A<��
�ZAC5��4|AH�8h�AN�J��SAR�y�q��AV�ؿng:AZ���/S�A^�R�}9PAaߘP��AdmB�]�Ag(�f��Aj\d�уAm0Ӆ�6}Ap?����Ar��2�As�Fj�[�AuֻM�{�Aw�*b�Az  1�A|tqh�0A~���@�A����fˀA�(��$qA��]�.�_A�5P���A��+^�TA���Ei��A��>G֚�A��~�$s!A����{Q�A�mt��A��D���A��Q���A�!�dsPA�~��_��A����|A�l(�OA�� �$l�A���\��oA�S���zA���;w�A�t��ub�A�d�K�!!A�Y���A�Tq�R�RA�S�"<�A�V�4���A�]���+�A�h��+�A�wPL��A��)P�A����lOA��v��(�A��n@��A�z�?}(A�=��@�\A�<Jn.)        ?���$@���M�@0�s:g�@A[d�@NoMBS�@W��8�@`̿mS�@f��m]�@m]zGV�@rpd�'�4@v����L@{(�z�@�PL�ȋ@���v��@���7/��@����rǓ@�ݝ2��U@�D���@�k@�#�@�J}�~��@�@'H,�)@�M�D@�q��H{�@����ź@�� w�@�<�?$��@������@�ִ��B�@�8�"�
F@��]]�R�@�)}	�k@�����zH@�Z�Nol@��q�p@�����@���|k@��Ֆ���@���Į1g@��_�eQ�@��N��@��mvS�:@���BnC@�*Xҋ��@�V�Q�4@����}��@�ŰU�O9@�KUZP�@�Rk��v�@���O�@������9@��Y2b�@�a�B2i^@�GΈf@��5��@Òp��@�S�
�@�C���@��	>��)@ƫ.6m��@�y�X<��@�K���l�@� ��� @���V���        ?�$��ٛ@�����@+Hf�)L@?�"����@NV��&~�@Y����q,@dZ3+�:�@n���>6@vC"�J�@B($�Sf@�Rڵ��0@�]��y�!@�t�VMF@����^�i@����F�@�P��w��@�d(�1�@�|"@�2���y@�4�[d��@��)8�-8@�Ro��Su@�vtƆ�@���Sff@�����\2@ƴ�(P��@ɦ!����@���x4~@�"��ۓ@���&:W@��(q��@�V��m�@�\�5�?@�Ǜ��[�@�X�tUJ@�__v4@�w���n5@���]Z@�[!FV�@�>�|AM@���"��/@�Ս��.4@����9m@��9���W@�楹Y,4@��W�3�@�:/	Ü@�sCK�w@����WF�@�a�%�@�}����.@��R�=�@��Kt+@�'�m���@�����@��Ո���A ��C��aA�:p��A���W:A��Z�'A·ϾR�A��l��nA����)        ?���6��?�n�y
��@hZ���@3��&@��@D�&*C	@SV�ޤ�@`�(�{4@j��A%e�@t��ڞ9@~���?_g@��A2��@���P�Z�@�צ�N�@���i�`@����(�@�''��>�@�,�A���@����@�)𔋑B@�ʄ��S@�����@��wr=��@�'���l@ɵ�\`>,@͗�R��@��Y�?�@�1�@�2 @ժ�+/�@�U��@�4X`gpB@�K���@����@┧/��X@�z���A@怛f��@��#4�@��1I4��@�Vh��\�@���Ķ'@�Ej���@��b�@�#�Y�u@���Kȶ�@�F�t�z @��ӽ��@��sTM,@�}N�5�@�[����A %&$/�A$B���5A+ /�	$A97z�AN��`>AAkؚ˿A�e-�
-A��^.��A��UPUA
-��e�As����mA�|v�ĦA��jA}~`�SAu�Ռ�        @�x��A,H@�e���9�@�?��Ǭ@�����۷@��!��*dA�xoĀ�A�"��t1A�M��3A�J�6;�AREw*_A!���A%`���A(�0c��"A,�����rA0_LH��A2��?A4�i�hiYA7\d� ~qA9�1'H�A<���rA?�����9AAC���MfAB����ADu���2AF(��0�BAG� 	"7AI����bAK����DAM�څɗ'AO�}����AP���PnAR[�j��AS/�<!1ATa����AU�_T'2AV��'�cAX5U�ʏAY��C�N�AZ�O0�)$A\\�����A]и�Y�A_Md�g
�A`iEP���Aa0	����Aa���a�Ab���̂�Ac�U.��Adt7�n�iAeO��!�IAf/<VI'Ag%��}Ag�fU2G�Ah�!c�M�Ai�2W��Aj�d��.Akǧ�0;Al�5 A��Am�k��mAnΜ{��oAo���_M�Apv\{��Aq�Ļ�Aq�q�?�w        ?��8m��M@:ਜ਼C�@3��љ��@F�of��V@T`Gt��@`/_=$kv@g�����@pFV�Ȍ^@uy��.&@{k^]�;�@��$D�8@��
��o@��l;���@�b��	q@�&�U��@����]@���@�i@��qx&U�@�$��~�@�N)r�\�@�)'�L
@���*�@�+�-\m+@�R���g�@����\@���}/�@�VC��a@��Eݜ�@�:����@���`�@���!���@�b��6L�@��ߥ�@�a7\�C@��㰹�@��k���@�<����@���}4#@��g��K�@�ȑ����@¹D�w�@ðB��x@ĭ[�~�a@Űr�Ū�@ƹ{p�)Z@��Ue��@�ݙ���'@�����o�@�L=nb�@�A���+:@�oKZ��/@΢����@��c���@Ѝ��dg@�02���@�Ֆ1�@�}��G�@�(��
@��E��p@Ԇ��9%7@�9^6�@������@֦�Bb�        @;�v��@3�XX]F�@Q6�$�?@cIoH�)'@q��UP��@|��amwv@�s#�T&	@��h��b�@�
��k��@�����+@�X?�yR@�yz\O�@��8$�6�@�JW�E@�Y4��3@��c콮�@�ϾI�@��>e@�8G���P@��!�ȝ%@ͭ��t̹@��ނ��R@�G�~� �@���4���@�y�j�@�^~<��@�v�E ?=@���s��@��{N�L@�~�;��@�u�z���@臂#0"t@괞��@���j��@�`n8�u~@������@�<^�$�Y@�ŕs�@��{:�׺@�s���@��J��0@��P�FY)@�#�?��@�ιX%@��:�l�NA &�����A�A��wA���A������A��6�A��7);�AQ���A"t��T�A?�R�cA	cX��*A
�Z$_��A�=2.�,A�"�7N[AC*5NT�A�pR,[Ar��`A �+�"A�Y��        @
.���LU@:��Z_>@V��b��?@i�����@w �ݔ}@�j��z��@�%�~yo@� �S�ht@��eY1�@��l�)�.@���^J�
@����A@�E��WH�@�d��S��@�;#���@�ݭ���@�0�i�1@���|���@�1�?��H@�W�!@���s�0@�ض7E_@�M�H�@�'V��M@�]�*a�@��/o�x@坛,���@�e�O3y7@�e�BD@�̳���@�i��'q@��G�֛�@��c`��@������@���s�C@�5����@�����qA W �t�AR]���A�h��|A�����A�����A%>n��Aź00^�A
x�c��7A>cu&ϝA�|�YsA �Ԉ��A�ȟ��RA�kZ�A�Dv%�A2Qe���AT��nYA�}Wu�A�����aA�{;�zA2h����A~ڜT�A�D���A2x6p2!A�pV_�A �>�~�XA!D��竺        @�����@�ه#�^A �����KA�Cp?A�� �H�A(x��'`�A1n�����A7|����A>a�YS�AC�Zܷ'AGN���\AK�p7���AP}�RAjAS1�X?�AVx�)J(AY(�܁��A\j���UA_��p�4�Aa�pe6�Ac�y�*#�Ae�]M5�fAg������Ai�;V�Al1kX1An�${�nAp~!�ѩ[Aq���a�QAs���BAtb$+�LPAu�H ��Aw&���NAx��h6yAzi�A{��Ҧ%LA}�{�TA~���@3A��A���A���g�yA�����A����{OA�{)�^�A�\~��A�AQCB�A�)y�v�5A��K��A��=mbA���<�_�A������A���"U��A����vA��sCTi�A���)!!A�瘘�0jA������A�}��6��A�ο��	A��>�AwA�\���A��@d�3�A�.Λ4FA���`��A�L�D��A�ܴ#f��        ?�&�L	-�@T�,:@1��x�TG@Cd��6�a@QD�;���@[6�c��@c�3����@jʥ���?@q��P]�O@vX镋G4@{�����@��
��w@�5����@��&Ə�@��GC��@� �UY�@�|���@�q���@���ߕ�@��2Ϥ�x@��w��ԣ@���	��@�=9w��@�)uH!@��ǘ�$�@��6�[@�D>�Z@�I�4ktC@��9l|jM@�|�\�F�@��L��z;@�LΖ�J@�]��t	d@�� Ĉ��@�0_ȭZ�@���`P@�3�-��@���Kڕ@�kE8�~A@�%g��@@�ld����@�R)n�*@�>���-�@�2��\�@�-�.�D�@�/�A���@�8���>@�I%���[@�`f\�@�~��6MH@ʣ����@��[y�ٓ@�}\?�r@�9���[c@�xZi3�@�^qyD�8@��hfW@ѫ��#�@�Wu}�@���@ӵ����@�h��'o@�o<��	        ?�\���<�@�q
��@!� �aaN@6��'�
@GY���x�@T��Ec@ail�ك2@kMώ�"�@t�cɪ�@}�`O��@��e��g�@����۬v@��G֢s@��#d���@��R�\�@�,W�i@���Ư@��M8���@�����@�rEi�5@���q�$@�b�s7�@�O�ʮ�@�3�X�m�@�^�+ Q�@��_e@Ϗǖ��_@��12@��v�(@f@�H	o��@��IR�@�f� z@�55zio-@��hY��D@�,�KJA�@���t$M@圇�_�@�x��~��@�n=T�AA@�}�V�o�@���S�y(@��o��C�@�+
�E�O@�m��h�@��M�3@�&m溶@���	�`@�'��3@��f���@�u�H�P�@�9�d~�@��o�H�A ~�� 1A}� /s�A��ïA�x*�
A����VAٖX�x�A�=� MA<6��7A	y��A
�\ ��A�t�|        ?��� D�+@��E@2�J̽%=@G.x+�@V����@cG):�h@ne����@v��%h@�6Л�^�@�y��%@�ZÌ��e@�XS H@�c� ��@������@���Z���@�� ���c@��v�,9n@�Nĉ���@�:/X/��@��WJ���@�a����@�7�q�F�@�^^�]@����/k@ͣ�t�TN@���\Mzo@�{`2�@Շ�m�q@����o�@�ߩu�1@��V[)�G@�y�?ߴ@�#�G�b�@������	@��F�Bc7@����@���ǜ�1@���U-��@�Fc�i��@�U��Q�@�j��@���5tS�@�A�B��5@��~�u2�@�%����M@��m_S�
@�D-�٧�@��t�t@��קM��@�g����A �-?|�A�N���A���q�LA�0�\cA�C�<�A�󶰪`A�o��'A��`�A	R�qQg�A
�&��$A���DA>��5n�A���"JD        @��N�Һ�@��:�Ik@����M@�2��Mw@�\�ʂ3tAjDetAv�iS�A��ݹ�;A�T��A�A#zP�N�A(.�X�A-
��~Q8A1J"�A4R[2}�A7����>A;7�k�!wA?� )��AA�O|�.�AC��(,�AFS�'\�AH�f�_QAK�)��AN�,SDAPЦ�5�jARl?;fMAT¼)AU�п�=AW�6$�?yAY��r���A[��X�mA]�\J��A_������A`�>�Y�Ab#4�T�wAcP)QZ�@Ad�,��AeŎ+R Ag��*>�Ahb3�ֹaAi�K��*Ak)?
b<Al�gPѕAn���NAo�+��Ap�o�ӮAqku���Ar?�Wi��Asv[7��As�:`��`Atط��P�Au���͑LAv���S�Aw��8	j�Ax��}L��Ay�""�wkAz�'�n!�A{��w�@�A|�0�q�2A}�!~%XCA~��Ɋc�A�cI#�A�nM���A���4�`        ?��NY�@-��u��@Iͬt��@\3��x�G@i~�Pix@tCѼ���@}�{�|�3@�yX��(�@�7��3�@�M��;� @�Z�X@�K��@�����@�+�ȟ�P@���#���@���Z�@�-N����@����s��@�
.g̅@��V���O@��8��J�@��K��@�#�'�'�@�s����'@��T����@�>ՓX�Y@��X 3ó@���O@ē�~}7@�,���YQ@��$K���@ɜj��N�@�t(ӗpK@�b+��]@�g��]6@���C�4@��$Pq@�i��?�@�5,5�@�t�RI'x@�������@�,Id@�����@��v�t@�pI,�� @���﹓@ߒQ5p�@�����'�@�r��i�@�P�ٮ�l@�4o�Q��@�j]���@�k6��@�BF'>�@���c�c@� Io���@��ʻ6�@�0�@3s@��R�'@�2��E@�J8C���@�f4T��@�oH͏+        @ ����@4�j˼��@Qߝ�k��@c�<z%T@q��ļpm@|��/��@�<<�#�@�:7+�d@�*�*��\@���
�@�H(�qB@�������@�	H�S@��:"��@��[kl@��%C���@ȅ!oEη@���-J@���l7[@�M���+@���C��@�%���@���@/s@�NB���5@�ȇ�@��aM��i@�3w�p��@ﹱ�T�.@���y @��X���@�l�<Sq@��'�)/�@�&� ��@����|��A o�@�A�@ncA�0���tAX�	���A%�w	xA	�S7�~A
��Wr�cA�����A4�v>�A�3R��A�J�uA'Bŝ\gAu�"�Z�A�~��.�ALt|2FA؏I°A~�\��A@���-A ղ�V.A x�<A!!C�z��A"Cq���>A#w�T=.A$�8�UA&2t_�A'�Rlp	A)�z���A*� X��GA,;"���        ?�l񃂹@$?`x��@B��9��U@W��6V�@g&��*_@t�)˩ۓ@�� ]���@�q�Q5�@�b��	��@��f�6;�@��~���@���o���@��~\[S�@�x��˨@� �\��@����g�@�w�,͋
@̛��)�@�5�\h�@�wh���@��.�u@��=��(@�8Ӑ��@����@�3�n9B@��DG@�
��k@�M�o��@��`�9�@��ߢ&�@��"J�"@��7x{�E@�-( �@����O�@�#��o��A kĈ�L�A�:T��vAZ���3A�����A���#�A\�پJdA
4#�
�A"+�s�A'�3��A"���ӺA>[����AguC�A�hk�A��T��A4���:�A�y�'�A|e�,�A��H��A�G�A�A��#'u�Ak �(A �ρ޼�A!���-l	A"sS��>�A#n�C�5�A$ssx�>A%�^���A&�����        @�H��M�>@��FA
W3N��2A'����A)�1��.A4�[V�A<������ACz����AI]���APk��'UAS�(`�ЗAW��W�-�A\)KE��A`q���-Ab��)\FAe�R�M�Ahk�U�IAkY7r��>AngG�Ap�y>�U�Arq��P��At*��xdAu�����AwҬ"��Ay�v�?��A{�Fl<A}�.xc�A��>k�A�:��A�os�բA���U��A��8н`A�e�`X�OA��BNA�VDW>tA��Vj�;�A��s��U0A�6��)��A��\7(��A��.!�BA��\B1\A�Ν��#A���gۨ>A��%�*k�A��J^�g-A�fF��A�3kddZfA�b&���[A��D�u A��n�>X�A�cG�^�A�m�6BA��2���A���N��A�Cxa���A������A��5��s�A�pPW���A�0ш��A���16�A��n�Zh:A��2֒�XA�Q�o\��        @qg��!@?hecE��@VG�.<Z�@f@�q5ʿ@rt�����@{f��Ait@��	���H@���j��<@�F�N�b @�/�	�@���sH^@�&��x�I@��Jv!@�#�6s�l@������@�=U�(��@����4�@�ؒ���@�ؿ�:�}@�`ꂒ�@�'b��\@��4w� �@�����6�@�� �@������@��%�h�@�=�a�`@���Ez�@���Х�@�@ȆO�@Ĝ��i�y@������@ǃ6����@���K��@ʧJ����@�N�!� =@�0[J`�@���
b@��h�E��@Ѻ=�qo�@ҰŊ�@Ӭ�on^@԰��)�b@ջ��?�@��a��:6@���z6@�s��
@�)��GD@�V?F�u�@܉궾-�@����(w@�B�:�o@�-h;.��@�ڝ��@ፍ� �@�F�x��#@�˟��C@���A�@��\bH�@�j�;��@�D�d}��@�%�`�@���L        @ ��\�i@*,P��{@F�w���@[a�*W9@j���*�@ws@P]�@�5�^��8@��M��Q@�X��*9�@�/̯]�@��^�q�@���#�@�h�K�)�@���mЅe@�@���<S@�Q�(?{@���ت�@�]1TK:K@Յ�W�@�oR� ��@��_`<@�k)M^.�@�:����@��36�@�4Y�~9@�鑧��P@��bQ�z@�2�;��>@���Z%�A Y�Ĝ�vAv)I��A���x�A+�w�WA	��h!��A�K�?��Ar�g��ACl�$нA�o"�7�A�4����AX�����A1K�bQsAR���A�v=a�A.��S48A )�itA!E�N���A"k><~{A#�
�iA$Ҟ�tk2A&��?A'af�r��A(�R(�VA*_���A+�{��A,��w�A.�O��O�A0
�Ǵ�2A0��(PA1��Z�A2�~��I#A3r����A4`!]��A5V	0	��        @:N���^@^�d4�@s�N��8�@���,FS�@������@��=�Ȼ�@���Y��@���nF&@���1�8�@����;�@��ێr�)@������@�_�v6�0@�l��Y�@���7wW@�B).S�@�`��;k@������"@�Ϭ4�@߰u�\�[@�uX`K�@�b9�x@�Pfqk@�7]Ⱦx�@�����@@�.���=@�uD��@�����#@�wS �@�@�1y�1�;@�%�(�A��j��A�"�uUtA<_���7A��2A��A�	���GA	����AtC�G\�AmUngRAv�	��aA��"���A�:��q�A�V����AP�Tb;AHd��R!A|��ĥA��r�A��$h�AN�����A�����A�A��0Ar4u�A��	�l0A �\Ԭ�`A!tƸCA"=jr�/�A#�}<�{A#�d�a)�A$�� spqA%��^�VA&{׏c�A'du#��A(QG4|�M        @�WzB��Ag8I�� A"Nf��ϞA1�G��2�A<E+�FADt�n��AK�zi�UAQ޶��AVS}���A[3a:��A`@�K/Ac"�+���AfDw�0�Ai���^�Am_���d�Ap������Ar�8�P�ZAuMޅ�v0Aw�y�BY�Az�31�JA}�nW�nIA�zaڼ�ZA�2����A��/`@�A��h����A����ʶA�"��f-A�b�=��A��3N���A������A��>�r��A�4G��YA����a�A� �ڣІA�x�()��A�����A���N��A�(�Od�A��ܧt�wA��o
O�A��ج�$�A��d�
A�zsa8�:A�o|InA�j[l�݁A�l'r��A�t���mA���0�C�A���HљA��ǓHT�A���\�}A��B5?A�G �5�A���&�Y�A����D�A���[/�A�J���3�A�Ř���A��X#5��A���ʵA�F�OwW#A����A���S4        ?�b6BUD@ �o!�@;�H�<�@N?:�@ZȌ��YU@d����"g@n93��@t�+��~@z�I~@�	5l�A@��Xݷ*@����qi�@��䤈B@������3@� f�ͼ�@�I	����@�����GT@�����F@��\��@���[i@�w���"@���!�@��N1��@�q��6��@������.@�G�ܽv�@����(@��3���;@���p��@�w�.�*l@��\K('�@������3@��H49@�S�s�f@�QZ�y �@Ó8�*�_@���zK�@�;.Yq^�@ǡ��0��@��S0�@ʔ¿��@����l@ͷZ	�*	@�Zi4�6�@ЄC��3@�`�<yoa@�B(��}4@�(�Zq*@����@�H]�=�@��Nn���@�悔���@��T���@��GL*ZZ@��h���@����cX@��[>@���	�@�/5Q
��@�H��Oe�@�3Q��*�@�į���@�X�� ��        ?�+��S�?�NLg�@+dH�=�@0�Kٸ�I@A>=�@P�:Y�@[�D���@f�����@q�nO@zG�+�U�@���K@��p�H��@�*}���.@�=,�NQ@��(;�[@�f^�Xx
@��U��@�)0}7k�@��S(��@�^n��@�p�xVh@��N���@�݈a�34@Ȅ36�KE@̔���jT@Ћ�e�Y@�2�}2A@��c=�@ؿ�18�t@���6a�@ߍ&��@�|�T��@��t�b@��2u���@�Q
$��.@���t@�~|�i	�@�(�}�[�@�p'�&@�9�f��@�����@��$Y���@�tU֐=�@�a�e,�&@�h�}��D@���H�A dd@W3A�g>߹A�=�GA
��
�A}.�(�A�0߹�Ap#��A
<D�A�2�L�Ah^�A7UYA���QdA�R�&��A��J<JA�b��A�O�03�A�	���Y        ?�M�L�Ɲ@��?<:�@7H��9��@L 1E���@[-�zu��@ga�z��@r�GB�U@|D�݉8,@���u[B�@��o��o@�ï�� @�UM�>�@�&��@��(�2�@�m�x��w@��T��@��eGe��@���-�|h@�^�s-H@�F�x�Η@�%��ç@�N��`A�@��,Th��@Ό����@�Tq̗��@ӏ��2�x@�����آ@ؙj�:@�nQe���@�}��-��@����@��&�P�@䑺�SH-@���;F�@����^�@�[i?�A@�{�g��@�^]�|r@�Z��i0�@��ߙg@�4e΃�c@��g@��@�H��9��@���n4��@���+�ba@�O�8�X@�ޘ���@��fW�i}A ��܇kA���zA� 79�A���Y�FA
P���A'�p^�AMԻ��A|�Y�ޛA	�!�\A
�=��A;+�]l8A�<�� A��/pAD��(�A��5�        @�U�����@��m�@���p@�(�cю|A��	�IA�ٕ]�nAa�{i6*A!Ⱦ:u)�A'��ݭA,�J}c�JA1�#,�A5g��w^A9h�`�&�A=�/�q�<AAGr9>�AC�P'���AF�8;+ZEAI����L8ALǳ0���AP��V�`AQٷ~OAS���TQ�AU����mAW��vNz�AY墱3�A\$1�%@A^{��O�A`ua@<�9Aa��Oi��Ac@�$�WAdi�m�s3Ae���?�AgM;�LDwAh҆.MдAjd��|�AltgL�LAm�ib���Aok���Ap���Ƀ�Aq���q=�Aru���yAsm���IAtl	.7�Aup�ܪ��Av{�\�D�Aw�P˭TAx��~H �Ay�J�+�6Az��]�A|Ɇ�A}>ǉTA~r�U�x�A���2PA�v,`L_fA���DEA���0XP�A�eUt�w A���7�A������A�lz}��A�t#1V�A�ӣ	@e�A��˄wF,        ?�|H���@ �FB�I@;�2M��I@NGQO�d@ZѶ/�j@d���?�@n�g	�@tl�Su~@z�碩�L@��¶`Y@��y����@�&>���@��~��թ@����_�@�`�(���@�e�P&Z
@��k ��@��CA�@��,�w�@������@��ZfN�@�,6��@�����u@���\%F@���t^@��-8uO�@����@���l���@�-U2�қ@���Z�{d@�����@�@�3�{@���+G�@����r@�֕E���@��U���@������@��j��+b@��"�j:@�[w2&3@�:\!�w@�`�|S��@ȎTe�@���~D	�@��_oq�@�@(P�T@͇�#�\@��e[��N@�Yg+@��4n�@�nKnCdJ@����F@��d�1@ӆ�(�@�<��i�@�����zi@հ�r��@�n;�|a@�-�C���@����@سș?�&@�z?OB�@�C��U        ?�X{�M�@!�-E�6@@{����$@Sj��;�(@b-ՊO��@m�F�y�9@v�܈Ӌu@�[��$�@���SF�@���N�@�kdh�*@��A��!@��8�B�@�X�;/O�@�rߌ�ʦ@�)E\d�@���b�
�@�K=�CK�@��b7^�y@�,m���{@�٘�?m@��0��Zs@�%wI+�B@���pK%�@�oR��O�@Ҫ��&_@�~<�@@��ܫS�I@����E�@�����=@�5���@�YȽ�F@��*�$@��1�Dt@�B��-�V@��~�<C�@�<pQ@���Qo@�>8>"��@��sW�&@���t�@�kK����@�WK��@�\�bD\s@�|��f��@���@��A�z���A=V��I�A�NÒ*�AԷEYiA4���2A�x�LÍA	5�\:_A
� (��A@gG䙔A�4��A��{L�A�rz��A����xA��� �A�=�=q�A����A�	-��        ?�6�㍠@!8�C:9@<XԊ]�@O!���i@[�|�ys�@fܲ��@p܂	C�	@x �ZKý@�h&gc�@��uf2��@�0�H�m@��[̌�F@���imh�@�?��D/A@�t�/ @�b,�U@���3XJ�@�[�k@��m4+3@�]q���@�vS"��@� ��e��@�4W�@�+�?�p+@�|QL:�@�(ҥ��@�6�_�@�P����@Թ��@�S�M���@� |i[۝@��q�z@�%J����@��-���3@��r׺�@�ln�uڽ@�XS����@�W�OhC�@�j�}7�@�>�>]$@����T�@� �ղ3@�<Ԫ%@�wǫm\w@��+���e@�.�-u@�g��';%@�ͽ�۹@�>����@����"�@�B���n@��c� ��A ;��ɈAdd�^A�o�tA�VD��A�W3-�A�ZB驴A���;A����A��6��A�w�7�A	���<        @��rF�p@�G�c?7�@�T]��[A��Z��A���tA �{��bA'd�����A/a���A45�h�k!A9;�䡽3A>�����AB^�J�jAE���b�NAI��aw�AL�����APl�k��AR�K�RAT�)ۧ��AW.��2�sAY����uA\Sh�g�A_���hA`���NlAb��s��Ad�f(B�Ae���vmAgmՀ�(KAi3�aaAk<_��CAl��p�An��LApq�t��XAqz�6.�Ar��z�-As�:��4At�����Au�"�<AwZ}os5Ax@�����AyzDB��Az���H,A|B<�A}R�HIA~����GA� ��ݘA��t�l�rA�lj)�A�$�z��A��W�0
�A���r�+�A�_$����A�"/(���A�����A��m�2YIA�y��xK�A�FH%�E�A�v�r�A��N!aJA���ԃ8lA��t�A�m���~�A�K�zk�kA�,nӧo�        @�:M��@4�9h}@Pك��U�@bhp����@pI����@y� Iɪ@���R�.4@�į�A�@�;6Ǵr�@�\g��@�E��r�@�{a�8@�:�ak -@�g%h��@��5��@��H߷	�@�O~z��@�Ok[�u@��B"�F@��~9\��@��J�(@����SQ@��
��-@��)��/@�B�9���@˥��cn@�&�1��@�c�_��@����4@�7O	�:@Ի�h�@�Sg�)@���z$��@ٻ\�+9G@ی���6Q@�r�P'8`@�l���Ö@��I�Z�@�ϡA���@���gf@���
y@�C��L��@�~��wIG@�ø�}�
@�i�4�q@�j�Nj	�@��R2�n�@�7�ƽ�@�]���@��P��@�ۦKq_�@��e#�@�u;9�2@�I�AQP�@�"���e�@� e��iw@��^���@�ɜ7t�@���S_T@���<uR�@��� �5W@����[q@����&        ?�ۑ�ל�@(�8��G�@El��c@YM����q@ir3�.٦@w��Iÿ@��Mw?&@����*<@�����>a@�4Bh"z@�tL�M��@��X�M�@ƴ�xGO@�"�< +@�La���m@�N�P~�@��R�L�;@��9UrS@� b�ɣv@����H@��m�8oO@��I�F̽A��a�KA�����"A"���DA�ζl�Aݗ
sA��Q�Aj��_6A��O
�A�0. �AV�43�tAJ� 1��A!1`����A"���dA$yh̡�5A&10bqRrA'�->�A)�^��A+��qO:A-_37�A/2����!A0�z�0��A1jg[1�ZA2P�Z�4$A36[��=�A4!��X�A4��Y� BA5䔈���A6��x ��A7��BcA8�ً;h�A9|��6��A:d^�bA;L��n!�A<6s��,A= ����A>g
u�A>�`����A?�`N�%A@fjɿ7A@�5�1AAR0�u        @0r1kLv>@a�ǌ��@�P��#�@���z�L@�q�N�� @��GǦ@�Pp��=�@�f�S���@�5d�Q�@˾�Z�/)@ѭ�͠^@�
V����@���Ψ�@�>��!.@�N�K�eT@�����@�g��:��@�{gO �t@�w4o��@���k�@�z�E�D@�D ��D@�>�جtq@�k[����Ae�BTNA0g�jPAL b�AZ�-A	7�U��)Au~K�n�Aӊ��]MA)�k�̃A|
��b�A�~kJgA[_�i
/A��4B3A���
�dAP�:(��A)�S�&�A��#A.>��cA ����O�A!�:���A#	�r��A$P8����A%��QzA'�����A(�!M�LA*$�
:��A+�(��g7A-�c�.
�A/e�!���A0�421vA1���CA2�#�C�A3�럅8A4�`�@L�A6$m���iA7Z�Z�(A8�5g*_A9ߘ<�l�A;-�*�6A<�3�s        @��Cc�[A gY�;1A���g�A0�&�Y��A>-��AG���Z�LAP�=�[_AV���\A]��D�4Ab��< _AgY�]Q��AlDB��ɔAp��I��As��4�٣Av�l3_NFAzU�� A~(q2GoA��%}�A� �˰A�l�ٸ��A�᝛��A�}Ѣ,c�A�AjPwk�A��_HA������A�9��pMA���Y��A��:H�e_A�w�Yc�A�\O��E�A�S�����A�_�󉱽A�?�	�A�Z�p�Z�A����M�A��ńA��W��3�A�6Yl�w�A����h�A����A�R� ]!�A��wH(�~A�JG���A�׋�m�A�8�Ӽ�8A���CA��)+7_A�� �8B�A����&�xA���±��A����̜�A��Ӥ��A���cA���,b��A�����5;A��m��`�A��j�O�.A��oc�wA�c\��HA�<'8yA�6��cO�A��%LJ&wA�p0�%�        @�y*Ԟ�@Nzת�e�@i���)@|��x@���Aؒ@�=2v�@�9�1Lc�@�k,�w��@��FRI�@�5-	�@c@��j,@�n�$(WA@���dے@�+B	>�a@���	�@ĩm#^��@�v���؜@�o�ŴN�@͒�����@�n��/U@�&q��{>@���i�6@��F�f@פ�R_~@ٌ�"q�J@�z]��@�l	'��u@�a�$Q0@����@�?�I��@�hN@�Z.�q�@�� �n��@��+槢@�����r@�ƴt8@�L�ND�@�C�4r�@�e8�(@���NZW�@�H;[�@���F|@�w`k��@�&v4��@��\{(�2@�CRG\@�Kr![��@�12��@�ϴ7���@��r���@�gv��0W@�:�j���@���]�&@���u�@��sk��@���8�ҟ@�� 6�}�@���0���@����2�?@��Pf��N@���0�
A �F؞��Ar^�        @+�v5Я/@d)x]��@����饏@�M��@���Z�@��U����@�k�k�@�Yg�@�2a���L@ζ�챥�@������[@�u��R�+@��ab@�먅)�@��8�O�@���-x��@��t��@����"�@���3`�@�]�O�A�5��A��F	�A��i�Au*�A^��AAӘJr�A)���A�:Ak�,`ZAY�E9��AzԢ^��A!g�YbA#)���A%�-�oA&���J�A)	{��A+1t�A-t:Ro�1A/��
�#yA1%|t��A2p5p�_A3�)��A50�%E�4A6��!�A8.����A9�?�&�A;l�r��A=#!�.�A>��?��A@a͈EAAT��jQABPT�ACSJú?�AD]v�c�YAEn�R;;�AF�,jAG�����AH��#���AI�S��)AKS���ALM_�M�AM����7�AN���t�"        @B
K�$s�@q�++��I@��g��g�@�B��'�n@�nO/iv@�����U@�`��Ծ^@�Ĝ����@�y-s.@�Sѱ�@���<h@�ڈ���@�%�o@豨 �8�@�Ǔhre@��JE�@�Y�o��@��� dN@�7]sA��A �Ѣ*�Aq���JA@�[�I�A	[[X�Ař�qNHAB��ۜUANKZ�A��z���A�0�ŋAo�����A����nA��6Jt'A �y ��A"_����A#�f��A%pG�xPA'�����A(��w�A*3��ŗ�A+Ҕ�^A-uj1+A/�tYA0cP��zXA1:yx���A2r.��6A2���l�A3�a	3`A4�,.�kA5�{��C_A6hW''A7JЛ��A8/
Y�A�A9-��A9�W�^��A:���1A;��X8�DA<�ҏ�^A=��jf��A>��$V�A?��k��A@C�W~S�A@����AA7��mu�AA��B9-        @����HDA$pQԊ�AA��D�ARzQ�.�eA_�R�~Ah)m�{��Ap葛�͛Avf\*�t�A|�� CiA�������A�7���U�A�-g��!A�9����XA��� ��A�C�1�A����� A�%�UŲMA�ۘd��A�� �*�(A�S�0/��A�ܽp�N�A�r!��A��f;�PA���X��IA�d���DA������A�� ���NA�v2�->A�+$!��A�rnĎ�A�R�w�-uA�6����~A�J�pv(A�ݪ\ӾA����EIJA�����pA��9K�~A��yа��A��t7�A�	�&`J`A�n�RA�*����A�@B��l�A�Y.5z��A�u��gJnA�J��9A����iJzA�q��=j0A�	4Ț�A£�+鮝A�BIߪ%9A��N=��AĊJuM�A�4� ��sA��[�
:�AƗpҟA�O���
�A�%�p/�A����l��Aɛxa��A�j�k��A�@C7k�A��eV�F        ?�B���	@g�]�@*���@>dp���@K�`��@U�<�O�l@`z@��'@f�V��@mU)"��@r�y��@v���8�!@{�M�2u�@����7�(@������@����F�P@�D����@��B�٬@��n=X��@�P+9>@�P�YE7@����{�@�1�\�@��3m�3@��@/k@�F��nؔ@�϶�-(@�k(�y�@��(=�@�شh�v@��_j�4@������@����w��@�����p�@���EDF�@��7��@�k�܇@�2o�a��@�f4H�&@����="@���(wS�@�;�y�@��8�.W"@��˥9��@�i�ֆ�
@��'��@�3#�`�d@��'���x@��\�yI�@�=p�@�n2��З@�I��޵d@�*H��3@�ݱ�@%@����JO�@���븽m@������'@�ܻ7*@�@���Jݛ@��B�a@��ϱ��%@�
l�Z�k@�$�c��U@�"�9~��        ?���u
�?���vr[F@b�K�@4�%�E��@I�%�v@ZW�S�ũ@i�⪑�@v����(@�3P'�@�L>J-�@�'�@E�:@�~!W�k!@�K���+�@��K���@�4g5�ڨ@���%�@��	��@� ��d��@Ⱥ!�X��@� �����@�vO�.�@Հ�5xc@�?�~�`@�]!��@��kxC`@�[��@����g�@����:�@��-$n�@��ܴ��@�&|m-�P@��n.&R�@�K�'@��dL)�@��@�*w@�նn���@�
��{@�X��O�mA ߗ["3A}�:��Al��ݚA�;��ZA*��wA�L9��A	h,h�?A
���<xA4@��A��LR�Av�ԯ��A���P'dAm��aAL�=�zA/md:�A����iA�/�4��A�Ea�#A���ϊA��5���AȎ��p�A×в�A��#L�AÊM�H�A�$��?s        ?���܎@
t�X@4��d೫@JǏy�D@Zv1��/O@g�1����@t#��~�@�-��f@���p��@�T �!Z@�X��%�@�pb/6>@�8�� @������@�?cb���@��6��@�W3g�ֈ@���[{K@�~��|I�@�i���̆@�
���R�@�*  ��T@���Ԝ9F@၉��;@�d���hJ@�a�Z<@��ni+@��T��N@񌐹8.�@�ٱ9�O@�a-v��@�)s�ݦa@�9rX �@��@x�2A��� \nA��{��A�d����ABjD�UA
����A�y2%��AFo��o�A��5�Ar7�p��A#4�~OA�Q�u�NA�kXA�����A��G�nA�.��WA W��}A!l��sLA"�+�ŧA#�`P���A$�8�ВnA&M��ImA'^ED*�A(������A*R0�A+ta�¬HA,�/��2�A.l�z�!�A/��4Me*A0ˋ�p}        @��9�ǫ7@��&�cx@ٖ��:;@�2�=�xN@�d.���AЦT��A�]�[A�w�.�A�U��"CA ��Ϯ"A$��?�[�A)Fi���~A-�ˢ'&�A1�u�ޠ"A4Cv��7�A7/���bA:M����A=�}�2n�A@���F]0ABnVS��/ADe�#�9AFwEa�4�AH�F�N�AJ�H�Eq�AMI-�hAO�O��AQ*s�H_AR�@6\��AS�a5���AUP�p�AV�z��w�AXR����	AY���?,A[���.�A]7���2A^�ÃXXA`^ܔ�
�AaJ=y��Ab<�a��Ac4w(��jAd3r���Ae9@L�L�AfF4U�tAgZ�j��AhwD�UAi�Avu�Aj�)�[�Al �����Am@�����An���b�XAo�
*12�Ap��5cX'AqM���ӓAr)��Ar��i���As��P�'3AtK���k�Au�M�9Au�4�T)Av�U���6Aw����Ax�hL�~Ay��c��        ?��U~GJ�@�>[�R�@1�A��/@B�DpՂ�@PZ*;���@Ye� |h�@bE��U@h���'w@pY� ��@t�N�`�@y�@	��@�	�a��@��MAk��@�\�$��4@�&;|���@�D�2��f@�[F�~L@����ܣ@�H󭣃�@��Ը�IA@�։L�+�@���D�@��rԖ@���}Z�@�h�jP8�@�:�����@� � @�'@�Z��@�)��\��@�K˗N;Z@�@��^z@�e�PA�@�� �:7@����E@�!�,�@�Y��/Pi@��3�L�l@������@����}K@��sE1�"@��iR&A�@����q@�Vu��@�*>!F��@��̇mb@��ң�c@��E��@ĳeJ*W@Ť��@�D@ƛ�p�,@ǙWG��@Ȝ����t@ɦ��/�@ʶH����@�˥Kk�W@���0$@���Ww=@�,tD>�@�+�(@�ú��1"@�^{��'H@������d@Ҝ\ع!        ?ũ�үk�?��s,�o@pbW<L�@5�k�-�1@H?v���G@X$R0�@f#�`��@r�y(��Z@~�xl��@���Db�{@�>�����@�-��& O@�Y�+�Y@�s��T��@�q�2_��@�./�w@��:'�4@��H��g�@�~?�6�0@��UEF��@���f@�^.9F.@��f��@��w��@�N�����@�ȷ+�U�@ׅ(ֽ�@ڊJ$ި�@�ߺO�a*@��G��A~@����Q�@�d&�1-@�r��D��@�1�T�@� ��@����I�@��~���@���{'�@����O�@��[�ܟ@�
��Y��@����e(@� ��#S�A �o�h�jAu߂. �A��N�A��f�=�A�eO&A	m��v�Ap��iJA��%*�Aҁ�i��A��jvA[�\㊻A��Pڽ,A��RnPA��r�A���@�A��>U(Ae� 6s�A*<��#EAk����A u��Q3�        ?��5�]�3@$�N�s��@A��(�V�@S�kF�a@@a��8�Nc@l�%=!�_@u{�<x�@~��&�*@�4_����@������@����B�]@�>Օ���@�Ŏ@�6�@�9?����@��>D�[�@���#0��@�H�#G@��7��@�%ɗ��@�$�ͻ�x@�D�YU+�@¬�\�/@�M՘Ok@�+�����@�I�U�#@ά��'�e@�+���4@�&��%55@�H����@ג�w�-@�_R�e�@ܤ*j(@�l�q�S@�0�>4��@��F���o@�h�NJ.�@�'��I�@����#5@��V�B�@��O<��@�Ue�M@�,�E�@�X���>�@򓍚�Ĕ@���\0�@�5��]��@���%�@�/��5h@��d(ޡ�@�9���^n@����@��tZM�A ;�2C��A.!�"	CA*k/���A0��6SAA����A[����wA�i3@gA�ɌqGyA�1NE��A
3�t�A�3�b;
        @�:0�N�@�ý��i@��iT٦@��7^�A ��x?A	�d9C4A~���lmAb�EH�A @��JV�A${�X���A)4IP�AdA.j�ޥ�A21���A5*���'�A8���G�/A< 0	��wA?�� ��AB8�o�3AD1ɰ�PAFy7��z�AH�i�9��AKab��X�AN
� AP`=6��AQ�+pd�\ASJ��~ATժSG�AVo�� wAXٳ�^AY�iͰZ�A[�r�	GA]hby�A_M���=�A`�7t��Aa�>X5�oAb�PB�AcɠS�%�Ad�I��fAfH����AgDz��DAh�	ǰ�Ai��2&�Ak�8뿭Alf�[��*Am�t�/��Ao-=��"ApNӌK�Aq�_l�EAq��X&Ar��O{;�As]IPlAt,�+_Au ~��Au�S�\�Av��V�Aw�PLn��Ax|�z�Aye��P�AzRWT-HA{B� 5}�A|77"�1,A}/���4�A~,h*98{        @$RrԳ�@<��cL�@Y�&���B@m���UT@zox�y}@���P�lk@���x��@�f�e��j@����6@�;� �Ɖ@���X1�@�k�N�^�@�ٞw�@���e)@�/�K�S�@���#Θ@��5T�{t@�����۪@�����I@�:���@Ǩ9Eʣ�@�:N��@���0��@�˶���5@�f	\���@����i��@ԝ��l@�RL��6�@��XX��@���F�@��|��`@��ĜF�x@����0�"@��L~NL@�3M8@�B��7#@�{K$�֝@��޶��@��C*NB@耛��ZA@����Ho@��$�\�@����@���p�@�Bc>�9�@�,��I��@�#�9�@�%��\@�6�҂�@�T�鄱Z@��wq���@���q�Ǚ@�G�q�@�y,����@����@���v`@�(H�̿�A s_!���A^�%��CAW0AH�A\.��f�An�����A������        @�A���A@S��'@s�r��F�@��`�� �@� zTN��@��S�fXs@���8E�@��ݵ�@��	�@���^б+@�}9�\+@��#C�+�@�Ù�?�A5�SFOA �N�8!A��jmjA��*��A}L�4��AQrv�Y�Ax����A y{�c�NA"�~��A%q_m+A(*{��A+	B/�;A.I��zA0��7O�A22<�"}A3���,A5�+PxA74�˲�A8�
"�2A:�l��4A<L�=)ӠA>X�� 6A?������A@�M.B�AA�U&z�dABz$k5�AC\|�f�zAD@"���AE$�S� AF	�ĥ��AF���(��AG���MAH�Ԫ�o�AI�\�ؓ=AJ�z	D<�AKd�{���ALG�X�JXAM(�|��HAN�����AN�|���AO�*%�$�APM�_>��AP��L�]�AQ"��*�AQ�iQ�sAQ�|d5JARY.�^�NAR�Cz^�AS%�U?-AS����]        ?�!g!�@�@(,��+@P�DJ^z�@n�h�WŎ@���� I@�&�z�F�@��`���K@��>�4B�@�
�B�x�@�����@�u2@�]��R�@�X�+�|@�?����@���[8�@�R�l�;�@�x��@�q�Q5@�è�JK�@��g�N"�A ��
��A�x��A�}rMܱAt�f��GA|�O�A�z�d�Af �OaA�iL�^A����A�p�.�A�I@7%A ����%Ae�Y$��A��cmA!;0,��A"V�-.�qA#�
TS5�A$�?NԻ�A&Oّ��A'�:�3a~A)M����A*u���D�A+�5�7��A-6��TA.�@.�z A/�RsY��A0� �
tA17	��A1�q�έ�A2om%�%[A3	n��$gA3�kA2A4@�o�j�A4�G��gBA5��i6A6/���X�A6�S���A7�v&i�@A8O�A�A9���A9�yzA؎A:���J��A;��Fh�        @�M�Rg�A.RY[RA#��U�A5<nR�1�AB��l���AL���&ATa
i��\A[x�1��Aa�-=ewAf��C�Ak�?���Ap���0"At2�& �Aw��h A{[��<:�Ad��|��A��A8�Q&A�m�I��A�xؐ}�KA��C7}\IA������A�X�:W�A����O�/A� �W�P�A��b��#dA�X��m��A����K�A���o���A�����AA�~u%`A�lm��6A�5e�=�A�=�����A�O���A�l�F-�{A��ۃ75�A��T觿�A��'	A�^yWs��A��7k�qUA�*�լ�2A����dvA�7�D^�A��o)q�6A��x�##�A����Y�A��l1u[�A���&zA��w�V�A��~�{�A��!����A�0�6,�"A��%��pA��ϱMR�A�b{�YX8A���p�A����9S[A��~n�A��;�3�A���EAÁ�S��Aĉ�>��AŜ�r'�        ?�ߍV��@ ���O��@='w�5�@P*/s]j�@\�}")#@f]��A�@p�-m�@u�9���5@|�,<w{@�<T`�-�@���H2��@�mf�+�@�Z4� %f@�3�)�a�@�A�?��@����q�@��.[%��@�S�n�p�@�D!
��@�OJ8ǒ@�u ��\@��&����@����A_@��者 �@�
�y���@�`�"�4�@�Ų���2@�9W6`�4@�����@�M�Q�@��;P��@��p���3@�[0],�@�'hd{F@���x�@��ͮ#˫@��#��w@��i��I�@��˓ @�*G��@�6F��.@�\�ם@Ȍ�1��@��>�K�H@���X�|@�P�>@ͣH&�P�@����+/@�0B�r��@���U��@ў��`�@�[��3��@����@���J j@ԫ�D̓@�x)
'@�I�
1��@��&7@��ؔ�|@��9�,�@ٺ� �%E@ڠ��~֚@ۋJ�9�        ?�D� �D@/�JN�\@O�䃍��@c���ģ@s0u'Jq@�]a�r�@�����@�q�G8�@���b0@�!���W]@�lc^7E~@�m�(�,@���f$2@���>�@��'�â�@�.o�^u@��	�Wt@�h1�|�@�.�h%�@���6�@���K}@م:�!t�@�O��4�@ລ˦Y1@���M80@�n�n w�@��j�@���ItN&@����{�@��X���@�T%��k�@�+Ƿg��@� J�í9@�2X�s�@�b��d��@��OzXҿ@�!�D�.A �[*��A1N5���A��K!��A>�r#�A�� �q6A2�-c��A	����?�A�MVN�iAYmfh�A/o��)A��OeŜA��'*A����6A��1BoA��ԖQIA��D<ةA��GzA�!0�AV�#�AI�H.�,A�`|�A�±/�'A��>B�AF��@MA J�$��A �'�;ض        ?�Qmk��@Ȅ&��@2�M'hJ�@E8��σW@SJ��5,�@_a�4/��@hі��#@q殸ȸ�@z ;m���@��1����@��g��#@��9;4i�@���w�8@���m�8@�{����@��n�j@�Y��)#�@�6p����@������@��g�ޥb@�؎��у@�,�TKǣ@���B|�@�@k&|�@�ڤ��@�_�N9�Y@�3�@��@�~:��@�:*[�ͪ@ߜ�O?�H@ᜅ�@�#�7{@�~����@缿�#�@����h@�tO���@��4�@��+=vw@�?���*_@󷈟܆@�>�VR�@��Q�g�@�z��v`2@�/%�	�%@��� 
tB@��ƞ�_�@����cA �$�iWA�24��A�	[��A��,v��A��a�J�A�,�4�2A��\}AG"2���A	v��Z�wA
�Y�D��A����A2�ܙH�A��+<�AҜ����A������AE� �-�        @����?F6@�C�W�&P@��܉�Aw��ٲA�Jg_��A�v��j5A%�����A--�R�QA2�ZߟFA7P'���A<JV/�A@�G�Լ[AC�]�6~=AF�!��5�AJ�IAM���k�?AP�bz"}AR��9kzrAT�~�o AV��HF�AX�{|�r�A[0����)A]���j'�A`	ZP�AaTC&���Ab��<q�Ad��9��Ae�%�~AgB'be�Ah���T�Aj.�KC�Ak��YOC�Am��i�AoYo�4}�Ap����6Aq��&���Ar�^f��QAs�<S��At��z@��Au�QA@��Av��+�Aw҂�k�Ax���F�Az&.*W"sA{[P
���A|�>�#�?A}�B�m�A)�p`�gA�?5���%A�����wA���-���A�X昗PA��zH�A��#�s5A��]���?A�k�3]�A�=�2�A��_�[�A��bԒ�A��8�X�A��0��A���u8�A����        ?�,���9@Qַi�@/mj��<@Aw<�b_�@N��ޣ��@X'Ƒ��@aZHO���@g�8����@n��$hi@s�ݽ�w�@x8\�FN@}g��[�@��ӭ�s@����5@���Ӳ@����b
�@�����M�@��҉��?@�,�wh�v@��l����@�JZ�H�@��+�E@��,�T�x@��3��J@�F��8�@���L"@���Y@�iw�i��@�L�+h*@�H&�@�^���;�@��NM=�@��#��:@�%X���@�hz'K%@���Z��7@�Z���@�����h@���q��{@��Q���@���W@���#%!�@�s��3�@��>��S@���鞉a@�v���B+@�p��7@�r{A��@�|l&F%@ƌ�ɭ�)@Ǥ_ze@��c��@��=�!l@��!�f@�A��^_8@�xZ���@δ�eJ"�@��cz��@П�\�X�@�G<
�W�@��mN��@Ҟ��ْ�@�N��э        ?͙G�4-�@WÅ�@'bE���@?��_�H�@Q]f�@`�D����@n<��q�@y~���@�e�,��@�*I�0&@��,���@�@�mr�@�q[��
@�C8��u@���Z)��@�����@��ӟ�M@���x�E@�)���[@���.'@әݭտz@ג+�쮮@��E(�W@�y�]�@�,����@�M ��c@�E�`Dn@���o4@�)WQfk@��{�+X@�2r���@�l_��:�@��n_�1�@�TfO��@���^4�A p�`4��A��n�ֺA��A? ;��A�"�y�A��avA
�,�@�=A�!k��A�޲^A�ǝn�A����'�A�� �B�A'6+�)�Am��rOwA���ů�A��F��A�L����A� F���Aq*�|^A��Bii�A�_�
=�A �+2Jy_A!T�ȡ�A""�mrr&A"�j~�BA#��n�A$��H[/�A%d�^l�        ?����2�@�pl��@;h�����@P2�F���@__�%���@k\e���@vx�w��#@��c��@�-)t�@��}V��@��O�C�@��?+M�@�2�{	��@���<,$@�B�s?@�y�CC�;@�Z��w��@Ƅ��%E�@�FM���@�V�P'@�fu�$@��kn��@ں�q�@��`nX�@����J$@���h�@��k�@��͢
@�H� ��@�84	�wi@�V�z�A�@���`}@�`J��@����?��@���b��A ?�����A��0;�A�|#�u�AE�nx��A!)� ��A	f�,C�A���xA8��ؾAj3J&-�A�5�{XA�b+f�A4u�/��An��XxA��>��A���>&AC�Ʋ��A�E�`TA���c�AH+ɇA��q�qA	J���A 7.���A �����(A!����zA"U�r���A#t ��A#��:��A$|O�/'�        @�*�![�@�"��S� @�s�ɖ�@�¬�2�AR\��A
���+A*�>���AۼFi��A ¤gȢ�A%"�L�A)��mk'�A/SD@��A2���maA5�?E˫A9|Gf��AA=\�[TA@��ӣA�ACN�Y_�AEt���ѴAH�IFo AJ�ɞ1�@AM�GB̥fAPt�bEAR���`AS��&?�AU��]R'�AW���N��AY��@���A[��0y�A^.�53�NA`H�!åSAa���Ab����Ad323s��Ae�.�tAg���Ah� FA0�Aj&
Ʌ��Ak��+�4�AmfЯ��RAo�b�״Apj���"�AqO�4�mAr:�gQ�As*q�ӖRAt ��i�.Au����AvC����Aw$��TAx0�$�[Ay@��}N�AzU	2E�UA{m�:KDOA|��  ՁA}���<1�A~Ҩ&s�A����hA���h��\A�1����A��/����A�o�s�ZA�q�o�'A��c�        ?����#@�T�wA�@(����Z�@:��5٨�@G.�t�@Q�$�$@Yj<.'@`ȰÙm�@e�&�u�P@k���!@p�e���@s�5�s�@w�:�|	@{}M�9r�@Ģt!?�@�/	��ȑ@���_��@�C9�n˿@��U��@� �WR�@�Q8XU@���):ɲ@�zV���@�S���@�E|{ �@�P0az�<@�s�d���@��dq�c@��ѥ��@�:i�$h@�~����W@��R��1�@�-+x2̉@���Gp=o@���{�@��P�O@�0�&�@��RV��@��� z:@�'U�0@�/�z(%@���}J@���g@��-�zp&@�z:>�d@�f�2я@�0��p�p@�PY����@�v޵�@��$F�WZ@�����.@��{�P @�TmR���@��'t�5@�v�*$Ŧ@�"k�S�8@����uR@�S�s�@�<�v�R[@����WY�@ĶV/��@�x�-tK@�?'l���        ?���~V�@�����@'O�@u@>���N[@N��N
]B@[
�et�@e��?�@p���"��@xP2II@�(�����@���~�x@��ca�@�ܢ&�7z@� �DП{@�3��֓�@���	��@��*-��@�n.�C@��3�+G�@���4W%�@�����}2@��ƧL��@ú:O�D@��7WJ�*@����m@�hsg4b�@�W_'0�@Ӫ:�z3q@�-~�q��@�ጽ)au@�ƆTG�N@��a��k�@�|�j�z@��t��P@��5@�6�oǮ@�4�@�i@��qtȴ@�9��Gd@��Ha�1@����_@�i�q&FV@��W��n@�9�Y!w@���ҹ�@�@�s��K@���v��8@�~��Q�@�1n6.�@���FSA �C�	&�A��dA���k1A��n���A���T��A�I�ȧGA�vWDDA̋թ��A��)!�A	��$-S�A|��y�ADOWB�        ?��줐..@y�Fy�@'&2�$�E@:�<B=��@Iۺ�C�s@V@8w��@a�i�j�.@k���j�@s�l0��@|З磇@�iOi,	�@�QS�m�}@��n�(��@�008��@����k@����E@��"�u@���5���@�d�^�xi@�RrH�>@��h�)�N@�ьo�B@¶�4@���q��@�53�d�@��!ך�@�x��q��@ҥ��T@������@ׁ؉Wy�@�3s��%�@�֠t�S@�0ۺ�	@�7_� Y@�m�Lb#@�A�`���@�0��@�8��7�@�[*�k�@�ب��.@����@�/��3�M@�u�_{uR@���M�ԃ@�*5��+@�����P�@��	� @��P�{^@�C*����@���0D�@�� ����A 9�S���A%ֈ�<A�Y��A����_A���mA��|��A(���}�A=c��w�AXΏ��HA	{
kQA
�9�-�A�?�%7*        @�-cT�E@���S�t@�b��kɼ@�*{�@�2@��Qղ��A���amA��Q�MNAy�r2A�xy��A�y��\�A!�b/��A$�b�:�A(G5ܤ�IA+�\ѐvoA/��K�SA1�����A4
�&vA6K2��VHA8�$&ggA;3�Z�A=�xx�sA@K�C�YJAA��0_�bAC7�W_�AD����u,AFUU�vDAG���AT�AI�!��{AKdޮc*�AM1��7�sAO���
oAP}Q�1��AQ|8R"[AR�7I��AS�#�#AT����U�AU��{^_AWO�R�_AX>�@ptNAY����NAZ��8�/_A\4�3�}�A]��!�NgA_��	*�A`M�ʛ��AaE��rAa���l��Ab�_�S�Ac�0���Adx_�x��Ae`��X%�AfO�3ceLAgD��yfAh@%�h-AiA���f�AjJD�v6AkYoAln1�~�NAm��]0An��4��AoӰ�qQaAp���{6Aq�X�        ?��1b3@�%�W��@%���<9@7�3xJ �@Eg@)<@P��_o�@X�EIA<@aͿ��@fs�[�o�@l��Y�@q��=�r@u�k�hnr@z�;��!@ۍ��5�@���칗�@���@@���/��@�{.d��@��z��=�@����@�V�4���@�ʓP�U�@�[���X@�	g%T9@��Eq@�@�X��:@��I
��@�]��-K@���e�.�@��FR�"8@�G�"��@�)~C�!@��[��@������@�T����@�T�|L�@�\M�!]�@�k>�2?�@��y��c�@�������@��t}ǅp@��%�a#@�'ի��@�R�]>y@���4\t@��,�d��@��b@�M6����@�L>6j@����j@��e��@�QQ����@��/��T@ü<ʏ=@�w A�O(@�5uU���@����y�@ƻ�T.X@ǃ��pJ�@�N�}v��@��;���@����Q��@��=�B]        ?�����M?�| ���@gr���J@&�^Z\Op@9��	�X@I"��3C�@Vb��l�@b��cu��@mnG�7�@vE��5c@�BH桢�@�6*�3�@���ݮu@�f�@�?a����@�L<)R��@�M�,��&@�71���@��㗫C@��b�#@��'�@��ޛ�4�@�A�Y@ů*�A@��|Vl@�͉��J@�k1���@ҙ��Ͻ@��;D^��@�x��	"�@�+)9�@�
��D�@�v���@�ӣ}�@�`�m��@�/���@���:�@��[7��@�.ſ��@�b(����@�G�,��@���@��@�O�(2m+@�&�@�f��%�@�p޷F�@���&5@�~eA��@������@���"0F@�������A *�l�A�Ja�A����ARޙ�A��bA�djҕA(h�@2�A>Tj2AYu8�A	y{�x�A
�-,�:�A�;�q�        ?��G�km@
=��Ԍ@*P��L�@A.�Y��8@Q�k���@`Ty�,�[@k.vK�@u(��@~༛�>a@��^��@@����1@�����'k@�f��3��@�1O�J@�Q,�Z��@�!נ.��@���e�N.@��~�p�@�$�(١:@�9�Ɩ�@��`���@������@��/,N��@�����@˰�Sqk#@Ϩ��'�@�f��g@�g��v@���@�և�c��@��n���@��$"�]@��#r(��@���iKO@��Y��
�@� P���@�Tz�r��@���vC7@�s�2^��@� |�5�@��j��@�/}eQY@��H8H4�@�����r@�uDzXu@�h�b;�@�v��Gs�@���Đ�bA �4��5�A 乼UHA^�a�#�A��h�,%A���l*An�)x�A�2\�9@A
lm��`A��H��A��⥪AQ1��A�S=�kAl;d5�XAX��q�AJ�B��4        @F�Ux�a@��Ku~xF@�=���7@����Qd@�I�8��A �Gig�A��:
�A����͟A��DmAv�{�J[A#(a�]�A'���+jiA,�Z�\#�A1&B��HA4)as��A7���1A;!� $�DA>��q @AA�X�:AC�R��|AE��9�AHL��PHAJáI���AMTX��AO�&�<JAQ`�/AR���K��ATE'q��AU�wԨ-[AWV��(��AX����AZ����A\E��uA^!y;�A_̦��JcA`�Q�i�Aa�b	��Ab�2� Ac���#yAd�z�� �Ae�_9r[Af�Knk&ZAg�J�[ܫAhȮ�,gAi�5�.�Aj�&���Ak�1�c��Al�I=��Am�rH�a�Ao�3�zAp`�Y+�Ap�K��r�Aq-pYy�Aq�u���ArZK�_9�Ar�#�-�As��l
O�At8P����At�QA�G�Au�h��J=Av3�0�S�Av��P�9Aw��D#B�