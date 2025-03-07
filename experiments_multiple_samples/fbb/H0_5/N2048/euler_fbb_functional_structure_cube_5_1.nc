CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T101335        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_py         �import scipy.stats

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



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_xml            �<?xml version="1.0" ?>
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
          <value>0.5</value>
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
        alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?��1�=�H?��T&�/0?�F��4f?��<E?�R�5�T@ފ�#��@P�@�'��j@��DJ@ f ��W_@$ToC�@(�XڮW6@-��(�ɀ@1c=J�j�@4?����@7WN!_�@:����@>8zW��v@A��(�@C&f0+r@E'*�	� @Gg�"y@IǇ�̣�@LFm�߬@N���X�@P�|>\7�@R@|���@S�v-~��@UNq� nx@V�{�S� @X���M��@Z\���@\+�|2H@^�d�_�@_���cz@`�7�86@b���(�@ca�~4�@d0Y�)?�@eQ�Զ�@f{}1�8�@g�ݲ��)@h��g+3�@j,��T��@kxؘ<,�@l��w�w�@n+��֝�@o����@p��T���@q<Qt�=@q�O�1��@r���r�@s�����@tU� �h@u&�]��h@u��MIÐ@v����"�@w��8�_�@x��A�(@y���7.|@zp�ڃK@{c>�+��@|Z� ��        ?TEɹ�?���.�,?�/���$M?�z��$R?�M#�Zp�?��.h#=�?��a�wk?������?�&���<?��c |H�@z��8<@�a*b�@;��@E4���v@r���q@.�4o�"@ ��)�t@#��&��@'[Ǒ�@*����l@.�KS@1�Pɜw@3�!j�*�@6r+�b{@96�ݷ�@<0�=��@?`]���@Acy�L�@C2d�%�@E�)�@G#-ݛ@ID�t��4@K���b�@M���ұ@P& �G�^@Ql�׵9^@R��H��@T"8����@U������@Wd�L�@X�T]s=�@Z+�����@[�w��@]����@_@�,�W@`���~w@avv ��@bm7 Kp�@clP;,�@dt1��m@e�G�ik�@f��8�G@g�ygw*y@h�*4@j,A��J@ko��1�Z@l������@nn@r@o}�p��5@pw;d��@q5�֣�@q��ߠU@rĤ�F�        ?d��S�?���<��?���,�7�?�� �@�9?�	�#'?���<�w?�qO;d�?�D/��P@��F6u�@
��r@�@���@y���`�@�H�@ j�J60w@#�s;w�@'Ъ+���@,>�&m{!@0�,νR�@3a)'F@6w#��I@9�	\�k@=�ѿ�*-@@�.�l*j@C7��*T"@E���5�^@H~�=��B@K�	m��@Nǡ�v�S@Q+;�{�|@S����@U/�!N@WpF�D?B@Y��-�@\|�����@_L�hGg@a(/I�@bĎ����@d|_Э��@fPn��	�@hA���@jP�'rh�@l~wZ*@n�0��i�@p�U�g	@q�Y�li@s>{n�er@t��:_�@v%o��U~@w�����@yT�`�@{�Uw+�@|�{��,�@~���p\�@�H�/t�G@�G�9Z�|@�P���x@�c�����@��إCb%@���>$@��ݞ��,@�Z�4IV@�]�;�9@�����@        ?��R;��@ ��g��H@;��P�>p@OC�w=l�@\uu��D@f�� �+|@p�̸�@wo��ω@~�뀞�&@���Jh@�W��e�@��V���@�د�^��@� I$	͹@���}O�s@���hF��@�ht����@���Y�
@��/X0@������@�wKdU��@�f��Z|�@�A����@��15_@��&��H6@�rAf:�,@�[Ɯ��;@�\�vFm�@�u�YV�@��w���I@��=����@�(%���@�d��#�@î��k@���u{�@�e�J�@��N7P7�@�Ov��g�@��@���{@�k�v���@��i@ϻZ��j@лN���a@џx��Q�@Ҋ-��4@�{j��E0@�s$g(��@�qMQ��?@�u�n���@׀�oϷ@ؑ��>	�@٩��L@�Ʀ�, /@��jd?�d@�qsU�@�D�ַ�@�{���y�@�\[~ �T@��3!���@�J%u��@�K�v�@��(_\��@��a�\        ?bg�s$?���'��v?�C Wb1�?ˣE���?ھ3��H?�?O+c��?��CO._?��#U���?��`(��]@uN@	�.q@�����t@��vs�	@�
q�@T8Ȓ�@x�#��@!u��i�@#�`��y@&a��1�p@)��u�@+��]��k@.�8�[�@1Ġ��_@2���O��@4�%J��@6e�jâ�@8Xk���@:a���E�@<��%�o�@>�x)�aC@@��Z{L@A����@B�]e��@D9�K^5&@E�D'd��@F����@HQ�@��@I�+�8q1@KA��:��@LɭNN�@N\����@O�|�:�@P�I�8�@Q��.�H@R�5���@Ss�K,}�@T`�s�@UR�}�N�@VK]ϋ*�@WJh�M�]@XOΙ�'�@Y[���N@Zn'A~^@[�\�et@\�py�CI@]΂H!y�@^����@`��@`��,w�L@aY�O)�1@a��=��@@b� _��@cX(Ѐ|        ?R����E�?��C�
*%?�����%�?��"񨒍?�.5�w�?ܙ0ԍ�n?�g�٣?��KL��?��IE�?�~m@�}�@��.I%@�-X��@J%6-��@��D3q+@ �<�@�j~G~�@*�5��@ ��/�?@#2Y�mx@&-_{�To@)v�Fu�@-���+�@0~��Di@2�y���@4��ǡ[@7q���*@:#6�W>@=���+@@j��?�@A�B����@C| �N#@E\��~6
@GZ����@Iw�V@K���%O[@N��1�@PC ���@Q�l�
d@R��Ύnm@T[�_��@U����@Wk1g�n-@Y��,��@Z�#��A@\�A���/@^\oy�=@`"�b���@a ��KV@b(j=��@c9i��[@dT%ȏy@ex���<-@f�9���t@g��8p�T@i"�O~�-@jo�vO @kǎ�l�@m)�}c7=@n��ԑ@p�ʘVe@p�6;:.�@q���D@r]�9ST        ?R���Ζ;?��̶i<�?��B���?�΁s�b�?ǀ��?�Ά�SL?���k�h�?�b
���?��be�?�������?���9#�@ 忰~�@(D�}@	ĢQjj�@*6F
@�����;@��M�S@�B��j@6R%�P�@!}�U�;@$ �g��@'=�l*{@*8��'@-�����@0�����x@2��I?$�@5	q��j+@7q]G�~@:vo��@<ЭDo�@?�­��@A~Cy��	@C2/����@E�`��@F�ZD��@H����^@K,rDuh�@M{#�m�@O�r買@Q?r��m@R��DpО@T�2 � @U�� C
7@W�����@X��a)�@Zt8n�.@\>S���m@^��!�@`䎗�e@a	�V@bp4���@c/�	�@dR�n�@e�s5:�@f�C	�@g����
�@iK�C���@j�����@l	�&�@mx�Q��@n񹑞��@p;!f8ҩ@q��@        ?�|�q�z@ 6~A�o@�=�M��@3��	��@B��H��@O�(�@�@W=׆��@`H';��@e�[1�c@k�kl�;@q� L�@un~���@y�n��]@~y���@��L�k��@����<��@��V����@��~?V��@��n�5�@��BS��#@��@���z@��� �W@���Kt�R@�����u@�=č�`g@���	�@�}ꏲ@�^�ۿ6@��b��I@�!+��n@������@��6饉@���W��@�@�:a�|@��?hˤK@���q�k5@�XUɱ�@��P���@�|m^�	�@�m����@�d�P� _@�bF4��$@�f�r��@�p*��b.@���8
��@��
1vȇ@���J"E@�ڞc�|@����@�8G}W|�@�q[��@��]��T@�|6S�F@�#Tpɻ8@��
%@�|�Y�ۙ@�.�2g,�@��*l2�@ğU�Z�@�]�tfkD@��U HS@��k�*��@Ǳ3�u�3        ?��i۾?��g���?���3�9?� ;��ء@���P-@��k���@�ӰT�@!���rҐ@'<�|���@-�k�Z�@2PT���@69�[T@:���dŚ@?.}Af�W@B�Qs�@D�o��@G��:U�N@J���>S�@N�}a��@P���E�@R�K`�V@Tuj�{@Vq~+��@X���3�@Z���ͻ@\�V��;@_;4�ThS@`Ф�
@b�kW?Y@cTY;��,@d��>n�f@e���Q�@gbz�Qp@h����@jG`��f@k��6��@mT�K5��@n�3/�K�@pF ���@q|Xu@q���x��@rض��Zv@s��Vi<D@t�|(x�@u�s�_@v���x�E@w�kT�@x��.�H@y���ǮU@z�%9� �@{ۋ9��7@|�Z����@~(è�ŏ@Z�Zx��@�J~[�z@��Ⱥ;@��W� �@�9x���@��b;��Q@��.�S�~@�K�ri�?@�F|��=@��k���        ?m�[�p��?���7���?�_>�g��?�2>LP�]?����Z?��$�grM?�	%?b�/@��P@	�z�y��@��ܲg@��~��@ąGq�@ �@`c@$���u;@(4d�b@,g�*S�@0���ɶK@3L�t{�@6:G	��9@9lb�Z�@<���)@@T�q@T@B\���1@D���-t�@F�|䡙@Ii�s��@L��禊@N�,R^�@P�	�ʴ�@R��U��@TI�0��@V5}	�@W�m��@Y�q_�@[�r��@^t�m�{@`.��@aY�2"�@b�Y��m�@c״^�@e*D�n�@f�X؝#@g�A� ��@itR�n��@j����Vv@l�4&�p.@n@�����@o�E����@p߱M>�@q�5�_@r�,H9_�@s�-#��Q@t���o�@u��Ú��@v��.h@w���y��@y�o��@zC.��>�@{v偵A�@|��W�@}�g���_@D�Ð@�LXn�Y        ?��U�9�?�w��h��?������?��?ɠ@ '�	=@����=@���	��@!�߅I7�@&���{�@,=[���@1z'L1(@4V�he�@7���:|�@;�­YR@?�C+H[�@A��0:Q$@DM� ���@F�1+���@I���R�t@Ld�&�*$@O~x���@Qg��P@S,�/��l@U�4��j@W��n��@Y)Ǌ.��@[c 0���@]�O(��@`UK�Z@a^��ռ�@b�%�|fk@d-�4��@e��AƈD@g!��J@h��x�@j=���o@k�e2�@@m�,���K@om�7��c@p�ҿ�u�@q�ic(�4@r����;@s��9�t�@t��g0:^@u�_%�@v�'}͗�@w�}����@y �-j{�@zVbez��@{�#�D�@|��6��@~-jN
�@����uz@�t�c�BD@�*��x�@��+:��@����<vm@�h�"p�@�2-T��7@� ���@��_?� W@��XAms�@�����W�        @~�=ʆ@=,i7f�@Y+��
�@l���aS�@y�x�$��@�c{=4@�Z����@�䂣e��@�Ҷ~aq�@�:Z�x��@��=��m�@��e֒��@�@V����@�xă�&@����?b�@��Jn�6�@��$B�(�@����j@����(V@���xw]@�������@Ē ���?@�w?�6��@�o�I#A�@�{���@̙1Ercl@���]!�@ІL+�Z@Ѱ�9�P�@��\�ig@�!�+@�f�v�@ֵ��u�@����y@�o���=D@����m@�Po,���@����")@�Y�LsU@�wE{��@�F��0�@�087�)@��	�fI@�תւ�@@�=��^�@��xC�@� 7�@痜2O̓@���@�v��z"@�7B��@�ă#:�7@��f`ʽ@����@�6vʂ3�@�6Ax��k@��WW>@�x{)��@��}�H@���"|@�z}�1@�-/,(�S@��I�8�        ?]�[I��'?��?�!`?��_�-?�Y11��J?�H��s?�V:�%3?�io"n��?�-�����?���ι`@ x��`@��Ʈ{@	E:����@hꭻ�N@Q��@���~,@u�����@�'�@����f@"S�U"@$J$��5@&���w6�@)&r&ڳ@+�����@.�j>x�@0�V���@2E�,�j@3߸#��@5��z�@7J�����@9m	@�e@;
�ӂ@<�ک�e@?
B��:x@@���x�@A��ͺ�K@Bًa�F�@D
�e3�@EE��AO�@F��T��@G��+��@I2|ۗđ@J����J�@K�����@Mt���"2@N�-b��@P<׍�@Q�,|h@Q�ۺ�O4@R�e�V�@Sy��?J8@TT�t��@U4�lc{&@V)Z[@WV|�O�@W�Av7])@X�˯ݩ�@Y���@Zե���@[����@\��A�A@]���[@^�{��@`<���        ?:I�<?t5T6@ܽ?�V�c~�?�~T�絟?�䵔�(�?���oG�?���>I?�9�r&H?�� ��?�Z%P��?��]��@l?�t�:м?�-"���?�h:i"Ȭ@ �M��0@5h��S�@-���N@�$����@ޕm�@�j�nR@�i  �@dm4FU_@HF[Y5p@!H��� 
@#��Qgb�@&8;��&�@)	few5@,�\$@/o��1"�@1���i��@3x�7�G@5�r����@7�ʾ���@:AB��y@<�a�Y�@?���=9l@AI&#
'w@B��T"�@D�@���[@FH��6�)@H&Q���%@J^�>�@L1��C��@N`��1dB@PVX���@Q��w��)@R�\M���@T!7>�@U�w���@V��*�K@Xx:�F�#@ZS���6@[�dk5�W@]d�\�l�@_+��>��@`�����9@axz��@bw�"V�A@c�x��&�@d��
��w@e�� ��@f��
�hs@h�u��Y        ?;�OG�Cf?p�/%kɫ?����}k?��XĮ}x?�����?�?}3Ŋi?Φ��?��T����?�����?��r;m�?�
o퐟�?��R��[�?��X�0�?��]WS�7@('�@�N���@
lvd'@f�#�H�@ď/΁@��0�@�NsB@�{����@ ���{:�@"��r!��@%������@([�7�@+n�$��@.��:d��@13�:��x@3*����v@5HʨaWF@7�2ye��@:�G�@<���+�@?i��zc5@A0��m_@B��A��@Dnmݥ@F0�a�ʫ@H�5�U@I����gT@LOC���@N+z7��@P3��
��@Q]��ۦ�@R��4��@S֗�->�@U%}�D@V��.B#s@W�ϸ�y@Y[�w��2@Z�&G{n7@\f��J��@]�Tf���@_�����@`�r&3&b@a��*l@bi%���@cR9Q��d@dA)^�@e5לi@f0nB�]�@g0���        ?��$Ƥ�?�T�Bއ@��_�>@*uАɂ�@96��z4*@D��;���@N�S���@U|�*7�@\���$)@bP�7�A@fٝ��@k�0i
�@p��0K�@s� @%c@w�\� �@z�%'��@~�o]�4�@�U<
��@��ɏ��s@��A?��@�aEW�
k@��/��@�� �>�@�U��w�Q@���=�k@�r����@�����@�֍)zH@��A5�@��3��:@�}���.�@����7j@�Uv3��@�qd�^�@���طG@��B)f�@��EY�@�Leq�K]@��n���6@��s����@�]Hc�M�@���4�ŗ@�C�>�@�ń�j@�(Q�+(�@��D��I@����/5@���Dķ�@�n��qr�@�Lqdcn@�/Y���3@�R�`S@�Z����@��h�->D@��o;�{�@��^���6@��'�/%@����Ea @��$�N@�	Rk�R�@�O^�u@���|�@���.�        ?��l%\W?�k��⇆?�	��[&�?�y�m�U?��:��9�@d���n$@:��s@wo�@B$G�@!�Đx��@&T͕WGd@+"�ͯb@04В��<@3 6MH@63e��@9�����@=1=%U��@@��*��@B��xL��@D�coC�@G(�ZUB@I�H\%@L=�¶<@N�����@P��)�;@Ru���q�@T%T�@U�z}��~@Wti?���@YC��P�@[%i?��Q@]\��<�@_�3�E@`�_���[@a�^��@b�¸�B@c���W2@e/^/�A@fmTne��@g���Q��@i|�� _@je��)<�@k���<Hy@mA'�9@n���B��@p%�a�L@p�k��@q�f�hl�@r�����D@s����3@tj�ߗJ=@u^�9G@v\Ky4|@wc0�J�@xs����@y��J=@z���T�@{ߓ���@}�4��@~Y��J@��ݿ��@�~����K@�/󟻥�        ?���b�I?��e]#��?���Sa�?��K�>0?�фX��M?�Gq��.�@�c"��S@	�ڃ�P�@�n���{@v]��ρ@���4�@ ZKB�A@#����A@'w��^٬@+����@0�x
+@2�,h�@5U>��BU@8F�L���@;qf\m@>�MaA9�@A8;l�@C" +k�@E'�ȹ�@GI.SL��@I�ܯ��@K�k��@N[���@PzF�=l;@Q�ʀw@SG��}�\@Tʆ��M@Va!ǖ�D@Xx�ԟ@Y�LT	$@[�N���@]�wXZ�@_�U�1�@`�C�;�|@a�+#��@c�NiQ�@dQL�sV@e�O�b�@f�0p��K@hA[Q3��@i�8Pi�@k*%�[ =@l�s�e�9@nP`=4��@o���H@p��z��`@q����	B@r�Z��@s�l��q�@t�O����@u����}@v�!v�v*@w��g�zJ@y�+�@zI�mv�@{�����a@|�1ϴ��@~;cjE'�        ?fb�#'�?��ޤ^j�?�*G@�N�?�f�o�m?�P<�s�>?��A���?��i����?��8k?���ĦǮ@.���0�@]�Ȯ��@�}6�O7@�oee'*@��o�@沞E� @ 9;�ߩ@#_��#��@&�.��@*�"q�o�@/U6 �i@2 :^��@4�i��P1@7�X΄�u@:���̐�@>w�)�@A k{]�Y@C+9O�\R@E]����@G����`@J=�h�}E@L�x�[�M@O�i��w(@Qj�9��@Si?��@T��|���@V�b'S#�@Xnߖ_�@ZmMT0b@\��je^�@^�fF@
�@`��y�H@a�]���@c ����@dTR�o
@e��[Z��@g(CyS��@h���/@j9'�
r�@kعc|�@m��
�j@oF_�ZF�@p�7T�3�@qx��ل�@roR��l�@smO�@tr޶��Y@u���&k@v��	���@w�,�X�@x�b����@z���c�@{5����l@|r>��D�        ?�oRe�(U@,�/��;@Hr!�bn)@[@���(@hS�G��@sD��@{[� ���@��u��"�@�!���r@�g�T3z�@��J��I�@��=�s �@��u3�@�;_�p@�#�O��@��,����@�����@���O��@��Tc�YJ@��\s?j@�^���)@�BYR!t�@�?��I�@�V�9��@��fn*�@�ҘzO��@�8"�8f�@��ܾ1�{@�(hKX�X@Áb�w�@���9]@�WԊ��@��?�2`�@�^�%��L@��IJbm�@̘wr�� @�Hп���@�IM�w�@���"8�[@��wZ{.s@��ޓ��@��9��K@�ĥ�9�R@��W�
�h@�ݧ�Y_�@���i��@�y���@�B��WH�@�xc D��@ܹ�)XЊ@��,�@�c�l�h@�f�L���@�#iB0�@�簔Z�@�V=��@㈬I6�k@�f��P@�L���H@�<���«@�6��e�@�:�� �@�Ij��        ?eT�u�_?������?��5�`2?�����<?��D���?�g�4��?�㤌���?�ʰS$e�?��^��Bb@�(�p@	�w#�@��$�@#u�~��@����;�@�����@��A�D�@!�BXz�@#�Sd�~�@&r��E<�@)!0=��@+�y,��@.�wy ��@1��yf�@2��L���@4�8F�@6W��pz�@8GM�z�N@:Nѫ-L�@<n�K��@>��>/"@@}[��@A���)��@B�̿��@DG,�5�$@E���n@GP��?@H����@J
�Q���@K��e=�@M8�*/O�@N� -� @PKs��Pb@Q,	"��@R���R�@R��^O7�@S��Ƀ{�@T��)@U�"kN��@V�'��f@W񴺵<�@X�����2@Z5<zA�@[,����@\Jpx �@]n=�؉Y@^���º@_�W��@`}O���E@a*$���@a���ə�@b[� ��@c �r�~@c��
�~�        ?5V~\�?r\f:��?���Hr�?�"o�0?�t2lw�|?��5���?��� ?�8�i�4H?�>�hm��?�y.�?"�?��o�]�?�Y�dq��?�|��?�n����B@"$-Tp�@�3Q�D@u�T�i@9���k@�q�@$g�G6 @�\s tP@r>�7+�@ Ջ���@#%�	��!@%�N|̥�@(k�"^�@+dsXDD@.�w��qK@1�y9�@2��=t@4߫֡�@6����"m@9C�P�u@;�k�&��@>=�{��@@{	~�I�@A���J��@Cq�r��;@Ek��Fa@F���%@H��$Q�@Ji�L��@Lb�V��@Nt�s��^@POд���@Qr*}7�@R���R�
@S�Fl)T@U(v ���@V�V��@W�X��@YY/@Z��k@\l�j�@^�K�@_�'K֑h@`�ɬ]V)@a�2�#y4@b�h�IW�@c��pQ-�@d���| @e��̒N_@f��� I�        ?`��%�?�1%^-�?��"F;�?��$����?Ը�L�1?ᢰd�$�?�,��H�?�V_#+?�����@����@�n��y@fJ�4@}�@��@9UI��@k�#���@�A�@!�o�idh@$��sC�@'��c�3b@+�L,s@.�0�;3�@1t���=g@3�S��8@6����[@8�P�6@;J'd��v@>6,�A��@@�\��t@BT���@DyY�F�@E�q����@G����@J�[b@LE�bg�>@N�c2x6P@P�ۨ��@Q�{휁�@S4�e�@T�-8n�@V(Mx�<@W��R� �@Yh$�>V�@[%���V@\����@^��3��@`k�ݑͭ@as����=@b�$�4�@c�YJ�b@d�[��`@e�>�.�_@g<c�	j@h��rΐ@i�Ij��@k99�B�@l��� �Y@n�3q@o��4�@p�&�m�@qf����K@r<^�I�@s(e�@s��VB�        ?����L?��3�f?*@��a�]�@1���Z�@A`!�'\@L�iKѭ�@Uӛ<.��@^��/�J@d�2�f�@j�d�N��@p����s@tl��7�	@x� ��C@}ͱW�@���-�"�@����I7@�Y�c��k@�Q���@�wV��T�@���֞�@��oj[z�@�~��)�'@�n���Җ@�v�3Ýn@�����=@��E��̳@�!.j<�@�F6��?h@����P>'@���H)Q_@�6a�b'@��N%�-@���� @��A�@�4�k�u@�ծ����@����}�[@�@�1X�@�����}@�o���/�@�aD�d�@�X@,C��@�U��>�@�XΠх=@�a��:cH@�p��V@�������@������'@������L@��a+e��@�<�%Fq@�@q�Ա�@�u�'��@�Xbޕ��@��om�ڵ@��a�E@�@n�t-@��V�$Q|@Ò�h��z@�?��f_?@��6E=�h@š�Be@�UC��~        ?��n^�uM?�7�=��?�l��%?�V��
�?�KB^1tP@����?@/��e@���M�@����@C�SVӯ@#Z���%@'ue� ^@+��-�W@0f`hg@3���W@5�2�&A@8̜�lɓ@;��C��@?K�e�D�@Af²PW1@C=/Z�u5@E(�%�>�@G)L�>$�@I>Y3�@Kg�<��@M�8���@O��;e-�@Q.<��r�@Rk&j�?|@S�8�D�@U�]�$@V_5�� �@W�A#�@Y5�ؗԪ@Z�p����@\5v!���@]ģ�[�_@_]�'�TW@`��yL`�@aV�c!ʙ@b2>|x�5@c>�t��@c��j���@d���7Z7@e�f=�d@f��1�n@g���A@h�*_&�@i�99{D\@j���0@k��(�5�@l��ey"�@m��";@nҵa���@o�vlR{H@p|���9�@qO���@q�lg��@r#�uIT�@r�����h@sD��_�@s�0H]�@tj��Sƴ        ?��"�q�?�"��*�}?�yZ��H�?�Z�۔a�@�H�VY�@R�u@��� 'K@8��\R@#�9��@)B��lC@/=��{�@@2�(uL3�@6x�1�@:P���M@>n��#��@Ai�G�U@C��1��@F7����@HӨI-�@K���l.[@NwF://�@P����M@RU���@S�i�|��@U��ш�@W�_?�s@Yi�,��@[_�m��@]jKV�V@_�ۖi@`߉��qE@b3'x&�@c6^�6@drB4 ��@e�ɏ�/�@g�����@hj�rX��@i�]i��@kI��)@l����z@nS��{��@o��
�3@p�_@
z@q�5+j@rvgH��@sV�У�Z@t<��B@u'���`@v��@w/�8f�@x����[@yO�
@z�N]@{��ו@|%MC�'@}9ʟ5�@~S�VJ�@r�N���@�K��Q@���d��@�xœ��@�t�^�@�����K�        ?���ܴ�r?�5m@��?�"OVЧ6?����־@�2���@����L@�B�K�@!{��;�@'jsD%�@.A�%j�}@3���@7\v�p�@</��5�@@���t@C���u�@F�|�0\j@JDg�I�A@N�v���@Qi3i@S9�M!ٞ@U���AL@X%�#Wg�@Z�Ǯl  @]�o6 �@@`{"|��@b&�R�I@c�3c��	@e�'eg@g��r�@i�J���@lӑ���@nt��@ps�l���@q�5E�'�@sg-c;@t�d�d@u��o�)@w�Z]49@y Ix	E�@z��P��@|�R#�җ@~_H���@�!����@�;��;z@�"0�m۲@�0�,oaP@�H�]q��@�i��#��@��H�6U6@��ֆk��@�B!�w
@�Iw���	@�����ks@��%V7@�R���@����!s�@��ޖ�@�@�_߅
��@�)��#@��t���@���+彶@����>T{@����1Pn        ?�脶�@0@�Y;y@L�H9!�@`�:�d�R@n�A�L@xъ^g��@�#���M@��J��a@�PS�\��@��X�!��@�v���t�@��U]W��@�5S�ݨ@�E�"�L@����}@�O �Ⱥ@��,Ego�@�˨��[�@�Ժ�9@���
�H�@�.�9�@�}_&��I@��Z0o+@�^�k��9@����l5�@�J����=@ç�?&�@�@_R<y@ƀ���4�@���Aɇ�@Ɂ��.@���۬�@̨;;�*�@�I�����@��c�뇔@���C�V�@ѱ�8Y�@@ғ��@�y\�R��@�b���@�O��9�@�@<�,/b@�3���H�@�*����@�#/[.@���֬E@���
eW@��nM�_@����H�@�#(�� @�)����@�%p��W@��n*���@�$�a���@�
��@�3
���@�!G���@�C�{�2�@����l��@�VU���@��f	@@�k�P��@��oK��r        ?�aj̜??�]�^"�?�ǒB�Z�@H�9��@ir�r0@$�4/9@-rӅ�@4Z�5��@:�8�{�@A5�j�1O@Em� v��@J�b:r@OFP���@RsR�:�@Ux��Ʉ@X�d�1�A@\J��U��@`Y�Pz@b V�c�@d�b1�K@fM)��w@h��:l��@k�]f�^@m���J}�@p8z=I�@qoВ�[p@r���19@tL�eLw�@u� ��@w[��V\@x����:�@z�q��S@|MX<ٛ@~5��.�@��!b@��{o�̍@�ƅ��@���#)�@��DG�Ci@��G��@�������@��{l�S�@��2r�@��^��C@�:�龘�@�h�U�kf@��P�E�@��(��@�J>���@�5U�=�/@�ޝ]�G@��sY��@�;�8��]@�麟�@����,@�a��v$'@� ?H�y@���Ŝ�m@��2w^�F@�p*����@�<�$F]@�D&��@��խ�        ?�?�H+ŷ?��JM|�?�JK�%#@?��'Sտ�?� �6���@��6W�@%ab(�@��ֺ@J����L@!s`�\@%����t@*�C٭�:@0"�.��@39$o~&�@6�0�Q?@:c7����@>{���K@Aw��}��@C��� �O@Fz����@IG��V�6@LH��,�9@O~ky�:-@Qu
΁I,@SE���@U1�Atl@W7�, >�@YX�*@[�oY��z@]�Af�g�@`-6��zg@ar��J�9@b�U[��@d%1���@e�&B�@g�e��@h��`ᕚ@j1���@k�me��z@m�\��"@oV伈-@p����y7@q�qҭ�@r���-{7@s����;@t����@u�&�ɳR@v��a8V@w����,X@y�>3I�@zYE��"!@{��(Ȥ@|�w÷��@~B����@�t󆋬@����niD@�G�E*�@�
�J�Y@�Ӂ���@���7u&@�uǖZ\�@�O��,�@�-�WCz�        ?���{H=�?Έz���?�Ώ�ȡ�?�I�1u�@
�W�@�n���@�Zd��P@$��D�b�@+}Kl���@1n�~�@5�e����@:���x@?�W���@BI<�r͓@EA7�ڭ�@Hxt�:�@K��I�v@O��5?�n@Q��D�ѫ@S�(`��@VGK�B�|@X�S�ě
@[W2{It�@^ 6���@`�nRt�9@b�ų+@c˒�~Q`@e�v���@gt��\��@isA�4f�@k�H��n@m��?�*�@p��ho@qL��&@r�T�EY@s�vKv@u_�[jk@v�l|�B{@xg	G�#@zsK�\�@{��RU��@}hGG-/6@2��^�@��.IQ��@�z��k��@�wh����@�{�&&3g@��@D�3@���1Y��@��_Ҍd@��D�z^�@�}���@�A J�)@�Cr��@����@�w��"@�m�C�Y@�gz�+DV@��0ҟ@��Q�(hr@�������@�Wǜٶ@���̶~        @f�EhS@LG�9�@hp"���@{�jxc�@�T��MZ@�!T�2@�M�V�H�@��믚�@�Q�Kk�@��E�RO@����t��@��y&3��@������@�_��\@�lt�@�\�\s@�)/�Gu�@�v4���\@�x� ���@�M;Dv@�7�3x�{@�7� ��{@�M��pz@�v�>�4@ܴ����@�X����@���cf@��XZ��@�8�"D5�@��j	�M@����=@�D�Ǣ|�@��8րb@�&[�N�$@�lw�g@�-(�,�T@��8�A�@�-�F�v@��ոM,\@�׵��@���t/@󗖢K@��M6�@�n-��lH@�bc�9��@�\��aL@�],Y�d@�c����@�p����@���!4�*@����%�@������@��-�CA �`��SA ��SE�kA;n���A�K"��A|8M �A!>���A�j!6biAt�}1:A#i�<�A�^��:        ?���ؼ�Q?��ʲx_?�a���?�G��"Qv@Tb�Ej�@乊 ܦ@:'�v�@"$uln�@'Ӡ����@.^��{@2�\+yH@6�9@;d	�*�@@".���,@B����*@E��+^�]@H�q�v	.@K��^�+H@Oqt�e��@Q��u8�@S��A�b@U�� ��@WWy�Z@Z
��04@\mF#�@^��:@`�:���@b���{�@c�{u_6@d�����@f��6���@h.���@i��1��@k_P&��@m�!��3@n�;��X@p^�w�Ԝ@qR?ٿZ?@rM@"���@sO��׼F@tYm0��@uj�Tp�@v�#�H��@w�&��,@xʀ��U@y�n1�h/@{/�HT�@|n-e^��@}�'x��f@�:,��@�+ӛRaU@�ک�U7�@���[8x@�D���'T@���El�@���6�>@���i��@�J���@��@DS@���/bH@����M�]@�������@�y��v�        ?m����?�7���?�y��K��?�R{�?�$���?�ݬ1�g7?��5��U@�s� @r�ӫ@�s	0)@yn���@$�y)�@!�C��@%g��Z��@)s�}�G2@-�i|�<�@1vu�b6�@43���s@72-ݎ @:v�C���@>���`�@@�fSPn@B����g�@E5���u@G��[AV`@J�oqIE@L��S��]@O����5@QU^�CY�@R�ϰI@T�"���Q@V[P_��@X38`��q@Z!�(��@\$�<�Zk@^>��ͮ7@`7�t`��@a[��?��@b� =��T@c�yKD�@e��H@fa�_r/@g���@i.�oRzF@j���@l0�4�I�@m���#v�@oipL=ؗ@p�˄���@qn^>li�@rV�����@sF�y���@t>�Un��@u>��(�@vGd��0@wXN�_�@xq�}��@y�0��@z�N=^T�@{�]=o�@}1��s�@~x�Y*@ȀPy�        ?���?�k<}�?�G`�PBD?��$�=�?��,��Q@��2
��@m�w`�m@����!�@lr�/��@"�g[@&y(7
@+P>I�8C@0OT���@31�� ��@6N��]Vc@9���$@@=7�o�N@@�f�A�j@B�r��@D�S�Nwv@F�2K�{@IF2�m�=@K�x���x@N]$�T�@P�,Bʽ@Q�}��@Sr\����@T�탛�@V��t��@X?d�no@Y���'�@[���d�@]��&^�o@_t���@`�o��xo@a�ʚF��@b���Ҳ�@c�?��[@d��]�W@f�2�?@g)j�qz�@hY���@i����S�@j�=���@@lە�@mk~,�i@nŰ^/�@p]�0��@p�V^�
?@q�ƃp@rC�F{[$@s!T) �@s�!�u:S@t�ǫ�kw@um-J�.�@vCo%��@w�mEk@w� 4��@x�Z�*�@y�_L��@z���p,@{�>�/j@|�e"��        @��^�ڐ@2����T�@P����@cV��S�=@q���8p�@|j$�O@��`���@�|Y�G�i@��e���h@���Dd`�@�f(J���@��6�
\@�;J��I@��.���@��g���@��\~�Җ@��ӱ"�`@�l���M@�X���_@�Ӷ�d}�@���F7��@�l��W@���zj@þD46i�@ńQ1�do@�]�F̣@�J98՜(@�I�ٴwX@�\A�)5�@ρ�J35�@�����@�S��>0@�1:+F��@�i�.���@ի��.�O@���l�2�@�L�nf!@٪�@�t@�,q���@܅ I�I@� �V#, @߅�G�Ő@��;�ˉL@�Vf�<i�@�'mu�V@��_� ��@��N���E@�Kl��@�db	{�@懨w�Q0@�w(��t�@�k��xn@�f;&^�@�f�)�@�kq�ib�@�v��,�I@퇋n��@�i�9�@�Ro�*�@�o6y3{�@������@��	&�@�7��/        ?��H?�GC1�"�?�\1�@29?�>�])�?�J���*@v��ko@	���@R���l�@����@=P#��@"-a��]�@&fUl�%@*u�+�m@/.�2~��@2&�� 	@4�d
�|@7�l���@;�I��,@>e��x�Q@@�Z�/*�@B�A�@D�s�a �@F��	��@I+�G�}�@Kx�����@M����4�@P0N�<�@Q}q�O�@R��+�@T<�i��^@U��ϯ V@W+�:�@X�bc<�@ZI���@[�,�Z��@]��;��@_M����@`�s�^�@ao��[�@b];{=f�@cP�`�@dI�R2r@eI`G�2�@fOO��@g[\mp@hmC����@i�ژ�0@j�Ѵ�e@k�2)J��@l��g�R@n(Hy�.@oa�!
@pP,^�L�@p��	�@q�e�7�~@rC� �@r��l��@s�wK4��@tTB�_�@ua]���@u��Ez0]@v�J���@wC���t�        ?c�*4�-?�@&׵|�?����b_?�+��k�?�
�F�S^?��J:�C�?�ԯ$�j�?�`�8�?�jM��)@Mm��@�I�S�@e�z��7@@@B�.@��O���@���VH@۴����@ �7i���@#z���K�@&h�@7/F@)��16�@-'-��j�@02���0@2���LJE@4���{j;@7@��XA@9٢>	�@<��z���@?�:����@A[�hj�@C��$�n@D�W��j3@F��`�p@H��X>@J�T�H��@Lð(�2@O)�K@P����;@Q�:s��@S1��(�@T�D�_��@U�_F�e@Wa\�ta�@X䝦	�@Zwyu�K@\9��ք@]����@_�X�+�#@`�ڀ@a�=z5@b�˸�M@c���%�@d���@e��ճ��@f�,|V+@h����M@i/.oM5@jd�c2��@k��Mc@l�n�&�@n9��¶�@o�|RC�?@pz0Ӓ'�@q/�H�|�        ?j��m_0?�c�mG�?�	c��e�?�=�g�?ܔ���JZ?�O\8?�IOW�?�|����@ ���N@٠U@1V��81@�Զ�&}@�J���}@+Z³�@I�?o�C@"��[L��@%�ǹ��@)0z5;� @-٢�:�@0���t.�@2��ۉqh@5�����b@8R ���@;YVUxi{@>�YTFM@AO%�q@C �յ�Z@EP"���@GA��d(@I���.t@L�4j�@N�9����@P�7;�ߵ@RR��k�@S�S�՞@U���1��@W`�-��@Y>����@[6@���@]G,�@_r3�B��@`�����@b�]�$�@cKv�X�@d���ʊe@e�����@g_�O��@h�0,J��@jdJ���@k�J���e@m�e{/ǔ@ob͏�9�@p��+�Q @q����@rz�h� @sy�5���@t�k/�@u��*���@v���?W@w�l�/�@x��J��W@z-`�9z@{k0�=ȝ        ?�?�̫�l@M\�s�@<s�=_s@P���h�@^�P���@h��L0��@rP��)�@xԏ-�M$@�QΗ�Q#@��hW��@��f)!#�@���v�}@��(�U��@����a��@�;�Ni@��Qj�{�@�}�)���@������@��0��Q@�I�j;ʷ@����_�@�{��	�@�F�=%}@�/�r�K@������@�5��',@����4@y@���\%g�@�U���9@�)���H�@�Z�(\�@����9�@�~�=��.@��� ��@�˸�n@èִ��@��%����@��f<�K@�?v�,@�D��6�m@�}��vC@ʽŃ��O@�<m�ʕ@�T ��a�@ΪT�	
@���}(@жy�}@�k�|���@�%���?@���3f�|@ӣ躓�@�h���~�@�1E�
�@��b@v(�@�͊��i@ס��n<;@�y�p�uq@�U�z�0@�5ٱEj�@���;\@���ٖN@��I�r�@������        ?c-w��?�@�A�?��x:��?��`��V?��a�3��?�(=�'��?�����?�Yt;n�?�AB2���@/��,]@	]��h'@/�>�L@���e@k�x�_j@[��d@�k��&@!�O��s�@$1Ou�9!@&��EG�@)�ifP�@,�q�]�@0)����@1�l�^@3�!-@$@5چ?�p�@7��t��@:=��V*@<�$|,F�@? �ߝ�@@�}VC�@BCP)K��@C����>@E9�U|��@F�MXF,�@Htp[���@J,3�P+�@K��7��@M�-���@O���xDP@P�Y#���@Q�4$��1@S���U�@T%�(��v@URE���2@V�Ի#�,@W̾M�m�@Y"d\a�@ZuOv�&@[�ϳL@]LI�h�V@^ɦ�eb0@`)�?
 �@`�f���@aŚ�U�<@b�Rr�Ƒ@c{�w�7I@da]}\�@eM��2@fA5Pf^@g<U��c�@h?	Q��T@iIp��j@j[����M        ?DD|7��/?��ev8�?���E]�?�2�_{`?�4W���?���šoW?�$����?�:WM?Ng+?�Dߥ6(?��L���8@��)Ⱦ�@9�GX@b�3@�ͬ�6@>	�}T@;a���S@�� �j�@ �.	�]@#���`b`@&�i�U+�@*^
K�@.2jס��@12��m~@3}���}@5�B����@8�2<�E@;�U6�@>�7��_@A�>{�F@B��?��@D��0�-@F��}d��@I/��Ь@K�O�m@Nf�N*]@PY�P3�@Q�ը(U&@S<��+~@T��@��@Vq|�_�@X,��/�A@Y��$�P�@[�&ЫP�@]�KR�B�@`x����@aܫ��
@bA"���@ct��Ƣ�@d��8�da@feB��i@gaY� �@h����@jG�[@k�czhs-@mi;�+�o@o�L��h@peUP�I@qI�=o�@r6��'�@s,Z���@t*f�(�_@u1'�^<�        ?H�4�[�(?~;��}>?�E�Tā?���r��7?ř�9pD�?�5=�1��?��<��;�?��/��?�f�4�0?�dt��??��}����@$�L��@8��=�@!H
�~w@x��v�@@]�A��b@�X� �@�w�!�@"�7�)@%�w�%�@)Ą0l@-u��!�@0��Aɼ�@2��&@5^�w��@8�U@�@:� 0N��@> ���@@�&[��@B�f<�72@D*KNn�@F���� �@H�����@K+��lF^@M�p}�^I@P/�>-��@Q��4;ap@S�S��?@T����x�@Va�?wh@X&�b+�@Zj�d��@[���$�$@^�W�@`Ui�O6@a8D�t�@bf|�,��@c�9a 
@d����@fC6YAw�@g����S�@i6Ro�C@j�?�D�@l2V0�+�@mӼ)��p@o���a�0@p���=�@q�<G��@r{{�|��@st�l��@tt�<o�?@u}��K3G@v�٠�p        ?�~�K�]�?�9�V).@.G��@1j�Fn@@��P��@K��$8��@T�T�ӆ@]e����l@c�oYɊ�@i�ׄ��0@pf���@s�5�3�@w���M�@|d���@�����A�@�i����@�^�j�f@��]��ׁ@�Т~V�@�[��!c@�W��B�@�v��o�@���9!�@�"��v�@��l��@�fk�T�@�� y'��@�%n�Ol(@���_�g�@�k <�S@�-�%���@��4�C�@��ȭ@��"�o[E@���*�x@��SI��@�Û�d�:@��<m�@�-e� �,@�t�̪@�@���r��U@�*@bM@��)̀-@��! �^@��R_.��@�8�d.?@��E^)I0@����;@��C1��@�G���@Ã/�}�2@�y�O}P@�w�.a9@�}(�v�@ǊbNr@Ȟ����@ɻ�:��%@���v�@��6�@�EW�@΄��Z�@���T%�'@Ў��%e*        ?��+r��?��E�>�_?׶��{V�?�	*@#��?��uZ'=@Er~@��Ք,@y����@Ww"�}�@"�hJ@&n���K�@+BQ`�}@0F�⼄�@3'����@6D�n7��@9����V@=/#��"�@@}�Ϲ�@B�=4q�@D�B�Iܸ@F��ho��@I(x�ۼ[@K�y�=��@NeSO3@PZՎ޸A@Q��Hz[@Sb�&@T�Xg�қ@V��S~I@W�ZU���@Y"j!��@Z��Xr`�@\j���{@^ ^E��&@_�m�v�c@`������@a����h@b����[@c�1��Y@d�b�(�P@e�S��@f�(i�@g�cL��@h�c���@i��C >�@k��z�@l4/l`c�@m]ďC��@n��4/[@o��Z��@p|���T@q0�H%@q��'*0@rb[�؃�@s	_����@s���-�7@t_)�<F@u�=�M<@u��bu7�@vq�Tz�3@w'�Kr�@w߅�D��@x��ؑS7        ?qIީ��?�n�[4-?�px�3��?�s֤��?�ȹ��Y�?���ۓN@ �W��[�@��?3D@Z�0��@4�?�lG@^L�O�/@/p�Z	x@"�Y��@&q�9�?�@*jq��@.�,]��@1ĸ&ɓ@4\��c��@7-xе�p@:9�ۀi#@=�_��hq@@��'��@Bn2s@��@Dv����T@F�9}�-@H��/@KcL�G�m@M�a�2�@P[<�U S@Q���Ͻ@SO߾	i@T��0A�@V��*�p�@XP�ð@Z"u���@\	,hd/�@^m=��@`
?��E/@a�=�Xc@b:'��a�@cbX���@d�����@e����x@g���@hs����'@i��~���@kB��n@l���B��@nC1"<PG@o��R�Z�@p��.@q�qp�R�@rq����@sW��&�@tD����`@u91!��u@v5[��l@w9>���@xD���-I@yX����@ztM^N1@{�'$�z@|�Ig��        ?h3:�;�H?��g���?����0rt?˪�}�?��;���?�W��6?�:�W�?�|8v�Tv@��!��@��/�?@�vɳ@lƍQ�@��&LT@ �A�~@#��t�j@'�!����@,�`��@0��N7�@3�B's�@7J��E�@:��u@?���&�@A�����g@D!s�-G@F��#�	@I���[`@L���$�Z@O�V��@Q�5\3$@S��[;ޮ@U��}�@W�c>�k�@Y��ވo@\P@�#�@^Ԑ���@`�V셭@b$��%j@c��(��9@e*'�%�(@f�̃�s�@h}B���@jDC��
�@l�u���@n�t��@p	���D	@q���$@r,Lgn��@sM(6n�c@txJuպO@u���14@v�j���@x6���@y��8މ@z�+�H[�@|N'rN��@}��"?'�@9	ۯ�5@�^X�
3 @�$�J��G@������@��A\I�y@���7J@�k�7�        ?�
�,�=�@"���9j@A#�l�f�@TMU���@b��\g@nnB���v@vSU�s�@~�H��i�@�5�_f1@����Dk@���~�Ã@�>s��}@��Y��@��tq�As@�,b�{�q@��7Xzh@�S�ñ�@��u��'�@��Gz�^@��`H���@�������@�Zr�%_@���+�~@��^��R@�w����@�LH)3{@�0���@�#��͡@�%T6��V@�n#k@�+۔�R�@�D �[��@�c� &ƥ@ċ�C�z�@Żp?7��@������@�2�iS1@�z�<��v@�ʒ5�@�"�Ò3@̓����N@�쨳C�9@�/�W@�� S)�@ѭ��p@�rY�@�;���@����@������@խ�n��@ֆ#K�#�@�b_�r�v@�BUH w@�%�]]��@�['Ь.@��e	j,F@������@��`c��d@��3��*�@��w��[�@���]�@�bnQ�I�@����t�        ?yC���?��p���?�s|��]?۬��z??���p�w�?��ѐ��?�������@�,Z���@~�G�4�@:R�\�@��F��r@����>@ ��ݻ�?@#~�n@&���GW�@*'�OE� @-�_�r��@0���ti@3���5@5O3�ĲW@7�����@:F�X}�@<��֓C@?�T��.�@Ap^���@C8-���@D����@FrT��@HF�_~W@J/��$sX@L-f�r��@N?�R-�@P3�Ғ�@QQ�Yqh�@Ry�-]1@S�G6%�@T���J�@V/�=1G@W�8����@X���)�@Z?4.�y@[���@]$��q�@^�~�ʹ@`�c�]�@`�ľ�.@a�J����@b���a��@c[v<��@d8=��B@e��[v@f ����@f켟��f@g�d���@h������@i��Yy@j�W͊T�@k�e7�q@l��Ɩ
@m�!��C@o[�O@p�o�@p�;        ?@A�W)�?y�t$�%?�j`7(�g?���S�?�9��?Ծ�Ƈ�?�(H7���?�E�Y���?���<�<?�a����4@��>�w@-6�箍@���ς@��
�T@q���@>Ľ��(@!s!�g@$]ξ�@($�~H@,Dz���z@0tn�1a @3L��@5ڣ�ffY@8����@<\�1dd@@	>��t<@B_��?@D@V�F@F��a��]@I2����o@K�D����@N�)1�M@Q+��q@R�GN���@T��x�@�@V���+8@X��L�8	@Z���7��@]_�2P#�@_鞸� @aMf��S�@b�'���@d;[Ǥ2�@eѦ���K@g}m=�K@i?%���!@kG�s��@mL2��@o�g0�@p�m���@q��w]�@r�5��B@tJ7��@uM��Ʌ@v������@w�Nv�@y] �7�@z����@|T�r��@}�w6�i@���n߉@���]�=�@�q���~        ?i�K�6�?�8h�pqE?��L6yv?��3q�?�4�A0V?�9D�܊�?�g_�X6?�`��Iy?��xa@� �T4@
,��E�@V*�1o@of�[Z@J�nڙ@�7��!@!0�6�(1@$$�s�|�@'e�gS'@*�����O@.�r���@1���F�@3ձ)'@6P^��l@8��a>KH@;܌��@>�CO�@A��?@B��3��@D��%z\�@F��N���@H�D�s��@J��eUh@MMZ	�@O�gv�]@Q#�����@Rya��=�@S��+�@UTp�k�@Vڹ��Y�@Xr!�n*@Z
�@[ջ�u@]�_��W|@_�3�
@`����5!@a�7}�-"@bąR���@c���Z�@d��bW�@f��/�@gGP	OA+@h~�ĵ9�@i�i�e�@k	����@l]�b��@m�K��0@o%K9�WO@pL�|ֵj@qvfW�r@q�=p�P�@r�5^u@0@sp�0!�;@tIY��\        ?�EZ�	��@?q�%@0�j�1@C��J��@RP-!�YA@]�E�,(�@e��I�N�@n*p!<�T@s�����@yY[���@j�i�@��T3Р@����F�@����>@��7
Y��@���z=@�3C�	��@�М���@��SPJ�[@���	v,�@����@e@��k��@�E�.�:�@�!?(@��@��Ե��@�"��L @�H��M8A@���h@�ݽ�O�@�&cEj@�i�^]
A@��N�|˫@�kI�@�{��O�@��&覹@�jwLy@��ݕ�#U@��0�?}	@�$F)�H�@����1��@��K��I@���%�v!@ť���@�k���~c@�Y�o��@�M0��0�@�E�Z_^c@�C���@�E�lf�@�NH��A@�\9b^�@�pn�dq@̉�{Ī�@ͩ�k�H~@��s��Q@��]�_�-@ИU�	��@�5&S�@���s��@�w�3#��@��`��C@���2G��@�r�wqϱ        ?l�= �?���緩?����G�?��.U�W?�A;�Z:X?���u��?���X�M�?�H0,�Nr@8�3��@
$-�#�@=�sN�@���kÃ@�R���U@� ��<@ S�i`�@"�s�u�@%um�@(G7�V}Y@+D�,�L@.n/�O!�@0ឯ���@2�$�w�@4x�wV��@6esm�B�@8h7S:n8@:�$�I@<�D�G7@>��Ģ{�@@���Y�/@A�_&��D@C'�)��@Dvҁ��@EѬ�5�~@G7r��$@H�=eu%@J#����@K�1a7��@M< �<,1@N�Vo5�j@PAFg���@Q��$�@Q�#J"<@R��|p�@S�*c*�@T�T?���@U�[��n4@V�J����@W�&@ �0@X���Y@Y��1c�@[k��y@\>*�0�@]j���!@^���\��@_��y&�@`��C�@a2�]Г@a���@b���Z�7@c6��.�@c���V�@d�����'@e[�'�~        ?M9��ޓ?�d F��?�1���%|?�*�VT?��o�G�*?ԐF��s/?�2��T?����W?�"�1��?��#Ԋj�?�z*����@�~�"�@
$�Ċ.�@Y�"1��@!���x@]�Ay��@"�k@͡@!6pV��@$����a@'N;#@*�JL��K@.�
X���@1BڇF�@3j�.���@5��h/Ģ@8,�/�\g@:�ɖR�w@=��ٟTa@@<�Ĵ��@A��L7+y@CgQ*�Ҙ@EC�y2@F�IV�@H�Ꚛ��@J�MS?{�@L���Gc�@N�H �e@Ps�N��D@Q���p��@R�۾_KI@S����@UT
]�U@VZ�C��%@W�ݱڳ�@X�d�\�@ZU�zX�@[�Ȇ i@].��cP@^��]f��@`�d�@`���ٵ�@a��ݹ
@b�g��@c]t���@d>����@e%:?���@f���@g�:i�}@hXZ�HH@i-�Ϟ5@jP�̟�@k!�zzv@l:�	�b�        ?Xoh�=r?���to�?���T�y?�jbB�3?�m?kѳ�?��g�.�?���G��?���	��?�"��9�[?� �"�?��>v�@ �=��}S@�M�@��@�9o.�@�(�J� @gFC�Z@S
�6�@��P�@��v�F@���J@!��郙@#��C�
@&O	YȔ�@(�܇�E@+Ԅ�c9@.�@��pR@14�׷@2�3�� �@4��6��@6�<��mp@8�۞o�@;&)�w��@=��X�~@@S�:��@Af�{/K@B����@DS,l`�;@E�Ic�$@G��$���@IL��O�@K���@M��$+@O��'@P�8!���@Q�t-Q{@R����o�@S�Ū@U(�����@VoJ� @W�rkCsP@Y%u�lM@Z��#p�@\ۂ�@]��˗N@@_B1�@`x�����@aX�>�]a@bA�"&{�@c3�=t?@d/Z��@e4�d�@fD9B�@g]��~�        ?ԯ�4l+#@������@&E�L�Q@;?�@ūH@J92�b^�@U�'���@`T�����@f� ��@nKq��>'@sX'
�n�@w�@�j�z@} �S�A@�N� �[*@�I�+�$1@�z�w)�@��b��Y�@�|oI���@�%�����@�&Лt*@�A��.Ml@�uᔶM�@����7��@�+�=:�p@��X�m �@��U}�p@���
25`@�fm{�@���i@�\��IG�@��ox�a@��,k!�F@�/�D�m@���Ӓrc@��:���u@�9�(^�@�&��4)�@����^@�-��0@��
 h@�m���@�&�V��@�;�f�l�@�XuM��@�|�A�3�@���=tA.@�ފ��o=@��9J�@�aeT&�@����s@��� ��@�2�bF� @�����@8�5�q@�\&D�`�@��+��@���ALh@ŭ�G�j�@�}�կ@�P�zZ��@�(պ)�8@��,7��@��d�Q�@����A�        ?�ᩎۮ?²���?��r~R?�$b�8�c?��<�2@:Bi1�@�"�˖8@��~E�@: �'�-@#��`-@(W�Os=@-f�}��&@1uy����@4r�w��@7��b��s@;�� �-@>��=V�@AT�X� @Ce8w�?�@E��&�G�@G�ߙ^@JZFV��@L����#�@O�q�3q�@QP [�L�@R�mz)s@Two�f6|@V*p���@W�o��@Y�=�� �@[�)��2@]�qbr)@_�����@a���{8@b/��W
}@c\�����@d��ǀ�@eկڡ��@g!|R��@hwu�F�@i׍�X�#@kA���<}@l����˧@n3�+�q@o��˰�{@p��?�d@qrV��b�@rCtⳕ�@s��W[�@s�i�!� @t�U@u��V�2k@v�����@w��9� @xl�Q�v@y]I����@zQK�63�@{H�ĒE@|D���I@}B��GW@~E5,��@K9�K!�@�*n)��A        ?z4��41p?����9�$?ȸR_��?���J�R?�(�z��?��bO���?����gW�@�p�z�@	�y{%�@�B�y�@����W[@]�4�~x@�2w��@"FI-��>@%����F@)2�z|�@-0b��@@0�B��`@3$NzN��@5�0F�{�@8~L�U@;�Ǉ{C�@>�րEO�@A1���=y@C����@E2��I�@Gl|��5'@I̛�J�L@LT�`�&@O����@P��:˱@Ro�i��\@T��ל�@U�ĝF��@Ww���@YR��m@[C��֡�@]L���'�@_m"_�j@`�p����@a�
��(@c-[��N�@dlT�^��@e��f*�:@g���`@hm�'���@i���M�0@kQ'"�,�@l�f���@n`�h<)@o��4g��@pς��|�@q�G�1��@r��=f�@sm���q�@tZ����X@uO}S>@vKp��@wN���r@xY��A�]@yk㼆��@z�_Y���@{����        ?�-D���?��_��8?�b���a�?�u�Y�l|?��Ahs?��%��B�@ �S�kEl@�L�9�@`�Mt}@maT��@8/�9�@�,���@!Α
�@%&+�EJ�@(��R�&m@,�A��/�@0�f����@3,u���@5�LU�Ak@8̨���R@;���H�@?wM�]S@A��}Z��@C�j��!�@E� ��Х@H:|�ˠ�@J�����@M��Ј��@P6-y� �@Q��Xt��@Sj�j71�@U*�-�@WMY�@e@X�x4��@[���+@]1�=!�g@_xG�&�@`�bvt�@b,�[�.@cz��J@d�w2b��@fB�͸�@g�k��T@iG0S{o@j�g�͜@l�7�.G8@nA�M-	t@p
ȑv�@p�.�=o�@q�\�^k@r᩵UI@s�(��q~@t��u5�q@v���P@w%Z.4�@xK2�^8@yy3���@z����sS@{��ne�?@}6��X҂@~��<[�@�j�V%�@��|�Y        @�L��V�@3��ѽ(!@P�����@c
Ї�B@p�pˠ�C@zz��'@���=�<�@�x��#3@�o��Q��@����?��@���3��@�����@���՚n`@�r�Di@�w�i},r@���1��A@��惻�@��{���Z@���.��@��ɣa�a@��D�/j@����ߕ@����V@�jn�@�c=,�$@���"���@�T����@��XZ��@ƖlhK�@�U���@�)�"^��@�:�KT�@���H�2@����Y�@�!�}瓛@�>L1��V@�d���@ԕ跇� @��dP��@�~\ �@�hI�1:�@���F]�@�)��J��@ܚs�(�@��1`_@ߙ,&E�f@��#)i�@�]��ǒ�@�,K�o�@��q]ki@��
+C^�@��1$�@�9,`�@�hCR,q\@�JvR�`@�/��0	@���x��@�Du''@���k-"�@��d	�@��&*(�R@���W/_|@��\�}�#        ?s<��<�?�V��8z?Ņ����?�~���Q�?���Ӻ��?�Y?�û�?��0Jq�`@�S!�}@
��>�,@
�d���@RY�/y@�F�@p�WP�@"��A�ۼ@%�+�v�@)j*���@-@��X�2@0��c�@2�#���@5Zl��#@7�2��Q@:��* �@=�٢ڎ�@@M�$�6�@A�C.��@C��}�}�@E^�_2p�@G8�FD@I(i��U�@K-�5�`�@MH�Tt�@Oy�HB�@P�����!@R�	G@SHe��\�@T������@U�o�J�@W5"tg�A@X�z(5��@Z�����@[�h�r�N@]%"s�0@^��!u��@`ތ��@`��UR�@@aĶ�S�@b�?[��X@c����t@dq���"@ea�!C{�@fW�k9@gS)s*c@hT���@i[�$�-@jh���}f@k{�4���@l���ܱ@m�1��@n�u0��@p�[%
-@p����>@q8�bX�@qؼ�[��        ?zI���?��p4?�Z5Y"�?ᖔ�
,?�^���Y�?��$W�H�@�'��f�@���δ@�O�ӷ@��x�L@ZK�$%�@"¼�c��@&�UQ��@+O��O@0)T�`��@2�d�Ź@5���xQ�@9Ee�C@<�(�v��@@a�g�@B{���|@D��n0@G*�$(h�@I���B�@L���u�@Ow6����@QKag�q@@R�;6=@T�̛Q#@V� �ؼ@Xx{��@Z�l���@\���J��@^�Ll*�@`�A�.� @a�ؚ�a@c��&��@d\f���B@e�6Ϙ?W@g@�ǘ@h�pWq$�@j���Ge@k�5[m��@m3�E��@n�ݽ��@pDZ�	�t@q#Yd�@r>JA`@r��Y��?@s�n�!zj@t߱��hW@u��۬c�@v�?R�_@w��i%�@y�%��6@z)Z
@^@{Mﭚr�@|zb9K��@}�ྒྷ@~�`	!�2@���R.@���[S�@�f�	#�        ?_�=cL�?�ቑ���?��u�?Ȣ�2�V?����?�\F�L�?�Y~V��?�$"��@ �hgӌ�@�>�z@
 �(]@���Tn@�:�3��@'k�/��@;�y��@"p�޴��@%���m�@)���y@,����@0t|��y@2����i@5!F��F@7�K����@:���ϛ@=�\��%@@n��'9Z@B+y�B@D�P;�L@F���+	@H7@�ϙ@J]���T@L�stH�@OJ8#�)@P�.B��{@Rix}P@S�-p�O@U�����m@W.����@X�� (w�@Z�C�	�>@\�/��\@^�����v@`wo��0@a��u�4n@b���}@c�����@e7�	!@f���+r�@g�Ǥ5]u@iHÃ��@j����,@l>b���@m����i�@oh�T�:c@p��4d@qdY\3�@rF�E~��@s/؝�p@t 3� �@uyP+�/@v�c@w�;��e@x)6�$        ?���pE�@�F�C�@2}����@F(�I��@T�K|"�@a�j��Y@i��:��Y@qԏ��0�@w�Ƶ�o@~�^� �@�4d�@���R�f�@�d�d@�ݝUom�@��_ѐ�`@��6Ռ$M@�xUq��@�;f"f@�$*�Wt@�O��op@��#���_@�7�Ɓ@�������@�k���@\@�&;��+�@��dS]�J@�<oJMˍ@�␉���@���8��@�f���@�C�Ei{@�4R,I��@�7��a]�@�&��S�%@�;��ӵ@�X�	��r@����@Į}ۉ�V@�����w@�(	��#@�r{w\@�ľpt�;@� B����@̄�P� �@��_4@�g�A� @�s'/*D�@�6�4�!@���@1�@��vg<�@Ӝ;V�q�@�qF�qL@�J��G�@�(Aܧ�@�	�$�f�@��	�@���3��@�Ȱ|��%@ڼ��f@۴X\�5c@ܱ�Y��@ݳ�X�l@޺�,|        ?[]&���t?��r�;*'?�ʪ�e�?��VC�z?�Z�0�0?�&2HY�?�x^NA�<?�����VS?�qf[ư?�<���)G?��fl9@�=0Q��@�a���@n����@�h-� �@s��cK@^Z���A@z~hF@Ǧ'��@ $-���@!�v��K@#�H��C @&�B!@(-[a�x�@*r�u�E@,ӗҙ�@/O��@0�c/t�@2M��3�"@3���@5,�2;�@@6�� �@8Ff��6�@9���@;�D�EI@=^QE3�@?0,�Jc�@@�kp�a@A�_�rS*@B��XE@C�����@D��Zq@E�:�@F��bnD�@H;��J�@ILP/圛@J�gZl��@Kܵ��@M4k���@N���:`�@P�wԛg@P��x �@Q��@RF����@S+��@S�[jӻ@T����j@U�X�Ԅ@V�l�>��@Ws	P�"�@XfG��@Y`>[��k@Za��XS        ?&�z�Q�?a�[Kd]�?��w�]k�?�7��o�?��{�yC?�E�BLpy?Ŝ��� ?Иi�bY?�<;_�|�?��_�b�?�1*SCҠ?�ʶ���?���/��?�~qE2�?��r��V�@�/{���@
�Y�V@��"6�@<"]�@R�HB��@�@���@�K�G�*@�a(p�@"NN��@$��P��@'8���2\@*o����@--���X�@0>�H|��@2�=Դ�@3����t@5�ހ��@8�Oˮ@:]��_#�@<�}�C�e@?Yŝ���@A���@Bu�v��@C�Vu�#@E�Ϫ�q�@G:�^Z`�@H�/��@J�M6��@L����_�@N�|ިr�@Py���_d@Q�cOf@R�~7��@S�U�~�@UFtn�@V�?�@X $}�@Yr�]U29@Z��d@�@\�Ywٱ@^!����@_�Im_�S@`��sc�@a�ޱ�ET@b��ɥ�@c���ƿ�@d�La]�u@e���ʀ        ?=�&;��K?p����D?�N�&�OV?����~��?�/�$�?�kF�H�3?�
��>?�z�Ѱ��?�Em�Hn ?�V��?�F[�8b&?�T'ţ4?�~���?�3Xѥ�P@q�om��@WDo��@	�b�q�@��,Ñ@��Z��@��B��@�!��T�@=lw@!k��o�@$^U�&@&��A��@*#�b�u�@-��~�i1@0��#Sk�@2�����@4�^��K�@7P���@9�A�Mn�@<����;@?~�X��8@AK%,��@B�O7��`@D�M�We�@F��-�X@Hx\��JU@J�����@L��LTCp@N�dO[�u@P�s�u�@Q�rs9��@S:j�BE�@T��+P��@VD=�~�@W��/y�;@Y4�9��@Z�$��^@\]��I��@^�w=�@_��]�@`�㥆�6@a�bz�@b����@c��jE@e�15�m@f8A�ﰃ@ggƇ���@h��J���@i��u�@k;@���        ?�su���?𖭘�mB@��{{0�@#��cH#@2հ-�@?8P��9@Gu�x4�@P{��Q��@VW���@\�u�<@a�	���5@f	=�%y�@j�/s��@o�ֺ߽�@r������@u��#&��@x��2l@|�-��@��4��@��cAv�@��	_���@��i�C@��n���@�2�3@��π��l@��Z'0o@��9���5@�8� �՗@����`�@�����v@���	�z@�?�̉�@�稁�6�@���j�f@�j���)@�F4�@���'��@��	�\_@���HN�u@���.u4�@�Ձ�:�a@�����@�0��- @�n�z��@��)F}%@���m>-@�l��k4@�؝�k!�@�PF��Y}@�i�v@�1��Sx@����6�@��3����@����O@��O��.�@�xx�r)�@�g��9��@�^�e�U@�[��\M@�`型S�@�m��]�y@���\,�@��@*s�        ?��E� ��?��8O�>9?�s���@�P�+�@����I�@!K����@(ދoT[@1	�;Z�@6^�g_?@<l "��e@A�G���@E\�7�}@I{۹m��@M���1G@Qj܍��Z@T�1�@VӌR���@Y��� ��@\�&��$�@`&��T1@a��ic�@c�Bo�@e���8�Q@g��P���@i�y��@l�����@nI���@pTV=��@q�β` *@r�T�lT@t$����@u�>% ��@v�T�z@xW�'MJ@yӇ��jb@{Ze�@�?@|�A#K�@~�/�/_n@��M.V�@��Q)�q�@�ѩ8F�*@���̬]0@��~�Qo3@��	�ed@��\���;@��y0o�@��`���@���0�t@�����@����,LA@�ǎۗ,@��
���@�
�i��@�3�Z\7@�1.�?��@��9�`#�@�gݔŨ�@��%�@���(�M@�M+����@�����9@��n���@�I^����        ?��&��G?ʢBa� ?����2?����I.�@��-@_����@@d��'@!e~O���@'�5Jo�@-�s�m��@2�}�QB@6�%��{@;�u�L�[@@~1�_��@C^��v�@Fy:��q�@I�ü�n�@MS���H@P���qf8@R}j�He	@T�	�Cn@V�o>{�r@X㰜�Q@[/P
��A@]�i��@`x�+H@aE���	f@b���
X@c쁍,��@eOѦXj@f�����@h7�^�@i�|��¥@kO�v�7@l�S�Y��@n���c��@p,]�74�@q�̐��@q��t�@:@r��-�X�@s�GZ�@t�>w��@v���J$@w)8ǒ�@xN@	Ur@y}nY�a�@z����@{�QY��@}E�^��@~�T�WW�@��n��@���^�|a@�iK3�f@�& ����@��|��s@��kˏ0v@�w�^x�@�G�IA�@�΂:�@������@���P�f�@����%:@��^;���        ?�P�%�b?ȯ`Z�A=?�XɸA?��;�x�@�+9�3�@BW��'@Q��w�@!Z��ɍ@'%��J�@-��c��@2r<���@6~�R�P�@:�W�y��@?օb�E�@B�6]�{@Ep����@H��P�@�@K�-�!�k@Ol��s�v@Q�j�#�U@S�0L3:�@Uѫ^�s@X�җ�@Z�詪oa@]"�t�g�@_���bcm@a[����@b��w�,�@dn�$t9�@f+�&Yn@g�<���@i�!�ɨ�@ku�Z@mf�F:@ojl)�Z�@p�:69b�@q�=�ۃ�@r�y3�
@t"1��܆@uW�θ�+@v�]��Xe@w�p4�@y<�u�@z��*���@|l>#W�@}��5Kެ@0��@�XJ��9@�*�.��@�Yw�w@����E@�Ȉ���f@���7)%�@��v��@��_9g��@��n�?>�@����"q�@���0#i�@��{���@��8C	�@���0��R@�/,�@�>�%        @�5�9�@Q�� M�@n&7�*|@�����%@����^�H@�=���h�@���Ǆ@��|a
�A@���߯��@��Xpw�@�!7:ɿa@��q�_rP@��[,��@�_���A@�e��@ɠ:F�}@�\��H�@�W�]��)@�B:�@@�D���(�@�`����@ؓH���@��Iqc	@�@� �@ߺ�W��P@�%�v�~n@�y�I���@��K@�Dl�(f@����@�;vV��@���J9�@�]��M��@��l˨@���k�K@�0����@�G=�p@��2��s�@��� #�@��K6��V@�ɓ�j@��h�g��@��ל�C�@���Z�@�ڗV��@�����@��_�&�@�"?���@�E.���)@�m��4��@��KDY��A g+t��=AN��SA��RNACI�8qA�>tA�V/2`A6�bA�Db��A������A>�����A�S����A�>�        ?v��ye� ?��=e;ۆ?��uҫI?��Q��S?�^�:G?���wGjq@c��iA@';;&R�@$��90@hB���(@cx�_M@"R�>7H@%�f	.��@)낖�q[@.s�ڏ�@1����W�@4^���%@7A�����@:Z�m6�h@=��"�@@�G`.��@Bwxm;�@Ds�Io@F��%IY@H�5{��O@K�(g�@M�thC�@P���I�@Qh@7��@R�Ŝ��@TL�Fo۾@U�Ӱ���@Wt��`�@Y!Zaf)@Zߵ��p@\�7����@^������@`A��~�@aCX$@bM����3@cb���-@d�>�/7@e����}@f׃o��@hhIJ�^@iWm4���@j���@#�@l 4X�;t@md<K���@n�u#K�@p&h!�V�@p���g�d@q�r��4@r��?�@sT�0���@t0X[;T�@uy�\%�@u�i�x �@v�@�B��@w�����@x���y@y�CH"�$@z��Y�        ?V.�?z]�?��д�n�?�r�&�?ņ7(��?�A��`��?��ʁ?��jY?�I9���?�����+@���z�@.�K�0�@�3���@/9��@O��f�<@#��<�@ �̈́n�T@#͍p5k�@'&��T�p@*����u@.�Ժ�=F@1��X�Z@4o=^@6�&�d��@9��P�0@<�U�6[@?���TW@A� ���Y@C��xdV@E����hb@H���p�@Jh��\��@L��S��*@O���?4@QH�uF�@R��m��
@Toī�@V&ܯ�,@W�s�s�K@Y�g}��@[ۦJQ��@]���tvc@`p�4]K@a=�|(�+@bs��el@c��W~�]@e�|T�@fn1e���@gߞ���@i`u	,׈@j��g��@l�5��b@nA{kƣ�@p �8ԧa@p�KU�߱@q��B�@rҳi��0@s��Q[��@t�}A��@u���N@w
ut�>@x-9%��@yX��_^(@z�^u?d�        ?L��J�?�f�nV�?�����[�?�!���?���1?ж$��x�?���v.&?�_�4~��?����>��?���6æ?������@YVw� @	k�˛@=O�t@����@M$؜RK@ =Xh�z@#ț� B�@'�K]��@,E�{ʡ�@0���J4"@3J[fˋI@6.m�qL@9B�<��@<�D�OY@?�g�wb�@A���4@C��E �@Et�u�]Q@Gg��տ�@Ihv&���@Kv��هQ@M�W6�@O���J@P�8q��@R�d�a@SJB�U�@T�Ԇo�@U����@W
 -���@X`�<��@Y�n��@[3�Oc��@\��nZ/@^=�R�5+@_؆����@`���wc@a�fh	�j@b�8~N�@cl�r��@d_��3�|@eZg���@f]9{o�@ghZ�*��@h|$�24@i���ں�@j�(i3{b@k��8�@m(���Ժ@nlՌ�*�@o�c�g�@p��o}R@q;"���        ?��ix��@y����J@0���3M@D �IQ@R�ܲ7��@_�"X]@gLf���@p#
{N4@u��@�@{�|�/9�@�Q�A�Q@�;����@���&���@�em�9@�գ�5�%@����@�Ӣ����@�0�ema@��:r=@�V2w��Q@�f+m|�Y@���F�s@��P�U�Y@�b�):!@��լ���@��[�0'@�P��4G�@��gM~�C@�o�Ŕ5@���ǅ)@�ݞ�c�@���h�@���a"@���6?"`@�������@��'��H@�=�c�@�5&�N('@�j�Y�-@Ū�wX/@��S�1��@�L+�:K�@ɮ˚�d!@�n�('@̘C���"@�q�hQe@ϳ��s�@Щ�~��@рI�߈�@�]�N���@�A�X�)H@�,�D��b@�M��F�@���H�L@�����@�&>��X�@�9G���@�UK5��@�y�u�@ܧ7��@���|,��@�1�z7@�3�O�
        ?�~Ok�?����,�?�@R�f�?�'�����?�y?�y?�_02��@BMFr5@��cl'�@��dw @�bGsa�@ �O��_@$K%IF~@(B1L�3p@,��%Ә@0��s7�@3"��k�@5�԰Ku@8��q*�2@;�],	��@>�PA��@A%гk*@B�L~��@D�c�[��@F���os-@H���5@J��z5q@L�v��G�@O+^�7�`@P�Yc��v@Q�ö.O�@S*g[�x@To@�)�\@U��7��@Wx][�p@X|�V2��@Y�\��@[f=.б:@\�e�y�@^|a�+�@`z�#B	@`��gtf1@a���-�V@b����T5@c��ϐ��@ds�l�E@ej�� &@fg���@gmlO�� @hz�zn�@i�{f�+@j�i0	�R@k���{@m���@n;��=<�@o|�O�E�@pc(�| �@q�i%ge@q�n�W�@rl�=�@s$F(N�.@s�Z.�r�@t�N=�@ug6�lJ}        ?g�d�޼�?���1��?��Gb@O?Б9.�_�?�}(��?�J�iVE?�����~?�PpQΩ>@��7�^@�Fi@��(F��@�CY�v@��hW�@�,L��@/�9]a@"A�.�@%P�e�1@(�=o*�@,v�GPSV@0L�R3@2��$[��@5q��&:@7����E@:�ͬ�W�@=���d@@���]@B���TE@D�K�;�@F�\���@H�x���@KC�:�&@M�z�n@@P:Uh�0�@Q�<�ܻ@SmS,�@T��3u�b@VA�^�X�@W�4�00�@Y�(K�3*@[�9S�p�@]q��m�@_n��@G�@`�	�7�j@a�/�/p@b�`�ā�@d%3Ԫ�@e`=<�q%@f��2J�@h C3���@ifU����@j��`�9@la�
#�@m���Tn|@o���
�@p�|X3@q��3�@r|'�
�j@ss� �P@tsB�Bt@u}�ߞ[�@v�|�Qj@w�<�d�@x��]�N,        ?l��R/m?��W/b*8?�9`��?т�����?�"r��q?��"w ^?�UJ_�?����_�@�����@O�Hi@�ѡ�@�R��L!@��Xi��@ ���F�@$0��@'����@+�KZ	U,@0*i����@2�����@5]�>H�@8Uk�<@;�T(7-@?�쟌�@Ad�����@Cg�xg!@E�is�:@G���l@JN���E@L����@O�Il0 �@QG�ˁ��@R���T�#@Tn�_(3@V!��9�@W�؎L']@Y�$��*�@[�zU�|@]βK��@_�����@ab#��@bI[�%;Y@c�U����@d��|kX@f)J���@g�=y�8-@i"�)2Y@j�r���v@l.��O@m�.���E@o���pKq@p��9;�K@q��r�K@r���=�@s��w�"@t��a�T@u͚X�h@v�`[� @x"����@y^jw���@z��\8}�@{�r��q@}]�=��@~�:�X&        ?�$����@Gp�PJ@9a����@M��D&�@[�/2}@f�g�l'�@p��@��U@w���@~oF�TP�@�k.��S�@���!zv@�R(�/@�������@��5G=yb@��ʜRF(@���a��b@�m��^3@����>��@����j@�<I�bT�@���0� @�/v��e�@��=���s@�M_y@��`8���@�>]:��@��x�K��@�i��F�N@��dU�@�Ъ[b��@��Ӏ���@�tQ�fT�@�]_e��z@��y2%;@�����r@¼,�Ң@��L}'@��m���@�u��h@�CmЂ@�{��!ū@ɽj���@�	#���m@�_6n�C�@����@�,5Z-�@�R��t@��p�@��{G��@ҫlcWze@Ӂ�<�@�]��ޮ�@�Am\$Z�@�,H�vg@�]��YW@���'m�@�[Pez�@� [��3<@�/����?@�F�y2Q�@�e$y�x@ދG�pm@߸�y(
w        ?T[ =�r�?����$?�\�{�?�.��|�
?�oN8�:�?�e`��j?��2%� ?�ĭ��g?�@�y���?��~|�i?��(�2�?�[���x@�{D<��@ �.KE/@ֻ�&UR@��?�'�@���m�@�`H��@�$�z�@<��@!��E�@)�tA'@ ��pX]@"b]��v�@$)�=��@&���K5@'�Θ�8@)�I�;p;@,�����@.=��#�@0>f��@1g�#G�@2����U@3��/m@5ѱU�8@6iS� @7�LPC-%@9 ��<Q�@:���!�@;�wb���@=ve�|�@>�>mxa�@@B�;�ue@A�BK0@A�:0E�@B��X�]@C���G@D`-�[��@E?��{@@F#��)�@G��h�@G�58��@H�ɢɎ@I�9�ɞ�@J�x�-L�@K܍��>@L�y錠@M�7�R��@N����$�@P�����@P���"C�@Q �B��p@Q��W|i        ?7�|����?sg��j?�aP��?���娶?�{A�řA?��|���?�
\Ip%?�'m<i!?����(f?���sI�?����?����X?��p�&�@܃Ѣ�n@�@ {t@
��f{��@�.�;��@ن%� �@*;E�]s@�WC���@�E��@@!1J߿�@#�����x@&I?�[~l@))���v@,Eb_3N@/��Ϙ��@1��`c@3���>}@5�m
&k�@7�2�f�@:%@�aE@<�	� �@?M"��@A[�cuy@B��R���@D"ɧ���@E�����@G�B�:"@Iph�]s�@Kg@Z'@Mx���j'@O�d�Z7
@P�>0�kv@R*l�D��@Sl��@T��� ��@V ��� N@W�n_�@Y:���@Z��C�@\S�T�/@^��T[@_��f��$@`ܥ���@a�����@b�#�J��@c�>B܉q@d�pI��0@f�6��O@gJ���@h��|ui�@i���+o        ?C���;�x?nˑ�2?��-����?�^���}?�;Y�_�?��(n��?�)xD�`?�m�5c�?�H����?����($?�G��R�?��͂ ��?�����?�\B?Lm�?�����@����>@�S�Z(�@�0!�@���B�x@u���P@}|U�%@����8@��L��k@�@��5@"4LԼ�F@$��C�O0@'ot'�@*c��8��@-��b���@0�;�C�D@2XÄ3�@4Q�Z�@6l�А��@8��L.L@;���]@=�I��v@@%�GX�@A����7L@C?ׅP�@D�H06@FW�Ov��@H�ǒR@I����[@K�I��@M�JDĳ)@PW�Ƈ�@Q35��	6@Rc2�]�@S���ޤ�@T�4G�@VL7��@@W��/�S�@Y5晻^@Z��@\_��>@^=��Cl@_�Z�~@`�%ɺ��@a�;ƕ��@b���nA@c�Ӑ@d�C#.�~@e��	�X        ?�#4yj%�?껛l���@	I��ziX@8����@.39�9�@9�T��@B�q�Ub@J����.@Q�ܒ�&�@V��/ź@\Ί(;_@a�EP9f@eU�F:!@i[���@m������@qL�=�@s���[�@v��ԕU@y��_<Q�@|��IRz�@�7c�%@�	���@���櫹@�����m@���<x@�Np�^@���&�%@����
@��:�c5�@�t�u�@�T�v��$@����EN�@���Ļ@��s��@����S@��U�M<@�-ї?	@��Xs��@�?�R�3�@�s��1��@�K�9�O�@�(��E��@�	�/�/@@��y'm��@�٫�q@��c�`��@������@���cTGZ@��Jd32@��ፀ9�@���M�O@��BY�o�@��<^��@��z�X�@���z@��u�^�@������@�<��='@���S�[@�o�lؖv@��^@�����82@�OO���        ?��&Kz$�?�4�]k�?�{ ups?��"�&�?��F�~#@��8\�@	���4@ף�;K@}"�b��@�w�΄�@"{�y>��@&cT<k�C@*�R�)�<@/>��k�@2�:!8@4������@7��ֵ�#@:�,���@=Ā��{�@@�� di�@BV��,�&@D3=r��I@F&�s�<@H1zE�_�@JR�~�7@L��.�&Z@N��a��@P���9@Qݸ:z��@S'@F�h�@T|G�a�@U��󺻛@WI("J0@X�1��y@ZE(�R�@[���Z%�@]p��Jѧ@_�s�@`f��Q��@aG6*�@b-��R"�@cm���@d�.��@e����@f���f�@g׈��@hVD���@i,)A�H@jECyIE�@kd�h��@l�X+J0@m��e_�@n�u��%�@p���c@p��L�`*@qQ�!��@q��FS=�@r�]��@sKf����@s��4�h @t���N�R@uc��a!@v@ϊt        ?f��"3?��y6$�?�$���N?�?XL��?ފu�';�?���4�?�q��A?��K�5'@'�rc@&���@�TpR�@6 #��@�!�U0@�';n@�QH�z@!|�=O[�@$d���c@'��橐@+*
�z��@/�d��Q@1����1-@3��E*\�@6�M>��@9@fu�5/@<4{��9J@?c+��@AgB�.�6@C<�fZH@E2��I�@GJ�F��@I�ъdNE@K�gAWw�@Ng�;�G�@P��
1̍@Q�@��@SjR	�@T�����@V���S�@XU��<@Z%C���@\D��@^J�6�@`��Q�@a+g�[��@bR����@c��&�h@d�T��w�@f�k�G�@g��6�@h�{	٨@jz�a�UV@l퍅82@m���j2@ooa��� @p�~Cɵ@q�wd��A@r�l�S�@s��ۦxC@t��#�ԁ@u�mgz?m@v�UψD�@w�$����@y����        ?pr�O��h?��|���?���n?���K{�?ܴ���?�b���"	?���=�?��0-�p@ �D�z�@�>+\X@�t��	�@|�9�@�<ZNY�@@)�8�@.�\/�i@"u=H�_�@%�|=���@))Q�(#�@-��t@0��kI4�@2�׹�[!@5w}��d�@83`�w@;)F�N%j@>[�=��@@�y�N`�@B�lm���@D��H�t:@FՔV�:e@I&�dE@Ku�8[�@M�!V+w�@PRO�&s�@Q�r�j��@S3M�P��@T�=i���@V`���g?@X���@Y��0�/s@[���B�@]�Cp)�Q@_� ����@`��H�R@b␈��@c1ӈ��@de�����@e�(�)�@f��tS�0@hR#G�@i���@��@k5�� e{@l��\��@nUX6�j@o��F@pڤ!ᴦ@q�4P�j@r�q��E@s����c�@t����A@u�c�A@�@v�����@w�i�z]�@x�QeQ        ?�c��pG@ >ܐP�@<�3ʹ��@P���c@^���D
@h��U~�@q��o�;@x��:zz@�
�
3o0@�E;�]#>@���`�xP@�lƣ��@���~-��@��B)�~@��c��	@�71*I|�@���(9�@�Dk�Q��@�@�"1@�V>q26@��,"t�@��t��/�@�4��N@��md��@�����p@���!�^h@�aa���"@��_��~@�O��LR@���"��\@�p��L6�@�c�J�@��L��9�@����D�C@�%����@���B@�˶�C�@����Y��@��4h�@�r�#�@�}�a�4@�#q��q�@�>o& @�`�͆wb@ʊ�g�D@˺�k��'@��9�m@�2��o��@�y�	�D@�d�9�r@�ޅ�ݩ@ѽQ"\��@�og�� @�%*�L��@�ޥ���@ԛ���Eo@�\�{�@�!�G��@�껙� i@׷��<Kk@؈�x�h@�]�fK�?@�6�1SY^        ?���Z~�?єxp>�?�5����@.Qk��d@>�?��2@�FO���@"&A�5Q@(�/�E(@0w��*�@5�ev�*@:(�p���@?���@@C�K�^�@F�)V��@JM�y��@NXR�ew@QV�a�m@S�1���@V��[nO@X�ڠ�� @[rI����@^VS����@`�6Q���@bHg��R@c��}�@e�YL�NL@g�F��W@ii�g<[�@kb��	�)@mp?��#�@o��Ϫ�j@p�䋳^n@r	D^��!@s9/��a@ts�gm�c@u�=�c�@w	v[[@xdm|�g�@y��<�@{:ii��@|�o����@~;=<̱@��ni�@���TC��@��a䷼@@�`� aK6@�?uv���@�$����@�n���q@����*0@��q�Q�@��%Zp��@������@�����l@�p�E@��H�9�@�3�3	�@�R��Ðh@�x"F^]@�Q��.�@�����@��o�@�&9�v�        ?mv�w\0�?���D��?�x��s��?�T�an?�z���as?�$��!�*?����q@�;�V�@���S@c���,�@7t��@ �?��7@$vN�I�X@(�/j��@.$4��i�@1�l���@5Dzq%�J@8�i���@=
.�0��@@ʮ�Z��@CL�=<�H@FPX'U@I����c@LUbD�pY@O�-�s�h@QڬW
@S�F��'�@V �
B[�@X���@[��Z[|@]�4o�L@`N�Zfv@a�,M��@cts��O�@e*O�b�@f�A���@h�X��@v@j٥C��;@l�jH|5�@o׻<�@p��.�U�@q����@s���R%@tgq�\8�@u�8��0@w��$�5@x�X�{�@z �t@{�[��@}7�
��@~�G���I@�$6��@��ӻ�i�@�Ԅ��w@��Z��@��eI���@�����
�@�se��Mv@�hz/GA@�c �a�@�b�C��@�h]���@�s�3�        ?��:'�_?���P�?�8@1�i�?�,�d��?�$���T@��m;ܬ@j�R���@K��y_@ ;2O��@% R���@*�H��@0a��@3먃��@7���F�@<Ix2C2�@@�~%ֶ*@C?�W;�Q@F+�[m�@IZb�哈@LΪ��	�@PE�))M�@RJ~�w��@Tv�g7��@V̷K���@YMw0kxC@[���in@^�u]֩P@`�W.��@b�z�Q@dC3��%}@f�z��@g�
^b��@j��Z�@l"y����@n_%u_6@p\Z:��@q���Ȑ�@r����2@t=Oc��Z@u������@w!����@x��+l��@zE��'�@{�	�X@}��Wox@r-�@�@���S}��@��*
��_@���Xf�@��n/���@�������@����^�@�ᷙ�R@�&G�U�@�=�o��R@�za�%�@��l�MA�@�B�[-�@�j����@�����@��.m!e[@�Z�@�1?@�ŨR�f        @�.��vH@={�	�@YC��/�@l����(@z7/z�g/@�Չ,7h�@�a��4�!@��Cj��8@���#��@����aM�@��"^�(@��@��FB@��_q�@���%F�@�*��^�@�����?j@�G�q���@����K�@®�2�@��Z.�R�@�4�� +@ɦ6��@�79#��@����)LD@��6G���@�Tg�T�[@�ܥ���@�u�X@��Y�f,@��KU�C@ڡk5i<&@�|l�"�x@�h~�nVW@�2��v��@�:U�"�@�J}}H#1@�cR/�@䄸H��@宕��@��ֱ�f@�p�r׼@�^f��X�@�ǂi�@�����7�@�Z"�DT�@�=1G��@�{L֜/@�Ѣ�>P@�[��K@�T����@�����@����nh�@��rÆ:�@��?�!p}@�g`Rڳ�@�D�m��.@�&ȃ8�@�'D���@���p�~@��q^��@��mK��@������W@��&�0        ?t�ƽt�?���k0?�'FQ#?��ڴ��?��,��4?��$�,�3@�o�r@
8_�{�w@�w{0�@�y���@�Vo��_@!��*7Q@%e�)^�@)~�c"Y�@-�0A�ړ@1qig�K�@4��V@6�9gc?�@:
����@=W���@@o8�a @BP6�}�5@DObg�M�@Fm,��F�@H��
U��@K'���@M�'�V�g@P5�f��@Qm���kH@R��6��@T\�-�^K@U��ݘ<*@W�S��<�@YDX���u@[	���ô@\�Gݛ@^�$�0�@`b4E�p@ag��G.@bv	n_e)@c�o��	@d��HO{@e�s���>@f��ݒJ�@h5��l�@isg�h|�@j��B��@l%V�Z�@mYc����@n�h7FkZ@p���A@p»}�y@q|޽{�@r;9f��@r�QN>@s�j����@t�;m���@uZ��A��@v+u5G}@v����%P@w�+��O@x���rڇ@y�Ҥ�[�        ?Q�V�6?�6[�բ?�I����?�.��e?��2�?���Ny�O?���^�?�a��{�V?�^ �}@ B�u�X@�|���@
Z�gAۉ@i&e\�O@0�`�@W�S��@����@!9�@�G�@$3�ajs@'@z�Qg@+ 䗴`\@/��Ք@1���Y�@4γM�@6���khH@9q��!Z@<r���m@?����P?@A��F�9@Cr��(L@Er�k�@G���v#@I��:S�@LQ� s��@N�j'+L�@P�j��6@RN�H{�}@S܁*b8@U�8X&@W=(�4|�@Ylh�@Z���[��@]�6a�c@_"y��^@`��Ȋ"a@a���@ܕ@c�(��@d](�K@e��f�b"@g�{o�@h�M�9�6@j���Y�@k����l@mU��R�@o�/&�@pd� �n�@qL��Q�@r;�L@s2'���6@t0n�`@u5����@vB�X�DD@wWS�d_@xs��w!�        ?�[�O0?��K���?���yr�?�Az�F@ ��#@��KT@i��M�P@�X�q@$��Sh.?@+*� o��@1M-�;�@5�H�qf@:Y� ���@?�?�V�@B�ި�@F)V�c_t@Iǒ�^�;@M��H�T@P�EƋ�@SMʞ�'@U�b*�/@Xro�k�@[K�Z�-@^T���3�@`��e���@bri�X)@dQT7V7�@f>i���@hG��&�@jm��&o�@l�q�y�@oP���@p˷I��@r ��@s�����D@t����@v�����@x��n@yʹ�@{����|V@}e[���@Q~&!�@��B���@��T�J�@���h��@�ꥵ7�@�*jv��@�L�j��T@���=��?@��D��F�@�5�>�t@����ꀽ@�	��	�@����WB@�	�?/E@��>���@����{)@�,{&�@�]躱��@�C?]��@�/@v�@�!��Q�@��?�        ?�U7���@ �j��@?��`��{@Swbas�@b�ViE@o�d3~@w^��>�l@�q���N@�6�;|@���]I��@��Swd@����=@��Y�@���vE@�|Á��v@�i�|�)@����@���.��@��Ч41@�����j@���/D�@���$y@�I,\@��4�y��@�����@��Woc�@�9��9@«�>>�@�/<Ϡ�-@�×�>�e@�iS��I@� �@8]2@��1Y֓@���?]@θ5�L��@�]���
@�h�3&@�}�Jo�-@ӛ�t�q@��x�{3�@��@����@�*�y]h@�k<#�q@ٳ�ƕ�K@�H�W�@�\5H\�W@ݻ���/-@�")㘧�@�H�/z@����@�����ݚ@�Zh)@�KفI�@���yy�@��O9f@_@嶔V]��@�Y�ق�@�eo��E�@�A����@� ����7@�3�t�@��JLu\@��1^��D        ?�&���?�!��G�t?�4��D��?���$"'�@����b�@i��u@,'��6 @"׹U�@(�a��5�@0�D��@3��X�@8d,f@=D���rl@AMPV��@D3<G�i�@GTt�L�@J��#��@NE�>WQ@Q4���i@S�(��x@U3`�w^�@Wr~�%��@Y͛�F�@\DE�4@�@^�8Q>��@`��l�N@b%С��|@c����c;@eص8�'@f��*�ic@h=�#\@i��r(@k��(��@mY
�AB�@o%�-��{@pVd
A@qq���+@rjС,@sh1�1�%@tl9����@uv���@v��C|H�@w����3@x���.-!@yդf>�@z�����@|%��t@}U��W�@~��k�u<@�i��,@���."q0@�%A�6@��v���@�rMF�^�@����!8@����%�@�y�s�t@�,�:��@���L=b@��.��g1@�U'a��@���!ʈ@��eX��]        ?y+r2!�4?�����K#?�W@*�u.?���F��?�/�Ϊ��?�>�.��@��@_�F@	���E@']d�z@�6����@h���@ �E��p@$��,�@'�a`�@+��;�#�@0��Թ.@2]�D��@4�5���@7��믮�@:~��{�@=���p�@@}�nd��@BKP�9N�@D9�)|*	@FJ���G@H~K}��@Jי����@MW7]�|@O�D�T:@Qf�bK�Q@R�V��@Tt���@V?^ͱq@W��O���@Y�3���@[�AA*��@]���)�x@_�鳡��@`�>��F@b!]x} @cV�fH�@d��I�B@e����@gE����@h�!�L��@j*7�\�@k�X5���@mF�t�#@n��n��7@pM�=��B@q-a�Ĵw@r=�R_@s��&YK@s��}��@t�;�r(�@u�PEF,a@v�4�VO�@x��X@y"V�-O�@z?��[��@{c�
d�)@|���`@}��M<�        ?�M����?�N�*?��0�7�?�q�j~�?����I��@j@J��-$@ס�J�@U�#	<@ T�H��@$����@)=���@.��?��~@2<�� (@5����@9#�U�j@=��%Z�@@�Zh��@Cq��G@E�|3"?�@HZî]��@KK����@Nr^��^�@P�C!�h�@R�3�^��@T�9�g�@V�5�ݷ@X��xO�@[8Bf�	@]���5@`�����@al�j( B@b�T� �+@dd���4h@f �K@g��3Y�@iw��k]�@kTN�4y�@mF�8���@oNy�99�@p�k�U@qϐ���@r��*b @t#��@u]XR��@v��US=@w��ɛx:@yN��l�@z����~@|#p��L@}�,�fL�@ �71�@�V��8k�@�"#�>��@��_iZ@�ƈY�@����\M�@�} ���@�^�Z��@�EP6!@�02�n�3@���z�t@���I�        @lA�|)@7`&4�l@TerM�@g��@��@u�
�ݟh@�S3����@�l�?t&�@�����`@�*��~�@��~����@�cU瑪@�b�4+n]@������@������g@�c}Ճx�@�/8K"@�-c%h��@�]�R(�@���7�I@�)�s?"�@��A�^@����@���`�@�>���x@�|���̟@�П�	��@�:�x]�@�\��*`F@ҧw��/s@��jr%�{@�[�G�@�ĩ�/*@�7[��(@ٳWͱ7�@�8N��[a@���P[��@�\<�G�@����B!@���D��@�ٛ��@�΋el@�d�[���@�H��Ж"@�0ڟXe�@�y���a@��`Di�@����+��@��u4���@�����|M@��/��1�@��,�P�@������@��;�E M@�H�NK�@����ud@���]�Z@�$�t��@�	J��B@�C�׉@����(@�h��vk@��K�ON@���$0        ?d�����?�����7?�9
Q��?Ɋ��0��?�1��Z�5?�Ρ�	p�?�x<��/?�D���?�8��O@k��>�@��4A�@
f�M�@�W��!�@����@��F��S@�\(�#@f�Yܕ�@ �9&��@"�A�x@$)�(͙@&c+�b]�@(�|����@+/��+�@-�İ'|�@09��iU�@1�l��sy@3�:;l%@4���_@6*��7�2@7�Og�C@9xy���@;5;���K@= 鴦="@>���Xf@@cK��ń@A`�L\#d@BfsKP(@Ct�A�F�@D����7j@E��.�@F��}� �@HhIs,-@ICZ���@J��&�*@K�%RX&�@M13�H�Y@N�!���@P ~҇@P��w��w@Q|>G}CF@RA�$���@S�H���@Sڧ�£-@T�c\���@U��M�RD@Vc�4��@WE�����@X+�$�K%@Y���p�@Z��l�[@Z�����~@[��*m��@\�]ZΩB        ?.	b�|b?h	���g?�{�~�?��5���?�XA�M�?�0��:�?ˬ��p��?�⪌ �-?��?\ԧ�?�7) �?�˖=��?�; ݰ<?�yП�9?����z�@��}��-@��'��@�D�L�@�+X��7@E��s@��7��@Q�Z�b@ ���>@#2�:��@&"��F@)]����@,����5@0cu�@2}��q��@4�zꍷ�@7;�ȝ�Q@9⠮�~�@<�TV�P@?���Z@A����e�@CD�Xk 7@E ���@G���@I0�K�2�@Kh���ܶ@M���L�@P�dV?�@Qmȭ���@R�<Sԍ{@TCgR�F�@U�΃��@We��a@Y`Bh�@Zٔ�d)V@\�o��@^�zL���@`Td��@abT���=@b|&a�G@c��I�g@d�.j�7@f��!؍@gZP[2V@h�1���@jj,�V@k��t��@l�=�S�!@n�	/]i@pE��        ?_���T��?�NT�w�?��\'�7M?Ŷ�m�uL?՘<�B?�Yg��?�;X�?��47�?�5��h@�m���t@��
�Y�@h1˖@0 B)@����K_@��0N�@6=����@!�[�E@#��f��@&ҍ�vp�@*���@-�x��/�@0��$�@2ؙ���@5/��n@70�D��@:k"#@<Ω�ef@?�����@Af��
�@C���@D��f$�@F�Xd��2@Hv�0>�@Jtwٞ�@L��Q���@N����5@P�' 9G@Q�5�@R�'��@T2�W��@U�Ѝ�Dz@V�y�E@XU�D#@Y�u:���@[V�%@\���.�@^�iE@`0*���@`�w*���@a��� 5@b��8��I@c�<��Mt@d�#�{��@eɫ�+
+@f���L��@g��5��'@iʍ��2@j)��t��@kUQ"pf�@l�8`�r@m��<�+�@o�v��@p*����        ?Ɗ�_N�\?��m���@�����@.�
oU�o@=kt��L�@HJ�&��@R$ZO��@YI ǳ�@`Ĉ/|k@eo�M1?�@j�E��=@p2XJ��@sW3G�A|@v��ق3@zs�c��@~me�
��@�Xw2���@���m�0�@�,�=�@��)���@�\ ?�@�=��م�@��:�m�@�:D��Y@��%�9@���MF�@�m�%�@�L�ٳ�@�;�V��@�<9�S@�M����@��;S��@��{�S`�@����2�[@�"]���@�X�o���@��}n���@����d\@�7(2�b�@��`��"@� �|�P�@�u�`O"�@��@�.��@�AM|�@��Kl?>@�ާ��f@��W�ʽP@����D@�w�i���@�a��E@�Qč)��@�G�m�V�@�C�+]u@�E�A��j@�M>��"�@�Z���@�m��=�@��N�ѿ@������@�Ȉ��h�@�y}M��@���!�@�� �M��        ?oV��\�?���o���?���˶�:?�ni����?�V:���?�v�I?���4s�Q@+���5@��]=k @��=;�@4�Z��@�)��U@A�UJ�"@��D��@!�T"\��@$��t��@'��u�x@*ʙo�e@."�w��@0�����"@2�k�B�[@4��k;ec@6�*(vSv@8��42wL@;M%�M�@=����@@Ǚ�N@AlR�8^�@Bɫ��@D5d�(%@E��&AM@G6�#8ԍ@H͒	��<@Js�Rœ�@L)U���T@M��?aY�@OĎUPu@P�P�#@QУ��F�@R�Y� @S��`�5�@T�?�~
@V��0�@W8� V�@XgT�@Y��~]�_@Z�)��@\(P[�@]zO�5@^�(�x��@`n���@`Ҷع�+@a�l�1d�@bL���
d@c!/9P
@c�!ic�A@d��-{@eup���@fJ�[�ә@g$l"��6@hg��f�@h�I�@i��aV�        ??�G6��?w��Ҏ ?��Eu��?����z?�����M?�Q0�l?�j��xf?�y(^�~�?��IB?��B�?��N�?�`j�y�Z@ �Na|@�z�K@��E�?�@�ߟg��@����@G3�X'o@+#��Q@^���C�@!��pG�@#���\�@&�����
@)۩�n�=@-cv��@0�����a@2��%:t�@5# ���@7{9�d��@:'&GN4X@=K7L@@�Q��@A���Ѕ@C~�s��,@Eb�W2�@Gf���*@I�qй	@K� x^�@N3b�W��@P])����@Q�����@S� �d@T���\=@Vt'��y@W�Ā�z�@Y]�S�}�@[=k�ݨ@\�s���@^�^���@`_	?&@aaT��t�@bl�#���@c�&K��@d�׸��@e�]U�@f�	T��@h2��@iwHHX�@j�,!J%�@l"���M@m�)��@n���Lj@p;�.�lL        ?`�@���?���nu��?���60y�?Ĥ@��?��w%e�?��>�
r?達p�M�?�*.����?������@ >1�y{!@̭�߮@
̯��@����@�b9|p@ez�	��@�{�)0H@ Pc��d�@#��Oq�@%���"}x@)F���w`@,ݺ6��Q@0c�Gq��@2�E# P@4�P�.��@7O�1�F@9�]ǻx�@<�pB�@?�3E\@A��֤�u@Cj���o�@EM�'z�@GO��7�_@Iq�/�@K�~�+t9@N�X�4T@PQ�X4@Q�v���@S��ff@T��y��f@Vo@6N@W�#��c�@Yx5wB��@[EhW�@]'!y\u6@_�u+߲@`��V��@a���\�@b�$ȬZ�@c�Z�B(@e'���m@fkc>�/@g�C-VT�@i�OU��@j���@k�dY8@m�3޿T�@oW�ph�@p^4f��@q7er��@r^*�+�@s#I�'@s��_@t��ܰՕ        ?ӥ�@�0@+��<�@%��D 5@:��ds"�@IfI�v�@T�֧p�@^�g��0^@ed,l&��@lJy�zC.@r��@vg����@{7:]�@�>�����@�&��Zn@�;�D)�@��C�8n@�4��u�K@��VǃG@���m|Ӂ@��ep.�@��S��f@���B�@�@� �-�p@����)@��=a��@�N�J%g@��䔭v@�ub{I�@�!��"�@�޺��:�@��'��@��4��i�@�G3�6�@�A曞�Q@�M�w�w/@�b�2(��@��)3H�s@��[Xx�i@�޳O�1�@�R��I�@�dX��K@��ܬZ�@���L(�@�{�HT�7@��C�i�@�k�u?�P@�y飦�@�C~���@����#@��1�O�@��]��@ġŭ`�@ņr���@�qbˢ��@�a��Im@�X�ؔ�@�S��Dm@�U�f�v@�[���@�h֍�@�y}ϋ63@ΐloq@ϫq��=�        ?����2A�?�j���p?��im8	�@>��|�@�D
-@Y���vf@"�#e�S�@)�n#V��@0�$�39#@5U����W@:d�	��@?�e�/�@C�/"�@FL�6D��@I����=@M��V��@P�a��3�@S	*���@URj�+��@W�u�#�@Z]�D�Б@] ��G)@`  `<�@a�	�ׇ�@c�{~WZ@dƝ1�M/@f�жK�Y@hQ	Ȱ�@j1�ˈP@l"�̥-8@n&.Yh�@p����@q12���@rM�V~@ss}�R�B@t�s���@uڸ�*`�@w]��;H@xgo����@y�M�L�@{G�0!�@|�\��\@}�w�PS@pǺ�X@�{�Χ�_@�DQm^ӆ@�4��\@��j� `�@������@���(��@�I*�h@�h"��*@�Vz\b�@�Jv�� 7@�D,��~d@�C�	P��@�I/7@�T���]@�e�Z~�@�}�)�@���r�@�^;u�C�@��G�Ba�        ?�����?�~5����?���׼��?�g�m��L@6x�S@����e�@�k!w@��z@#G+�8�@(τ��{@/���@3AudF@6���ފK@;3,!�/�@?�(?��@Bxh1��5@E6�{}ll@H*q�{@�@KT��'�@N����@Q(�����@S�5n�@U�Y�;�@W>�i�<@Y�g����@[�fTBp7@^h�}��@`�Af�#�@a�
�wô@c\���b@d�@�c-�@fy<8�@h"��G5@i�#�6�=@k��V���@m�sW�j@o}5?���@p��g��@q����@r�C+�.:@tO��|w@u.@�nh�@vb+
f�@w�!(��@x�3E�y@z:p;�\@{����0�@|���Du(@~n�u@��s�}p@���7)�@��[m$@�P��]u�@�%���!�@� ߆��@���̣�@��B+r8�@���L�(�@�����#@���Y��@���`��@��k��@����/<        ?�S{Z�&�?����/G?���Y�F?���֌`�@w����@�B�]��@�yp� @!��Ct�x@'�@��i@-Q��@2)�C�Vl@6��VhQ@:q���q�@?C��Wѓ@BJ+w�.@E6�@9�@Hk���S@K��d60�@O�3
���@Q�J6E�@T~O�f@Vk���A@X�,j��@[�k>�"�@^Y���Y@`����@b:��F:O@c㍏��q@e�ƭ-�@g_�Ko@it����@k���>Y�@m�����>@o��\z��@q5�D0b�@r{�]<�@s�H%�fl@u:SH<��@v�>�B@x@����@y��_��@{��r=@}YpSb>@5�f�/@����U2�@���Z��@��m��7R@���Hݿ@��寨�X@�#�@�Z(B4a@��F�ޣ�@��7K�@�i�7��h@���B�@�dd;���@���k�@��;I@��]s�P@��PX�Q@�kwPtZ�@�Z���iC@�Q�jb�        @��oNG@Iޔ��+)@g�ԃ�N@zM�O`�@�ϕeJ��@��5�)^@�9,���@��"jN��@�,���Y@�|���@��4j�\@���-`y@��� ��H@�#����@����xm@Ą��?@@�?&��@�&'Π�
@�:�^�)�@�>�0YS�@����>�|@��k�K�@խ��u��@ת��@ټ�*�m@�� ܑa@���x��@�6��nY�@�gxg��l@⡮���.@��&�j@�1�)ކ@����S@���&@�O��N/4@���(��p@�=3��4�@�������@�O�Vu0@�s��Uz�@�DN�R@�B��9@��e�h/�@�Ҙ�CS�@���޹��@���� @���o`V�@���
�5T@��v9�@�+�e@�����@��̽{�s@��MҤ�<@���L}oh@���ʲ@��$��ˋA ���dUA)wUA�?9D�Ab|I�-A��7A�[���AL��
��        ?x���RP�?��{>K��?�A��~r�?�
�?�9��B�?��C\��@њ�U�@ۛ�-�@64����@A�D�ɩ@!T�	�
@$ЎWj�O@(�S��A@-}�83��@1/Ϗ18h@3�+@;�@6�����@9�4�8�.@<�>�*@@D&6u@A�Q;��@@C�T%9%�@E��HH��@G���Ղ @I�ρ�p@K����H&@N?dr$YB@PUd	E�@Q�E�}�@R��r�b@TF��prH@U�Zje"�@W,VJ.f�@X�� xy@ZK�,]&@[���"@]�q9��?@_j��Ʈ@`�!,�M�@a���E@b�t+��@c�%{�c@d��Rxz@e���Q@f�$�x�@g�n��@iU��u&@jBo+7@k}��{@l�܍"�@n:���@ocE��@p`��@q�>C@qɓ]z�]@r�{C�.@sC}��'@t�R�U@t��u���@u�i��?�@vi1@N/?@w=Kg��t@x��        ?d��i���?�+U⚐�?�� �y��?֫U�Vv�?�;�n�?��$J[?�i?�~�@2��x=,@^��#}@����9@Ĕ ��@W���@�@!R����@$ڬ��&�@(�D9n"W@- f����@0���@3�����x@6d�����@9tves�@<�/k�o@@#���@B�3l�^@D#�(�u@F+�^n��@Hq�+�/@J�1�WI�@MiV���@P����@Q|iPl�}@R�}��E@T��OE7@VC(>�\g@X�=�.<@Y�S�d�@[ٲ�-@]�lP*��@`
-ե>�@a-ηѸk@b`,��E|@c����|@d�c�^�@fU���@gɶ�%��@iO�-�@j�CoXt@l�x`G�\@nTՒ �v@p��;b�@q
A&�@r
r'�R@s�z��@t+c�n�@uL���~�@vy��&�@w�2P>.@x��P @zG��5h�@{�4ݶ��@}|���@~����	@��l$@��-l��?        ?V�@�g�?��V]�?�_��9��?���(X6�?��^�&�\?�EUDgs?ᮥI<�:?�6>+"\�?�.��y	�?�������?����H@L�;݈@���W>�@��Z��@�^�y�t@����an@7���M@8g"BS@h���!�@"TR�M@$��8Q�@'wl�@*��(d@-ѐv3��@0���@2�QŹ�@4�����@6��M��D@9)t��P�@;���	�@>L�H��)@@��'�@B�LS%�@C�%+�5@ERj���@G��8+@H��fD)@J��	���@M�s���@O?��@P���^N@Q��Rh�@SBQ�@T��\,��@U�Bu��	@Wl'��7�@X��*��@Z���!��@\%�Z�^@]���\a@_��	�rA@`���[B7@a�>VA�@b��X>G@c��bdw�@d�n[��@e�6��Ci@f��gI��@h!�!z @iV��n��@j����Hj@kߏ���@m4Dp��        ?���P�|J@�",CH@6�A�պ�@K�<�;@Z`�Ŧ`�@e�$��A1@pca_s@vM�R~@}��z_�@��|{�tW@�t�~�\�@��d�/�@�ސ�6�@��KE9��@�'�3�:�@�����@��
�Y@��w�W@��ď�:�@��=y~��@�n<��@�^xn�'@����!T @�'�R���@�Y:� S@�����F@��/���@�y�O.�4@��Ge3�8@��R�-�@�^j|v@�ľ.	~�@�}�\;0@�F���-@��ѩ��@��Č�;@���ԁ @����)w@� ��@�-EL��@�MJ;���@�v=�ď_@Ȩ-��@��B��A@�'����@�t!���@��=P�@�)�߻�@�H���~
@��<
0@ѿQ}C|@ҁr�lV�@�H4oS!�@�� � =@�㒵s�R@ո7��@֑�Pݲ�@�o�c���@�R��'%@�:��@�'^�^�@�H��rK@�E�̨        ?b���ض?��X��f?���T��?Ǡ�"���?�zA�!?�x-�gaA?�����?�HVf��&?���X= �@ ��7a�@�i��@	B"�o5:@V[�z�@�-'z"@�d�8�<@8��õ�@���x�@xl��E%@!��ج��@#���E@&{I@(j�H�J@+e^u"@-�Y����@08��q@1�E�`�@35[Z�\@4�b�R#�@6y�>��
@87�k��@:;M���@;���	�@=�;��P�@?K��@A�?��@B"��,g�@CI_Xv@D{&�~�@E�.Z�@Gi΍��@HZ��@I�o����@K-��� @L��|~=@N5i���@O�1`f��@P�/���@Q��#�:�@Rr��m=@SY�--�@TG@I�.�@U;Ƚ?��@V7��@W9rz�[@XA��%�@YP�R�A�@Zf"�{Q�@[��D4�.@\� ��4�@]́��@^�&!eI@`���@`�Kվ�W        ?TKk��d?���^?�0<�G�?��C(?�V�`��1?��Y	du�?�@�dKj?�>�S@.?�o�.@�?�(2�p��?��`Q��@�=3��@��f��@������@�֔S~�@:%��@�QP%�@���li�@ %ka��	@"��:(�@%k����@(u\�B3@+�d��{�@/f��C�@1���$@3ʦ��*R@6.o��@8�^���@;4�G�ޣ@>�Θ.�@@�3й�@B)���@C��N�&�@E�O]�J]@G��,�l@I����V�@K���z^@N6d�DSX@PQ�F��/@Q��Л�O@R�'�|Ⱥ@TXh	K�@Uѻ0�u�@W\\�WhD@X����@Z�}�c�@\f}91b@^8��Tf@`�,Y�@a
���_@b1��@cbÊj�@d8lޘ @e[j3�a�@f�r�Ow�@g����@i���(@jL�m�Q�@k��ϓ�J@mt�A�@nn�g�1@o䄦�YY@p����        ?@X�����?rx�.�wQ?��}���?���x��?�_}n2i?�/<:�)?����?��4d\?ޝV4��T?䫄��bg?�.7�G/?�~.���1?�[���:?��1����@ �e�v��@��� ��@Ŗ9rX@�V�2�J@p�'j��@q�ʭ�:@�S���@XyQsm@��`�@"�l��9@$y����7@'"Z�F�@*vqv
�@-�m[@0;�
���@2�>ðD@3��;��@5���{"G@8+8�ph�@:{%n�H�@<�/$���@?���ej@A -\�']@B�f�ɞ�@Dz2��@E������@GSu%�Ǥ@I���^E@J�=x(W@L��ľY�@N��tM@Ph�EUT@Qz��P^@R��Z1�@S�S�d
�@T�д�_B@V2�ʎ/@W}�n1�@X��Z$QP@Z4i���@[����z@]GYo��@^��>��@`[F�C@`�0@wc�@a�����@b�R���.@cq�$��@dV߿QhL        ?ǽz�黗?�����|@����c�@0K5��A@>�&�Axp@I���@R���U�@Y؞�U��@aS_��^@e��p@kG {��@p�ȾM�@s�+��u@w�����@{h��'�1@�]i�)S@��bg�A@�~�Z�/@�{br�@��ߜ>@��֐��@��rk�@��cl$��@�8��`�~@����@��
&��L@�فjϔ�@������@�
Zʸ�@@�E7�9o@�˨ p��@� w,adV@�AG8ˋ�@��r�M�@��gI���@�O��_�K@�ċI,�@�G�u�˔@����i�@�yC~�;@�(|�r@�s~d{��@�Z}6��@�INVG��@�?��ً�@�>�O*�@�E��@�SnE�a*@�i���@���� |�@��jz�	�@�����ˇ@����2@�L:���>@���C��@���Ёl�@��X�u��@�B��mY@��R@��@¥����~@�\��Ԥ@��$h��@���em��        ?s���P;�?�<?&T�C?�VZ,�y?�0;X#A*?�c�D�?�/j��?��$�N��@3j�1H2@	� �o\U@b�g��@u<_>�8@��'�5Z@��$ɨ@!� }�<�@$�����e@'�F��8�@+8�F��_@.����H@1`{�-@3q!�0,d@5�4���'@7�CK�@:`��]ho@<�w�g�@?������@A<�
a@B��1ܲ�@DET)%�s@E��a���@G��	���@I[cf���@K2�6�A�@MKI�2@O��-[@P�%�0<�@Q�ߏ�6@RŰ Ӎ�@S��33�@U�C�@VY�P��@W��֢Μ@X��U�@ZK	��A@[��G�	@] ��0X;@^�x�?�-@`��ɻ�@`��"Y��@a����>@bz� 'K@cS��@d1�r;e\@e�P��@e��e5@f�棓��@g���d�@hކ�I<@i����@j�j�샥@k��a��@m>'��@nɨ/�u@o;t�Y        ?K��.�?��v�O�a?���h]@�?�6h�ǭ�?��<\�[?�S2��~?੃�Q�f?�w{5Vٜ?�,Á�r�?�N�f함?���v���@�Qtf=v@	A�d@�)ig4m@j�e��@�7~�ƛ@i��Y:�@ ��y��@#��o-x�@'`��^�@+(&O�@/S_��/@1�d�P�U@4s4Gr`q@7+<�BB@:��̂�@=J�8�l�@@[6z�j�@B0���>w@D'R���@F?y_���@HzSCz��@J��^��@M\^��~@P��w@Qk�z��@R�p�⪐@TxcEe�m@V�T��@W�IK8�@Y�9LuO@[�����+@]�1
u%@_���^J=@`�xE'��@bS^��@c>q�p@dx�ۖ�@e��7#��@g3~���@hs�|��@i߶�B�@kY\;C+�@l�ISE	�@nt�D9�@p��(e@p��+�k�@q�_	��s@r�M���+@s������@t��.���@u��ϩ��@v��r48        ?`�~��?��S�߯�?�l&s�?�X{���?�s;M���?ܯ�i}7<?�qu}k��?�.��L�?�i��q�?���i2�@ p��_0@S�/���@��;�Z�@��$��@��t�@����O@:�ߚ�/@W�/�@ 2x�g�@"����@%2�����@(Vz�W�@+A���@.���H�4@1=���	.@3H���h�@5~r�V#@7�b���%@:n:�z+�@=,;(Lш@@���@A�Hs�'@CI&�R�9@E�����@F�[u�@H�g�b�@K�,�Z@M@�7��%@O�5�d��@QC;̶�@RP��m��@S�v��E)@U��CW@V�pb�m@X!�ͤp�@Y�Č@[vݺs��@]>���b@_F�0�@`�g�.�@a��I?�@b���-��@c�|�k�@d��kI�@f�9N�@gE�O�!@h�����@i��l�+@kEK�Z��@l�q&@n-P68��@o��;���@p��nPJ        ?�8���7@	�ԙb�x@'�I��@@<}��-�z@J�u�!@U�9Vg/@`I���b@f��?��=@n�m�͢@s<��X�@w�4��{�@})v� @�o@k�@��O�@��S*Ʒ@�{�tJr2@�V	�ď�@��gOSc@��]�܄@�;�m��@���L�]@�Il�G@��"#@�r�h0�}@������@��p@g�@�6�T�2�@�����@�ǿ쀎e@��2��n@���6a"@��)�l#�@�r)�q~@����BU @��T��o@��,����@�/Ho�<�@�z�=�-@��_��D�@�3\
m�@���4]��@�&)���@���B���@�+��S0@�c��p@�5ȯx�@�,Z�i@��>�z@�����@Ĺ~��@Ũ��^�@Ɲq��7A@Ǘ޽�@ȗ�����@ɝ���@ʩC�z@˺3�MA$@��6HE�	@������@��'��(@����@дY&8�L@�N�l��        ?_q��L��?��yx�S8?�\�B��?���0�$?��K$�?����7?�KKB}�]?����8?��ɎJ�@A���@C1!%+@�����@fP��@�f-:k@M�re�@h�-�H@ �#+�m@#OC���@%ݫ��x,@(���	�@+}1����@.���p�@0�Gj��Y@2����7�@4g\�b��@6I����@8C���F]@:TaN�l7@<|�jo�F@>���0�@@�f�\M�@A¯'��2@C_4Q�*@DX��c��@E�����~@G!p�ː�@H���f"@J�UW�@K�V���E@MND%��@N����i@PY�rDi$@Q=_�k@R'ݞ��@SY, ļ@T܁1��@Ug3��Q@V�ɜ�@W%J����@X9`���2@YT��6�@Zu���s@[�;<߸@\ɀ�:
@]�õ�	�@_6��i�@`:�ig��@`�X�r��@a�'!P-@b,�:�*@b�I�
��@c��m�9�@d:ov?�        ?@U%1r*?{Z6҄�?�-�֧�?�<rC�?�?QK��?Л��H?��{X]o�?��z����?�L��;nx?���(?�Ss��?�[��ư�@e�#G��@�|V#��@���F�@�Q��o�@�K �@�����@��"�@ ����@"�)~/@%A��"�@(B��z�@+���1�/@/G���@1x��P`@3����V@5��U%K�@83Cx�?@:�.烎�@=��\oQH@@>��3\�@A�𼐄T@Czn�F�@E>�-�F�@G�ݱ�@I�l�$�@K/Ӣ�^"@Mdu+K�@O�I��1/@Q����@R]4&���@S� �L@U9/n�@V�*Һ�@X$%��W@Y����X�@[n�?U�@]/����@_Ta=�@`t@Q� �@aq[�V�@bx��'�@c�}��@d� w�A�@e��8\�@gYc^�@hA	����@i��/@j�N�0��@lG(�+
@m��fsC@o5{i"�D        ?BS##X�?t^�d��?�7K�m?����\!?��`&p��?�_,d��?у\(T\�?ٚ/���?�в�9�t?������?�. M�?��#�c�?��=�?��u�&�(@��_|�)@��?$��@
�F7r�@��$�@��V�y>@���h�~@8E�GJm@��Ko�N@ ��Mm�@"�Y:o3@%K^��@'��ٱ� @*�R:.@.
�ڱJ@0��_ED�@2���;��@4�q�=@6����B/@8��lJ@;T��)Z@=뿯�r@@Wf&԰:@Aϼ��&�@C_�&w�@E�v@FɤTٳ�@H���<�@J�-8/�@L�xԥ��@Nٗ4}@P�� H��@QĽ�̌@S��E@TW~_WC#@U��5'�a@W'KNpr@X�3�?��@Z5W>�jN@[Բv@�@]��qkj�@_E!�N�|@`�a�N�k@a|���=�@bw)��*@czo��N@d�����@e��OH@f���u�@g�M�_        ?�)�|�?�u�k���@v'*O� @.�S��J@=��E�$@H�Q	�}l@R��r �@Zj�f�[@a��=�@f��-v@lȽ[�@q��u{�*@uW$�o]�@y[�G��@}��&ju�@�@�5��U@������@�����@��$�!�@�����@����6@���h���@��5�
��@��k����@��UaR��@��z4��@���(k��@�T4��e2@�b�����@��]�M�@�������@�\�3%v�@�˰(Y�M@�I:7�@��p�.9@�p|K�b@�sx��b@��k���T@���C�@��i5��@����
��@��5���@��4�$��@��oB�9@���Bap�@��K.q�@��}���@�4�2�<�@�h(~�6@��a��>|@��
�V�@�/�`o,Y@����l@�l/_\;@�Q�4@x@����;@|@�9@�<�)��u@����F}�@ĸ�O3p@�|7�6&�@�C�@��ߊ�n