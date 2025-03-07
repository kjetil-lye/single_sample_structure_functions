CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T105153        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?�2ٞ��?�Ï��r?�k��2\?�K��g�@[��|��@{w�pB@{b:4wH@dg1ϰ@#��ک�=@(ݤ,c�@.��}��j@2tk*~(%@5�z�dj@9�����@=��c��@A>��Bc@Ch�K��)@E��W��@H��~��@Kc�m��@N\��0@P��<�x @Rf����@T!�vک8@U�iZI��@W��r���@Y�m#�0@[���/�@^#c
�)@`6lLY��@ag�.Qq�@b�YK�6@c�~��0@eI����@f�4Ewvp@h<����@i��8��u@k%��2�@l�ކ�,�@n[���s�@p�Z=��@p�^��.�@q���6_@r�v�	1@s�>�
�@t�C؋��@u���/�Y@v�匿�E@w��D@�@x�Ns�`@y���	��@z؂��l@|DqL�Y@}9C���x@~w����@��7��@�����	@�6WZ^�r@��&B@��/�l @�^�v��[@�!iY���@�鏂1{�        ?�c�w;1?�j\�C?�Q�=���?��ʿW�@�2m]@#Bt�8�@S�����@',����>@1>b�	��@9�Wu%@A�c4x�@H���jW�@Q#Fd��o@W�H%�@^�h|Y @c߹G�@i{M�gsK@p�^D�@tM3�R�@x�쿟��@~?%t�7@�DV�B�@@�� ��5�@���N�@��󴏝�@��v��#@�������@��TT�*@�|�$��@�_0�Ϊ�@���\�P�@� �|sJ@���_BK�@�]EJx@�L0���@�sL�0Ì@�j0BrD0@�8���� @�%Ӫ�O$@�2�ؒ'�@�`_�K@���l�'@�!3�G@�Z����@��b����@�&+���@ħ����B@�<�	�6@��(�� @ɞ����@�m���@�Ol3��@�D�^�@Ц�.��@Ѵ�O� �@�̹��+@�����@��wK'@�L�gQ��@׊0p���@�Йr�@��X��@�xJ��        ?�ydQ�-?��=�8W?�:���?�2v��G�@��.�u@Œu@f��/@#}��/B�@+�۳��@3��&�@:�kXve�@B:���@HN��.��@O�]���@T��1�'�@Zs���x@`�X��m@dȾ�ˎ�@i���3�@oɲK@r��j�@vE�f��@z>2�%U@~������@���X��@�M�:�@�$��U@�6�i-;@�@d?�@�K����@���w�[@���&��@�����u@�į�X)@����g@���Ȱ�@���>��@�.�oq@�Wi%�F@��I��@�����l@�;��d�@�M_��m�@����_?@����@>�@�`�7@���uK�@�E3�{A@���<�Q@�)}�[Yo@��8y?G�@������O@��ŕ6��@�}<949�@�b����_@�O-_�&�@�CQ���@�?[��/@�C��,	@�Ptl|®@�f& �j�@��MK!�@��]�V�        @1�d���@`�+N�@y�?`�@�����@� ^�A'�@���s�R�@�zx���(@��@)��@�21z�J@�Dq�w��@�����@��r�.@�+ T%M@��7��A@��`�@��CZ��@��Ѕ�@�h�=�@�p�;�@�~N%<j@㗠���@��n��Q(@�4|1�xE@귲F9�@�]�?$@�}��V@�G�˛T@�L@�����W�@�O��X>@�׋�?y@�Ϧ��\@���pM�@@��c�58N@��y:��A �I^ҠPA�:we�A���FWA�
[<�A
 ���A-i�A�$AW�[k�A���A	�p�<JAU�AO.�@|�A�O:&D9A��7jA2�<��1A���A�A�8�pI)AnvjͮA8����A	Vg��ZA�t�1�A�`����A�e�Z#DA��pm�)A���A�Z�p�A��S>:A�mڅ#�A�O�d[D        ?����:]?�9�|��?�)w<��?�6E~���?���8-U?��Bz��@�<���@�']��@1�C��@r��%�?@!Ԏz��]@%݀bϝ�@*Wow/�t@/Fo��s@2W4�Q�@5IVG8��@8{$��>S@;��@?���M~�@Aӻsdgy@C�&�7f@FK�9��@H�,'�@Km�����@N@�+s�@P�]��5�@R7�1�[@S�l_��@U���M*M@W�I��P�@Y�<��@[�>�)bD@]��44@`jSj��@aH,�FD1@b�����@c߸���@eB93&Q�@f�{{7�@h6�ˍ�"@i�;��?�@kn�ez��@m$r��H@n��Vj�@pb�7�n@qX�J��<@rWt$M)�@s_xoC��@tp�I�j@u�ib]�"@v��:�-@w��û�h@y����@zV��k�n@{��RO�@|�y����@~R���|�@�V��	@������@�Q����@��,;
�@��|�FI@��t��J        ?n�na�?�".�Z�?�WQ)`�?�L�z�	?�+�h �0?�Up��x�@
���&�@D�Y���@�w9�@%�����@-ֵ�5i�@4/l$N	�@:�N���`@AY82��@F%P���@K���lV@QA�ĵ�@U ׈��+@Y��IY��@^�I8cZM@b,jO.��@e_�A�@h���:�@l�Z�-�@p�Z�u��@r�����@u�Y>p�@x]�A�mH@{fR���@~��\�ĉ@��A�c@�����ۈ@��o��6�@�"�.|��@�lr@���F� @�q��+�F@��lP�P@�
k�@��s��@�0/��P�@��O���y@����
8@������@��exF�@���I.2�@�i�� @��佸�t@��=K�/�@�iW��@�T�=��Z@��}��h@�#����@��T�q3@�2��V�@����@���ؖ�@�"֎��z@�JZ�@��a��x@��,�7*c@����_�X@�	�O��        ?iG;	b@?�h��U�H?�HL����?�P���}?���"z"?�<`��?�����g~@4S��@��{���@u�S��@#���*@-"���#�@4�_�(s@<�1Ϊ�@CzLb�۟@I�?R
�@P�-�@U�o~n�@[/�=h@`�ݽ(@d�_�ļ�@i&4�c�t@n-4_�o�@q�~���@ul�� @x��f@|��J���@�rF�'�3@�Θ���@�`����@�)����@�,�X�(@�h���;@�𺛵�)@����^!�@��t��6�@��Nη�@��T��@�zfD�J�@���}��@�N
tC@���Oj��@�%���h@����f��@�FL�S:�@��{A�F@��(�0P@�����^@�kF;��@�eZ)��%@���j[[A@�ʶ�+o%@���c�]@�!11@�:��A �@�tPK|=^@��J��@��}�@�_"�4@����=�@�/����@��z����@� ���^        @	j�b#��@=��cl��@Z���fnC@o	���@|��0�B@�ceF�g@�U:��!H@�"��%�?@���h9�@��)���@��s,�.@����_�@���4�M�@�y%q �Z@�S�<r8T@����`�*@��\V�s@����,�@Ʀ�>�@ɀ�շDL@̓B2z�6@�ᢀs�j@ѷ�d{�@ӟI�,��@ը����@��	�?[O@�"�ŝw@ܖ�XM�/@�0��9@����.!@�pf��@��Z"�*@�6��@�X�5��*@�)�t��$@���%k@��&��@�-�5�@�zM�R@�ظ�B�@�q%y�@�R�Į��@���G��z@�,�bY@�y����@���`��&@��Q���@�+0���@��`�FFA L`�в^A33���A!��݄A]���A�6dt~Aՙ�ȼAӪ�DA0��-�AH
7�A	f;���A
�!w�ڗA��=�A��x�M�A!��;�E        ?�����0a?��uY72?�6���@ ǉL!�8@򫷾r@�l ���@!!���o@'aL$�m�@.��h�O�@3[����@7�Q�fՠ@<�8��T@A5��q�@D2'��@Gk�A]U�@J��(��K@N��B��@QDB�`��@S[��S�@U��K�©@W�t@ib@ZZV�1�@\�^m���@_��k,M�@a8|�C̖@b��>8�!@d8�	�ѧ@e����#�@gy[��W@i1���j�@j�v��@l���~4q@n�<!�'�@p\�k9��@qb�=�}@rq-`�L\@s�/�@t���a	@u϶�b��@w ;���6@x9A�{��@yz̍�q@z��<_��@|}-�ZP@}r����@~�c�2�M@�!Z�E-@���P�@����`@�]�yce�@�%�K�:�@���)��H@�����@��=� �\@�rM(먐@�Q��@�4f	���@�� ��@�	]��@��K���@���op@���Wٗ@���|        ?~�P��&Z?��Os�M�?��g�FO�?�5^+1c)?�����d@j��5@��݅��@�Y��:m@#F�~�@+���I�@2�o�}n�@9��V]F@@�g�k2@E�x��"@K�ڳ���@Q�j�k��@U�Fx�b@[��C�@`��|�@c�8��PR@g�8Z$`@l9-ހ�@p����b@sO�Фr@vU!mc0�@y�i��+M@}HX�w@��#�X:@��̛�F@�a��'�@��&E6.�@�.k*+	@���9�E@���M��@���"�p5@�W�Q"�"@�'�>Đ@����@����@�AF`�bu@����<�!@���f�@�4�6��j@��塰@��h$�@�\S��E@@���\Zi�@�y��F�@�$���8�@��h�ξ�@���-]�@��/��@��T{���@�Ή�B#�@���X@��!��
�@���r��@�L,6s��@���[�ޓ@�Ǖ7	-@�@��H@�j�<Rx@�ʨ�}n        ?��La!Y?��V]ڿ�?�_%з��@
j�)S7�@���0�@!�55�$�@)���@0��B�a�@65�x7�@<X�.���@A�B�^u,@E��Ę@JƤI��]@P/���;@Se�O�QM@W��e�?@[@��@_�l�%@b�d�Ij@e�ħ?�@h��~�:@l�ur�p�@pR�c�F�@r��RM�@t�ڎ��@w��6x�a@zhtț�t@}x}����@�aЛ���@�%Ϫ�U@�	"DA��@��<�L&@�1�o�Sk@�x���*@��݃i�@�p����@�&v/,e@�~���@����Db@��sP��$@�<s�0fI@����(��@�ή|��@��1a$@��d�(q@�i��D�@��u�@������@��!J<fy@�5��-�@�aMn	[@������@�jҟ@��Ί��@�A���i@��ö|��@�A����@�w	�/0i@�T��X}/@�9�rl��@�&���@��v�"@�!��H        @A���t�>@q�Tp���@� g@@�զ('(L@���n�m@���`!@K@��W��@Ą�a�f@�m,�^6@�~͏�S@�����@�����M@�4�;�@�Z)�@�Z�i�@�Ev~d��@��:�`@�j;��@��B�F@�Y9@������@����g@�J�`� �@���u[|@��"sKMN@�Υ|�t@�ǢE��@�ҥ(��A x�PQ
A�y�D0oA���B �A޳,��A���ZAU�u��A�O�!P�A�� �A
Q홞ȅA�1�+��A,dP(T�A��<��(AC3�0ZA�>��Y�A�8w �TA~9�yL�AUL�H^�A1WA��� (A��FmA�u�#�UA��MH�A͠�Rw�A��,1�A�ٮʛhA�X�,A�}���A�O����A�� ��A .���A �"#K�A!<<M�PA!��B�A"n�B3�A#�.��        ?�K�}��?� Q��d?�<���i?��>�|�?�Q���+@�\����@���U�@t��"]�@u;�l�@ &�W��@$���@(P���@-l�;�@1+�k?-�@4/���@7/�4�@:�U;q��@>G��d@A!���0%@CG8q։V@E�}h@H����@J����@M}劷@P;�Z=�@Q������@Szʵ纕@U=Q��&I@W���B�@Y	�L�|�@[E�G�@]6�i|��@_p�.�v�@`�S�/��@bI��@cWk�IT�@d�2���@e�~��&@ggSqk@h���Օ&@j]�eA%�@k�wJG3�@m�Z����@o4��q�@pv9y�P�@qX�[M�?@rB���К@s3-:�M�@t*�#��@u(���e@v-�K#,\@w9��{G@xJ����J@yb@���@z��/G@{����,@|�1��
@}�ٹQJ?@2�|��_@�7(1�D\@��>;.�@�|6Ԉ�@�#}\�k        ?ki�=��?�='�+?�ы�k�?����ŧ,?���3J0L?�[.l��@I�R�@:�·�r@G�ͽ=>@%���gn"@0ō��|@8Ɋ&k@A�!�D��@H��~/��@P�FԌE�@U�PR{@\�>l4T@a�DwK�@fn@���@j��P�@B@pLb$��
@sv��*r�@w����W@z�;��R@N���e@��Gq�@���/\�@���Ȃ�@����u�@��y��@��"���@����-)@��	���9@�/@���@��C3��@�+����@��G��x@���_�@�r8l�_@������@����6=�@��@~z@���:97@��1��Q@��f����@���G��@��A�@�5P��G@�p���_1@��幫��@�
����@�i���Z@�ԉ�"}%@�J��B}@�����H@�Z]��/@��w�?@�@�L5^�`@�$*��"@�揂E@��c�b�@�Έ�n1@ĽG�2k        ?���i�mG?���clg?����2[?�ݽL��>?��!@�XE
��@�h�=�@���c��@"hrS�@*�~f��@3�<��@:���١�@B�5��@HUo|`�?@P��+�X@T�VW�~@Z���b5@`���9 @e<E�ؠ@i׶����@on�v�!�@r�}v}�@v�����O@z��x��@#"iV��@�6��Dp@��.� �@�ܚ>`��@�&��::�@��R���@�H��&)@�[ e��@���h��@�����c@����d�@�:���`�@����@����捒@�;���@������@��g9ULY@��[��0m@��B�&��@��� ��@�<@`H�{@���
 �8@�p>�v�@�e�:
��@��mk~�@�;��P�@��Jna	_@�S㶥[@��jJ3Ki@������@�w�ej��@�(��cQ@��(��@�P�~�@� /g��Q@�.|��.@�E���@�c��u3@Ǌ�=� !        @���u;@GM�8V�@c��ȴ@t�:����@�Z++Ԏ@�m��2�@�Np��V�@�y7e�>,@��3��h@���ʫ�@��i0�<@� -V@�^��0j$@�G�ı�@�D��� @�l3���	@��$񀑧@űsa�UB@ȳ5� �@��2��@ςǩkKp@ѪgѪf@ӷ�{c��@���D�&@�A/2s�@ڽ86-�@�^�~o��@�n�Yd@��}��@�-Jx�@䪛Et��@�Wf,�#�@��K�\2@��r�u,�@���K�8@�������@��r��I�@���Iߠ�@��܂�V@�5_�d̙@�c���@��uf���@�ۚǻ�@�&_�V�@�z���@�ت���@�@8شs@��c��D/@�,]�plA X W���A��l�A��k��kA��	Կ�A�j�Z��Ae��u�rAA�O��A"{�~�A0@F*�A�*���A�����A	�9�0O�A
ù���A��d�{        ?��O���?�d56F[?�m�+0��?�����@��/I@�T�rl�@�މm��@mdc?PQ@#���W��@(�=�v$�@.Cs&�hF@22���(@5��4@9)��Ԉ~@=pg��@@�����|@B��
��@E64�ҫy@G��𔟺@JZ@�<�E@M!�@g��@PTgB3@Q����K@S'��t@T�J��P�@V�����@Xc����@ZF�i#�H@\;�v9{�@^B��7�@`.@�s�F@aD���}�@bdֵ�J[@c���+@d�p����@f�-��^@gJw*�v@h���B;�@i�T0H�@k_��&�@l��O[Q8@nJ�=�J@o����2�@p�#\R@q~=GM@rQ�(�6@s,��=@t8�"e�@t��Ga@u�10aǌ@v��^�hq@w�ÛN@x��h�%@y�'�]M-@z��˘�@{�1	�@}3�t@�@~&��xc@M�/�G@�=�Xڛ@��P
m�r@�v�c@�.���        ?a\Z�c�D?�	�N���?�E�ǫ:�?אE���n?�?jLD?��8���~@GA�ݍA@�g��ng@�����@@"�:�1a/@*�8�?g@1�	zcF�@8pe�@?�;+� @D�����>@Ja�a+ͫ@P�H�4��@T�g�=g�@Y�:�v�@_%�h���@b�����@fq����0@j�w)~d@o9W]H�@r2�DL�%@u��:@x7�傧m@{��筦%@r¾Fx�@��Oldi�@���%�<�@�dŌ���@�������@��fI7@���E�]@��C/_*�@�����1@�r��1�@�]��]v@�hE!0�@����|�@�ߠ�h�@�OT=�2�@���T�$�@�O-إ��@��_�;o�@�F3��	.@��g�W�@����/�@�ZƁ|�Z@�:Q�}�@�1�����@�!/���%@�6A�@�W���_8@��'�\c�@���K�h@������@�g�=-pY@��_~�oX@�E����@�����@�aiV'ӑ        ?t�Q�Ê�?����N�?�z�:�?��L�a?���LlM?�����˝@��Jw�@��OM'@s���&@!kr�0m�@(,��ao@0eg-H��@5�#_\�@<} �xu�@BP	z��@G5��ɍ@MA�@Q�{Ns�@U�ī�:�@Z���ZAS@_�8R�@b�8����@f\��6�@j2�&g�@ny���œ@q�^hG�@t=�~��@w!ͼ
��@zL�6�Q�@}�Y��t�@����f��@��=?�@���j�':@�]5�Գ@��q_�#@���P��]@���l38@�Rr�v�@��͎�q@��L��@��j�sSi@�����@���fR9@��r@[}�@��C�>@����D$�@����>�@�J��@@���ұ�@�+� Xv@������]@�7Y!1=@���f҂�@��T�#@�a;�
�@�lXJX�@����rb@���!��@�%�P�Ey@�;�V+�F@�[��6P@���U}��@����8�E        @"-�(��@Qx�*g5g@jxM��"�@|���(X@����~�@�A�h�@#@��3�3��@�ju_@��Qc�Ī@����W��@��\��S}@�ܑ�b��@����2@��#8��@Ù����t@ƞ�A�pK@��n�cQ>@�c[t���@Г_�68@Җ�~[y�@Խ�ŃE}@���0��@�y���@@�2�Z�@��.3�@@�ہP-�:@�dP$��@��o6�2@嶲T4.@灀ɜܺ@�c�$5X�@�]�+���@�p`4�@���R�@��a�O�-@�h�C:�@�[	��k�@��<� N�@�����	 @�YOB��!@��G���p@�Be%Ij@��ټ|\�@�^���_@����A YZ2�c�A9
񩷙A )�&g�A�7���A\�#ߣA�,��A
�],(AglN�5A.�~�BA	M����A
t���'A�<^�A��7��TA8�\�(Ae��e�A[?|((rA?a�9�A�����        ?�����6?����X�?��$�^�?���|?�e|���?� �ˢ�@i4�ز�@��6l[@�%�mҐ@���]}@~����@"���@%�C�%@)�'2�X@.S���a@1�H��j@4M�*Sz�@73�3T�@:Q}�Z�F@=���F�@@��p�|�@B�3 c@D�S�[��@F�;�x`@H�G�/�X@K98K���@M��j��@P(��O@Q��_;��@R��R�0�@T{ph]�@V"�aW�@W�`��] @Yw�$ʳ�@[J9��[@]23h�@_0~��m�@`��>�0�@a��y'" @b�����Y@d"��®@eKYI(��@f�
AxΞ@g����F@i^��C�@j�b/��E@lc�_�@m���8 @o�uVG�@p�)Z%F@q�⴩g-@r�XV�<�@s����z@t����4�@u�Z/4@v�&��@w��d %@x�f|Sv@z+�)\4@{MJxN@|��x6�@}�qK��@0rR�        ?�o�^B�?�,©:��?�S�*]�q?���)�J?�N,/�@uVG9��@^3ɓz@�9��@ I%+՝@&�ࡦ%@/V����@5�fV��@<n%�@BRO�M{�@G�"~��@N&t[�C@R���d@W�+n��@]-��_τ@aΒ��)�@e�D��3@i��yJ2@n�����@rs%�X@u'�2mX@x���f�@|f��?�@�M|Q`��@��S�&��@�"(�H	�@��c؜b!@�܀��@����@��R~'2@��x��'�@��ш��@�й�ZU�@��6\�;@����=��@�/d��@�{NfUZg@���օ@����.@�-��v�k@���ֵF�@��H�8��@���N���@������'@�򅛾�x@��ko���@��Q}���@�oqs�?@�`A�au�@��F��BQ@�2����)@����]�]@�Jld��@��@s��@��h�xw�@�v����@��L�G�D@��-�}ɺ@©:j�n        ?tf�>:?���:u�F?�37ƅ?ẦJ��?���U��@��g�@�.?-�e@)�rT�@&��?u�@1PحѺ�@9!�9џ�@A�KĴ}*@H5����@P1�����@U5��F?@[@J���@a3�Q0O�@e_i�8@j*��K�@o��~�^�@rݷ��~@vE��C��@z_(��:@~'b�@�Q� &�>@�����S�@�[40���@�&�[��@�"I	3Dw@�M���@�U��>n@��2⥈@����R}�@��~~9;@��倆F@�2e��@�xX�H*@��	�,K@�)[����@�t.ʠ@�̸��F�@�30�KU@���1H@�*���5@���Б�4@�]����@���ؼ@���hE�@�Ov$9@�?*f���@�7���ѕ@�8N��	@�A�3=�@�SU�Ѣ�@�m��;�@���5��Y@��^���@��sG�K@�3��`b"@�|�K�>:@�ω��A@�+��|�@�H�� ��        @g/Ͱ��@H�hs�"@dV�s;z{@v��a���@�As0'�@����@�+K+�B@��]J��@����Av�@�9}r�S�@�2���^@����@t]@�[�Ju@�@�o]S�@�ظ]��@�L�b�i�@��7�v32@ǔ�9���@�~!�	r<@͖�ؼ"�@�p�b@�-�F.	@��@�s@��\q��@���J�@�.v��SK@�u���E@�ۓ
��@�`���@�+���r@�f���#@��xy��@�bN��@��
��#�@�+�@�f�k��@�:��.��@�$ES�M^@��t]�y@�	~j�@�H�wV*@��߼�v�@�ǐ��@�Kp��!�@��=���@���(��@�`�b��@�ڿ0<��@�d1me��@��)9A�sA R��q�A/4�v7A�}G�BA���R	�A��	��A���P�A�ϏS&A�F�V�A��x� A	9��[�A
_�.\�A� b�QwA�l���        ?�m���;?�q���N?򫡦|��@� @�M@+B��R�@ `$�r��@([��{�@1	�Rt�@6��Vk=V@={���)@B����^�@F��o��)@K��V-�i@PxX��p@S\�7��@V��|�z@Y��ϖA@]�$;�
@`���th@bÅU "�@d�f7@g=osB�@i��xdi @l,����@n�_���@pǥ��.�@r6��|IX@s�$,٠�@uC9~�R�@v�a�>@x�����@zL�n��%@|��x�@}�`X��@�:+�2$@��ri	�@��j��4�@�Gk�`@�"v�P,@�AiJ�@�g�T��Z@��_�l��@��2�l�@�"�%(�@�I�,u@���X��T@��`�3�@�:Zy
�@�K��I��@��I6��B@������@�hu�?TE@�!�3f�@�ݰ>��@���AXpJ@�\�&���@�� ��@������@����J^�@�v�x�40@�C�F�ld@��P�d�@����        ?� S6A�I?�U�O�
@)&/�$@"Ӽ"y@1]nk=v�@;�`���O@Do�(ԃ2@L:A��	@R��.�؏@W��,^@]�Tm�@ba���d�@f8[��8@j�Q6hy@oT�y�Z@rV���L�@uMPi�V�@x���	[@|.���Zc@�d��l�@�=@ 3ݡ@������R@�-N@%fA@�����E@���J�@�t3j��@��r�/�@��'p4@���tj�@��`�;�@�1,m~�@��:��D@�5�BTʺ@����&�@�k��?n�@��s�D!�@��[n�?�@�?����@��5K�@��<$@��j��R@���8��J@��k�@���i v@������'@� ���D@�C����+@��A���@����Q@�Y5C�8�@���ˤI�@�T�܂K@����cZ�@��+b�l@��>����@�v�ƒ��@�[��U@�G��-�@�:�0�#@�5�2Au@�6�l�R�@�?��G�@�O�n��K        ?�����`?�v�q�8�?�p��?���/���@��`�@�9��f @�F4�AW@$�1B��p@-ڄ�@5x���@=
P�	L�@C��(�@J"��o=/@Q��� @V��x,�@[��tk�@a�Ԡ2Y@e�m?�@jy�NAp@o����g@s��.i@v���@z��ת~�@~鰷DR@��M����@�wF?r0@�PPʆS�@�fy@�0@�����@��&j,�@��d<Rt�@����J�G@���1�T@�&��� @�������@�F�cӭ@������@�G�}�@����1Y�@�B�Z0�5@���3C@��t9
@����M�@���ؓn�@����@��띋i@�ں���,@��0��'@�f���@���w�\@�+]D��@����@�)c�S�@��[�J�@�`����@�V2M��@�h�x�,@�O�`��@�>���0�@�5J�֫�@�3y����@�9�����@�G���/�        @<5�Z]��@r��nj�@����ڔ@����9�@�]S�<N�@��*oEV�@ů<
�h@��S۰�@�ȇaxV�@�C�����@�l�>��@� �zN�@��g���@��a9� t@�h}K5�@�1��@��t�D��@�YCPz�@�9rQ32�@�CdƓ	�A ;=���oA��$A!A��u[A��{�-Ajg����A	hHry�Ay���A�xc��A�Z�6�`A<ÊO�AF�4��NA�}`�(^A�"��4AƊ���Aqhl��~A����9qAByDp+�A���`�CA:�j;�/Aĥ{��ZA +��`�A ���;A!�Ky�7�A"��8��A#}����A$[H�ew:A%=W��A&"A��&A'
�6$� A'�Q[�@A(��p��A)�5ž�/A*�7��C�A+���K�A,��Y,�A-���Q�<A.�c�k&�A/� ��8$A0Z�U��A0�5����A1_���a@A1��n��A2i�R��        ?��_b1�?�l
�2x@ 蘦��@�ac�͸@J�}�@(j�9iR�@1�.�Չ�@7��w�.@?&`�&m�@C�����@HF�1u�@MVo��͌@Qo�p��=@Tp�|GOu@W��W��J@[.-Ȝ+�@^�ԥ�~�@ax���@c�����]@e��#��@h^�ㄱA@j�H��@m�g�sH@pZ�95�@q��0,�)@s��HvK)@u;�	�G@w���1}@x�&����@z��b�Gi@|Ŝ���@~���9)@�z�j��@���k�#@���7zw-@�ڱ_�P�@�
�OK@�@���@��nī�@���e��@�ѯx�@�i�$�@�ǩ���@�-�@R�#@��ffh�@���'jo�@�G$T�l�@�	�p��@�υǭL@����j@�f+#=O@�6�v��T@�
W{V�@��Pe&�@��~|+6�@����C<�@�yq�b�@�]4EК@�D&10@�.Br��@�~ن�@��X5W@��'� �r        ?���0)%?��|���?��?9<?�kP}�֘?�ؗ� �@;gCl0�@Bd1Q�f@!x|��K@,�*���@6yϚd�	@@� �d@H�)ҿ�@Q@^�	-@W����N@_d��>@ds��=�@j�N�@pb�]̝D@t9O��@x�����	@}�Ľ��:@�}�s'��@�������@�ɖ�2
�@�W|����@�)
��p�@��M"&@��2�i�@�]/	��@�y{6:@��ƨ�}@��06An@�1�@��D@��U*Ȳ@��A��@��ղ��@�K���u_@��S�4@����W�@��	�nn�@�n��:�@�e�/��2@��-��"�@���e	�@��B0��@�~T@�j@�7�6���@�se��@��m���@��߫q@�k�[�|@��B�ia�@�M_��@��mڳk@�/�1.=@��f��{@��$D<�@ª��|v@É�0$@�n�6^�@�Yb�1˫@�If�r.@�>�7���        ?�{lj�?���{G@�F�4&�@q�W�m@" ��!��@+�a�2@3���N%/@:�:+�82@A��;��"@F��-z�@L�Ƀ���@Q纆�@V�W�@[�  �]@`eo��`@c�*�)�@gy��ŉ�@k���w@pH�m�@r�Lga��@u�G�h�@y@��s�@|�3��@�e��p��@��p����@��-�N��@�H���@��lt@��X���@��92$�7@�PҞ��@����Cw@��lD�[@�@,d@���g@����$)*@���s2�s@��AS�y@������@�����P@��~���@��z�[@��^;�R@�"�g���@�I�p\��@�y-�^�+@��|��{�@��A��l�@�8�@��@���3���@�楬�0.@�L�C��@�^���n�@�	��3}@��,.�3�@���4�0@�|\���@�S�lC�i@�2m��/@��6�@�)t�[@���.�yY@�����        @U��ZfY@�L�8o3�@���T{�1@��}��@�d���$@�F��t @�R����@�^���	@�@�β��@�����@�7�M�V�@��g�J��@�kG�CW@��g��@����@����X�@�4Xf��@����ё�A�·_��A|v��ZA{�+���A��0̠A	̍����A��tA�#c ��A��h:b:A�i����A(�7��A�DRD�cA�:�u3ZAi&s�PA���VAi���SA���p��A�W7JA#L�O�A bI���=A!6qv�9�A")����A"逄��A#ȀB7A$�,����A%��QQ|�A&{�%  �A'i&=L�A(Zm����A)O\w�I�A*G�\��IA+DD߹�A,D<����A-Gخ}_�A.O
��A/Y��<�QA03��H�GA0����TA1Gj�%��A1ӷ}̈A2a�H ��A2�{����A3��j5#rA4c1�A4���r9A5Ao��1)        ?�i�Ά:#?��v�=?��� Y�&?�qB8��?��VN>`{@���
^@��Ӝ]@�@�l��@x����@!��,u@%X.���@*<��G�@/����@2���Y	@6Fx�%��@9��ૡq@>�B(*@A?`�Z�@C��26��@FK
���<@I!��D��@L1vN(@O{1S9�B@Q�u|�I�@Sb6={4@Uc�^��?@W��=b�v@Y����@\-���)�@^���J �@`�3����@bR9�Q�@c� I;@eem�:�@f�� 9@h_�~]@j��X��@k�oJ
��@mԮM�֐@o�H����@p�q��z@q����@s�.�#@t-S}S�S@uU`�W�@v��/̦@w�S_CO@y@Q�9@zKgf��Z@{�5h�3@|��(�@~]w\
�x@�����@����>@�^{�m�J@�!�+i�@�����@��j$/@���I@�^���d@�:M6qX�@�
�'iW@� �J�i�        ?}�uƀ�?����j�?���x0?ۓ���X�?�\dƌg�?������@,�k	V�@�bfQ5@��{\�(@�[�;��@$��v�@,��d�8�@3Iy�=X�@9a'��B@@e�\�-@D�z&,b�@J�(���@P!����@S� z��m@W��
�@\m��]�@`�f5��?@cǍ�n�@gV0><t@j����@n������@q�)�7�@s���q�@v����c�@y�ujXJ�@|�-����@�
 4�jD@��y�vl�@�ۄ�@���-�/p@�E}%� �@���]��@�T����f@�G<�.U@��V��h�@�b�ى@��233т@���T6}�@�s}�@�n���S-@���nQ�H@�����i�@��A_�9}@���VX^�@���b&�@�ZuB��(@����hb�@�9P|���@��GϘqy@�\�3my@�	�n�|l@�ȥ1`P�@����[�@��i�U�@��ɻ\@�çN��i@����=��@���mŤ�        ?��-ܱ?�Z��D��?�T�N�M?�s�b9*?��W��@�2 !�,@���m
�@G���� @�L@�t�@#��#��@*<����@1B�_��@6Z��f��@<�@�^ՙ@B {�,]�@Fr��8�&@K��
�@P�);��@T����'X@X�n8��@]j'��11@ak��@d}��J`�@g�[K�,@k����W@p)Z�m@r|y�8�@u$��(��@xk�d'�@{F�S�8@~�A�}��@�M��`;@�`ƊӒ@��/�D�@�i��2d@����Go@�y3�l�@�>^C�\@��)���D@���s��@�i���u!@�]s�2 @�p�5@���7u��@�����@�5�ҟVO@���'h�@����ŝ'@�PL����@�ӓ_x��@�j) <G@�~2Y�6@����oL�@���$�H@����A@@�E��4�@�O�y@�cv���t@���46!@��Ŋ]��@����I@�%�T��@�siml"K        @ l�k���@N�2@��@iE���@|sA�E�@�V%��@��>0�@���m��@���>T��@����D^l@�X
�=�@�Q�>J�0@�Ĺ]J�Y@��;�p@���p��@đ��@�֍7��@�f�*+2�@�E���2@ѻWʊ��@��i��'�@�mw$�*9@�	�|�8Z@�Ԏ���T@�����/@��1�p @���Q�@�toړ�4@�W#*��@�T��LF@�mE�w@조6���@��EW �@𯱬%�\@���y� @�H!9�z@��(�6�@��ڀ��@���]n�@�'�F�u�@���@,��@�n^�\�-@�'$Y!ؐ@��-�N/A �s*#�A��^�ыA�-ɐ-A�IcA�N��yA�.�<c�A��^�8�A�-���A	-x���A
U�ɱ�)A���)�_A�~��Y�A�3���A>IC�aAEx��FyA�$���A��|���AO�}�A��5�jA�K���        ?p6�bCK>?�6W���?�����
)?������6?��0�T��?��A�	-}?�=�{�Z�@ g,�Í @ ���@�w��@B��a�@�v�_)@�y2DM1@ �'�a�@#�}Z�@&��b�:@*����]@.�M2{�U@1h��c<@3��(��@6]g6���@9R��@@;��gr��@?駵I@A'�J,�a@B�Wb}@D��DgZ�@F�7�hb@H�4��@J�{%�H@ML/Xt��@O�3�G�@Q1����@R�r�7�c@T
���E@U��w�N@W5u��@X�m{��d@Z��\\h@\�hK��W@^������@`I���+�@aZs�3�@bv���r@c�dÑ�@dѩ��UF@f��ӳ�@g[kn3�r@h��u7@j`��{�@k�[����@l�ڀ��J@n�ֻr@p�'&7@p��&��@q�9����@r����@@sg��J�@tN���@u=��
�@v3�ΚM�@w0����@x4�h�>8        ?R[�])4?�Z��ҥ?�K� k��?ɭ#����?���n'%�?�/^.^��@ ����O�@��=�?@��:Ɗ@$�s	f�@.�o�!��@6�i?J׽@@hT4��@F����l@OQ�A$�@T��R(p�@[��諍�@a��kM@f���G L@lb��u:@q�\�$@u��8;��@z:����P@��'i8@����|p@�>q�(D)@��*�m@�kXQ�w_@���!a��@�>��s�@�%RY\R�@�P!3K�@��zU��@����,>@����t�7@��ka�@�6V��i�@��&i��v@�I��M5@��2b�@��2l��@���8%�@�'��
@����gjy@����<��@�|��1@�k�����@�n���e@�����D@�ؘa���@������@�"�a�W�@�Wu��=�@Ŗj�$��@�߲���@�3A
�{k@ɑ Hd8@���&�@�j�k���@��!�n�@�k:���@�|ռH��@�H��r�`        ?p�)�a<?� {Q?ì��P�?��'LZ�?콿ja�?��6����@���Q>c@��@��@.��/�@#��b[И@+�-�h<@3}͜�o@9d�v�\�@@��5�z@E6� 1�#@J����I@P{�GH�@T��,߫@X&鼐K'@\�v���@`�o�r@c�Jh�n�@f�~���@j<���"@m��TՒa@q	�z
@sD5���@u�DAe�&@xSh��o@{-K���:@~A����*@�ɳ,�W�@�����*�@�|���C@��C���@���%���@�-��@���. k @�����@�|�wM_�@���T!�w@���ní�@�-xNt�@��ȴ�	q@���}��@��u�@g@���T���@��:Rj9w@����#0:@�!�i�>k@�T����@��w��T�@��d�E�@�;�6*��@��Lr�*@���EO�@����?T@�,e7�M+@��+s��@�;�`�}3@�<��:@�����K?@����k��        ?��-R�+@0�"�ݎz@P(�K@c�hJgo@sz���@�N�KR@�ߡ��q�@��RK��@�ȜqD�S@������`@��1gI+@�w��6V@���3Ai�@�>��@�zs�@��ۏ@��Qڳ�]@��ޑI�@�rd2c@��ZsW�@ǩ~�'8i@ʏ��Ys�@ͨZ�2�@�zG����@�:��8"�@��ӷ�a@�����@�<�l�.@�P<Cg��@ܠ�V�Gy@��i��@��\���@�-��ʬ�@�`j��@����
�@�ʗ�-@�U����)@��7��@��w����@��>�Oӓ@�7f��@��ȭn��@��9ҴХ@����<@�-%�LN@�[���L@���w�@�����@�%�?��@�}��9��@�ߞ$E3@�KNMC��@���ѡoA �G�A ��Po
�A��v��Az����AM��c�DA&��]�A�?%A���xA����,�A���P5        ?��
G�1?�>�N���?��E���O?���h*vu@̯8C%s@�e�3&@��	!E@!�O���5@&�,<���@,��c�Uq@1���kV@5M�-
W@8�\�e�@=m����@@�`Zď�@C}F�ߌ@E�h��%�@H>t��k�@K��F@M��r �@P�;J~��@R/�!tr�@S��j���@U��-�Q@W�$:u@Y����@[��7�@]Õ�r%y@` W�ys@a*��<�C@ba
v�7@c��}0T9@d�U�_�@fN$�@@g�T�S��@i+��A��@j��w[A�@l=j�>�@m�R�,�@o��h��@p� �b�@q��K+*�@ri{�`Z�@sX�4�D�@tN���@uIVNx��@vJ!g=+h@wP'�V@x[�jg�@yj���?@z~��Ȇ@{���g@|�!|��@}������@~��e��2@���(@����eE�@�E�U"^@����8�@�����ah@�!�;�l@��E�ߞ)@�k�7F7        ?�{�?�D)8�X?Ѱ|_<P?��Z3p�?�.���@ʞ�Z�@
�]���@�H��g@�֖�P@#���	��@*��fXz�@1����t�@7DwkFz@>*-3�@C��NP@G�� ��[@M����a@R*t���A@U�:3��@Z[���@_K�#ZK@bl�v�Ev@e���M�@h��Z�9�@l̘lr��@p��!!�@r�%�@u[l��@x���y\@{"��~@~g�j(�)@����&h/@���0�@��4m���@�%�M�@���?�A@�y��o@���q��@��^\�@�V���@���gvz@����ܼ@�(`TS@�jФ��@�qgL�j@���I7C�@���[�P@��篺�@�S�b�@����^}{@���C9�@�dIN��~@��;K>q@�j���8@�o��y�@���g�&�@�u؊�FF@�$V�*r
@�YDlt@�A�)l@�_���Z@�- �9�P@�Iq|�1�        ?�Q`�-�?۲ÐKB?��;H�f@\���fI@���?@#����@" ����@(%����@/H&t�ɪ@3���]�@8�yᔸ@>��$��@B���)��@F�<؆��@K&��'�G@P5��{�@S>�Cyq@V�-�w�@Z�
�e��@_+�ri�@b�eNȥ@d�n+�E�@h&�`'�\@k�$���@o�o�-��@q�T��9@te�� �_@w	/q4xK@y�l��@}[!�7�@�@}gi��@�217��@�4� �@�G� �L�@����
�r@��5�f@���]�n�@�K�+�|@��1�sL@�h�����@�v����@��{hܛ@��O�b��@�����T�@���;��@�"*��]�@������@��p��@�@���@���=���@�^f�@�����@�~���@�����<@�W�4�f@��$@��1^��,@��e��=@��P�C�@��v�qK(@����8�@�	���@�*9�O�        @9%�Q�@g�Lk���@���k@���P|��@��8����@�X�%o�@���~@�I��Tb>@�&��bi�@��e�Z/@�8��!��@�ÿ*�`�@��@7�;�@�i݇��@�+3�&�m@�ᓬ�X@�&��Y�@�`�+��@�`fN3|@�$J���@���-��@��+]�@��t�_�;@���e��@� *RD�@�\�]��f@��G<sf�@�".�@�JW�'r�@��z>t;�@��/r���@�R���@�ą�v<�@�D�s�@��\����@�pG��@�E�e�A js=1]�AN|�Y�A9��E��A+�b��A$���n�A$����A*y��ֈA6O�E�AF��t�:A	\�-�TA
t�q��A��f�y�A�e�(��A�l�~�A��}��/A	���yA�j�%ȥA71����A�x�4�%Ag`^��%A�Z��A��-���A=U.��A�L�h�A��ì��A'�H���        ?��/h�s?����?��{���?�~���@�HzT��@F1N�*@�s���@ 4s�l�@%Rj+y|�@++����M@0������@4�2R_�A@8��v��@=�B)x�@@��=�@C����W�@F��:��@I���~x@MKG/��@PRQ(l��@R9]�{�@T< fo�@VY�?��[@X��#��@Z�+z�M@]Xe��^@_�#�G��@aJk�Q�@b�����@d%�ҿ��@e����@g@���7@h�t 2��@j��K*h�@ld_FՖ@n<���f@p?���@q��[^@r�E.�@s%�iӎ�@t=ݟX@u\���=P@v���@w������@x��4�g2@z0�1��P@{{P9�t�@|Ι��@~*���&�@�4�,� @�~6@=@�9�u��@��:�
��@����:��@��5}3�@�O�>��@��]5�@��)%ܓ@�˂�~Vd@��p�o8@������@�n9�QL�@�X ��Ɏ        ?����dy?�l��)H�?�-zU���?�4i�yS?�8���@ 0��d�@	N,m�r�@ϟH�@����Y@"�9�"HW@)��p���@14WU�G@6���	�;@=X����n@B��(�h@G�2�4�@MXX� D%@R����@U�+[�;@ZJ���@_F!�V@bn3�h�@e�؛�-@h�=��@l�*?B��@pt�ؔ@r�6�K�Z@u(��@w�"��)@z���㎉@}��i�9@�u�:�`@�.NMڝ@���sy�@���_.$ @�����¯@�)��z=@�rl�@�ٍ�Q.�@��y��f]@��L�V@�i�9�Ŏ@���(�@�hO�Լ@��,�Ž@��Eu��@�q��K@�E��W�@�.�Lv)@����5�p@��uI:��@��}��D�@���^��e@�.�%��@�:1��@�?.���@���he�w@�/v^�1N@����NB@��<��@��?\��@����aa@���\��5        ?N50��?�XK�*q?��3(�[?��X?���?�[�0I�?�=�z��@����_@>���*�@^vBon@"$�,xV@)T��@1O½�@72RKT��@>����M@C�˱�@I2�Ƿ@Ooj���@SlJj�-@W�	@t�.@\�S�w5�@a�����@d��H3�@g�oy6�@kSIS@o|����@reI@t���@w5����@z$+����@}P��Ta@�^�o�3@�5�o�C�@�/���@�M��M�q@����%��@�� D~c@�����@�"�Ũ @���j
��@��\�?@����'�@�p�F1��@�>T��<�@�$�kwh@�$%��S�@�=�8&`G@�9 
,�i@�`ΗZS@�������@�ڵr��K@�-e���Y@���Y��@���J��+@��޶@��aF��@��#�!1@�]#m��@�[HY�@���;�C�@��p�N"@����u�@�ޥm/C�@���8t        @.���<�r@_pz��n@z>^^�Y_@�~U�3�@����r@�-#U��n@��)AM@��h�G@��V��@�j��@�O�{�s@ȧ�b�a�@�u+ǾW@�^�O��'@�BÊpf@�h�2�[@���bn0@ނ:���+@�<A�p�'@�[��9@���R�@�		*��D@�q���@�J�����@����\D@�v�~�@�!���4�@��rW,�N@�{�1���@�DV�n@�����U@�kHQ�@�Ff|�A �:���A#�H9�fA@�.��AgC�� A�q
�M�A�Y�0)A�����AbaH6A	����[�A|>���A�Zh�>A�B���EAy\��j�A�fS�wlAKX����A�u��A�!_���A�[��5A�u\��A�S	n��Aw�D���Ag��]�A]7���AXZ�X��AY�j{(A_I:�vUAj�rFA|y�_�A��/A	�A��ɲp        ?��w��e�?�@�D�#5?�E[���1?�hi�1�?�y�d�@}B	Oy@�W���@2��6@���H(T@"�^���@'î0��F@- M�)"@1�4,���@4�����@8Z���@<3o��~�@@+N�E��@Bb��M�@D���{�@GF_����@I�����@L��n���@O����@Q��m��@S3}0!�@T���sV@V�1�r2@X�MH��@Z��!1v�@]1�����@_�N=�[@a-�N��@bPj�RO[@c�[��-@e"��	��@f�m_eЃ@h?�NAy�@i������@k��s��@m�� 11@onx|��=@p�+�V@q�g��t�@r��=��@s�M�+@u.�W&@@vh�5(@w��\0��@y lo�vq@z^	��[�@{�{����@}<�Շ �@~����@�%���@��,�w1�@���)q�_@��k� j�@�|%%~x @�an�κ@�Lcl8@�=�!��@�5p.�@�3�Es�        ?�\e&%S�?֌����?�s�þ~@&g#+@ 6���@+�J<�-@5��(l5�@?M����@E�F�,ӝ@Lۘej��@R�[���.@W�w�Z@]񢼨]S@b|L�T�@f��
��@k' i���@p/ωا�@svW�B�@v\����@y�!&]]�@}�J��@�H_ݻ�@�otݒ��@��[� ެ@��\�y�@���$dt@���D���@�'r�@��`�D��@���W5@��TY�P@�Z3�ZPP@��u�k�@�_�����@�����4s@��8r�@������@�JL��.W@�KWGF@���MD�@���V,�@��<G�׽@�1�1���@��ҕ7��@������n@�=����@��� �a�@��{:H�@�o�fˊ@���[�@��I���@�9>��_r@��42.��@�Ò憖@��cD&�@�̧�W|e@���"�@�@��g7;�x@����#�9@�ľ��t@�LH��	�@ȇsB���@�ΓaGN�        ?d4�+�??�#����?��? ��?�L��rθ?�����I?��C
)�7@�o�7�@�g��@�]��l@$*u�@-�?���5@5\�`V@=�u��e@D7&jK�@Jr�\��:@Q�)�M^@U�ho��@ZՔ�ax�@`n5."�@c�ע�@g�jQ}Y@k�	O�Z@pS��Ď@r�Vj�U@u������@x�8N��V@{��K��Z@�*�.O@��]���@��݆I�@���Z��F@��x�կ!@�Y�P	@�ܾ-��@���6H�5@�)Yr�)f@��䚩/U@�2ˁ"Aj@��ҹ���@������@�ag��=�@�I���N@�I��l�@�ci6 �@��V� H2@��C>�@�&�u�[@�i�K��@���bi�@�۔�e�@��@�0�@�	R��3@��jO���@�7Ԕ���@���z'��@�TK��y@�=$|Q�@�.~���@�(^���(@�*��h`@�5�;X�z@�H�n�F�@�d���J        @M.Y0(@Q	SJ�*@p��"\r@��V��@���L"@���pv��@�ӳ��t�@�_d��=�@�%����t@��-�/3	@ˋ��@ƫ��$j@�,�L�ǥ@�	�e��[@ҮT�+��@Ճ�6�@؈Ye�*h@ۻ��T�@�PU��z@�T���F&@�2&�z�@�%���?@�/�rH�;@�Qu�� @�%�o"@��Q5F«@�"��~�@�et	pY@��bY@�v�[�n@��	�J�@��8b�5@���mUڃ@�>���=@���T[��@����{�2@��f�ee�A �%��o�A���EA�v�(�A��C��A�V⁳APU�T�A�	+�OpA�&i� A
%��E�TA�{�A�-�h�Aa��I�A��b�A�&�8�A���J�UAP�i���A&Q��CA��1�A�#hp��Aƀ$�J A�T@��A��f))UA�MBRA�M[�%A�S�˞�A��r��        ?�̈R�l?����?أ\j3��?�K)(�]P?�ay�A��@)}�"�@�C���@�.��lF@�߀�I�@Y���@#_K,��f@'xiN�O�@+�g�(@0vW�|
@3).���@6�SK��@9M$�O}�@<Ȅ�!01@@G��'�t@BS(�Bd@D��Y+0@F���a@Ih~S�L�@L%.E�@N�Nn?��@P��NG�@R�W>�@T; ��@U�=~�-@W����y@Y��mop�@[͚��*@]��<��:@`� C�@a=39�S�@bs���p�@c�GF�W@e
�_l~@fk�b@��@g۠c�fu@i[u�G�@j�zi���@l��Xj.@n=�.��v@p (ƌ�@p�G/��@q�B��#�@r�-wO�@s�=(�=@t�"E�d@vd��@w#I�|d@xL���t�@y�_ݝ�@z�OB@B@|V�n�@}Q��ۨ�@~��S��;@��\�a@��r�bSY@�z/��u@�:ՙ���@� ]��n�        ?T(�����?�ߜ�ڢ�?���%6s?�߉�n?�ދj�o�?�N����?�����]@q)�HE�@���Y�@��'!C@$����5@.�4D�<@5�Ŧ���@=��
��@C��iY%�@I�fC�@P���|�@U	�[���@Z5x��@`��^@c�}�d�@g|~{���@k�Y���{@prn��c@s65-+0�@vD��3�H@y�V��`>@}L�JiB�@�����@��3�Ws#@�)?&e)@����?�@�g3=�� @�Pȴi�@�7Q^���@��V��t@��fp!@��k�y�R@��Ep�}�@����A*@��И��@�H�ހ��@�d"���@����VE@�ޣ*�h@��B1��?@��ԉ=�@��A��U@�Ha"3��@���O!@��Y��L@���Jl��@�N����@�Qd�Ă�@�^ �[�@�t��N��@���zŃ@����&ǻ@���vĄ@�:Hu�,@��?�;b�@�ߩBױ�@�C�����        ?�86��?��h�_]?�E&��?��-f��p@����Kq@����x"@)L_;j@"���Z@)b�G<8@1M)?@6���Ɵ@=�8����@C&m���d@HXR�Q@N���4�@R����@WF	�?s�@\H�˝�u@a���Υ@dRd�_��@h�̭x�@lB�u/N@p{&�_"C@s�����@u�L�%C@y&<W���@|���~Q@�3&�@�@+��3�@�w�ͣA@������@�kFzC�@�)_:@�k���@�í�=�@����K@��;$�@@�[KJ�G@�O�G�i@�^�iM؇@��S����@�ϙ�ܷ`@���W@�ؤ�}kO@�&�1�6'@���8���@���&�@�j�J�"�@��2��!@���_���@�8�!��1@��c���@��2�R`�@��&[�\@��jw.1@���v�@����&f�@����~@�訧X5O@��[#�	@�.�hF5Z@�^����@���p�3�        @>T{X�'@K��(��}@g)����@yl@��A�@��͎�Y@��o�uM(@�55���@�_����@�F����@�"c�UB�@�Xg!X�,@��GD�!�@���bm��@�_'{�P@���@ê��s�@�x��$@�3<�'@��[;U�=@��P@��y8�{@��ї��@�����x@�I�FR�@ڡ.�C@���L�@߮e:�ک@�2v�"W�@����@�]qݭ	@姗��H8@�F����@�����@���^�@�kF@�@�sm����@�6�I�@�=��vx�@�N\qn|�@�iW�5b@��%Sg@��z��v�@���Wr�@�=�p�
@��b,���@���}�@�L� }  @��:.�¸@�6����A ]�ն�A%��'�!A��"sqA�Tؽ�-A�A
Az���<A]�xVQAE�\��A4(ò�A(!yu�A	!�t��A
!���I�A'/:x �A2�K�0        ?��LϨ5�?��9����?��¶�B?��bC��?�G/���|?�zNv-�c@��E�@�r{Ï @NM�^h@o�����@B�KR�@!�ܜH�@%���o�@)�,��@.F�M�[@1��=R�@4=��<��@7?{_��@:���r�K@>����p@@�eX)�q@B���oD�@E/֖<�a@G�Y��9s@J�!.�@L�U�z@O�K�u�H@Q\z Τ@R�ݧ�#�@T�$&��'@Vy���H@X\�Fǀ@ZW�<J��@\j�6�B�@^�uٟ@`m��ch(@a�5��"�@b� �96�@d${v�]@e}	<��@f��u��@hZk�u^@iߊ���R@kt��ɋ.@m%�{�@n�	�:@c@pKS� ^@q7��@r+Hױ�@s(	j�P�@t-`K�h�@u;a�ڐI@vR%Fgi@wq����@x�>j���@y��#L�I@{wK��@|J��4��@}�"�y�@~����V@�(,��C@��V��@��`<ڻ         ?kR�!j<'?���ck�?şA�$s?�l�� �?�ő�b�E@��0��@L�\Kh@ �o�|@+b��Z�8@59�&|�@?yEt9��@Ft�&�@O i�Y@T�k ��@[6b��@al�����@e�G��K@k8�}�Q@p|�Z��U@s�ݡ��
@w��y�H�@{�/��a�@� V���q@���Ae�q@�[�s�;@�R�EYrn@��E�6Mk@����&b}@�Z/UH!@�WJ���@�v�$�
@������@� zSL�P@�����@�[>�ޠE@���ez�@����L��@�#��x�2@�Ĥ�Zn�@�wzd���@�;օ�L�@��a� �@���)��1@�񞳳��@�~3�/;�@���/?�p@����_@�Ƒh�b@��aԢ�W@�(��jW�@�iO��R>@���Xc?@����Ƈ@�n=�h@��^��b!@�V����@����]�@��	�+V@����6J@�^��.��@�;�_ݽ�@��']�@�fO��        ?sQM^�8?��ţ+�?�7����?�oxO?�����Q;?�;Yͷp�@br@f@͑H���@��9�@&䁏�j�@0�a�v��@7C�4�@?�2?�i@El�,��@L0�T&�D@R6vu|�&@W&M[�^@\��&7p@a�G
D!�@e����ek@jh�Xk�@o�cm�y5@r�~K�m@vj���@y��!��V@}���T@�2C�/'@���ĉ��@���]�v@��Z��@��;��_@�Cy�Y��@�<ϡ �\@�_ƹ�z�@����1H@�(�5�"@��.���@��[��x�@��
�g:�@�z
���'@�3�3.�&@��S׳@��gW�@�	Ʈ<��@�7٩A��@���w�;�@�y���J5@���,�5�@��U��@��Wh2~<@�j1m(@��D%���@�/6n�@���ݼ@����Q�@�z���H�@�1{N���@�.�ʩ�@�5^�\�#@�E%%��:@�^+���<@ŀww��C@Ƭn�5_        @Jq��@@m���f�@\�G|���@p�+�Ѹ@�,�ƒ�@���l&K@�p���V@�W��@�7@�f<L2��@����l�@�e�Y��@�����Z*@��=���@����@�������@�u��9@Ʊۋ�4@�=z	sC@�Oլ�@�#_�zB@�c߲/�-@��v���@�g��R��@�/�nA@�(�^�@@�1�)�@�]Frn�@�+����@�#z}!@� �+��@�Hk���@�Lә$@����-��@���@�����i@�s� ��j@�揱[F@�i��5a�@���h��@�� aW�@�W�D�#@�:a�@��!ƶ>EA s,{�=AtUn(�A�9O��A�{tm�(A����i�A�Rh6A1jsu�A�sh1A	��uL�jAI� q�AÊ���AK݌��GA�m@��AÛ�%�A�#��'BA}�OP 
Ae�]��AT��ٕAKzZ�ܣAIX�/Y        ?�˜a��Q?�D��?��!+L�U?���|<3?������@�xK��@���@�qo��@O�"��J@ �虴u�@%�Ƒ}@)�Xzk�@/ ȡ���@2c�%��@5�QzI��@9` �@<z)<@@h�'�@B��� �@D�D�9�@Gy�	��@J+�6f~�@M����|@P�!��H@Q������@Sj��F"�@U?��2�@W/m��kD@Y:׭^1�@[b=�bZ�@]�
N��@`RX�8�@aBA�h}@b�b@c�?�?�?@eZ�8v�@f��_ʓ @hd0�.�*@j""qs�@k���K�@mp��) �@oAZ�!R@p��AS�b@q�����@r��(Ū�@s��y	F)@t���5�@u�����Z@v��m��v@x;�}��@yJPh�=�@z���Q@{�a�x΂@}Xnl�Z@~t��+õ@�����@�������@�W�C�^@�����@��0��#*@����p{2@�a^�aa�@�-�|�G        ?�]\�; 
?�^4q?�n�u��?������@z�['@a��7!@'��_,@2�>uٗq@<�cv@D�g�b�,@MYU����@Td�eˣb@[���F�@bq��6@h���@n�&��� @s����R@x�r��@~D�0G�@�|]��bO@�\g��G@��ŉǩ@��v�e��@�Ԡ|��@��&���@�����>1@�ڭ�ͭ�@�6d���@�����,�@����EQ@���;��@��n]�%@�\n�!�j@�`L�C�e@��X�YA�@��g~�@�@�|(����@�;$���@�,��5m�@�)2���@�֢I�"@ğL�[0@ƃ��b�@Ȅ�HE�G@ʢ��D[@�����6�@�9 x�)@����2!@�%P�8�9@Ӂs{��@�흾y�@�i��&1�@����Wj(@ٔ6CAL@�B��9�8@����(@����s�@�Z�/I� @�T���k�@�W���<�@�c��QM�@�x�'~f�@喑(���        ?���r���?��*w�?䧠�
�Q?��"1#q@	+�s�@�͒N�N@ �cn_�@)	2�}@1��&�@8�4x��L@@��pq�@F��f.�@M�:l�t�@S��	U�@XU>���@^���,�V@c	�i���@ghB�"�@lz�Z�qG@q(�R7\�@t~!6G��@xE�}�ږ@|�4��iG@���� �@�N;�Q�@�>��@�7@�{���@��T���@�tH�%X@�����@��% ߵ@�J��qeQ@��,\���@�����]@�������@�~R���@�3j����@�׶�aV@��"���~@����6gT@��O@�Qv�ܵ@��u��@��j� <@�Y�8�`�@����St@�Hc Z�@��v�~&@�
kXj0x@���cZ�@�5R��@��/L��L@���t���@�-ڳ�7�@�/R-�@�Mm�Q�@��1����@���i�~�@� :U��(@�W2��@�+��_@�5�-E��@�T�~�*�        @+��� @^��;��@|ejH��N@���6W�@����3��@���848@�%Rv�}�@��v�>�U@��Eh�*@�Q�M5@˱��\q@��"L��@�.�hn@י��{�z@�k�m#�@߉9nz=�@����h�@�Y��<��@��ؓs7@隀1�pC@쀑��@�,��'�@�q�!!�@�2��!@��"@���]`�@�%N���`@�^Z���W@��d5�2�A {޻)Aeѿ��:A�[)��A3���%�A��a���AHɂj��A����A
�s�=�Ay�<��A]�"լA+}�SjA3����AE�Yy.HAch#l�A�hO��~A��.|��A �t��AKˣ�]A����knAHb�CAAs����A����O�Asû��`A ��D�A!Q�����A"&"#�A# u��.�A#��� ��A$�02�A%�cZ'�A&��`-A'����zA(�)ֆ�A)��ڃ]�        ?��	L��-?��-s$?ѓ��m�?��&_Q�?�YO4*��?�I%3��@s�r��N@�m�~/@�zs*�@+'�@~M@z��@#R-t��@'Tn�2�d@+�Z�ٚ@0_vH��=@3߁>R�@6+�7'�@9HE�@<��S#@@9RV>�F@B1���m�@DG���X@F{|<
��@H�|IH:@K=�<���@M�d����@P>iB~P�@Q��q�H@S�l��b@T����7@VDU[ O5@W����@Y��-o(U@[z�c���@]Z�a�_F@_L����h@`�jxR�k@a��[��k@b��к@c�2��U@e�koD@f;�����@gt��P��@h��͉�@j�e{��@kY�_�:X@l�+;�#�@n"S4�P@o��@p��6D �@qK�W�@r�5�+@r�� ɍ@s�4���c@t��yn(@ug���?-@vJ�Qmg�@w3;�{�Y@x"�jP>@y:�e��@z�9]_	@{�_~{@||nI        ?b�7��?�c�@/b?�M{����?ϒb.� �?�
5�E�?�2��o�?��+d��@X��@��Sf@F8�{
F@ ޅ��|�@'ǲ�@N1@0Y�8	��@5�{�EYr@=5�\8@B�B#��@H [�3M�@N1&���3@R��^$X�@V��np��@[�W	d8e@`�O���@c�'M@g�����@k�/��x�@o�3��[@rp�v���@u1�Ϛ@x� T&@{7�0�  @~�1��?@�*d�	X@�#�^x��@�?����T@�~M��;l@����s@�eS�ϯr@��p�h@�����@�g&�E��@�����@��%�2�@�B.��@�xr�Ċ@��*���@�ɘ�s��@�� ����@�n����,@��Q�X�@��T���5@�̕�"��@�'���@�C`��@���u��@��-����@�P����N@����3�@�D�u�a@����lZM@�8z�}�@�j�N$�@���
@��.��        ?Z�
��?�VID��?��>s9�?�J��1�?��ƿ�?��3&?��z1P�C?�uX�@����-@����l�@|:!�@$kuff(@,ٓ���1@3�DαTV@:�j���@As\��NF@Fs��44�@LaL�U˫@Q��	Hu�@U��x6�@Z:�=m?x@_hu�D��@b�c�$y@eݗL���@iy䳡]�@mw�A�f�@p�!AK^@sV�w�a@u���Y@x�0<��@{��+�X@U��zv@�~7� ��@�v<��(w@���d��@���ĺ.@�J�t��@��5y�x@����oy@�QȲs@��o�A��@�����F�@�S�n=@�1���q@�)���o�@�=5�z�@�l(���@�[�;a�@���}CD�@��3��|�@�#��
��@��U�ٶ@��d��.@�r�]̆�@� �x�܎@����+�G@�K��@��Lޯ�@�jCDi8R@�W��M�*@�MV{]\�@�J^�W�@�O
�|�        @�W�0�@:��_:�6@Ws�TV@j��,��>@x(Z�.�0@�,M_�A@��Q��@��oc�@���e�@��$�/�T@�Э_:s@�.��!(�@�<T�܂@�8�("SL@�0%�L�@�mY��@����v$\@���"��@�c��w@Ì���:f@�� @�B�&{�Q@��0V:�[@�a�.�(@�(H���@ѡ��3�@�,�'�W#@���l�H@�vP|�D@�4O�'&@�qQ}�@��"/߅�@��
�C�C@��L�(@��ɂI�@����I$X@�ǋ���@�:O�3�;@�d�fH�
@����3@��i��#@�@����@�i����L@���SAu@�%܈(�"@��)��n@��(e�@���h���@�\���@�W�	��?@�(o���F@���C�@������@�������@��*ד�@��A�8��@��f5d�@�}�@�@�}za�@��̡��@����l1@��{��\?@��{JQi        ?���/B)?��[�භ?�W�#(�?��m�#?��)����@��o��@�6���l@�$uw�@!�C��@�^q�$&@#Ô��aq@'�،�@,}\^@0���b��@3[�k�@60uǋq�@95-K�dy@<i
��M6@?�ݱ�z@A��_2@C��7:��@E�A��"@G��(�@I�#�'5/@K�uY���@NL�1�V@P\h��@Q�!�*��@R���̕@TA�1�O@U��/��r@W7�*�@X��n��@Z:��d@[��y�A�@]J{}#��@^�����i@`Ug��^@a5�;��@b>#H�\@c-)�(s@c��R�0@d�Lz�&i@e*s]@f�4��oX@g����@i�Ձ�@j$��q�@kB��m�-@lh�_@m�Ы��"@nȳ?Q5�@p��#�	@p�	skc@qG��Ih@q�F�-�@r�e馪�@sL5�0y@s��A��@t���
\:@urA��@v0����@v�g��
O        ?�)����f?���ʙ�?���cZ?�e�n�?��ࣥ�@-���@���
@�,���@!���"�@(`��D[�@07qH8� @53�*��'@;P$H7�@A[����U@E�X��x@Kv�[W@P��\*�@T+&�~@XB����@\���G
@a웄@d�N��@gD�D�d@j��0��s@n��9O3@q�4�@��@s�ɧ�V@vv���@y5�K�]s@|*��Ox:@W�~�2@�^�.Fm@�.���',@����@�)ݗ���@�V���;@����c(%@��Q��@�Q��
��@��S�{�@���Z�@@������%@�$�w'@����a9M@�~G��iS@�H2�n@�%��?�@����7@���C�@�������@�����Yf@��&2V�8@�i����@�<|�@ȧ@�u%�@��e� E�@�&`;�p@��u%�O�@���c�U�@�t=�%�{@����3V@�ųߜq�@��"#*L        ?�ݳM�vV?�r��s�?ҿ-K�?����q?��ћ/�@��Q�!;@/�,�^@���	ew@!7z�V�@(_�Zz�@0�h�v��@6ʒd���@>E��@Cē�_�@Ik1\
�@P)��ʒ@T&��N�@X��S��@^f�Bo @b]<"���@e�҅��+@j�%tJ@n��=��9@q����w�@t��C��2@w���N�@{-
�@~�ݏ�@�Y]tcm@��Q9@��6q�{@�Pr{���@��_�_Hw@��F&�8@�q'�=�@�<뇛�@��E� A�@���&W\�@���2@����*@��x�p��@��Q�Y2@���2L�@�E��5�@�����@�Ӯ� zx@�-��u8i@��_���z@�@�@��}�^j�@�k���@��b&��@�`Ö	�@�z�Mv:@��1��b�@�޼jh�k@��Q�X@��'S�N@��pE<�@��_ p��@��"ğ�a@��:T��@�Bպ%��        @q���Հ@N3� 9P@k,!��@@I��>@�� �r@��3��d@�{�]Y@����AW�@�}vg��@�����@��DwsK�@����\o�@�pc��@�6ڼ�P@�0NK�R�@�[�{Ҝ�@̸����@�#7���@�W�Qz@���R�Y@�8l�#�@�*�
B�@�d˻�"@ܴŘ@�
�*�@��U�(��@�	��h�8@�VA!V@�K[�G@��`i5@�k-#��@���j��X@�L�ZQ��@�ɡ��@�OX@��@���o\��@�9��A@�	Q�){@��]�%Ke@���|��@���\@�t��k��@�Z��C�@�E螿g@�5��([@�*���h@�$����@�#�|��6@�({]W��@�2deL]�@�A�	�@�ViWm3&@�p�N�7A H%��� A ���0Ap<��%�A����A���߲�AA�RTـA��࢝A�[U2�hA,�g#A�GĂ(R        ?�rXi�-?��YR�?��eH7�?�B~k�h?����+�?��E��@�PW��}@?XT�q@z�C���@ ���|@ T{�Y@#�9a$_?@'Zا���@+�7���@0H��2n@2|�Uy��@5$���0@7��4OI�@;�0$d�@>S:/	^@@��;���@B��h'_�@D��R�4@F�L��gC@I|����@KW�$P'�@M�PiZn`@P/���@Q���||�@R���#ƨ@Tt����@V~�D�@W���8C\@Y_f/;v@[)L���0@]�:�*�@^��w�H�@`�ޤ)d@a�4�U@b��G	�@c�&�*9�@d��׋N@f2����@gy]'��@h�.C�ͮ@j+Zۍ*�@k���u�@mi�^cM@n����@pp�0�q@p�-[8�v@q��`6@r��1 t@sz�V)��@tf|�@uX*t�1�@vQb:@wR&T�R@xZ>�dS@yi�[��@z�&�q��@{�z?]�@|��K�        ?�`��a?�Sk� j�?�������?�����"t?�cU;T�4@r0��8@��,�	�@�ϲ�	?@�����@$�h��^�@+��췎D@2]�w$v@7���}B�@>�x|։@C��W��U@H���MO�@N�8;��@R�뢓m@W��N7@[����)�@`�s®�d@c��Ψ.c@g�R�@k�`��o@pF���`@r��ج�&@uc���A@x�k_�@{�9DN@�"���@���eE!(@�'��'@���Ȋ�@�?UT�!@�B�x��@�4�b͛^@�Dfh�4Y@��U��s@���bQ�@����[@�.o�i�Z@�~w��Z�@��}�9d@�E�iam@����M�@�K#_�7@��H�i�@�7:*M�G@��}&7�@��jz(@��Sꐂ�@�m�ԃ i@�pRvd#@��zDa@����P�R@��^�r��@�,)|ꏄ@�ePR,J�@���IŹ@����W�@�U�����@����ɽ@�0ޅWJ        ?��R\��?�rSm`:?�|V��*�?�;� �t?�i�/K@�S��6@����U�@����!@mq�z��@%H�l˚R@,IV>ˍ@2���-�@7�ŚV��@>k5fє�@C&��B6@G٥��@Mc��R�@Q�$EWH@U���N@Y�%�6.|@^ړB��@b0��{!@eK�Dk�	@h�S*��@l�"�J@pr�=�@r��nC��@ubh��y@x6;�`;@{K�O/�@~��J��g@�%GQ��@�_,��@�=���@���P{RE@��ԐM��@��uS&@�v���x|@�>���hj@���°@���L��=@�m�A�M@�aPD$5k@�t��F��@���ݼ�t@���Z��@���.g[@�a�e9&@�c�o��0@��AT�s@�W�C9�S@��kyQC@����N@�W��Ӧ�@�+O�{�/@�#T�4.@��Z'�+�@�������@��qs���@�ʫ.�t@����5S�@�0a���C@�u.��a;        @w�)pk@K�=�0�@f�@��0�@y�K�M�@��	�wq@���� @��5 �$@�x'L�1@���O���@�S��@�M}+{�@��VNF�o@�i_pd�@�_ ���'@�L�@��@����&@���U�@�v'���@� ��x,�@��QS�@��X��α@р�����@�"���@���.n��@֣�!�Y@؄i~闗@�z�^���@܆�6��W@ީ6|�q@�q(X�=�@�7~��@��	
��@��Wߘ�@�Y4�4M@�MI��@��3�U:@錺m���@� 4��@�Z���@�A��#�@���ͅ�@����*�@��[]�MR@��iD��@�� �ػ@���"|�#@�Ǟ���A@����Fn@�W�-��@�7����@�sy?P}�@���;��L@����@�l�N2y�@�ׯ\��A �Z���xAh�?�\�A0�eh7<A���ۘ�A���5�A�IJ�R�A��}��Au6�(�:        ?���mÝ?�i��J=?�8�����?�x�M��v?��K�@ �gy"�@o�U~@ݴ�V�@S����j@� O1}�@!����ۑ@%���\�H@*�?�֧|@/���9[4@2�t���@5���
1#@9���m@<�I@2��@@hZ*G�@B��b�v@D���)��@G\�Qv��@J"SdP,@L�=aP,@O�}�t@QM�EP@S.3� q@T�Gb@V�P�o�X@X� ���@Z������@] �$�p�@_q����%@`��%@b5���G@c��)Q�b@dｊ��@fd�Hj��@g��#��@i~�ek�@k%��r@l�E��|�@n��Q��@p?�����@q5�d�@r5\V�S�@s>=-�7@tP�oG�L@ul�3���@v� �f@w�Hv�	V@x���?�@zBu���0@{��i�{@|��E(
8@~N���Z�@���_��@���D���@�\����@�#�6��@��`53q�@��]�^HS@��$��A�        ?u�ѸL]?�/��%��?�Ȏߜ<,?�`]��?�C�t�@ ��N�A@��R�W@�7.�mS@"�a� x#@,,�U��Z@4j�e�8@<��4`/@C�� ;s)@I��l�O}@P͡�iz�@UT̛l��@Z��a�@`E�~鯺@c�GՌp@ga���M@k���e�@p
s�u��@r�S���@u?�@x3~_���@{gRK͐�@~������@�N����I@�Tg���@�����I#@���B�@�\]�I	%@��1M�T@���J,@��D���@�$zpŨ.@��wq�f@���fW�@����gs;@�ēvhP�@��x�u�@�E<m @��`ď�B@�"z��0@�{h`��@���L��@�a���@��Q�\�@��յ��/@�F��j"�@��r��@����9>@�p}f�@�t��T�~@��&����@������@�Ĵp��@��KԿ��@�3�ik%�@�}�#��@�Ҙ'��c@�4�Ɛl@����        ?��|��V?��f&�@{?�I�f���?�u9UL?�nɃ�u�@��;��@����G�@.�@�Q@#�ٳ�V@->�{rP�@4��\�L@<��g׶@C�!�7�M@Iі���@P�&���2@U ��Rs@ZO��\6�@`!��/!@c�����@gQ���@k�)�@p"����*@r���g�@u����9�@x�V�1�@|���c@����%@���s!%@��� �I�@�'BGp�@���K�,r@�(���@�� ���@�ky$��@���P-@��[=��@�Y��n�@�.%�P'�@�e}q�H@�!֗���@�A撟/@�{�"�#@��<}��@������@�ew	Է@��\��@��x��@@������ @��x@�����68@�*{�U;@��ȹd�(@��qbaN`@��1�(ȼ@���ʴ��@��_$v��@�x�˺r�@�w���@�|�F�"@��O���@��x\��d@��oM>��@��/���        @�Y=�h�@B�8-��&@_ާn�@r0����@���F��8@��Xpn�u@��V��,@�^��M��@�3_�`n	@�n��!�@�k�\@��'��@��]'k�@�-Sǋ@������@��İ{O@�����@���D`6@�~�%X@�/fzJ�P@є�v��?@ӷ��xj@� �����@�q�>M@�
T馉c@���'�d@�^�r�4�@��Ǵ�@�E�b@�O, �V@�$�Ʃ�@�*�Z@�0�֤�@�=K��@�z �Tsd@���3�T@�"Ĺ2p�@�j�,=�`@���N�}�@�'�JC �@�����"�@�!��@�@����@�\�4�s@���1�@�۷�ia�A ��|(�(A��AаϨ��A���EpeA�i?��A
\�q��A1��T~`Ac�[:_�A	��"aA
�Q0�n�A7,����A�jl	�A�ֺUyA41���A���A�F`�BA|��Qg        ?��hJE�K?���b�-?���Ì+�?�/>6?���~;V�@=kѸ�@�Ͳ��@�k`F_@��Z��<@"9��~�@&��^ď�@+���� E@0�l��l@3��9T-d@6���I�@:�y	��@>�X�Y�@Aczv�c*@C�ڮ\�@F*5k��@H�d����@K�%Z��@N�&�f�@P��X�!@R��;#��@TnHg�0�@VTQeQ�*@XT�D&��@Zp�	��@\�Hx��@^����@`�<߮�@bZ��(:@c[,��e@d����@f=p� ��@gǸk,�@icJ�?S�@k[���h@l��|u��@n����@p@��s�@q9Z��yk@r;8$�]U@sE����a@tX��q�_@ut�u�<�@v���uE@wǢ��Oh@x�vPKcD@z>_�"+@{�s�t�@|�Ιk�@~5���͹@��UiX@��)��@�Aܒ��.@��Cf>I@���Wj�8@��˕@�h��Ɉ�@�?�(�@���{Yu        ?�ւ��	�?�?J?"��?�.��kR^?��r)K�?�o<t�@
�
.-�@���@ ���' �@(�!�7�@1�}.~Ǚ@9l�@�@AKv�n@Go��R @O/�e��@Tg��4�@ZF�s� �@`���]��@d�U��@i�S��}U@o�� %(@s���@v�S��k�@{*�P�^@� �.��=@��`Đ��@����?��@��I��I@�2Se�@�ht�&@��n|��@�o�F�@��"u�m�@��r3�,�@���YG��@���Y{$7@�R�\ۧ2@�Am��۝@�P6+RF@�~�z^2�@����cn�@�:l�@��2}�~@�9�gJ��@���9
��@����G�@��8�@�@�2�?ay�@�ي�;�@����O@�X�R4�@@�2H��9L@��hh��@�rn?�@��?�M
@�(+|�݋@�D�'�@�lj&�i@Ɵ:���@��/����@�'$�<�@�}>W?oy@�����R�@�N��3�"        ?r ~�?��r^��?�W>)2۽?�1�4��?���w?�nxa@�D��2]@Q-��@ߠֱ�@'�IbO�@1�2�"b8@9r<q@AC���|@G'�1.@NQߖr�@Sp^��1�@Xzn^I�@^TK��!@b�Y���@fX��/�@j��"^@o}�l�h_@ro���@uh���Y�@x��+�d1@|Gk�J�@��Mk��@�;�5�@��ơ@�	���;I@��!9b�@��r�M/V@���5�-	@����|ta@�G�r�e�@�+3��@�-��v:�@�Q�S�)�@���Cs�@�CI�d�@�J��O��@���y+�@���W�@�����t2@�<B�
�
@��>-��@��u��͚@�����@�� ��xd@���W�1@��nI�ȓ@��"���@�?���@�|���^@�����@�J�uV�@����_�@���z@�t�%=��@���A�@���d_@�"��Y�:@���'�z}        @!a��9@N�F^�M@i#FW��@{�8<��@�\}�\;@��k��@�6�׏W~@�}��m�G@�(��mU5@��9��:�@��y#�v&@��	�n@���k�{@�R�7<R@��a�6@�d����@�gAu���@����v��@�o���A�@҈����@��7I�C�@�;ET�@�@������@ܣ�.V��@ߠ��H�:@�hZ]�/�@�e�v�@�筗ժ@��|;@��88���@� 8J�'@�G����@�a���k@��E.K@�tl�/�@��;��n�@�XY�;�@��d��ݞ@���|
��@�=
�Z �@�0n�,�@��o��]�@�����A �{��A����A�}o\�A5ĩG[�Ac�6��\A�ԅY}A�d�J)�A	1o���A
�YeuA�0e��AgfP�'A�˶�߰A8@��5A��1hA�;��A��
��A�#H�.AoSitAY���+AK�0�        ?��By��?�)���?�I�#E�?�{FW@	�Ȕſ@5��Oܲ@:h'�@#�|'��@)ۻK)�@0cM�k�@4Fm�=�@8���&�@=Zϼ���@AF���K@D�X��@G!��y>@Jd��~@M��R�\@P�5o*3j@R��;�bc@T���$�@Wi��@YU-�z[�@[�Q�.%�@^PKC\;@`}��(K;@a��&XE�@cW:++�=@dڪ�=@fl�y���@h����K@i��{�s@ky�
�8�@mD/Q��T@o�T,2�@p�9��@qw�>^A�@ru�{���@sx�5K@t�E[\[~@u���~�@v�y5�-@w�/�\�@x�Y�R�K@y�@汻o@{��"�@|@X ٛ%@}n��+�@~��P�_@��	�@��aM��@�/�4'�@�բ���@�~� z̓@�+&c�@���GO�@��~�ݬ�@�E�m�@� ��甧@��W��!@���WR^�@�H@=O@�|x<�C        ?���Kb�+?ȣ�0ڭ	?��+�i��?� �����@KF�M�@�з��E@�e�6Ƃ@$����@,��ƽ@3�g�c~@:t
���k@Ap�<@F��*ܧ�@M�m���@R[	��|@V�S��$@\T^��@aNg����@d����B�@i>��@m�a�X&@q���_4�@t{o�tE�@w����Mz@{h4k`?@j+U�_@��Un�m@�O�:No@��!��T@��ޢ@�޼-d��@���H)@���?۝@��^�t�@��<��%r@�(�v��@��k��@���q�@��&F�@�V.o�@���2[@�{Mr+Tm@�1[!�H�@����r�@���AN��@��Ł�5@�qju��@����@�J6AP�@������@��>��4@�&�oyS�@����3=@�|`�Ka@���Ć@�AG�\@���XL_@��@���f@�T֬��@�R9w�@�[(�|��@�p|NN�@Ē\N���        ?n�̟�R?�\���\?��2�9��?�����o�?܉� ���?�̛�Q|?����U�@B�6��@��w�_@��4�W@&��e�S@0���s@8!�8��@@�Oႆ~@F��3A�	@N>X<��@S�luNz@Y	Ocʋ@_d�U��@cdW.*�@g���[�&@lz=Ѩ%�@p���l@t�W1r�@wm�E��@{1.Ze�@T}TYϖ@������@�d�L��k@��11�@��!$�)�@�JR���@�1���.@�����@���z��@��̂��@�w��"�@�Got-�Y@��8�5�@�*�r�
�@����7�@�H.y��@�� e�-�@�<�v�w�@�Г�Nc@�uU͜s@�+fM���@���*��@��|��%@�� Q��@���ޓh@���M�@���z��Y@�ṱ{�@�7C8G�@�g3����@��rXZ@��)y{q<@�5�.�aE@���!G�@��͑���@�e�Lu@���ßV        @/(�b��=@]�;K�@x"I��@�&=mw��@����1@���xUAP@�g�fܟ@�'�ǅ�s@�=���@��>�s�y@�%>Җ2@ğe��h#@�h��J��@̀q��c@�sUf�2;@�ͯ>{�@�Oj�� �@���ܭ1x@��4�i�?@��5�{W@�s���u@���~@���B3�1@�<����@��}��.@�FX�8t@맲2��:@��`���D@�9t�B�@�;w���@�u`;�?O@���Ny@��#�J<@�g�)��g@��%�| @�A�v@��v�@�C�XV�@�����@�l�u��WA �J�X�@A\b4gs�A5��d�A�J�<A�qj�&2A�!���A���.A��9�=�A���lmrA�j���A	�P���A
�����<A�M0�J�A���`��A�`Z�lA��JW/A��T(�A�5}Z�7A('�Z��A�%�ZA])�ߣA�2��$^A�;'3�        ?uB��f?�z�v�?ƖBO�@?���N�?�V���+?����?�Ʈ�r{Q@/k^�@	a�]�Q@>b�4�@B�&Ih4@��g���@����@!��!��@$�,��|"@'�o4�]@+XQ p
@/-!�@1��Õ �@3��X���@6Hx�;��@8�����@;�J�V@>qͶ���@@�<���@BZ��y:@Ds[#�@E�d�	kq@G�g( ��@I�K�T�@K���ϑ@M�oPU�y@O���%�@Q���@RB�����@Sy�����@T�����@V
|����@Wd
�7{�@X�U�E�c@Z:}�I4s@[����X�@]@�D�e�@^� D��@`;�!Zf@a�=oR�@a�<^���@b���>�@c����6L@d����1@e�㌻@L@f�M�~%�@g��{D5@h��# �O@i����X@jТk{�@k���*�@mu���@n8�ȓ�H@oh��'�z@pO��E#(@p�Ƌ���@q�A8<5�        ?FƉ��v�?�l,kHn?�h1�)[�?�'�<e�r?��$���?ڭ[���?�M	0dYd?�݇U/Q#@Q���f@
ՙC���@S1?	MF@˙���k@%3���T!@-au�wH�@3���|��@:P�dw@A��Bx$@E�J�duB@Kj���(@P�5"�N@T�b}�S@Y.�E�1@^+wV�@a�Y�@e~�Y�@h��-2��@l���S�@pu��6�@r�c;'oG@uz�����@xY�6�	@{xW.#�@~ۯ��:�@�C��=�@�=|�~��@�^�{�{H@��b�@�6@�Wݤ83@��j�mz@����3�@�Dhf�i@�ܩ���@��$Uv�d@�\���L@�Gc����@�O��u @�v��m��@�� ��@����%t!@�ق�4�@�1�U�p@������l@�����@����z'�@�U��P��@�G/9��@��3�P�@��Y?c.c@�k�3�y�@�z-Z�&@���g5��@��I�1@���D��        ?c��?�P?��h�#G?�Zש�yM?������?،[ȄZ�?�I�]
?��M��.?�G���c�@c̞�%T@v}���@LX���;@!��I��@(� ��i@0��&m�v@5�Bg0d�@<:8s���@B�-�w@F����@L�3ϰ�@Q7�S��7@Tޮ�|L�@Y
�
@]�]�@a��Ku�9@d�5�QR�@g�l�R}@kv�۴�@oz�J�@q�,|�H�@tU�O��X@v�bk�?@y���h�@|˵���C@������@��a��@��^pm�>@��E��W�@�����A�@����1�7@�W֥u�>@���a�#@����i��@����F@��5p@�P��*�@���d8\@�Q=u��@��+�ң@�� {��@�����>�@��n&x�>@�� ��@��\qՅ@�$e��@�+����@�[E�n�G@���aS�@��X�'��@�.H7uA�@���ؖ�@���ܸ;@�l1M�_ @����˦        ?��I�M��@0����� @M����z�@a�>e�@n�#3�@x����@��~Cɼ@���-��@�&��nk�@���*��=@��boݦ@�*��5@����&@��DWB@��}yC@�
�*Ϸ@�IY��@���+i��@�oQ~t�U@�V���e@�v��+�r@���vo�I@�����e�@ß���@@Ū��i@��6�#U�@���0J@̉	��T@��x�_@��NNz�.@�D����@Ӻ��y�@�@v�^��@��r�"��@�|�Z_��@�2�݌�<@���!U��@��F�C#�@ߵ���@��If�v@��ٖ�]@�����@���o3@��~�@�:q�(��@�g@?Y	@�_�I@���%M&�@��lb~�@�n����@���}�m@�$Cw��,@�F)�ڃ@����\d@�Ff �@�|�t?Խ@�CcB;�@��η�k@�ݷYRU*@��]J�$|@���@�j���0@�N�YS֦        ?��C=|uH?�1:4 N&?ѕJ'��?�؀%�Z?�1��:?�^@�sx#@r�W���@y- ���@�����@��h@@"!t�j`8@&i M���@+5���D@0E�����@38��J�@6v�Bì@:��}@=��\x�X@A	�ð%k@CN��0��@E�֯3��@Hb���Q@K4"fdV,@N9�7�@P�h�a�c@Rq����7@TFc�V&�@V8P�(��@XHf��=@Zw��Z��@\���R�@_7Sc VW@`��_��@b?���C6@c�/4ͻk@e*�O ��@f���?�@h_�U�I�@j:�q>@k⩍�M@m��Rӻ@o��=c��@p�0,�y�@q�VWZ0l@s搌`�@t7��[�@uk�u|�@v���+2�@w�dӫE@yK��
H�@z��})@|�z g @}��w�J@���!@�W+�B�@�&����@��%-�/@���I�v@�����Y@���mtI@��D�f��@��<6�Г@��~Ǵ�:        ?X�K����?�K`�0�?�8�?��?���Z�NZ?�wuI9�Y?�TPf�?��*�F~.@	|��UV@/�S�m@��F%�@'R{�@0��Q���@7:*�A�@?��-��@E�)#��@K�h��e�@Q�ȤÜ�@V>��,�j@[�7���@`�y=Q>%@d��T}��@h���`2�@mL��ŋe@q?,>kR�@t#�a_v�@wX>��V�@z���@~����*�@�{/�lu�@��,�ʮ�@�A�~C�@��w�d@��Y� 8�@��4�ә@�|rAd�@��S��@��)�_�p@��޴�T@��
5A�@�+1;^�@���֩[@��SC�@�b���@���ݭ|@�H�W0@��� �i�@�{����@�4�NN~@����;@��ϣz'@���l���@�y91=Dw@���wF�v@���ɩP�@����W�w@���Ɯ=@�\�=
�@��Q#��-@�G�ʗW@��x���@� ����@���DW@�&�ٷ��        ?�HWO��V?�K:�a-?�7���kC?����ݿ@
tJ8$v�@E��G}�@!I�[QA�@)oc�;qc@2�Htt@8βa[@@�K���@FA�d�@L�{x��@RM�e�Fs@W��bn�@\��u���@a��|�@e�4 |B@i�Hл>@n�F�j?@rNg�w@u�A{(�@y�)z8�@}
ث �'@���z�&�@�%I�sk@�Φ���@����֨�@����x�z@�S�_�^@��p���n@��4� 	�@���-�z@�����	@�p%>U�@���ɦ�@�����? @�fA��$G@��5O�J@�����@�`����@�:�}���@�0� k�@�@�܋�Q@�n����@�]iD�~@����ύ@���yϦl@�/�-�A5@����l,U@��V��@���;��@�=U��	Q@��6:6�@��,\�4@���!G�@���M4@��O�`�@��m�ʼ@����@�/�S�@�HH����@ǈNL��k        @h<�\�.@Eޣ�J��@c�S�@�@w��m�@��y�|��@��D<�,�@�i�J���@�|.��J@��3� �@���d�p@�!�[U`@��?���@�z�9}/@����r�1@�:�E��@��	{І@̺�o�@Ё�hG�@��τ!Ö@�^2A@���@��@���c@�8x�G��@���@���@�^H�hK@䔸 _�@��Y��@��5e*5]@�5��v�(@��G��V�@�*M�|w|@��gd�@��#��j@���^���@�736a��@��i�n8@������@����6Y:@����?T�@��[/��A ��ų�A�����AH��D��A�x��uA֫D�aA3��WwpA��V�jXA
̋���A�kX�HACҊ��A��Q��AUܶ<��A<��OPA+�M�A$��*�A%";�I>A/^;>� AB�-XdA`D�H�A�s:�A�Թ�{+A��*���A;ySr&�        ?��ձ��%?ȂDN�S�?�=*IX>�?��Mub�@�>3�г@9��L�@�릖�6@"o�9�(q@(?I�`5@.��N�@3��L��@6���'r�@;S۶ւ�@?���)v@B���IQ@E,Y x�m@H8N�f�@J�ٙ�$@N$�@![@P�aXN�@Rt�p {�@TDf`@V(XFm^�@X!��b�@Z1/���@\W,U�@^�����y@`uS3/F@a�7�@b������@d@"*~��@e��Uk`8@g3��GG@h{�i�@i���ۊ!@k��c��@m&F/HX�@n����RX@p?����h@q��ʨL@rO-�fM@r�̍�l@s����t@t�C�f@u��L�@vٳ��G�@w�;���@x��&�Q=@zym�@{.�ὤy@|Wy�R��@}�j�:6r@~��M��@�K����@��y���@�R{<Y@�x���r@��R�a@�mQ��EE@�*)�'�n@���{��@��~�6bA@�{���        ?lKLI�j�?��$�V�?�UF@0>y?��RWNe?��8�_�?�O��8w�?�s�S@� $b@`��,l@�Z˧��@!(��#�@'R��=ş@/|��6�@4]oqIDv@:<���J@@����r�@D�Ms�@I��`�//@OTyr9}@R�"���.@V����_�@Z��h	S@_:~ڛOu@b(;��]@d���MB@hn���@kjl@o��-xH@q���҉ @s��I�C@v�/@	�@x�7�9�@{3P3.Mj@~��K	�@����+@�4C����@��(��y@�����R@��J܊ğ@��h���@��Z���@�K��M@�\/8��@��*D�@���@vx@�d�ذ�@����7@�l�@�@�;[���@��ހƢq@���ٮ��@�d/��H@�+��@�/�m�"@�>�L�b�@�Y��K�@���I���@��uP	��@�����N@�B0���@��� �k�@�++��@�{��T��        ?��คN�?�j�'�K?��I�k��@�����@ �����R@*m>��^G@3a	��@:�W"&�@Aޞ��@G?���@M<o���@R/��[�2@VP�@�u�@[����j@`AACT��@cY�;��.@f�pld��@j�L.zS@o;"K9�@r@y@t�b#�g@w���y��@{,�iBZ'@~�S�`	Q@�e �Yͫ@���m���@������@�eG��k�@�X�^�@��P&��@��J�}@�-��@-^@�븍��>@��� �@���ȵ�@�Ü�c@���N@�,�UoY@�Dp<�vS@��c�9E@��ѠS��@�
��@�3�S��@��?*�6Y@�j���@���1�@����1@�)̕�m6@����_@�IYyŦ�@�,�$��K@�1@�c�@��ʹ��@���u�d @���<�(@��zEHҿ@����_7S@��&	@�1޼@�0c��y�@�La��
'@�m�����@��h�Ȭ�        @4H�Y��2@cN">���@�����	�@��,�4g@�!�	YQ�@���Sy@�b@k�a�@�<�Ka�@���"<(@�MA�v@�B�1�@�,\[���@�[�ڤc�@�R���t@�{z�H�@���T,f@�X�ۺF@�6��@�v?Mʋ@�|NT�F@�E+��Z@��'�đ@�ڸ�@�pBmUSX@�r�G��@�_��@�	��n�@�g@P7!@�И��E@�F>��x@���4��W@�U�.S�.@���P�@����@�L�U��A �xe���Amdo���AZ��K�AN�>ſ�AH�����AI)4��AO��uA\R(.l�An�'��mA	�5�0��A
�tA-�Aɡ£�A���҂�A$O�q�A[&��k�ALI@�R�A�^�N��A���[�;A<���A�r��|EA���X�AM���2A;�A��ۉE*A|գWKA>4E�:YA�(�	Aʻ����        ?���ė�?Ù�����?��L�h�?���h��?�h��d�@~�lݕ@��&�̅@͛�i�@��Vi$@#{�.I��@'�:20�@,��P�]q@1 ���@4�>H�p@79�u;$@:����`+@>S�@Bf�@A"h��_z@C=��j��@E|m23�
@G�R���@Jg E@M#��i@O�$uj��@Qp,�B�@R���1@T���Q�@VXŗ��$@X!����)@Y���;�@[�]O�@]��8��@`���h@a�	G�@b?C!J�@ck���F@d�
��cL@e�aM ;�@g2���%@h���c��@iﴵ.�@k_����~@l�0�*@nc��`K�@o��N3�@pͶ��M�@q���B�3@r������@sjQ#���@tW0��;@uK=�en@vF���@wI|џ�z@xT]��@yf��`u@z���ð�@{��VU@|��m��@~�g*�@C�m��@�E��%�@�����] @��E�`|        ?d�sQ�\?�C� %�?����x?Щ'�Ef�?� �<��?�ɒh�?�M5�U�@
T��2@e�x�s@ 2dx �@'���4H@1&_Ţu�@7��^#�@@ �5(��@ERv2sO@K�g�&=�@Q���d��@U�h:o�@[ �7���@`hso"�@c�o@,f@gh�Yе�@k���Q�@p3��@r��2Ԓ@u_[��M�@xh/L�<@{�9a���@L�IY�@������@����t�@���nl@�b�=n^@���:1��@��dڙ.@@�c��-�@����Zׅ@����k@�{�0>�P@�e�?@�k�' �Q@��xv9�k@�ѱ��o�@�s�.J@�Y誑��@����c�^@������@�~0�£>@� ���@��˻L�O@�@����@��{�b�@�ʎ}3�t@���\��@��:Dg�<@��^�w�(@����j>@�
�Ce'(@�5@T�,@�l<�
�@���<WS@�=�I�d@�`ga�        ?�����c?���b���?���K_t?�TX,:�?�N7A-�@���j�@u� x@��A�e@#)VZ��E@*�,����@1�ͺ��@7�nO�§@?q�N��@DQ9S�@I㍅�K�@PG��q�@T9h:��j@X�<ݢ�@^,�|'�@b%�5*]@e�z�}�g@i���F�a@m�׶��@qj��D�@t�O�_>@w�}څ@zXvZ��@}�1���@��2G�@��1�`�X@�+�� �4@��s�-L@�!A���@�ݰLT�K@�Ǯ��K"@�pX��{�@�$Ӓ�%@��;��@���^��@�� ���@��@��_�@�ي�~��@�$�o��@����NJ@�=��Kj@�bD�
}@�ɡ�ʛ@�B߿�*�@�΄�R@�m	Q@�~���@��٢_�@�����(�@�W�T�cl@�Z)_@�g�7��@������u@���=�eC@���3�]@��O҃@�\��@���S{X@� �� (        @!��m�	�@Pf*U�n@k=X�*=�@~2;�d@����"B�@��*a\3�@��_�}�@�؛�F�@�AS�:�@�c�g��Y@�ޡmZ�@�8='5��@��pf��8@��wO@�z�s���@�^.���@�|�A��G@��`Fy�@�;c��q@�+J\C�@�> ��	@�t��=*@�����@�N*�P��@��q�@�]A���|@�Ӧt�	@�\bB��@��Mѫ��@梳����@�a�8qL�@�3o7M٫@��B���@�[9�@�	����@�!�H,L�@�=�|���@�ea��j@���z@��r�1r@��Yl��@�u��@�ד^�Y�@�FU�e7a@��6����@�K����@����]�IA �Æ��A��%�Z�A~���6sAg8��AW�/"ZAN� �lANm�Q� AVc���Af�2��A	�<\ƿ2A
��dǦ@A���	��A�z�w'A@:�yA��= �AkLކ#        ?�jC&jޝ?���=�I
?ⵦ���?���@\	\@k(����@$�q�@@)('@D�2��@#P�iq6@(�̜��@.�+�ϡ@2��$��@6kO4}��@:u�m	�@>�s�7C@A�:di�@DSK�.	@G=	n�t@I�9s���@M	x'S�@P) �uV@Q��]r@S�� @U�8��^W@W� �#�@Y�]��\@\5+��tK@^��3K�q@`�{�xM�@a�ȵ&@cE,��d@d��dW@f<HH�@gѡ"��@iyZ�(@k3̳�a�@m|{��@n��Ʀ}@plU~(u'@qq���/�@r�JwQ�@s�( *t`@t��t�7@u���O�@w(.�=y�@xk�r)��@y��?p@{hNb�@|t�ZL��@}ᛴ�A�@X{�u��@�l�**Sw@�2�hk�_@��� �@��Â'!�@��hz��@�~����\@�_E�=k�@�E��d@�1�!�>@�$#La"�@�9�J�@�L0tE        ?|˄�΂?��څ?�?Щ�����?��"�;V�?��B���'@�;/�#@C �}�@���QH@%��`j#"@0c
�L�4@7ߤT�@@��Aza�@G3�`C��@O$��?�@Tt�E���@Z]4��.�@`�LET�@d���n��@i�d<	$�@o=���@r�M]��@vc�)��0@zn$JȰ�@~�R3�@��he:<t@�����@��c�}c�@�If�q@���m�3-@�Mgȏ�@�iuq�w�@����t@�4z��,@����'�@�w�)���@�3G!�@������@�dX	V-@��s��@��d@�ןPpB�@��,|\�&@��Z�@�~o}@�����@��{��^@� ��ɺ>@�j��af2@���r�k�@�&��	�Q@���\�~N@���0��@���y��@�I���5�@���H���@�\'^+]s@�D^`81@�5X0y�@�/\#j4@�2��@ea@�?�!K��@�VU@���@�w.N؁        ?��kn���?������?��dR��?��qk�Br@�ı6�a@t"#|kJ@;���@&��@���@/���W4o@5�:{ZE@=?kS��C@CC�R��w@H� V�`�@O��灎�@T#�|2@Y�=|i�@^��b2:@b��Yaj@f�����@kD�Ӌw�@p2 ��9 @sy��s@v\)  Oh@z��q��@~:;�n�@�L�)N��@��;��H@��;dm§@�����J8@��i|��@�&{#�;~@��Ju�V@��L�t@�Q�8.�@�����G�@�3���+K@�⾎�_>@�^��S?@��<5�!@�x`�;pO@�&���(
@�����@�Ǵ4���@��� )^�@��i4�L�@��b��_@��	 KC�@��N>��4@���ŊS@�1�}�\e@��ON�@�ښ�D0@�B�d�x@��=&�P�@�7]�-(�@�ō��4G@�`���Į@�Տ��@�����M�@����ZJ]@ª���{�@Úb���'@đ$���        @)�[G<�@[�STJ�^@w�����@��vD(��@��%�v�Z@�)�|N@�d��U"@����@��|�Z�@�I����V@��ȃ�@���0�@�R�x��@����@���⌕*@ը��d!�@��֒��@��J@ߴ�oP @���Pf�@��pe�<}@���:�R1@�Gqȅ�@�~;�fv@�Hz���L@��<�(�@�lG;s��@��kC3�@��:�@�%tJ��@���3�9@���v+&@����t/�@��]P	�@����r�A �4�08A�����A)�y�A_�ة��A���A�UIU�^AG�)�DA	��'��AF��GA����PA&(���#A����,A���TP,A����Ae�5���AI��A4B���A$�����A~#c�A_�+�TA�;>�A'w~�|A7�jӤ�AN�4of�Akꤘm�A�υ1�KA�2��A��O�        ?�ڵ�e<?Ţ���z?���m^B?�b|g�r�@ Mp��� @	�����@�p�il@K�^�5�@ ��_m7�@%T�7|@*��q��@/�d��7@2�cˤ�@6CǊ�@9�ժ���@=�T��i3@A�dKA@Cl��H@E�
F��@H�b�	@Kfצ��@Nj8��{@P�K^��@R~�;ι�@TG���@V(�w��@X#!�a<�@Z6��я�@\d���a@^�b��C;@`�}�/��@aĖ� @�@c6��/�@di��
@e�z���@gG��ϔ=@h͸�>FS@jcvz@�@l���@m�_�j�@o���t�@p�H8�)@q����+@r���WW@s���@�@t�/s��Y@u�ţD=�@v�ay�h�@x"
M�@yI0�[%@z���Ef�@{�8FO@}O����@~vάzQU@�Д�@��̉�G�@�c4��{�@�&Am��\@����r@���^��e@���|Dܥ@�m�"a�@�N�
��        ?�89i!L?����j��?��, tӀ?�`�o@)fW-@:�Y�~@����;�@ |C !�@'.�g��@/�6�{@@54�;�R.@;�9:��@Bm���@G�
�p@M!:�ǌk@R*��V��@Vin�n��@[[�¢�@`��ȟ@c��O�k�@g��ە�@k�4�~@p-�R�ϱ@r�G] F@u�~8��@x�K��c\@|F (s��@�5��'@���A/v@�Fǆ�pq@��+�_�@�6}�X�w@��'��E8@�߸��5@���oM�	@��ژW�C@�k��IvB@�K/S���@�G�d/��@�b��zp@�����@��P�9T@���ݩA@����p@�i%�=l�@�۸:��s@�`�،M�@��T�ѣ@���l��@�b6q�@�4�h��@�={�oA@��;�D@��
ʈO@���^2-`@�ǯӛ�@����mW�@�'�톽@�i�@�1�@���Ҷh�@��MR+�@�x�Y�j@��Q����        ?�v��ml�?���b���?ߩ�%p?�7ߚ�Gg@�L�@{�X.@@��_"@'�l�5@0[�(�o@6V,�v/�@=�<����@CS>鍺�@H� �k �@O-TuL7@Sg;Ǣ>Z@W߅���@]l%�m@a�o���8@d��e��@h�H��3�@m/	#���@q
c�Y8�@s�)_�	@v˻�q@z"���@}���H�@��K�*�@�o~b��@�zd��>0@��mJ/@���r�?@��5�2��@���w���@�Dv�L?2@� ��d�@����@�<�F���@���,�!G@�ꁞ��@�{d��@�b%g��@�� �č�@�<๤�@������@�eU�p�@�1��k��@�b/�@�gw2`F@�,��r�@���ڮ�@��9`$1d@��Vc�@�Q�د8;@��	�h�@�
%)޴�@�~��.�S@�0�w�@��)��)/@�D�K@���/ǔ�@�g�q�V@�XT��@�S*��\        @!����@S�L�@q�Q2�t@���m���@�}��&�@��XA�@�Tf�Z��@�&���`@�W��:9�@�<��Ȁ�@��hs���@ĕw��X@ȝ�?G�@�	 � ��@�����e{@ӊ66�ƍ@�]���b@�ini�t@ܮbG���@�Ճ�\@�����@��1�k�@���@�H"wLS@��'��7@� �4���@￬���@�@�4,�y@�' �I@�8VG��@��̿|[�@�{$���@�:ȓ�@�}�EP�@��@��@��5SP��A ��T��1A�	��+�A�yh�0}A�]���hA4�"̙�A$O��A�@�Q�A	:K�1�>A
�VWEo�A)n}��A��1H�AM�i�QAy[�$�AR���{bA3B���Av����A��޲>A��dc�<A��m���A�75'�A�p��"Ac�X|�A2a�]�)AR� ��aAz���+A�ж��A�-��k        ?��-	8c�?�Һ�^Lu?�aS�xH?�u>K]ͼ@���M2@����`@ţז�@ �`d=@&>�p
�4@,DӶ��@1����
J@5Hu<��n@9p�&�/@>^�>fj@A~��ga8@D3��H�@G �T�6@JGq�){@M�	��G�@P���܈@R�zۘ��@T�q2�5z@V�^�%@Y��(э@[nt��U�@]�K!���@`NP1yB�@a�u{Ku
@c'>}�@d�ǌ�sL@fC(����@g�k�=@i�i
��@km!�y�v@mI��xL@o7S���n@p�u�˼@q��@v	�@r�Zc��@s֢���<@t��`�@v/�ڣ�@wl{kSH�@x�I���'@zƑ�9�@{g�8��2@|�cnN�n@~N��"�@�� ��@����i/@��6(�u@�fj�wa@�I��@�4�_�ol@�'�U�ta@�#|���@�'T��P�@�3�}g��@�Hg'�}�@�e�ha�
@��j.@�L@��eƴ�@����j�        ?�ݽسg?��}	6�;?�f��ꛌ?�{�[�?�eǺ�	@�^��T�@�n����@�.
{v�@!��6f�@)82<b��@1���~�2@8:��o��@@=��7�@EX�۹3+@K���@Q|��?�@U�f}�X_@Z�-@`ob�'%k@c�{��i@g����@k��yQ0]@pcS���T@s�V+v@vN���@yf��k��@}ܟn�Z@����ԃ@���lq�%@�#:M�&^@�����6@���kBTD@���1i#�@�y � �S@�?��Ċ@�'�27@�2-���@�_ƀ��S@���<�΅@�)!�a�@�����@�F����@���K��@�HF�>`�@������@��PF?N�@�k�jԎ�@�O �1/U@�I��ޟ�@�[���~@��Y5��@��;�)F @���E��@�O�E��@�����N@����,W@�TŠ4�@�����\B@�Iz��3@�����u@�x��3�
@������@��>|�xW        ?�|� �>�?�<�Q��?ܻ�nd�?�3'hS+@ �K�	;@N�T�[t@9�~�TU@ ���ou @'�`y1�@0{��P�"@6j}�x@=�<�u�n@C�����@II���@P�n�@T;�:kx�@Y!U�,��@^�ԇ"+�@b�^�}��@f�q�B�b@j�.@zw�@o�A}I��@r��-��@u�PR>�@y%�-�[@|��<ܼ@���yL�@��|��t�@�.I8/_�@�Բ��^|@����b:@���D@��� ��@�dE��о@�W!a��@�ou��0@�����@��Z���@��l$���@�4��?�@��M��:@�6��Y� @��ͮ��@����\��@�jAK�$T@�U����@�Y�If@�vl!l+@�U�Y��@�|����@���ޏR�@��8�@�<X���@��۵d��@���a���@�p�J� �@��p��d�@��> ��d@� T-�h�@������[@��;���@����y�U@e�a^�        @);\{��@X�Kb-�.@t�W�x@���=���@�c ?'��@��{h)@��d%л@�-1�'ӭ@�C�8{n@����e�@�X�3s��@��jٗ��@�f�-�zj@�;�0q�$@�dT��7�@�r맽S@��"�CA{@�z޲R�@�F�Vv�@�C�F��@�s�v1�@�kJ��@�6�����@�nǊ��@��[���@�7O��#�@�l�PuG�@����ʋ�@��+�}�@�X5�ք�@�jnsK@�j�P3�@�uk���@����E�@�z��n@��s�uq@��V$G@�t�%{��@�=�s�F�A ���O�A��f�8�A�].`WA�ڶ'R�A����� A��*���A���KA�pt�A	]>��oA
��B�$�A��̺A�?C�A��w�)AH���A?����A��~&,A�.�a9A��"��1A�"����A��)�t�A�7w+�qA��BwB�A�]�,jA�a�pP        ?�W=��l?���ί�4?��W,i@fH*�U@�}�7@$`��R.�@,�-��u�@3�(��z;@9Zm�`|@?�y�}@C�c�,��@Gʷ+��l@LL���,�@P�~���@SE�㆛/@V%s���@Y:hɼ.I@\�� (A)@`��|@a�S��=�@c������@e��U5�@h.!��@j[���]]@l�/eP@o;��E��@p�:n�1n@rDw���@s��a�U@u#Fgw��@v�MP�[@x;��V�F@y�a<0�m@{��$"�@}O}����@;��@�}���E�@�t.�i4�@�q�k���@�wm�O��@����DW�@��|��,d@��/�c�H@�ڦ��2@��b+˴@�:�����@�vI��{@���0]o@��Tu�@�W?�	G@�X�Z��/@�	�w��@�����!@�u����@�0�l/@���z�v�@��L`X4�@�t�@e��@�<@v��@�џ�%�@��p��M@����k@�x�A�l        ?�h���?��u�bf?�W��^?�*��-3�@
++����@9�	@ ϸfh��@(E�b��@0̺Vh�n@6�f����@=�S��@C���r�@HC	d-W�@Nn�8&Z@R�b�w�)@W+���Q�@\.�O��.@`��e((@dSA}�@h!tH�g@lqm(�A�@p�$��@s`�rk�@vj\���@y�IjWu�@}�^k���@��<Ul��@�"g�WR@�}B%��@�%7���@�t��j@�����'@���ö)�@��t(��p@�m�$ƀ@�v�sos�@��:>t)@��|V��@�[>&Q��@��F��y�@�Pk?Ýf@���^��@�;�����@���KH|@�q]qá�@�)&���@����X]s@��[=H2�@�ȧ׾�%@�iж��@�x�� �@��ڭ0@������@�ꔽ�{'@�(���@�q� U�"@�Ǡ���@�*a�J�*@��%y�@�5���A@���nG=�@�>��:�@��E�        ?x�
��?�Y����?���$�D[?������/?꪿���?���?�@R1�c�@@"���l@خ���(@ �$%r��@'���@0�V��WZ@6��[��@>LX��@C�%��ui@I���$N@P+�=�e�@T/]NMv�@X�ýeЇ@^Ain�Q�@b5^����@e�)[�P@i��~M��@n��+.@qr���=�@t$�nA@wn�b�@z[>�Su�@}�ײ��5@�߈�G��@���pp�@�5K'}&�@���qvz@�<����@� :91Q@� ���@�����5@�I7�c�@�����@����)-�@��֋�4@�) ���@�l�sQ@��32��@�)�ʥ�@�|�ӄe@���<@�X�A;��@��tA%�@����{@�0�>C]`@��FoH�@�Зt�@���Z�d�@�㑏�ق@��Юz�@� 2X@�1�HEq@�cf~���@���Q�@��	ߠ��@�AXƛ�@��&
ٵs        @@��M$@n���8�@�N]Q�h@�C�4k�@��NT+�@��5�E@��㓽�@�~��M@��.W��@��.�z�@΃E��@�d�7�S�@��]�Ζ%@ٗ9�s�@ݨ��Ր�@���/�@�aC"1L+@����x�*@�B�d��@�s��scK@�|NFlb@��(E��@�lϭ)@�TBaz�@�4�%�@�-=:Qz@�=��g@�f/��)�@��d*�1mA ������A�p���A �d|�4ATMC���A��H:�A"�!�ЭA��J���A
&�H��A�����Aa#@t�@A0+߂�Ai��H��AP�C��XA>b`o,A33��7A.��c�qA1|�H�qA:��aAK��y�Aa��aA{H}ƷA���ƞ�A�����A���_�A5H����Aq�et�A Z)��A �<�㔅A!�(�O��A"N�W��A"��|�}4A#���I��A$]L�T8A%�~u��        ?����*�?�B�/R��?���>G?���@��?�Y��A�3@%ڱ̊�@�/7qC�@����|@r0�i�:@"
d�JR@&T��r�@+�1�`�@0-��(�7@3�<9J�@6+w�n]@9��h���@='��DZ�@@�s��6@B��b}3�@D�{�M#�@G�ro�7@I��/Q<@L$�R �@N�?ӛ=}@P�9�}&_@Ri�j� @T* �
N@U�α�@Wus����@YN����@[>*�m@]D�]'�@_c����@`���X@a�R�Zl�@c+�����@dm�6$�@e�����@g7�~@h����U�@i�D.���@k����@m�-}ۄ@n�V��Y�@p4�6U�@qsʨ�<@q�}{��'@r�(P!�@s�}f1`�@t�N_Zw@u�yuVT�@v�k�$i@x� �2@y/O1BD�@zW��
�|@{�	gw�p@|�X��v�@~�S��8@S&��@�TZ��1@����}B@���n/��@�pJt        ?_�eO�?�����H?��3��?Ƣ����?�mE�T�?�	f��C?����R�@�1����@��a�@���ߕ@!�p4� @)h	V�@1�ߙ,&1@8���s_@@�v�a�@Fy�Ŷ��@MQEe�6@R���9ܹ@W�ݣ��)@]��"G�@b!���@f F�@jq=�@os�%��@r�̥��@u�2[i��@y$���p@|���(S�@����$@��wE�R@�P����@��
py��@��|u7�@���M�t@���͇@�M���&�@�"�}��@�xn��@������@�=؏yW@�{g.�9@��H�t`@���P���@��+|a0|@�<� ���@����+�@�l�i9@��w�g�Y@�&��G@�����@�N��e@�>}�N@�þ�bx�@���a:	�@���7K8*@����_�@���|u�@��`ۉ>s@���Q�@��x���@��4 L��@�V3ܹ�@�I����        ?c�3���?���k�?�d8'�:?ʰل�?�l~@T�?��*G'��?�lѷJL�@TG+��@�ӭ?�@/-��-k@!}o~�@(W�#��@0��i�^@6�1k>"�@>��%nN@C�Ik*Ii@I�Z;KFP@P)�����@T -Hʩ@X�6��7@^R�E�@b/����@ez���ȭ@iQ*���I@m�3GwA)@q&�](@s������@v��z�=�@y�L�z��@|�v�q��@�Dʖ�8�@�/O���@�;/ɲ��@�h�iy_@��6�.<@�)ʢA|@�����u�@�9�P��@���x�ۣ@�"�Q�@������@�O��+ݧ@�������@����xR@��*Gn@�o��	�t@�a% ^3W@��R�sv	@��:3���@��F0~a|@��u�R*v@�Ʉ�(@�/C%��@�`�^+r@���W�T@�ܹ[6 m@�&���4@�yy�:!�@��SH�uv@�7����@�Q�� IA@�뚛1�@�ʈC�\        @�4��p/@D����;�@a�]��W@sɆ��G�@���7el@���; �@�#����@��p�,�1@��%�(�@��P}KDO@�{H>�y/@�RA׋	S@��4W�ڦ@�w^@��A��o�@�z����@�ݵ��Z�@�n�_@�0�G@�"k�A$|@�G�X��@��7����@ҙ�֫@�~�6d�@ց34�4%@ء]�2@���&3�@�=�c���@߻����7@�,� �1/@��~�tL@��H{^6�@�n�h14@�ʺ3d@�~���@�xv)@�D�k�@�"�l��@�	���@� �^{@���l��@�*4����@�H`ӢK�@�p��kC@�����5@�ߗ�C��@�&�W]Jp@�x�;m�G@��\�EI�@�<��L@��^o�?NA ;}��A ���7ZA�>n	��Aun��8qAK����A('˅ �A
�ǲ��A�Z{6��A�gs�'%A�ME)�A�0LD�A	�0�s��        ?�+$��C�?�e��18x?�l�.�2	?�~�(�J^?���'b�?�cPc��@ �%9�V;@8?i!�@{(����@c^�:@@��+�@O��VV�@!�%��h@$�ص��@(K�o��@,!p�2+�@0$�0s�W@2bf}T��@4ʰOho�@7^1,-�@:���&@=
��Z<�@@D���K@A�b"��4@Cx��R�M@EQm�k��@GDͻ��@ISJ���@K}��� 1@MĻ��s@P�����@QWr��K�@R������@T0C��B@U��k�W�@W��$�@X�Z�@Z\h��|[@\+m�F�@]��7�@_�Pb�@`��&.0�@a�R��Mf@cE�3��@d}�@eG]i;�@fzr�[��@g���5vw@i��o�k@j\l(�`�@k�-�l>�@m0?�O�-@n��k��1@p�A�	�@p�Վr^�@q�ޣ�@r�<�$)�@sgM
��@tIN[!��@u1S�Ǐ�@vx��v@w�%@@x�~Q�(        ?`����v?��mT�.�?����?�K�:D?�e��~R?�����?��	%��5@	�((_�@�
�m+@�K�~�@ ��e�@(�SP�*`@1q)�*@8!��+Ѹ@@I�D�J�@E��b�@Kٽ v3�@Q�A]���@V3A�D@[nQ�K�@`���l��@d2e�M\�@h �OG�m@l��,�M�@pÌz�F�@s�Yl~@v���.�@y��7��@}�.m�H�@��>ʷY�@�h��8@�e�B���@��{���@�������@���g=,�@�e��e��@� �G�@��o\E&#@�ś��t�@��uޯ�G@��ٴIu�@�0����@����U��@�����@���
�d@�C���@���f��[@�B�޶=�@����*@��	T�P@�M�(��@�#m�I�@�o�	�@�� �$B�@��*���'@��H%�@���E��C@��&�%@�&�Z��_@�h�2v�@��oL턲@��₰�@�t�kS        ?S�6��?�(st_�?������?�S	)|��?�r�Y�?�!܈֏�?�t�n�p?��L��?�@��9�N@�P�>a@�f�.@#��p�Hy@+��ex@3ղ�0@9�
W��p@@���0�@E�I8Q��@Kse�)@Q!x�kw@U>��"�@Y��$@^�� �@be�D[@e�G���}@ip��'�@m��|6@q��ؒ%@s���l)[@vP����@yL��\��@|�G�T�)@��{x@�垟c�@��2�g@����x@�^�@��q��@�hEB�\�@�~p��4@���HL �@�G,�R@����a�'@�\&$=�A@�#gq�r�@� ����@���e��h@� U��+@��ct#@�/{�U$@�Y���,�@���xb��@�������@�&�&�"�@���x8�@��:��J@�m��v��@����ñ�@�����@�4� ���@�u�h�@�Wg�+�@�@��q�D@�1����        @�!L���@6��y�~s@Sv��%��@e�^�}@sR2qL�@~� "�5@��|�dXE@�',A�s@���g(h@��(R~�;@�kT�}o@�̰9�@�9 �\�j@���Q���@� /NbU@��9߲�K@�@��"�I@���n0@����O�@��"$}��@��yjg:�@�-ǽ�?_@���l�CW@��[�.~�@������@�����@�B�E���@͚u{3D|@��ȫ�@�Qo��G�@ҫi��&@���y�@Ւ �C@�!am̖@���.��@�y�>vR�@�B�bY@�7�Q�8@��pf~@�	x�8��@��,��@�,��p)d@�N��~C@�|��IS@�&HEfm@��D`�V�@�R���@�،�e�@�%Ը�@��aA�Q�@�0Brb@�et�ne@�9�ˍj@�I��ؽ@��c}���@���f�@��3�h�@�Ĵfo/:@������@�����^@�ˢ' �.@��6v�R�@����[