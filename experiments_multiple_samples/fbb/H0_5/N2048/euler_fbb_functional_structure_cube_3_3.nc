CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T103725        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?g�GԀ�?�������?��� ʦ?�E�Y�w�?�X)@в?�>�v��?�CG(�_?�p!7ۋ�?������b?��r���?���GqЁ?��	�JA@?��S��@_&�Շ@��n�'p@kE�L�6@X�n���@�Ў��@�s��w@a����@�[��N@��1Q�@R�fМ@ �R�yh�@"&�׳q.@#�34��n@%k�o�X@''��Z�@(��j܊@*��aˬz@,�߮�@.˫�Xu@0p���Z@1���|S@2������@3�1���@4��Q��@60v��Y�@7ry��@8��BxV@:c�Р�@;p[��[@<׳����@>Hv�F@?ªt_(Z@@�,��Ԑ@Ai�K�i@B5&	\��@CO��� @C�G�F��@D�/
@E��J�7�@Fv"��@G^q��O@HK���|@I=���d�@J4���u@K0�U%`@L1u��m#@M7Z�=.�@NBK
�@ORP1�5@P3�4{��        ?Ht�{+�2?v8��\<x?�#S~�D�?�Ƚ�8r�?�����f�?�b�nH?�@o���?�Y,Pr�w?ل 򕷢?�#��9L�?�dx��zk?�c  �?��ƺ�K?��� ?��F�+��@ \�@!�k?@VV��aw@	� �f�@�Q[�,@.N�%6�@�<��K@����@�~�H{@��K�?@�3�"�@!-�?�A@"���"M@$ݘƞ��@&��W��@(�ß�<�@+6�ڼd�@-�����@0%��k@1I��F��@2���\@4Xt`0;@5~p�/@7����@8�.,�V@::�S�`g@;��oQx�@=�`y3_@?����ţ@@�^��d.@A�]x���@B�a�mKO@C�|cKHi@D���|��@E�A���n@G���@H,K���@I^�v	",@J�5@@K�ߴ T@M*��:a@N��g��@O�����@P��}�?@QZ�/��@R��q3@R�@dR�[@S���T        ?b|2B�C�?��Y�C=>?���4���?����Mj�?Ž���j�?ђ[ڶB_?�/�O��?�i��*J?���'OW�?�.��E&8?��3c���?���)��?�G�.�E�@�La�@h�^�P@
\�$'�o@�.�B�a@�lƴap@TL��@#q�ah@,7��Z�@o��A�@ w�%og�@"VE�z@$T$VKo�@&q�]�J{@(�։?�@+H���r@-���#�@03E���@1{�Bc��@2�c��-�@4t�Ϝ�@6�6�>�@7���%s@9o�9�aW@;=���@=��{�@?,0�@@�$��@A�+���@B��%F�>@C���q�@D�Ʉ� @F&i���@Gb�i�J�@H�6�f�$@I��SEނ@KS��@L�d���@N'W�DS@O�c���@P��"H@QXw�M�@R$�].�@R�����I@S�].s1@T�:VQ��@U�j��|a@Vo����@W[�o(�@XM1�v�v@YC�r��t        ?��J���5?�Cs �D?�9��`?��<�u�@	����@���f�@���?�@$��ѥ�#@+%er���@1N��U@;@5�2\��@:'.� @?C�v�@Bj���v@EmP§Г@H�'k�V@L#��=��@O�
s�@Q⚐��@S� A;Q@V)�64�@Xx��1\@Z�h�tqv@]o�O��t@`�c�ǔ@an#�)�@b�9����@d^�+��@e�9F�l@g�'��3�@i5�kI~�@j� Bi��@l�����@n��|�_U@p;��f@q6x�x2�@r8�`��@sB^[��@tS��f�@ul$|�ɲ@v�?�w;t@w��Tw�@x��=`B@z�I@O�@{W�/��@|�E�D�@}�k��
l@?�Jy�@�M�m�r@���c*�@��&^��?@�n���>4@�+���5@��5�<�@��_l�^@�y�X�_�@�F+/���@�G�>L9@��:����@��
���@����/�2@�}Vh��@@�`�u�2�        ?L��n�"t?x���:?�6�V��?��N_��?�+�;�8?�5[�A�?ɧ�'�k�?��\��l+?�	[���?�Jw<?N?�g�:�S?��k-�?�:�4~N?�J{:)�?�N55D�?���L�	?� ��I?����!:�@���	�@�B$���@	����y@�p5q��@"JxԔ-@���q�@h��A@���v}@�wm�Y@;��du@����O@ѯqse�@��9@�}����@�]
�@ q��F�]@!�!�hS�@"�ǔ�@#ݽ��z�@%$���@&VL�k��@'�9^��j@(��+��d@*Tr� @+���A@-.���ֺ@.�	s��'@0�Qߎ@0�suܰ@1�aC��@2Kj��v@3V1逑_@42l��@5��Q��@5�����@6��#��@7�6�[�5@8�Ե���@9�W�P�@:���!��@;��L�Ҩ@<��B��@=��uz�@>�f^~g�@?��9�a�        ?Ab��jc?p�_��g�?��td�?�Y�
B�?�]���K�?���M���?ě-��c�?� k�o[�?���;?�`�h?☀S���?������D?��]�5�[?�v9�p�0?�x��E¿?����_P@ �Y9��@�m*�<4@	w��%@	Ҝ@��@J��<W`@�?��<@�@,��@`��%l�@����+�@�e[�Z�@�@\�/J@ }#0m��@"0FdtH@#���ݜ@%��E=�#@'�oF���@*�G<E�@,H�њ�@.���:6@0��Z|[@1հB_/f@3-���"j@4��߯)@6��t�@7��ЬeL@9#�x��U@:�����<@<y$�C4b@>:�}윇@@�SjCq@@��WRג@A�zWz��@B��-�@C����a@E����t@F-��1@G7E��@H]���@I�avL@J�\�l��@K��'	9@M@��J�@N�֥���@O�#4�̯@P� &c8�@QN7�=B�@R:&J�Y        ?7�]�{R�?d2y�ޣ�?�8�6��?�ְ��E-?���}��o?�OM�m�?��.��6�?��8���?�>�X�i4?Ջ�T߈?��#�N�?��t��y?��3�~�G?��$R�?��gj#?�|���u�?��ض�*@ 
|����@��7R�@�A��@	v����(@@�<�Z@�i��(�@�^�^A<@^�"J�w@�
5���@������@�N@z@ ���"@"@�Ω�[@$9�J��@&U��<@(�!k�=@*@�]��@,����@.�tH�%@0��'&�d@2#�Ƙ@3w��|@4��i��U@6r�\u�=@8	Z�sB�@9�O9ee@;j���eV@=5�� �G@?�R��@@��*SBb@A�ZE�^�@B�9����@C�uтx�@D�(�O@E�j���@GT]q5�@HJ���@I��AT�(@J��l�y�@L3i�t�@M��eR��@O �q�$�@P;e�ΐ�@P���@Q�iZ�@R�����n        ?�K'𡉑?�\H���?�R%�1�?�~&뿞?���Q�%�?��2��'@��_B@p@(7#?n@�Х�R@��TN�@ :���3@#�o�@'�I�Z�E@,j�1;#@0���"��@3F�3���@6q���@9,��^@<p^��]_@?�ߪ���@AϜ%J��@C�x��e�@E�¬m�@H�Ʋ�i@JRg����@L��m?o@O@ܮ��@P�]��R@RP�Hڌ@S�bM���@U:&$�M@V���#7@X[5�u@Z�Y�ui@[��"+�9@]x>R��@_H��X@`����]@a��d��@b�����@c��
��@d�׾�z�@e�U.�\@f�
��@g���W@U@i+GZu@jC����L@k{R�z�@@l�L�]�v@n ���@oM���� @pQL0�`2@p�.��t@q�����@re���_}@s	c<[@s��ӡi�@t�[\�t@u\(�Y=�@v"Y��\�@v��\�qL@w���E�n@x������        ?bfS-�@�?��ۄ�wI?��O)�5�?���{�؎?�)k
�rj?ђMNZ�?ٯ	c_�?�Mjj�?�iԇ6�X?����=�?��p���?��r(�K�?�Hޜv:�@ f���@��$©�@���Kc�@�QR��@6O��G@�o]���@ʵ9HH@�W��+!@�|0��@(�7:�@��u�@��g��@��$��@!����@"���F��@#��G�xe@%|$�;��@'�U�.@(����@*\|�r1@,WX��@-��l10@/��ҟ-@0�0aژ@1�.�bI@2Ў��� @3�&�0{@4��uW��@6IW܀@7"Lt��R@8Hʙc��@9v����@:�j� U@;�L4n@=*�Y�c8@>uXA�Ӗ@?���� @@�ܷ��@A?�9V�#@A�7�in@B�*!_�@Cd�߭pg@D"��	0�@D������@E���7�1@Fp��x*@G<�?N�@H�%]��@Hރ� �@I��&՜        ?Q�y4��?e@��?��H),z?���[�%�?�b�[j�?Ķ��.�?�2�7�*�?�0�6�x'?�A��;�?���W��?�e�6�?�n��>?��	��4U?�9Qǈ>V?�~*�~"@AB���@E���@���N[@?⊣T@=,4%:@��Ӄw@#W(�U�@�b���@fk�6�@R�N�Z@r��w�@!c��
@#)��=Z�@%
���C@'c|GT�@)"��Ek@+Zh�l[J@-��oڕ�@0��^�@1[�O'�@2��]��p@4����R@5��6�f@7ȴ��L@8���/�@:`4)0�E@<=/�@=�%�a@?���a�@@ַ��@Aծ6�:@B�P�=!~@C���N��@E�Z���@F)��#@GT5{�6@H�p'�.Y@I��y��@Kz�Z�@L\tW3@M��Ä@O��aZ�@PB�� �]@P���I��@Q�fE��@R�7xͫ@SK��J�@T0�A9�        ?Z9=N�?��6���2?�n��4!?���!�**?������e?���cQ
�?Ғń��?�C��	��?����x�?�Y!`R!"?��M��d�?��ʬ4?����t1�?���-�R@ �	{[@�|��@��nGhe@
}~���|@u2G�H�@c~2�@�{H�@?l�5�t@�C��	�@�e���?@�0--�s@!&�Ξ:7@"�Fp�@$���A�@&�/�IY�@(�~d��0@+iy0��@-l��)�!@/�OՖ=@19�)���@2� �{�@3��'�=S@5vw���@7 �7�̘@8�(ą<�@:Hg�Gf�@<�uRi5@=ԴKv�k@?�(Cl�@@ӵ(:�@A��Ų-@B�楂�@C���g�B@EV���@F:����@GkJ�1=s@H��z�|@I��1��@K7��,W@L���|G@M�_�3��@O]W�@�@Pi��"�@Q)���N@Q�nk�@R��o@S�*)��@T_i���@U:s�G        ?����o[?̯1�J�?�� 1>��?��\ t��@6���@�d�uK@ffI�@ ��ĩ@&�,I�@,-�yV�@1�ʥ�/@5N�.�(�@9~�-w�@>��K�@A�����@D/iW�#@G`����@Jٓ}8�@Md
�a�(@Pm����!@RB����1@T1[ʬ�7@V9�T�SD@X[����@Z���	{@\���d!Z@_\�+�O@`�n,�@bC���@c�y��y�@e���@f�W�]��@h@)=
i@i��l[��@k4��^>@lޒ�@n�ԓ�?J@p+Լ $@q��ӥ1@r��Ad@r��/@s�\�(QH@t�00�5@u�E�Fֲ@w��y:@x."u�@y2��u6�@zS3�!�@{y;���{@|��=�"@}�'F���@�J �@�'�k��@��&#�6�@�o�Uɫ@��?.K8@��O���@�q��kz@�"� ��\@��An��@��}<j��@�H�ge��@��t�h        ?IQ �2K�?u������?�`����?�����R?�)X�u�-?��8KU+?�)wL�Q?��5@��?ԫ�Ħ ?ڸ�x�H�?�̑	�P?�E@�?��l�r�?�����O?�f�*���?�2xeA*.?�7�bb�h?�v����?��X"�@ җ7�0�@��̄Ա@�1�.@��"��@	h�-�w@����K�@kT1��@�b�Z9�@���n@kP�M��@��@��iwځ@-E��@�e\'��@��	�ku@|�d5��@a~�Ru@ �=�`�@!��3П�@"�Ng}�r@#���w�4@$�zd ��@&�m��@'2��P�@(eL�	@)�����,@*���@,-,m�@-��K�@.ڂ�C�.@0��@0��m�@1�V����@2J���@3v���@3у��Y�@4���r@5hU�'�E@69�r���@75�@F�@7�f�%�@8�,Ao<@9��2���@:�?��        ?9���g��?i X���?������(?�-׫97C?��~ ���?�4T.�?��A���?��
���?�l`W�ө?����;y?��m�q?�e�x�&�?���?����RB?�~�h�J�?��֪�,�?�tU��'@^�B��S@K��~5@��IEе@PF��Q@��lc��@���v�A@�5��g�@8)v3G�@��Bn:@�f%I(�@��#�@ �Hq�@"���@$Z�}�t�@&>7M��c@(<��$��@*V~6w��@,�y�d��@.����I@0�r"T�R@1�4En�<@3D�%1&@4�YS1�+@6AI�R�@7��8�@98��'�@:�j��@<�|�g@>Z�3ʯ@@[����@A1���@B��'��@C�C���@D"N�L-�@E;D�I%@F]�ۼ�|@G�;�/��@H�r�Ad�@I�Ig��D@KE�2�@L�>����@M���s�7@OZ�[U��@Pe��l�@Q#cI��@Q半�)6        ?8��@��?d׫oа�?��҂�?�7����?� �C?�UTNq��?�Vt�0�2?��.�?ς�I��u?հ�z`�?��M�1%?���v�?��q|�X?����Y�^?�f�4Y �?�Oimr|?��œ9͈?���r���@��+�Z@�w=��@�C���@�֔h��@9�&��@ZwZ���@��ի'(@��@��@j@�� ��G@�u��td@!^d���@#��5��@$՚��ξ@&���i#�@(����׈@*�?Ү5$@,�Ԟ�Խ@/=ɻ��@0гs��9@2�}��@3^P�CL�@4�w�E�@6$�)�=@7�{�9O@9#]z�9�@:�����@<]@`��@>��{�@?����@@�M�g;T@A��HM��@B�#C��d@C�I��W @D�Y�!
M@E�b����@F�sÝ�S@H���`@I3�gwxZ@JdVb�/@K���.�@L���@N'-��0"@Ox���D@PiV�+;        ?��әI�?�E4Fn��?���B��W?ߏ&��?���#�?��>���C@�m�]�@���p@j�L'�@.'��-�@���@ P��_l@#��F(�0@'Y<��=�@+]ۋ4]j@/�~_մ@26�:�f�@4��O7@7pw]X�@:Q]����@=` ]�)@@N�����@BUh�Ͷ@Cщ/�>@E�J���@G�����@I������@K��Q�.~@N6�v(m�@PIo�N��@Q�|c(�%@Rɤcۀ�@T�hG`�@Uz��/A�@V�Z{�\@X\�:[X�@Y�!WJم@[p"�d�@]�Wh�#@^�o,WF�@`5[Q6��@a2XY@a�:^@b�tps�@c����@d�~��s@e�R_��@f�\\�z%@g���E@h���@j���_[@k3��P@lY	�7�[@m��3���@n�R��.�@o�`��
�@p�[f(��@q8��� @q��ů�@r���z@s2vf��@s�Z2��@t�cn���        ?s�`�`�?��0AQ�!?���J?ż�Q3;)?���gF?�2W�"N8?������?�~���
m?�I�!n?�����K?�2�p�@����*@�mX|N�@�#�:�@� �b6@i���kL@���!z�@�ӧG�@��2�R�@l\�A�@M�j�ܚ@ +ɏ�@!´���@#m�w���@%,y�!�@&����G@(�9}Z.	@*�I��7@,�×;@/	��;Y_@0�lk��y@1���N��@2�ma @4%1b�V@5ek�@6�O�E�<@8�ɚ�@9`!�/��@:�M?l@<7�t�uy@=�j�@?6��@@a�:�G@A-vbe�@A���Ι�@BҵV�@C�CP	�4@D�`��@Em ���@FT��@G?���[I@H/��;�@I#��s��@J�!�u@K��=H @Lց��-@M j�iڭ@N*E�#T�@O8e
?��@P%b��@P��**`@Q>����@Q͡nV        ?P��/�Y�?|�֒8?�$��l?�>�LV�j?��c�}:'?�B�Ч?�ܹwl�?�+o'��c?�{��k��?�AI�gӈ?�2 '�?���׸?��Ȥ�v�?�!ZVg>?�J��R��@
t�/ܷ@C͚q>�@�-�I{@�C�y҇@�SB���@��Gk�B@i����@)r8�@@�׆ֱ@L�Dᲊ@ �ج�ԕ@"��-q5�@$���K8@&�J`G,�@(�61��@+!
d��@-�M��hr@0J]E�@1f/#n,�@2�jT�M@4I,�N@5Բ}-�@7q�+	I�@9 ��`��@:Ⴣ�g�@<�]%w��@>�c��9@@HZ:��@AM7�
v�@B[YDA��@Cr̡��q@D��"�dB@E���J'�@F�Fi�@H.ƛ#@Iu����b@J��ׯY@L�U��@M���%3o@N�䐉GE@P4���<@P�uS��G@Q�����b@R�eLe@SSOT�w�@T'y����@U �'�o�@U޷�N�        ?]?zTv��?��2�t<�?����(��?�D�$��3?���Q�Ÿ?�`�l2f?��R˒��?����>Mv?�~ֲ-\�?�Ozt{K>?��&�N%?��\�Z�%?�Q}�g2@2���1�@��^1�@۾d\�\@a�-�
�@2-$��;@�%w��@�Բ��[@B5�K�@�(7)�@ �;l�
�@"�j��ܘ@%o*�D�@'{�kh�@)��I'��@,���{�@/�ʾa1�@1?��,RI@2���.�N@4|yA��E@6:I_�^/@8[�EZ@9���@;��H+��@>�r5�s@@��.� @A8M��й@Bc!�R��@C�'_�@D�Z�Z2|@F&�Л53@G~�@*^�@H♝�͖@JQ��*�_@K������@MS��e?@N��`��e@PC�NO@Q�5@�@Q�bo�8�@R�Q n�@S�x�k��@T��:��@U���j�@V���,/@W�-[3�@X�-�F�@Y�x�*�#@Z�_'�-@[��5O�'@]�d�5         ?��"kpp?�Eʀ?�7n�@&@ i3��7L@�_R���@S��f"�@ �kR%@%��3��@,�c��i�@2;��Bi@6�3FQ��@;Z��z]@@O@F&@C-O�ۅL@FH`�s�@I����_@M62��4�@P�ɝS�?@R��Z'}]@T�w�M�@V�֢��@Yc���"@[�_��@^�zf h@`�>c=�@b��oh@c�Ŝ��O@e7�__ځ@f�S�c�`@h�N"3�@jV<�{@l+Ǌ�-r@n�\@p����@q��q^g@rW;�a�@s'b��Oi@tC�݋�/@uhm�g��@v�uۜ��@w�؟���@y�����@zN�#��@{����;=@|�A�uS@~RVv�'�@�<��N�@����F@�O��'�1@�(�iB@�ҫ�q��@��'��5�@�e��V�>@�4�"���@�M�x#@�ߍ0��@�����i@���q�u�@�|�;�f@�c����@�N�,?s@�=�v9o�@�09KÉD        ?a4[?���?�vs����?�i�:��?����X�?��Z�B�?�n�滬?��0���E?ܽ}yg�?�����8?�Hg���K?�<	� ,
?�mD��?���TS?���$[?�^Ο�@�["�M�@t(��V@��'�@	����b�@�����@���Ni@��;�o*@S<;tN@.����@!y��ڦ@*��-i7@J�S.��@�2 ߳�@��-�T@!�)d��@"Wf�2�@#���X�@$��z��@&VK<��@'�9��a�@):
��@*���9@�@,L�����@-����� @/����"@0��\h�@1�Z�j?@2eCKcYT@3P}���\@4A���f@58���l�@66hMp@793�(W@8BZv>�@9Q�����@:f��=�@;���5�S@<�B��r�@=ʬ�c)�@>�8�$v@@��ӷ@@���S;@AR�Up��@A�-�9��@B��(��@CFǤ��@C����@D��
�pv        ?7-�����?d!�d�1?��F�P��?�b�&��?�%�,��?�����&Q?�.g7�y�?�2�֓#t?�b�q0�w?��<1 IC?�	a���l?�EƼ&?�N<�<v?�-d�6v�?���)A+?��/]���?�2
;��?�$:G0@C�0�9@F�WAo@��_�Q@4��6@��U�@5���@�P��q�@��,�nf@�Qߌ�@�58�@�R�i@!c����@#�w�`�@$�$."h@&��V��O@(ڍ8Jk�@*�s��v�@-8G^h�@/���s\f@17P"8<@2L~Ŝ�@3��QO��@5��@6�����8@8*(H2@9�?LMۧ@;A��k�@<��]�h!@>��3M�@@H�N�c@A:�{�2�@B6�!:�@C9��60@DE��Ԯ@EZe�@Fw���@G����"p@H̒r�^@JF<�g@KD�k���@L���!�@M�X����@O=G��}�@PQ:���@Q{aᣳ        ?Z�f"M)?�
��Ef?�v�t0�{?�r����{?�Ya�7�?��}��G?Ҭ�� ?�?ځ=G�i?���_;`�?�H�uSW?�2�*���?��w��?�,�V��?�D��^@ ����(@��|�)�@�+-:@
����@� 2T�@r��D�@�ںR�@E> ��@�W���@��n#��@�(/J�@!dY �@"���@$�-�~O�@&�*��@(���0�@*��4 v�@-���d@/r	{`V"@0�pg���@2F��B@3�qv �@5��I��@6��h�@8�@S�@9�J����@;_�_�@=t�W|T@>�RqNW!@@a�'.��@AX(}�h@BV�p�[@C]���@Dm}��t@E���v@F�8D<�@GϊO!O@I��w@J<o���I@K�(3kݫ@L��L�t@N"����@O�I�q0�@Pt�&�1@Q-<��;@Q�n�k�@R�����!@SsL{	l\@T>��{y�        ?����|�/?�y3
�!�?��v_�7�?���1]��?�+��Hn@�=��/	@���"M�@8R�ϋ@���~|8@$oZ-��@)k񃿆�@.�E��M-@2��J�T@5���!'>@9p۳C��@=QOj/�@@��*@B���\>�@EQJ�4�+@G�	&\��@JwK����@MA8
4�@P�[O@Q��u�K@S>1�|�@T�1Rai@V����~�@X�R^Kz�@Zj����I@\d�+��@^q�-�@`I��ar@ab��[�@b��di@c��rN�@d�94wڪ@f)V`���@gs��W@hƖj`>�@j#�14`	@k����L@l�RA��;@nu��t�@o��f @p��,�|[@q��!�@r`���>E@s6H��,r@t�I?�E@t�HA�l.@uԟ/1V�@v��!���@w� ���@x����@y���Y�@z��K%�@{��6-@|����Ҍ@}�Z�l�@~�#/K��@��b,N�@�t�	�4�@��%t�h        ?dQKc3��?�H
�΀�?�����@�?��l1<ن?ǭ�9(.?ҥ��I?���\��?�#�%l?�|�f���?�3o�*?�_�gu��?���v��?�0X�8(@ �� �q�@ZT�()�@M�0kb�@	x�[���@��x�h@:���E$@$���@)��6�@L3a�8]@�?$�^@�*�:�p@`�]@�M����@!T��IG�@"���n�@$5�����@%���_�j@'SB���=@(��y�J�@*��s{�@,vS���@.M lƖx@0K��M@1�GZ+�@2BR�@3&�j���@4;z�p^�@5X��~�@6~��@)�@7���:��@8�xj^@:"�3�
@;jo�(%�@<�a�?�@>�����@?sAm�r�@@n�,�@A&�0���@A�E3T@B��t�@Ch����7@D1�*.�@D���N%@E�̰��u@F����U@G~*�5�@H[.4O��@I<^����@J!�LlY@K
�T|}        ?W <E#?�"}��~j?��E�S/?��r��7?�y(vi�n?�x�ҵ5?�bP���h?�O�|��I?�W�1?������?�Ch�n�i?��ec���?�����$@ 	w�W�@$V�+��@�RW6�@
b�<��@��R�Q~@���R�@ Z+U�K@��?�c�@�k@��@����e@�-�ZT@!�3"�@#�8����@%x�۝ @'� ���@)���"y@, �{9�@.h�d��@0w�K�K@1��RN�@3)��Ɲ@4���N �@6f�?�@7�}�d��@9L6&�O	@:�t�=7r@<�vW�Y�@>�t���@@;SW~).@A6��?@B9��?U�@CF%��E�@D[�"��]@Ey��i�@F�A��"�@GѴ>��@I=��}A@JM�]�u7@K���&�@L�[���@NL���d@O�ŦW��@P�/�V@QN�����@R���e@Rչ�Β@S��<�@Tn��e�|@UB(.�]�@V��#�        ?S"ӡ�>�?~���:l?���8�0?��k.��?��3 �"�?�T��??��#y+�?�6Y_��R?ޖ\�^�?�_�2?�k��	͐?��A�?���H��3?��D���?������@|Z���@����QN@	���t^U@�&]Y�"@4`�ʮ@�;�s(@@��9�@'C�7�e@G�.ui}@�N�,��@!�:�_�@#��V�d�@%� ��<�@'Ǐ`��V@*�&D�@,�EИ5�@/"i��@0�v0J�@2^R�ǳ�@3��W�"�@5vޕ(�@7erg��@8���IA+@:�%� 2�@<�z�g1�@>�ZDd@@Ky:�@A[��7�@Bw1j�l�@C���Dc8@D�T,i��@FZ�X��@GN�[q@H�� �>�@I�,��w�@K`���O�@L�"a$�@NN���Ԅ@O�L�u��@P��\x�@Q���F1@RXgO��@S2���&@T��v�@T��J�x@U�2 ��O@V�r��9w@W�tRz�        ?�'��:2V?�u�%)?�&�k��7?��H�3 @��P@��GN�@i����@"�7Rw[@(�&�. }@/lr���@3|�9,�@7��H@<G^t0��@@�Ru�@C]��ގ�@FKT�*��@In���j@@L���Լ@P+�����@R��m|�@T2s` @V'�^SF@X\�D�R2@Z��nq�X@]��ظE@_������@a$����@b�r�=��@c���AZM@er��k�@f�)M�f"@h�Ĵ�}*@jE�E>��@k��ے��@m�d���@o���jN�@p����@q��?T��@rǮ����@sԺ�7@t���5UX@v�6׊@w-T��!+@x[kR�m@y����	�@z�m����@|R�Q�i@}fqd�e�@~�ï�
@���@��r�{l@�zQF�@�6:s��!@��)��W�@������@��	�>h@�M�j�v�@��w�#�@�񩮒�&@��p��;@��$��X9@��ţ[m�@�hO~Z��        ?h�>�_|�?�h���e�?���]�[?����m?̾U���W?ֳ�WMR�?�����?��:
?���^/Z?��v��I?��N�� ?��,�@K@3W�Li�@E~q�I@�p�X@-�
}%�@W܀�^@����D@�Ǳ~�-@	�0��@y�b�g@	
y&*&@���Xv@ E�L���@!��"	�@#H!�M�@$�M7��@&��Ds=@(A���C�@*��N�@+ܷ��@-��F�S@/���y�_@0���92@1�|'w8/@2� x�ݑ@4 xZKA@5��\+�@6>?qSl@7g�T�@8�蠔HY@9�?�gh@;����@<R��s�@@=�O^��8@>�	z^@@&?1LTW@@֝�bLv@A�V �w"@BAcB�7@B���䷝@C�b˵�r@DzJ.��@E>p��Ͼ@F�Lj4@F�m�	�@G�=~S�@Ho>�_�@ICm�,�@J��P��@J�E�IsK@K��-y�@L���7�        ?_�����?����f?�@�-e�8?���ߓ	`?�Rb厚?����	n?�~���	f?�"[��?��!R�8?���JG?�Vj�W��?�1�ߦ�?����'"@j[�B�@��U(�`@	���@����g�@#s�M�`@��@���@C��u4@#�aN�t@;!%��@���_\@!�c�J�e@#m,�M�@%n3A1X<@'��5-A@)��N��@,0��}�@.�ɮ�q�@0��j��@2�1rc@3��íM@5�f�$Y@6�H3��.@8]�;���@:!5n�x�@;��c��I@=�B���d@?���
@@��b's@B��z��@C2�8��@D^��@E�N�"@F�-)�d@H#Fӏ�b@I{�ǒ�@J�@�l��@LP^��@M�c���@OTp����@PtQ��!v@QD���/@R��ڪ�@R���Ø@Sڻ��ʭ@T�.kU�@U�֔ۀ@V���,�@W���*4@X��5��Z@Y�Ll;�        ?_�p<3
?�W���)(?���e��?�16�ȩ?�8��Q�?���NMO?�Wi�r?�5?x��F?�_$�"u?�	��ܻ?���=,�?�)�+��?��u�1Ae?�}N��@ )$�@V�u��@�Tc�H@U�`��]@z4���T@�_��@seM+��@ׂ�x�@�X́�@
�B���@ + ��@!����@#δ���<@%��m/@'�ZWk��@*3��@8@,�?�b�@/$�@�^5@0�HB��@2Tv77@3������@5b�6&o�@7 V\�@8��E@�@:�4�.v�@<mrמ��@>c���%�@@7lZ�'�@AG�>"��@Bc��:@C�{g �@D�,(k?�@E�a2�X@GAM���@H�!�/�@I����T@Kd8��{4@L��*O0�@Nd
�� O@O���4�@P�j���@Q���L@R~���߰@SbW��s@TL���8@U=\��@V4�{�j@W3&���A@X8&d�c        ?����x\S?�ueYt��?�1�?b@ ��_�d@�c'�'@cj-nTQ@ 쬅xO�@' Ύ�%@.L�u@36���6@7�<朞R@<ŧ�	{�@A!���ҙ@D�Y��(@GTU��>�@J�ύ��@Nw"��@Q1q�g�@SDD�w~@Uu�:�@W�LE�pw@Z.��h�@\�B1�6@_\� *�@aE�P�)@b~c���q@c�V�R@e���f�@g��uZ�@h��4�@jpJ���@l,џ��@m�|Vd��@oƙ���@pҠ�MD@qǭ��6�@r�m�$�@s�ٻNհ@t��~��@uԡ���@v��V�>�@w��9��@y[���@z;VqZLl@{b�ٓ"@|�kH}�@}�P��g@~�Xy;JL@�9�	�@��ɠB0�@�]�]�Í@�Q��^�@��8�
x�@�U�0f{�@�)��ס@��'��V�@�bx�t5"@����Z@��2��'@��1MT>@�>��`��@��Y$��@��J����        ?b��~"?��]��S?�
-�;*�?�t�,���?��#���?�,,�߸�?֝7C�ۄ?����)o?�a��F�?��H&�?�1N��?��Ɖ�~?�_��PJ?���ԡ�@ �1��@s�6�L@:kXC@�P�if@
���Y8@��д�@���V @[��ō\@/z����@��sI�@���%@2-�Um:@`9���,@��d�3@ ��n*s@!� �HiC@"�7��py@$L��oC�@%�dp�V�@'K+�=@(~]g�4@)��wD@+�㟤w�@-M��n�@.��^61@0-3�:�A@1vġ*@1�v�6�@2�r��ep@3�K�V|@4�7�(s@5��T��@6���x�@7���j�@8��f%ٺ@9�9-l��@:�y&�%�@;�_\4��@<��.�V�@>�$��@??�ڽ�-@@7Go�@@�����|@Am��/�X@B'���@B�p��M@CT�3Gv�@C�Uo�b@D���>p        ?@��Ag�?mJ����?�������?��r�ђ?��M��?�!N$W��?�T�P4?�4�(�?���� �?�7�';*I?� Ow�?�Fu����?�s�&oi�?�N�+���?�i�9���?��̼l�@ )�u�K@~H��A@Y�����@	�5&"�@��B-��@�����@k�{�@�qaҹ�@�m:@�p���*@����0@!d��g�@"΅u,)@$����@&�ke'@(�!�Q��@+E���@-`?�e@/�t-&�:@15���@2�~WI�@3��z�K�@5rGª@6�P`�@8���f��@:>G�X@@;���h�@=�oW���@?�[�0��@@ăjR8�@A��Qo�.@BɑH���@C��"��@D�� �d@F�x��@G;/���@Hm��bT@I��3e�@J�G�-�@L:�7e�@M�T�?̗@N�)F\�@P-$�h}|@P�c�N�@Q�\@(��@Rg5Q�g@S.�߾��        ?R�) w�B?|Z��9?�ƶ�k�?��0W�?�-n5,��?�+Py�[&?ˇf8�?ӶHh��	?��N@I?���܌�?�7�Mι?�Y08t�?�4w��s?�8�eŅ ?��Wm���?��lҵ��@��T�]r@εTF��@	1}�B�@�&]���@o���C@���]H�@�v�E@�@_s����@>Y'�@�U<�>�@�*�W{@!um*ߍ@#T�7��@$ل1�^@&����'@(�JO�b@*�(��m�@,������@.ُ뽮C@0������@1�I�@2�����[@49y���^@5��_�Z@6�c*��c@8L�|*o@9�!�˂�@;?&�G�@<���bd@>`�;ĢM@@�
^d�@@��_ˋ @A�c�%f@B�O���@C���D�@Dq�4(�@EgC<��E@Fb�d��@GdT��Ԁ@Hlr��B@Iy�����@J���Ϡ@K�3�?��@Lȧ���@M�\+n�"@OY�A�@P'�᫗�        ?��#��?�&f��?�f {��P?�O����?��s�v-�@���.��@�X�=K�@������@�]�6S@"墄q@'k �
�@,mY6l^�@0�^���@3��嗢�@72�S�a;@:��n�@>m!�?^f@A5"n�.�@CS�%��@E���]�@G�Ӊ;I�@JqS�\H@MF�: ~@O�ł�@QYs���@R�]v�@Tk���G@VUUC!c@W�l�K�@Y����@[T�AOc@]8.~�N�@_+�$e.�@`��[��@a� ,�0y@b�.��B�@c�l���@d�S��@f���}@gMb6hW�@h����@i�T��?@k��{��@lg�SIn�@m����XV@o&R�W�@pI
��@q ����@q�n�c�O@r��W��@sJ��f?5@t�����@t便mqa@u�����@v�j�+�2@wj�Z�Cc@xJ�5n��@y.g���
@zP=��;@{W����@{�|�Y?@|潂a�M@}��5d�        ?Y�ro�?��V��A
?�'	����?��pє�]?��^��)�?Ʌ���?��r"IG�?� 2�ӑC?�?Bx�?��.�?뢳�zws?���Y[@?�J�(�'>?�`�S߃?�����@ ;8���-@�k��i@!U�s!6@�W���@
��J4�@��Cj�@���od@4���I}@ 3�|>q@�wb�a@��F�(�@�Ϳ���@7̔��@UY �7@ V�L�4@!����V@"ҿ΂{�@$"�j3\@%[ɂ��@&�29��@(\Q@)�-�˃@+k�v�?4@-�46 -@.��+���@0/Q�E��@1ڔS�z@1��tg@2�����@3ҷS�@4�AP�4@5ɪ��D�@6�qE@7�iSה�@8���&@:���Y�@;�� �"@<CO::tR@=mTDD�@>��Zh�@?�"Jބ@@�|�^��@A*��&@A�ײ�`�@Bv͠��@C!����@C�ZSqI�@D���        ?D��O��/?q���M�?���zw;?�X�6�AV?���|@��?�I� B�?���?�:��ɖ?���An��?����8�
?�W~5K�?�)5���?�~ �'x�?�q�A8[?����y�p?���m�@�>�ut	@4��#�.@�^����@����x�@����>@�J��@��>�sJ@o#^��`@���B@�\��@!*�Y��F@# �B<�@%$K�8@'=��&D@)�Ws7R�@+�#Ul��@.��$gSA@0���ݺT@2	��U�$@3�x)y@5]7\�@6°f}�@8|�PM�@:J�}���@<-I� @>#�J��@@�f��@A(/�G@BC0��^@Ch�+DE�@D����/�@E�-�jM�@G�E|@Hm�7��@I����i
@K3\�Cȋ@L�T����@N&ڤ�&@O�9{��@P�x5�
@Quفu@RM3��<�@S*�j^�@T@�:@T���Z8A@U�Fuk�@V�,�]OV        ?I��}��?s�5&�?�c� ø�?���x��?��E,?��,+�N�?���(�?�)M�r�?՛ܼ��?����
K�?�ۚ�'�?��l�WF?�~͂�?�qފ'c�?�[�?�?�ËP���?����g�@�����@����@�i�)^@�}� 5�@?W�66�@a�T��
@�C�V�W@(�ƙ@�6�a@����@��L��@!o����e@##Yꊃ�@$�ݾ5�f@&���z/@(���ro�@*�Kcp�@-%L����@/uH,M�@0�B�_ @23���r�@3��N/7#@4�T��Q@6Qq���@7�����@9V�d�@:���p��@<��r"��@>J�ԑ�C@@N�2��@@���e4G@A�.B�tt@B�:�|@Cػ�u�&@D߾�}��@E�N'_9�@Gt�&�S@H"<�?�@IG��s��@Jt�Ey��@K���R~@L�l�]��@N*煯~�@Ow8"�I@Pe��"l,@Q�\�>�        ?�]Ʉ?���A�?�_�+�f�?���L?�6��D>w@�Lyz@�u">=)@Y7s��.@R,��R@")�j�@&��2�Ǘ@+��g���@0��GOr@3����@7�:��2@:�a	�]F@>z �h@AO7���$@C�Xk�@E��J�Պ@H\��w�@J�m.r}g@MƓ�H��@PYU�k9@Q�����@S}U|ĳ�@U+��F?�@V�nj��@X����T@Z�Q�@\�\#Sa@^�'�-"�@`ie���@a�Cj�,@b��F�A@c��?i*?@eF��	�@fQ��Ql&@g�鑪�s@h�=�;@jT�匞5@k���Z�@m3O�U�@n����4!@p��L�@p�"�ߝ.@q�=wV�
@r�M'�C]@s_PE!�2@t<FXh$@u.Ԍ�@v	�˹m@v�ת��@w��E��@x�R���@y���@zѹ́i2@{�s��\@|�8��)-@}���.�@��%��@���ǔ@���1��        ?a�ū�q�?�}&�9�	?���5�x?�� ��?�(�VB�?э�`�U�?٤p�Ot9?�� ��g?�^�R�Z�?��F~��z?���ճ�?�����R?�:�N�f@ ����C@�^ְ��@���D/�@�@��5@
ԩ�S{@�a�K�@����t@��JZM@����@�N�O.�@E�aC�6@��!�]�@B�I:��@ ����f@"Z�U�mq@#�_����@%Nօ�H�@&����R@(~1�~�@*+�Yz�@+舅��D@-��m��@/�$���~@0���&�&@1�}tAI�@2���@3ŔdZ��@4��&��@5�q~@;i@7�?C�>@8;9 �a�@9kd3�{�@:�&;�p@;�tF�1�@=)ol�ӹ@>x�iV@?΍қU�@@�f� Ъ@AIuk(��@B y�?��@B�y��h@Cz{��wj@D=���@E�J�[�@E��Ӛ@F���3�@GrS��Xk@HI�U��@I%.�(�u@J�<���        ?Spք��$?�,�Z�"�?�Oi����?�~��]o ?�FW6"�?�� W�?�Fv�?�(?ؘ�ө��?��</�/?�$���LR?�uZSB�?��D	Dֿ?��rC�?��,�t@ #�һ	�@'�h�YB@��Cy�@
4��VX�@E��V�@\/\H@ǀ?=�@g	Jm�{@<,���^@H_uV^�@� �ӿh@!��Ea�P@#bU��.@%]�OI@'v]�V��@)��m�ː@,�Z��@.*��@0��A:�@1��0�@3V��|�@4Ւ x��@6e�����@8 �	�@9��'-�@;~��5V+@=UV�¾@?=��B4}@@�M.���@A���YZ+@B�TA��@C�#��@D��	��@Fe��6e@GL��L�@H���N�@I�,hs�@K"�l�gH@L|�L6�2@M�3��)�@OL�z�N�@Pa���1@Q!-s���@Q�|/I��@R�f���@S{�/{�@TM�]羀@U$���|@U���        ?5[�?��?b�G��E�?���x�?��)��?���b���?�Q����u?������?�+W�?�~��A�?�F%&��?�X���X?���7~?粩(�u?������?�]���?�[���?��go�g?��3r��M@Ӿ�i��@�A��Q@	s��	�;@C>�7�@�0)�h�@�)Z)9@k�eE�Q@:�>B?@瀈��A@�F-�@ ���]�/@"W,�4@$0Si�!�@&&��WB@(;!���@*n?��@,��}�!r@/3r�yw"@0�t�?�@2=��5�F@3�{&zO�@5&p�[@6� y��@8U����w@:����9@;΅�tK@=��N�@?��5o|I@@�Ծ���@A�"IɕN@B�Z 
@D�ch�@E)��K�@F[�(�x�@G�v��8@H�ʘ�@J.�,�j@@K�5�;@L�-myaq@Na�)�@O��vu�@P���8�@Qz�:�m�@RH��dJ~@S�Ā�        ?�if]֟.?�>0����?��j�?�9��@@����B�@��	��M@f�)�0@(FOK؆@"�t�)p@'�׿B4@-�A��P�@2!V	ߥ�@5�����z@9��~g�@=���=@AKr�p��@Cƨ�x`w@Fn>���T@IB���վ@LDʵ���@Ot���;I@Qi����@S0~G��@Ug�u@W�Hj��@Y�X]/@[6O�ˏ@]s{Ij�]@_Ȥ�N(@a���X�@b]��[a�@c�T�wv�@e(���@fn�&3y@g��+(�@i`G�j�7@j�L��o@l��r�X@n&�;�h@o�mq�i@p�<G��T@q�d��
�@r���;�@s�1;���@t~ޮ�@u{�����@v~� �`@w�>��@x����7^@y��k!6�@z�At�!�@{�		���@}EGRA@~E�,�I�@|>��ܫ@�\�Z>!�@��4P�@��,�|�{@�KoF�@����a��@��ƚ��J@�W�^�ӂ@�}�^*        ?_q
|S�?�-q��?�Bw5��4?��B���?������e?���8���?��*�ֈ?�8��P�?��rK*3 ?�����p?�Πǳ��?�d�S�|?�;�e�k�?�n��1�D?��/�@t	�G�@����@�� ^~@
��H"#�@x���@�c2q��@��of'�@`ޭ'i�@V.�%,@b�{���@��� �J@���ʾu@��u�@ �7�}��@!����}@#H��*F�@$���#L�@& /('U@'lh�X�r@(�0܍�@*e�5���@+�w�hc@-�#Y+`@/,v�f��@0l��~�K@1H&%�@2)���x�@3��YΒ@3�[$�ߢ@4�Z�`E@5����b(@6�{��@7�OUkE@8ⵘ���@9�@�te*@:����	@<�Mw�A@=+�ö��@>J����N@?n��:�2@@K��@@���"��@A|���ǃ@B��^@B�����@CX ���@C�V����@D�ݹ        ?AT�|��?m��A?Qn?�yԙ��?�d�d �)?�'?pm~?���Ŵ?��p{?�V
E��?�{T);��?�U	p�?�yBD�4?�,v��?���d?���ն��?�*����K?�N:��e?�����f�@��ν@����@+TB�[�@
�7���i@���?	@W�=�G%@���T@3���@�s�P2@����@�s� �n@ �VXШ�@"���]��@$o����@&_�X�q�@(l�G�9�@*��!x��@,��2^x�@/H�Y��@0��L�W@2;a�P��@3�~W�@58�sʋ@6�"�쭹@8.����@9�R׷��@;�!ل$�@=Xč�W@?5|$���@@�C�7��@A�C���@B�Ffɞ@C��b�Z�@D�O9�5@E�Y&��@G&3k=��@H`�z�;@I���:�@J�����@LM���	_@M�}��e@Oǚm��@PKz�=]%@Q��@Q�"�@R����+        ?R:�P?|�8;�?�"�(�w�?�� ١t�?�P��W`?�IŒ~�?�j^tͯ�?�(�É$�?�"��9��?�c�5�j8?�^69��?��?����?����w?�4��w�?�9��S@n�D��@�� ��@��Q��@�i�@e��@d�J���@��g2@�I�ʋ�@��g>�@��?��@ �� �@"g�y��@$Z4���@&m.���@(��_rP�@*�C�>�@-q���<@0�9'�v@1h����@2ܐE�3*@4c��R��@5�ZXaд@7�u>�~@9p5�:W@;H%��@=5B�4-^@?7����@@�<D�@A���
�F@B�Ts�0�@D}=W|�@EJH@wof@F��e(�@G�p@G�@I?!��٫@J��O��@L����@M���&6@O2U�\?a@Pg~pE�<@Q<Vu�*@R�.t@R�ܒ)�A@S�S":�@T�K߫�@U��i�ݓ@V�.��L�@Wʖe�u�        ?�Ha���?�4�^cZ�?ݕ��"i?�".4�D�?��\ԔX@�;��@�"w�A�@3�נ�f@�lqz�Q@#�G���z@(a���J�@-�P0�<@1�p6N\�@5 �u�t)@8{Ǐ�#�@<=�*��@@"m����@BI�Q��@D���"@G^C(@I�9@D�@LK=�B�@O%���@Qn�;@R�3Z�:@TD��3�@U�)߽@W�(�
��@Y���%�@[�+[�@]yց���@_�@�P��@`��|A@a�%c�@cϨ#֤@d.k2��@e^h7�@f��0@g�e~�џ@i Wn��)@jq�)4�@k��aU:@m,�a�4m@n����'d@p^�	G�@p��7��@q��Mb%�@rH�@�7@s��G4�@s�c�4@t��uH��@u�7y��_@v_����@w=�a�@�@xoYQr�@y@���=@y��[��@z��>a=@{ι=��@|�x�A#�@}�#Q�] @~��[��:@����t        ?`�Pݝh?����K�?�1�t?�d^m?�m�/??���U���?ظ����?���ėp?�{�/���?��սb6?��^�,?���0��Z?�E��-Z?��OM I@���*f@��mm�@�)m�L@
��+���@W�dG@���þ�@�E;z:@���1�@*C%F@L�}<J@��8�ht@)k>�@ W�3%J@!�����@#��D�@$�.Wh��@&
ի�,@'�9�R�@)8�� �R@*��V@,�Ā�X8@.je��U�@0!;ABs@1ӧ�@2�B��@3˫/�o@4�8�7�@5*A�i@6A�_m��@7`�9��@8�]�Q|@9����k@:�����@<&��4��@=jAUҰ@>�S�V�=@@�����@@��A�@AaD!F"/@Bv�0�3@B�U1XF@C�ን;�@DH|�@Ew´�@Eѽ���O@F�)Om�@GjY�f� @H<Tv
�`@I[�        ?TI��V�P?�/���0?�K\���?����{Ŀ?��jJ҃�?�F^���?�,��}?�s�*6�?���N��h?�����?��1��?�TZ�{7:?�3
*]L�?��Q�e��@�O�@$42��@	���"@E�tH��@�|�h0H@�I'@�W�`H@�;��@`����@ {V�lsL@"g��v�@$w�n@&����@) dn@+{O�.;T@."���@0q��e� @1膘�-�@3s7ً�h@5�V;{�@6�T��@8��VAa@:id)?�9@<[,� �@>b`47n6@@?���[j@AX����@B}fz]`�@C���=M&@D���I��@F-��t�@G�1}O�@Hܢ����@JE[���@K��f©@M9��*��@N���S@P/
�I�@QB���@Q�/�
�<@R�iI�K�@S����.N@T�k��@UwN��1@Vn�O9*@Wl$-�� @Xp5D��@Yz�u��@Z��dL        ?FR7Z~Q�?r9�9��?�W��?��	~�zT?�����j?������?���Fq�?΀C�Қ�?�Q�$A�4?���t �?��0�Ԝ�?�.Y7��:?�`��Zw?�³����?�� ��5?�q�rʼ�@ N����@/���
�@`)Kp,@	�D�d�@�����M@���T�@;�}t@����{@U�֞c @,'�#.�@5�0c@ �����+@"q#�uC@$D%	���@&2HT)��@(;�!:yA@*a_D�"@,��r��@/1�	�@0�_ u@2
o���@3d�Y�,@4�C�|dJ@6F��I�|@7�0v��@9d�H_�@;
tq)�@<���]��@>�EMH�(@@,;�c�@A'���}@B���2@C��g�@D#JOxs@E4�M�§@FN��īa@Gp@�>��@H����7@I��y�H�@K�'��@LG�6��@M�c���@N�jUI�{@Pv����@P����?@Q�@�l�@R?����O        ?��-S"�?ȕ����?�Ʀlu�?��1r�U@��Kw@^m���o@r _n�#@���/�u@#���^@(� �1C@/�*��@2��(8Y9@6�C3�.@:�⵸i�@?>t����@B�y�ϑ@D�Gg:L@GeFs��j@J[B�l�j@M������@Pl��tx�@R1)��[@T���	w@V���@XR</�@Z<h�@\~�S=i@^��a��@`�f̀�\@a��հ	@cBs�z^�@d�5!��{@f�8)Y'@g�Mֶ#�@i��&t@j��r�ӛ@lH-�h�@m�O%&�@o�^�N��@p��hn�!@q�'���i@r� Y!�@s�|�ˊ@t�S�PI�@u��e� @v�Mf.5@w�i-��@x��R���@y��_�q@{�(G�@|1��]ڃ@}b���ȼ@~���;�@ג�Br�@��Ǎ���@�2��1mt@��M�R�@������@�5���AC@����և@��٩݀�@�U\e�
^@�(�œC        ?Pt�K�z!?z����?��
�$�?� �]��?�+d���?��;�7t?�D>5�Ŀ?ї1x��?�g���#�?��6�"?��r���?���s��?�"h(5@?�Wlq�5�?���*�?�a���N?�Bj:T_?���'�@ )�_�=b@��\@'Sf�t<@R`��$�@�?(��@&.��@�Qz�q@�nҳ1@v���J@琰8\�@h#�B��@����B@�hz�Z@J�n�|p@Z�9�p@�Fy+�@��?�}@ [�)�w	@!_2Z�$�@"kQ
��_@#�[���$@$�dWȗ)@%�z���@&�����@(/�*��@)q���l�@*��4r�v@,ᖓ��@-q��[h@.١	�|�@0%����a@0�)EG��@1���8�0@2l�9� �@38��m��@4	~�lȡ@4�-$�GI@5��P�q@6����U@7}QS
eg@8fd�3}m@9TPL�*@:G�I��@;>�u&]Z@<; a�        ?6�� O�?e
��i�?�?^Ϫ�?�.�/?�?�
B�0/?�B��Y�?�ѵNYl�?�-���?Є׌�f�?ֶ��W?�F���#?㪔
X?� ބT��?�5�+�e?�*��_�/?�8
���?���J�-M@ q�!���@F���K�@f0cY��@	�,�@���&�@�U���E@sk�@^.��_C@��8��@�¶�?�@�2�A*r@ L{�:L�@!������@#��Uojq@%}։���@'j�,�{@)q�H'�@+�Hd0�j@-�ZP�@0����@1H�G�mb@2�Q^�j@3�3VnIe@5A���5@6���FK@8,M�� �@9��k�2�@;N�-��@<�����o@>�|�V�O@@6�\�A�@A�5�T�@B=��@C@C����@DJ1�@E�7��|@F�#]��@G1#R 1!@HNF�L�@Is����@J�l�g8@KӃȰ'S@MV���@NR��sg�@O�U=�Q�@Px�Iϯ�        ?N]�ud�?w�'t?�"M�b}?�%�~?���G�?��/�'L�?˓U����?��=�?��ߒP��?��#/�c�?�u�.t�p?�%��c�?�p���$p?��S/�D?��'�Cu�@:LV��@WJ���@ǃp�g�@��F�:4@�����@�.hy�@��}�i@��>@�W�c>@�4��@ �EX@!�y���@#�PPZ�@%}��@'��p���@)���*�@+�"��A~@.D�(D[@0`�4(8�@1��wJ$@3
ᱩ�u@4w��M�@5����7�@7������@9!��5~@:�u�* @<�8���@>c�t���@@#�̯T�@A�ȱ�@B#!�h�@C0�UR�
@DG.Oo`@Eg,۱�c@F��Y��%@G�e��ZB@H��A��w@JE���>�@K���J\@L�5a+U@NQq�^@O���w�o@P��q@QZ7X/G�@RU�:�@R�p��@S��=h�@T���mԛ        ?�ȘD[S�?�{ֆX4 ?�u A�W?�z�	�J�?�b��K?��.����@� @�@_��7j�@��ʃ@�+zpB�@ � �#�@#���=f@'c��P$@@+��g@0>R�@�@2�q���@5,[`��@7�7{1@:�Ac�)@>)���l@@���S@B����]@De�?���@FZ���lH@Hh�:@J�l�<�"@L��@Z�@O!hǑð@P�P}z�@R���Q@S]����@T��Vq5@V&���9�@W��f��@Y%�:���@Z���z�*@\[bf��@^0��+@_�*��@`ʷ.j{@a�.˴W@b��B
=@c����9@d��dP�@e�q�ӕ"@fȈb��D@g�B4ni@iȂ}{@j+�$ī@k[���@E@l�.�V�D@m�R#W�@o	v�DX@p3���@pޛ¼>}@q�UxZؚ@r?֊6�@r�ڜ@s�&�*/@tm�Y��@u/}2�}+@u��7��#@v����u�        ?l����0?��o��?�xI5V�?��<J��r?��[���?�,�y��?�}�\h�,?���Q:$?�g�|gS5?��уT�?��J��K?��m�]�@�ڇ��@,�R�x@��(ƫ�@e�؜�@5md��@Z��C��@�[Z�Z�@ ���@�[�ٜ@P��L@%2��9�@!�0u��@"������@$;��^��@%��EO�@'����@)��37
@+io�:�@-`����@/h�b��,@0�VG1S�@1ֿW�A�@2��$G��@4�m7�@5Iը�<"@6��T�o�@7���e�@9W%J�@:X��l�y@;�?R��@=��G�j@>{=�Q5�@?��<ꀄ@@�s�b|R@At��~�@B9��:Z1@Cx;�c�@C�V��W@D��M�	A@Ex�ђ�@FRw`��@G0L��q/@H8u@H���e�@I�g�n�@J�����@K�/��q@L�Vm�<�@M�Oˑ@@N��Ʋ @O���KI        ?c�E�?��1u��?���ɑ��?�v�Y�J�?�D]�T�V?��y��?���,���?�D�[5$o?�>_t�a?�{����?��+D��$?��$�7J?�녖=k�@x߯@�S�]�f@	uEY��@u�궜�@��tca@C5����@����@�M.�z@vhr꿡@�f��n�@ �1v�D"@"���o��@$�HY��}@&�f�G��@(���H�@*�?w:-�@-/ﻅ>S@/�h��@1XB@2jMxw��@3��O*�/@5C$���d@6�-u���@8[8���@9�xV���@;�(h/�@=yXi���@?O[�5�j@@�-C� @A�Cƻiu@B�
��9>@C���Ѐ�@D�̠>�@E�x��@G�A���@H9��po@It^!�@J�{��|@L�)��@M\�����@N�Ub�k@P����@P͊xO/�@Q�EYn��@RO鸰@S����@S��`�@T���,@U�G��8@Vl�ܤ�]        ?f��T��?�U�b*
?�A\�(^?�����*?�e�ƺ�*?ҧƮ�?�yW��Z�?����{�?�0s� ?���=h�?���W7.?�ҼAk�K?�j��i@�4*��V@Q�x��f@
(��6Q@^EŤm}@{w�	h@�U�u�N@��9"܂@������@�>��Nd@ �L��@!�� ��@#�q]��\@%�.|� �@'��2��@*�t 4%@,|K�wa�@.��`Ѐ�@0�i�l@25���q$@3�O���T@50��]�@6�-��@8s��6�@:0�)s O@< H��,$@=��g=g@?�јV�@@�EqR�@A��go @C/����@D:��@�O@Eg�����@F���5@G��JP�@I,�oR�i@J�y�lfC@K����+@MQ3xGy@N�Q*�0q@P%/�@P뷶��@Q����)�@R�o���O@S`�j�'B@T=��w@U 9M�<S@V��dt�@V��q��@Wꬼ�@X�<;��        ?��{k�?�m�M��?�6�<��@LWgk+@����@P0�6�@"�ΨMQ@)��Yj�@0ȶ�׻@58�P���@:-� i|1@?���>��@B��@F�y���@I�ۮ!p@M\ă l@P�v:���@R��'�.@U����&@W|�:�@Z JX{:�@\�����@_f䚏]�@a$�,Lf@b��ژ��@d6b��E�@e֎ZK��@g�0)�~%@iE0��u�@kvX�M�@l���@�@n�]ic�@pl_��X@qqu�"��@r}�`��@s���v�@t�yt���@uΎ"��@v�Ŀ>�@x(�gZ,@y_{����@z��٠�@{�~A@B�@}0Q~.@~��flA�@�[��!�@�����j@�TF�f��@��,��@��*�"zB@���`��@�G�O��@�ܴ @��c�7z@��,�Z�@�p.�@�Bb�C��@���k�@��>�0�I@����a�P@���_JI@��DV�@�q	���        ?f���Ep�?����j?�ޝ�9�?��,�l�?�T&����?�ςk2��?ܦa[�_�?�֨�]�?����d+?�V��Æ�?�?���UV?��kW�?�X�����@D���@���r�@ڄ_V@
V��C@�6�k%@�V\��@��\Q��@��3VQz@� ���E@(��b1@�8��%�@����E@ P)����@!�:��Y�@#���n�@$�#�H�@&$-b�@'�;�*{^@)H����@*����V�@,��&]� @.�C�C�F@01��y@1&2�b��@2"����@3&%�/@40���[-@5B���$1@6[n��`@7{ja��@8�m��;@9�o7n��@;f�L�@<AM��?@=�І�@>��5�m@@*�D�o@@�ܰCH@Ai�QP0�@B|K��@B�e�Uġ@C��Ck��@DHeE���@Ewf�S�@E��"f�@F���0�H@G\�=��@H*q���@H�[v��@Iϣ�yc        ?a��8{�?���K$��?��8�<�s?�t�^�?�Yܣ�(7?��^T�r?׃�	�p@?�T{���?��
��^$?�=h� (�?�ؿ�{s^?���r�'?��]�{�|@ /*:2O�@50,�{@� �O�@
=B"n@@E����E@U_���@����)�@K�V��@	��<�@G��8@:_��@!P);�	@#C��p@%
��R
?@'(�Үf@)9y��j@+~�J#@-�kO�!@02�i�]@1�P:�G�@2伜!֤@4V��I0@5�	DC�9@7l_a#S�@9�q�j�@:�~��&�@<����	@>f��u�@@(��P)@A&��r�@B.X��6@C>�(�)@DX�Y�d@E{�7�@F�'�l#�@G��/Pa@I\5�&N@JfI���@K���t�@M,d5�N@N{J<P��@O�LiHi@P���+�@Qt�D��	@R;�u��@S럑�V@S�<����@T��:�&�@U�e�*~X@VlK�;��        ?^�����?��ٔ�h�?��fpy�?���$��?��$��g�?�fdC�#�?���B~&?ݦҴ?��
A�Q?���εh?�	�5�?����P?�[bA���?��?ZO��@;����c@|�&��@	"0`�@}��@S@�����@�|GS	@�s���@>��)S�@+��>Y@M�	�Ӑ@ �&!q�@"�ɺ��#@$~��b�@&Fy�|�@(��MU@*�aԎ@-1�F�@/���-�@1 /�2�j@2{*E�dp@3�򙀬�@5`����@6륓�9=@8��K*�@:2�e���@;�0��!Q@=��=M�J@?��O8@@�JC�L@A��~�@B�$k�
Y@C�^W��@D��۹ӫ@F �_$|@GNfb���@H�.���k@I�W��kq@K�����@Lb/�%��@M�A�@O%�Fڜ@PKϫ��@QQy��@Qʏ��$�@R���--�@S^K%L��@T/�e��r@U��?U&@U��^þ        ?����z?�z|PO��?��GM�
@ ��
�u@Y���@̠�I9m@ cta7�@&L�k�^T@- �-��r@2oT�E��@6�m3@;�� b�@@bZ ��@C9q�=�v@FJ���@I��d��@Mj�o�&@Pi�ր�R@Rd�BM�;@T|V�#��@V�m,���@Y'�)@[n��K��@]��oG�@`OŅgs!@a�����@c!��U��@d�k�o�d@f-p
.�r@g���cF@ir�
��7@k*�Z�9!@l�^��;d@n�DKR�@pT�a�M@qM��/]@rM�T�^�@sT��%0@tb��A�q@uxKR��!@v�ōV�@w�M)��@x��r�h�@z]ќ��@{L�����@|�2LK8@}�p�\C�@��&��@�9��
 @����r@����f��@�K�D<KN@�p�c�P@��I��=5@�|{z�`8@�>�F��@��[��@�����U@��~τ��@�e@A��9@�7J��@���d�|@��0���a        ?I��6Y�1?u��{�Y?�r ���?���@2?�[-�ZH�?��)�0�|?�`)gl�?�o�d�?�s���?�N{�=X�?�1Q���?�*�L��?锿Jd�%?�pue�
0?��nn���?��[x;?��G��?�0c��Ơ?���n�6�@D�1���@F�C�ͅ@e}�'@�7uCӣ@	��Ѽ�`@n�1Bi@��^=�O@֌�>e@;=̰�@�|�M�@-��Cw�@�s���@V��ri�@�����U@���=��@z�U�;�@L⛭�@ �n��w@!��\��W@"�d)��@#��*�@$�e�2)@%��G�)R@&��Q�]S@'���b@)�:��@*2����@+f\Y�@,��B��@-� ���@/,1���G@0>(@��y@0��p�@1���qL�@2K�Ys�@3�@ �@3�n�<�~@4x�<��@59c�~h�@5��o�q@6�L~4z@7�xs�S@8_!]�X#@91K扃U        ?6�<�y�?eAgȋ/�?�]��kz/?�8��,oE?��{��?�D�9��?�|tn8J�?��4$n�?�?����?�J��D�?ݨe.=�?�<��?�l(���8?�s��*��?�Mʀ��?������?�YT�/@ zEv��@��I�F@Ҋz�B8@	*���@Ѯ�_�@e5��a@���fd�@�Z�$<@[u����@���%@�2���@@��o�@!���\��@#HN�C@%5=l��@&�����@)�='�@+��!��@-U�LO��@/����� @1
��¯�@2OJ��@3�����@5���>�@6ql����@7�S8�4@9z�C�)s@;���F@<����M@>u�5
9@@5�a#m@A�7l72@A�<��@B��7��@C�UQ�@D�;)��[@F�M8�@G'�!�H@HG���qK@Io"�s��@J�N�ĕ�@K�3�&��@M��5�@NZ9He*�@O�a�8�@P)=	�        ?A�Ad��?l����'?�ŏ�e�?�-UY�}�?�kmzz?��K��?F���?�V<�*�h?�CǮQ?�(a���u?�=��B�?�.B��Gt?��g��	4?�QZ~�#�?�"�o�V�?�u����?�R�r��@��U@�����{@.Ȋ'�J@΂�%�s@��
C��@r�@V1�Kh�@�9@A,F@��!l'�@\Z6�v@hsc�@!R�Mf=�@#
�	 �@$�OAo�@&�Lo1>@(��0~�@*�sE5~[@-)(��@/�����R@0��U��@2A����@3�L��n@4�Z2@6qEaӌ@7�B�E�u@9���d�b@;(:2ʑ�@<ٔ60K�@>��)�n@@5�ji�a@A&�T�5�@BR���c@C D��:�@D)tE��3@E:�̑(�@FT���x�@Gv��Ƀ�@H��{�N@IԐ%@K5hGC@LT/s$9@M��r�ɑ@N�79�l@P*�!��@P�X+p�@Q�W��_        ?�Vk?TS?��j�_��?̛T�UW	?�9�pTR�?�<KWH?���Q?@Oy�$@	���Ƭ_@=���;�@P���@.a��@!H!����@$�b҄r�@(��Cm �@-&�禷@0�jܺ6�@3p���q@6&i$�n�@9EA��@<d�c@?b��7�.@Ajo;��b@C:޷��@E"y�K��@G!0A�I@I6f)�@KbD��v@M�vDߵc@O�ʙ�1O@Q5�1A�@Rw�yw;�@Sć捎�@U:���T@V~����?@W�\�N@Ycr ev@Z��q1��@\r���@^
I�s��@_��4��@`��H#~�@a���-�@bj6��@cQ j���@d=��Z,m@e/y+m�@f&�K�@g#�Q��@h&vYPŢ@i.�Q�3@j<F�f�u@kO�-���@lh{ck��@m� 5g�@n�!|V�j@o���恘@p��V�@q���w@q��\8�*@rY�_��@r��`>��@s�h7�@tJ��d�U        ?oW����?��*���k?��X�!�g?���w�7?У����2?� ���|?��s l�k?�����?�Mn�$:?���7eG�?�U2�@ k8E�P@�����@#&��@
�T	�@�U�5�@�7�c�@ǃf��@�ڲK��@-Uy�@�����@�9m��@ �
aUԥ@"��а�H@$C� �7	@&2�Y)@'�]�R@)�-}#@+���kڇ@-���I@/��Q�U@1�lK`1@2)�\���@3TÙ���@4�<�BJP@5��U��@7���@8]�z:�_@9��m�%@;��ڎ7@<��3@=�>�%�M@?s7탰�@@{�;��@AB�$D@BNY�@@BژǍ0@C�ܕ9Ғ@D�#�M@E]@�~��@F;P�)�@G;�@H��}��@H�v6��@Iٴfސ�@Jʨ�-��@K�M �@L�����U@M����s�@N�$J�5�@O�T�O@P^�ov�@P�?��        ?SDL�O�p?���s��?�m��J?��ʊ�0?�w�8T�?ĺ�Y���?�,���?�&S����?�*�XP�i?�����(?�[
�n?�k��?�²��j�?���{�3�?���|H��@�ĥO�@� �	�@4���s@
�;�/�h@�q��@bYp�yK@��5�@VH�*�@�T��4@nX:u� @b���|@ �iM/�@"mZ��@$/�p�@&
��Uj�@'����@*��:i@,4���$@.u��8�v@0hĝ��@1���y@2��IJ�@4CCU���@5�Q��k�@7%&5��@8�Ә�6@:&pj�δ@;����@=k�xYW%@?#}��*O@@t���"%@A^ĺ�>�@BO�7%@CH=qJt@DG�:��-@END"�	�@F\�y�!@Gp퉫�^@H�OHAP@I�>XHu@Jڣ6J��@L.(��[@MD�KaG.@N���_[�@Oˠ� �&@P��D��@Q7qA@@Q�
�        ?c��M{��?��� ��?�D��u�?�����%?Ă�LFd�?�^n��?�-B�G�?���'��?�A��Ԯ?�1ӑt�?�����!?�B���?�m�S�p�@�|��$@`Z�f@�4'��@�$>#�^@+�:�2@�LK�6$@(3y�o @�@�3�3@���d@D(�cB�@ �4�@"��j�$@$����n@&��Op�@)b���@+v_Tb@-�@�gu@0LRc�)@1��0l@3"�g� 4@4��Z��@6@�S�۔@7�c�y�@9�w&���@;xx-)J�@=[�����@?R���%'@@��1�0@A�<�Q�9@B�D�(�@C���uJ@E,}��@FgS}�_@G����A@H�Txc@JY@d��]@K�oe�6�@M2�I���@N����@P)��p?@P�?}I@Q�����@R�7ێ	@SjSAV�3@TL`�&�@U4i�@V"v��S|@W�����@X��?�@Y$�E        ?��*�?�tmj��Z?���B@�wJf�@.[�@]���Z@!��1�Ѳ@(��`�@/uQ��g@3�U�M�@8�g��X�@=��c�0@A����x�@D�5aE�b@HS�!��z@K�)��@O���"�@Q��k�@T'�uI��@Vv =v��@X�l��m�@[o�$^�@^}UJ��@`r��v��@a�&`��@ck���@d������@f���@hUǋNe�@jP����@kꌼmD@m�$�^�@o�%����@p߹[s��@q�$|KW@@r�;�C��@t��N�@u.�Y�ޣ@vUo����@w��%��@x�ݔ�@y����@{6`Q@|1.&@@}�͕o%@$��u��@�@�G9u@��͝Yz�@��(k�TZ@�]��b�@���)@��q=�@���Q8�/@�Y�^�n@�H�m��@��S��۪@��7�� �@���0�+@�T�\F1@�(���c@� 	Cy�h@���YD`�@����iݣ        ?[{=q8�q?�~�K&Ƒ?����x��?�5�F�}?�Nt~���?˔$R�?�;7H��z?��\0T!�?�<G46�?�*Ge~�?�i�1�N?�����?����]�?���tM	?���:���@M��)i@��9G�@{�}Η�@	W�^�nk@a�	��X@�� ��@�On�@M%YhN�@0򭕪�@,���\�@A�J�2@mĜ8x�@�S*�S@ {L�0�@!C��z@"����)*@#��yR|�@%@�x등@&��Z�
"@(']�Lg@)���UX@+?6R���@,���l�@.�4t@0 d�")K@1��]��@1�&��v@2��ޑ�@3π;Y1Q@4�Z��-�@5ͳj�"�@6֒���@7���@8�;0��@:���@;<9�A_T@<f|���@=��ڜRc@>ϷqW��@@g��@@�z�fv�@AQ]N+�@A�H#���@B�
�&��@CZf n��@D_���S@D���]{�@E�J��#T        ?Q��� �~?�/��M?��ɹT?�/	`H{�?��me?���:o�?М��dީ?׫�@�?�):q0�7?�Y}�1�p?�w�t��?�J���Y�?�a���p?��7�zC?�Hu+g�@���ۦ@��z��@	s�4�5T@k����@�|�I�q@>�$>n�@�7��G@��Z�mP@�圷��@�?
�@!����/@"�B�1"y@$�'|��@&�h¯�@)$|���@+v=��:�@-��pL�@0>�{LVs@1�����g@3����@4��k��@6���@7����۱@9nh����@;7,�w�@=>_��+@?��#@@�5���@A�
�=9@B���F�@C�x#��@D�Sn���@F%ǆes�@Ge�h�]7@H����?@J�fg�n@Kg�Uj��@L�F��`@NK|ƒ/@O�8�Ze�@P�/�l�@Q{�+O@RM�����@S&	��@TRC�@T���O-@UҜ/�l@V¯��ӛ        ?AĤ� iV?l?��A�?�
��?��`��G?��A���?�"�C��?�]��x�z?ɣ�B�?� @�7~?ؒ�4E<�?�8�V��?��<�>�?�fm���?�a�n�].?���d�??�)�ƂQ3?���0_28@����@�E�_@��|�@
�m�x@c��*4�@D�@���@��/kb@@ﲾ���@�4ze�@UA��k@QCb��H@ ��ӌ�@"q���@$<�����@&#_ ���@(%�b��@*DL;�ʲ@,��;J@.�)����@0�>�:�l@1��p@3K6[iR@4�{��sh@6-���=�@7���(�@9P.� @:�w~T�@<���^7(@>�q��Z)@@.���p�@A%� yjj@B%�欈�@C.����@D@�8��@E[�io��@F�D.J`@G�9xr�@H�c���@J&E�Eb�@Kp���v�@L�!��@N#GXRr\@O�Xˆ�@P~����G@Q<�R3@Q��EY�        ?�KV��G�?�|T��C?�����!?�~�Zv?�e-���F@��a�@2bq(@�	u%�@ �� �=@%հ�%�@*?ޮ��@/��m�@3:�x@6�V���=@:?f��b�@>?� �t@AEx��H�@C�����-@F�?ѰO@H�6���@KV�<v@N;>SA'�@P�3+i��@R<J��D@S���݃O@U�T��h@W}kK���@YeJ7�>*@[`����@]pv�@�@_��Bp�D@`�\��_@b
�u�@c9�����@dr��9@e���[@g ����i@hV�+~>/@i�ݜ�g@k����@l�=6O�@njJ��,@o�G/2'@p�l�XO�@q^����@r/�Up�@s;Y�@s�w�~��@t��g�\@u�F��aS@v�ˌ�?s@w�x"<@xv\d��@yp���w�@zp��@{t�@|=��)@}��X�@~�UF�L�@�2�}'@�o� L�@��n�@��ۿ6I�        ?l+��Ŵ?��7W|��?�*!�Хs?�3.`�j?�P5Nd�?������v?�5�͛7?璭n4�?��~�g?󳟥fm�?�o�edC?��-��E@����w�@����@H(%B��@�%��}j@�P�dW�@	q1��y@D
>��@��&�]"@ՐU�@�Õ?��@��z&��@ ��Њ@"7L�&�@#�붾Sh@%q�=�a@'(lu֢�@(�Tp'py@*�\[#��@,����@�@.��(#l@0]����[@1lr,��@2��$I�@3��B<ߧ@4�#Hr7M@5�`��e@76�3�@8x�S%��@9�v��Ut@;����@<r���@=׷wL݉@?ES�\0!@@]� �6�@A��,��@Aፘno@B�	�Z.e@Cv���e@DH[հ�V@E8� L@E�����@F�h�-ك@G���"@H��6TZ�@I��*�^@J�l��@Kt��~��@Ln��F�@Ml��2�@No6�J��@OvJ�)        ?[�q?���?���
�?��zIl�?�x�ɚ��?­��r?�O�N��?ֺT6�)N?��[��8?����?����W(?�o�ZU?����ƥ?�uh*�9J@A >�	�@���Lá@lɓ6�@�X�f��@�jƈ@�|�7=@�IM�'@��S��@��6+��@m��s��@!��y�?n@#��l��@%����B@'լ��g@*0�Zh�2@,�LaB1�@/N���@1	z��̛@2}�{��F@4���1a@5�}�ͅ@7G���^C@9��@:�Lc?��@<��L49�@>���>@@_�"p��@Ao(�.E
@B���N�@C�j���|@D�:�Ue@FD�ϔ)@GT��4@H�J�@�@I�f�s�@KY�X���@L�:��@N<�xz}@O����@P�����}@QpE��Q@R@��u2)@Sq��:@S�x�3@TӒ�x�@U�
'�^@V�u
�*@W������@X���Z$�@Y�Kj�~�        ?[!߆��?������^?��7TH��?�m���H�?��v��?�D���?�2vK�{?��U�2�,?�P�@�S?�	�Ϙ�?��펔?�|�[��`?���y�?����4q@ �}���@��Z�2@���T3�@
����@���@�Jg=�@�j��@|����@D��ͣ@A ݥ2�@sj�rw*@!n�M�MM@#?���y�@%.(E�"@':Yc��s@)eP.�Z�@+��p@.b�)c@0S s�&�@1������@3�Nl,l@4�븡|�@64=�]u@7�����@9c��K@�@;&��B�B@<�m1� j@>��hC�@@qXr�}A@Ay� �a4@B�T0&�@C�
�H@D�;��3@F���O@G>"���@H�0�wH�@I�,,�>�@K4:����@L��ϵrs@N&N�Ld@O�L�B̾@P�N�@QXY3x@q@R)�1	�@S ���x@S�Ts%ד@T��~4�@U��$�� @V��#�        ?�����*4?�;�:>�	?��lh���?������@0��@4@<|�d@��P��6@%�'�0@+����|@1�3,��[@5�X�{Z@:u��lfo@?�&5��]@B��#�z@E���Wm�@H�kl@L]�+�@Pڳ@R*���@T#��J[@VS$H�j@X�D�΅�@[�cP��@]�)^�F@`,��h�@a�K���@c۷�.@d����^�@f!����@g�b>��@ix30~�@k9�~��@m
��ɓ:@n�W�a�@pmt�&�:@ql���-@rs�wp�@s�r�%��@t����v@u��5ZS@v���bq@x	/��@�@y>����@zz�ڻ�@{�P88#@}�r�~@~_�����@��k~7@����6@�E���d@��BC��@����w�4@�~��	�/@�D)�_��@��4���@��/��h�@�����_`@���>�L�@�[:�q��@�8a[j�@@�eTj��@��@9��^@��빀�        ?N\��>�?x����V>?��Ujg#�?�MX1��k?����Kw�?���"��?Ȱ�<�?�:tg��[?��5I=��?݋�}�;s?�~/�pi?�7����?�8��In?�*��?����-��?�ɦ䇚H?��[��}?�W.���E?��8>?]@�D}�@���=@�C,0K@Nj^��@
���	@"�zN/	@�yjF��@3���@�o8B|@��1�@�����v@���@���%f@e��@��@l&� �@�Z����@��
G/�@ ��?*�@!��p���@"��x���@#��p��@$�J�B��@%ݽ�{h@&�	)��@(>�q�@);k�]@*h�r#B�@+�� �d�@,�`H��@.�qҴ@/d�N�rs@0[��7@1Q�tv@1�=ӡ��@2j��9�@3"AG�E@3�ߗ���@4�So�>*@5]`���@6#+��'@6�;N��z@7��$��@8�V_�1�@9]1�M*�        ?:A;�ؒ?i�?�_�y?�J9���?�����`�?����=�.?�Z��H?�J�bx��?�7�
���?�K�J˥�?�Z�X�i?�v�N��?��^ԼC?�c���I?��V���?����G/?�JЁ�P&?�ft�E�e@�GCI|@�V7�[@	;$$�n@`�f@��r�r@�@���@k/�~�?@V!^-�@�c�<�"@d[�(@ ���o@"|X�d�@$`�7 @&c���"Q@(�5�S@*�^F�A�@--�Aș?@/��g?��@1/7) �6@2���z@4�!�>m@5�oZ-b@78��1!@8ꋕq�[@:�ͅ�1@<���P�@>vbl�O@@</$ر�@AG�=u	�@B]�9G�@C~�/E��@D�A6bi[@E��2�@G#�m�k@Hp�H�K)@I�]
���@K-�nr�@L� Rj�@N+a�r@O��l���@P��t���@Qj���-�@RA!5ֈ@SgY��&@S��IuF>@T��J͟        ?Dz�%Va?o�YK�^?���@w��?��3-�?���;���?�\T/G�?�	��y��?����5�?ӧ��â�?ڟ<�s��?��I�>�?怏���?�V
�5|?��g�?�d�3�V?��)
��	?�����/1@]�c�@�
�X#@p��A	�@���D�@�5D�@6�pv��@�p��X@�ߙb!@ʺ��Q�@����x@�;V�ɶ@!����[�@#J��p<�@%%_���@'��#��@),Z�5@+Y0f/�;@-�����N@0�馯@1G$�{��@2�o���*@3�^@5i8��1@6�8$�E�@8yH��@:���@;ʕKS�@=�IC�{@?^���p@@�xl�	�@A�+��;�@B��cw�@C�3s`�@D��q;�@E�r/q��@Gi.{�@H9��2�_@It�=@�@J���,�@L��qx@M^�ԯ�@N�|�ш@P/�v@P��	c��@Q���\�F@RV5`�        ?�
�6Ps?�w"s�D<?�c`(x�?�sghwc?�����0?�r����R@Y	pX�@Y�)
\�@�JŞta@=.�=p�@L̴d�R@"�L@+�Z@&>���G@*O�b|�@.�#��4@1�"�>`s@4NK�"�s@7
���!@9���L�@=�.:QN@@(hK��7@Aᓐx�9@C�u��K"@E��u'@G�.K�@I��c���@K�!��@NzL�p@P5���@Qk{*�@R��"��@S�E���@UP S|�@V��!@Xp,��`@Y����0@[�Ƿyl@\���b�@^;]v�u@_�c��@`��b�@a��@�@b�DF=��@ci+�ĺ@dU�{�N�@eG��a��@f?,68�@g<��l(�@h?�G�y@iH�a��@jW5&��@kk��o`@l�%�xE�@m�g{}>@ñɸ�m@o�w�s*@p� =`Ę@q0����@qϟ�@�@rq5�-s.@s��[�@s�X���@tg5��w        ?[S�_��?�d*�x�?���4ٕ|?�4mvZ�&?�o���?�>�#�?�G�Wp��?ڲ��:^?�qR7]�?�K+��<?�Dq���=?�A:%���?����?�?�t�JqK?��	�9g@ yP�K`@ֹ�WJb@^
Z3u@�4�@
�Gr��@�ƿl�@���!*6@7"ew�@��!��@����Y{@��Y��<@�@���&@��]@ڴ^�)�@ '�Ft�@!,�=13@"Z��z)�@#�϶}ȱ@$�L%٥�@&Y�N��@'s�(�;@(�g�L@*9�k��f@+�ù�ir@-%[��T�@.�v���@0�伀-@0�&��D�@1��i ��@2��,�a�@3fm/��@4D��I@5'��B՗@6��D��@6����� @7쾥�=r@8����@9����O@:�Q���@;�0��u`@<�Kӈ�@=�a�@x�@? ��Y{�@@
��5q�@@�Y�P��@A&4��	@A�L���Q@BJ��G$�        ?D"�/ w?q�Ȣ��?����?��K�9\t?�
`xV��?�4�g6U�?�}�¬?�k#�5
�?�Хsk�4?گl7���?�x���??�ZU+nW?��X��?�M�L�+�?�V-�B?�HvE�Z5?�	�U3@��_�b@��Y#��@ԳA],@_K(�#@<Q����@�T�phn@��c�y�@o$O�@,i1��@�gF��@���b�@!uf �:@"��sa@$��y{W@&u=(�01@(x�Xo5�@*�R?"U@,�y�+@/,~%�yo@0�!��9�@2谇�t@3sӰ��@4�!�p�F@6TD*	\@7�ⵚY3@9s��r"@;1av��@<�8y�@>�4j�G@@=6���@A3���r@B2�ϡ�@C;,�E�@DL�Mw,o@EgtrLvK@F��8k;@G�~[莇@H� ���@J2X��q@K}���G@L��p��@N2�y<D@O��D-�@P�����u@QH4��@R)"��.        ?R9���?{H��q�?�z���?�Un$�F'?��^ve��?����?�2���?�1�~�?�߭��D?�jbL�)<?�8ȣˊ%?�K�ˑ�?��i[?�r˷UL
?����!s�@��	��@�g�4��@]�ml
�@Cb6Nϸ@DC��V@�'�y@ ��;�@��6>p9@�F�@��W.։@ �ac�!I@"�����@$oG(�@&|�x��@(�ߎjo@*�|�I�@-fs@DP@/�[���*@1Ths��@2��ex@4;EN{IB@5�hEa�1@7i�K��@9A�ܚo@:�h��N&@<�U]�Lh@>�<p���@@Q)��`�@AY�|j��@Blw>��f@C�󭋍X@D�{����@E�+���;@G�Y��@H`q�.�@I�<*پQ@K
�8���@Lo�����@M�kw[zD@OZ��s�@Po�_SrW@Q8)Iٲ�@R	��'@Rفp夂@S��\��M@T�X��+�@Uu���l[@V_�ց�        ?�	��z�?֭5�U?ܳ/XZ�>?�g��T�?�F��L+�@�D}^s@��|	�>@�NWz3i@1v�`@#OM P�@(��>�_@-S����@1���U@4���϶�@8+��=��@;�O�N@?��jI@Bk~Ȗ@DNc\�*�@F���
�A@I9P�@K�ݘM=�@N�7 @P����@RR��iJj@S�����@U����@WI���j�@Y��s��@Z�o�),@\�mz�	@^ʹ;��(@`imI��i@au]�Q�@b�$�?@c��ۖ/b@d�$mJ�@e�T���@g&O�Y�@haWMM�@i��R���@j�u��@l@_\�!S@m�z�	b�@n�bZ�J@p3�{~�@p�_ɐ�@q�#��?@rhhs�@s,vk	x+@s�M�d@t��:�@u�ZL>�{@vb�VŢ@w9���a�@x�3 ��@x�?��@y��(���@z�9�+@{�|s�@|��u]��@}��".��@~|q}��        ?a^����?����
�?��~�Ȗ�?�x�X��?�	����?бAߕ�?�g����?��(�ߞ!?�9��Cސ?�dh���?����t?���zQh�?���k��?�]�IRz	@���V��@_���@A�'%6�@
T_�n�@����)@�]f]8@Xt�6' @C2�L$@FC�)��@a���@�G���g@�m�D.@Evl�@ ��_lt�@"*����@#���͊k@$�j��B@&PG���@'�P�غ@)O��`�p@*�W(@,d��׃@.)Q+�@/ރ��ln@0���&�@1��]=@2��&�@3�{���8@4����@5� ޽��@6�su��@7���ެ�@8��Z�c@9�1hs"@:�f�c<@;�H}{4�@=!���(@>M�'� @?��P{�@@[]5�i�@@����ۮ@A�ʀ�G@B>�K�Z@B�$Qd�@C�a���@D:N��8@D�����D@E�!��W@FM���o        ?H��;��?v^���?�6C^��?��L���?���Py�?�i��2�Q?�C�Ȼ�?�V?�ݐ?�x>b�[?�'��	�?�O�>�?�x~�W�?�ґ���R?��'0}-?��B6��?���P��o@��"Д@P�lk�@
	��Z@=f�ۖ@B���@�gT�@S�
 �@.�V�@B�,ј@����S�@!�z��^@#s5���@%w�<��@'���Vm@)�k�^/@,K�����@.�W.~7�@0��X��@2,��z�U@3�|4�@57��r�@6�ö��@8����r@:Vd-�y�@<2��>�@>#��
%D@@�k��D@A!�����@B9xC��@C[��!��@D�[�V�@E��S�x@G�k��@HT�	�vx@I��0@KZ�5=4@L�f��f�@Ng�H�@O����Y@P��F�&*@QdEԐ��@R;ငl�@S�z	�@S� �O�f@T��8�GJ@U�0�
�@V�Q�5�        ?P rx��?x\bS~%�?�x��?�l[}]��?���uS�?�x����?����?���oE�?��9<�.?���ɂ��?�q_n_�?�.K�/�?��l�?���{Jl?�s����?��?� �+@�/���@���w�O@�<���@�/^@i��2��@Ԓ2���@|TU]@���(��@;gH�&@SГƢ@vZ%��@!!Z*e�@"���g~[@$��m20�@&�j:˞n@(+��bi@*�>�e@,�6���@/*�*�@0��m��@2��`?5@3T�&O�@4��ǹ]6@6"���l@7�ȯy�@9+��_7�@:�Y֭�-@<rK,c@>,�ɒI@?��F�#�@@�7���@A��$Q�Z@B��9N�@C�,��@D�����P@F	zr/�Q@G)��	@HR��e�@I����!t@J�~֑��@L{WF<)@MP�f)L=@N���6�@Ps���@P���[{@Qq����@R/����        ?��� ��?Ţ����`?�u9p�?�.�f�<1@ K.��o@	ض����@�R\�e@f�I�k@!-i��WO@%��>���@+D3�u@0��o�@3�Ѣ�t@7dP�.@;9�|���@?ZX�3�D@A�_+[_@D=�|z(@F����2@Iaz�0�@L*c��'%@O���@Q�zq�<@R�Ne6�@T_\��@V�} ��@W����i�@Y��q�ng@[�w��@]Ϩ�]��@_��0@a�PI��@b&7+q�@cLztF��@d{t[C�@e��c�@@f�t��E@h<oaJ�@i�`��@j�FU���@lK>��@m�����@o*�|]��@pS���x9@q@Ɉ�@q�ݵ���@r��d�ZI@sv�/M��@tJ?�D�'@u!���b@u��j	!@v�6���a@w�t1t�H@x��o�E�@y�� .�1@z�i����@{s2�&V@|i�k:xw@}c�5&�#@~a���(�@cv�IBt@�4u@FK�@���bMP        ?l�z0�?��~��?�[0e�$�?��I^χ�?��J�.�?מ�Aɵ�?�5�
!�Z?粿�U��?�JM@i�w?���0�P!?��wQ���?�fq���@:T19�@������@	%�C�}�@
dp�T @��O���@��B��@<�B}�r@�v+�+@t�@H�v�f�@ ",��@!�G��(�@#W��+n@%%W��e@&�
��h�@(��"�Y8@*��Sr�@,���@.�{H�7�@0k���@1�v��G@2�^���@4 'f@5>��/�@6�_�z��@7�����@96@��;@:��x���@<��τ�@=�e�	=�@?ܙ��@@M5/���@A�?�G�@A��8��@B�dϿ�Z@C��]XY�@D}���j�@Ec1w�ϓ@FM��a@G=����C@H2���
�@I-&Sﱚ@J,�ġu@K1����@L:͒��@MI���-@N]����@Ov�H?L�@PJnD.�@P��B�@Qp�t*�        ?H�9g�
x?t��}���?����v?���ן��?��H�1o�?��V_�G?��E���v?г�<��e?�9�[8��?�2^���U?�_��7�?� �U	��?�E���zo?��S��?�M}��f?�ܽ7�S@>�`�3�@:~�1=@���^ʹ@���@�2�S@��<�@��8�qn@u" В@��	x�@������@���/@!k/K5�@"��d���@$��D���@&�s]��@(��J&$@*�J��@,�㒯/@/=J�B�@0��� 3@2%}KI�@3n�	E�@4��C@6=�Y2=}@7�]�
@9Fz/*S@:�3�X�+@<�[e�i@>?Q�E�@@$���@@��s}@A�u[���@B�8��n|@C�p�xZ�@D�'��v�@E�f���@G7d��[@H"��-a�@IH��q�@Jva�h�@K�����@L���*@@N-����~@Oz�1��@Pg'����@Q#��V@Q�Bl��        ?k` ����?�Mݹ��?�#q?�����m?�ÅW���?����l_�?�f!3�d�?��x�e*;?�g����h?�����L?��o�H^�@뤼�Oy@乔&�V@
YQ���@N܃$�@c��N3�@d�Ĕ��@�h�z�@<L�dF�@ $h3\/@"��X@$W��%h@&��ǘ��@)B�s^	@+���2v@.���I5�@0���E�@2��=
�@43���4�@5�� �@7��1_�r@9Ƕ��uf@;ѵ^�S�@=�4�/��@@=��d�@A>�%��@Bs��v�@C���}Z�@E+��Z@F\&3��@G�{�=I�@I5����Q@J�T�B��@LA��T@M�N0:�n@O��A�@P�t���@Qz�K%�@RaLс�@SN�t� @TB`���@U<�l8Un@V=ܲ_ka@WE��ÅF@XS��>�@Yh�sw�@Z��t�@[������@\�����@]�z[+٪@_5�4i�j@`9aa��@`�1�h�        ?��؄w`�?� ��?襁��@�N���@B�xj�p@��2LPG@!b�)9@'�v��t@/���f�@4+
�r�x@9���I@>���jv�@B\7��k6@E�m+5��@IP���O@M:���aw@P�v��@R�Y�EB�@U^tQ	��@W���A5@Z��!),u@]u*�A_c@`:���@a��E���@cr�9Sl�@e,�Ɠ�;@f�݇��%@hڰ��0�@j�(7�	@l�K���@n�#t�&G@p�[��@q��:@rޑ�VT@t���@uSU�t��@v���k7w@w����@yL�{�#�@z���~�X@|$Zr�<@@}�)_/@#��)��@�X�&��w@�%j��S@����n�@����}v@���Є�@����Ze-@�k$&���@�T����@�B�b�6z@�6	~,�@�.-,�@�+w7K@�,��̿�@�3�f,@�>��վ@�O<R=\/@�dA�(y-@�?����@��@��QP@�_�
h�%        ?^��H��7?��DP�w?���x+�?��_���?à�v")�?�S`"�?��5� -?߹r/ڲS?��w��}?��ezAr?��L���?�D3���9?�=_�ۀW?��Y7@ ��Jo'@$�@70@�-S��@�q�@���zC@�CQl�@+v/��@���q@Ͱj�ʓ@�+t�U�@�s,�{*@��~|��@O�|�$@aN��n@ ��w��G@"�	�|a@#c�+C@$���n�@&O
d@'}�I
s�@(��	1@*t*���@,=�E(@-�b
3��@/?��ekv@0x���>@1W�)_=�@2<����@3(QZ�5�@4c�>.@53w�@6]]|�@7�3Ō@8�tՠ+@91W�u��@:I(P�	�@;guH4X@<�H�o�D@=���?��@>�CN@@��QW@@���߰R@ASl>e}�@A�|#��3@B��d��@COGE@S@C��[�L�@D��y�@@Egʝ_d�        ?KW�	Z{�?z9Գ?���ô�W?���d!��?�;�t�N�?�Aռp��?�n�� ?�u�^6T�?��)k?��$�{?��xVr�?���3��?�+�~#U?��K�j��?�O=�(�@�R�,@�o�@	̸�z�@�ޟa��@9�&�}\@���J�Y@`Gl�TT@G�I�ā@iŞ��@�Xrt�@!��`)	@#�O����@%�I �L0@'�,����@*'����@,����D@/.���߻@0��8��y@2bzL\ �@3���Ϧ�@5x�)@7�~D@�@8ڭ;P�@:�����@@<�֣��@>���K^�@@H��?@AYEH��&@Bt��]�A@C����Qa@D�&"��@Fb�X�M@GO̰j��@H��78�@J ���D@KjDSJ9�@L߉M>�@N`�с@O�a��\~@P��\�x@Q�}�@��@Rm����L@SL�"�B@T1O��x�@UD��W@VySsH@W�B}b@X˘�yZ        ?Rp��e1?|��q0?�T7����?�i3O�~*?��.��?��#��w�?�E�e�k"?�̋�wXD?�o&ӆ�?���⣖�?�ߪ���?�`�a�Y?�YR]|�?��t��x/?�P�>@߿��Q�@+@3��@����@��/@a�L���@������@=���^�@���+>@��دO@@%���v@ Ȭ���@"��z�@$�Ɍ	�@&��Xk{@(�2aH�	@+$��?��@-��t6d�@0*�1v@1o��p��@2�/c ��@4Xȑ�0@5�d�J*0@7���T��@98� q�~@:����b�@<Ӳe��@>�%ZY@@\�4]�#@Ad0<?<@Bu[<�@C�1 k��@D��ct(�@E�+To8@Gt]�@H]��C��@I����A@K 07��@L`���@M��ɖ:�@O?��g��@P_� N@Q#���r@Q�!�u�@R��|��@S�Du���@Th
���@UE�1f��@V(�e        ?��� :z<?ų��s�X?���ORd?��  ��@"+��@Y��ŷ	@	�Tq@���R��@"J�	�$�@'\�}�t@-���@1�b����@5#��0��@8�r��@<�b��Y�@@�	���v@C
*��n�@E�Q�9�c@H1-�h[@J�d��l@M���Q@P�M��׵@R$��^�@S���D@U��0�@Wu���m@Yb��߿@[cQ`��@]x:�@_�ف�b9@`�� �J@b�M��`@cJCMh��@d�0��m@e�[!>�@g���0�@h{�`��@i�9-�@kSF �S@lγ�ڱ&@nU�Z�@o�7ad%@p���~~@q����I_@rm{�슖@sK�cԾA@t/���s�@u.��k�@v$ml��@v��"��i@w��Խ�t@x��2M+N@y� .i��@{I�y$`@|#�H��@}.��J��@~J�t{�@lš���@�J%! ��@��R��@�z���@�7!pn|@���B$�        ?ZR��Y�?�Ͱ9ݓ.?�iQ�4L?����+M�?�`j �?����p�v?њ�*�&�?�b�z��A?�*�u��?�U���?���E&I?N�?�����a?�t���?�:ިV}E?�Oؽ�@Xϕr?�@�g~��@1z�\z�@�'Q�X@���gl%@��Mz@�R�t��@��;��@:�j�@nC��X@�`�P�@�)�"S�@�)�ٯ@��yVf@ �A�4�@!=8�P�8@"jڂ���@#�²Q'�@$�����@&1E*Hz�@'����D2@(�^�M��@*R�J[�!@+ǈ�\�T@-E���p�@.���c=@0/� �*)@0��j��@1�.��F�@2�`���m@3�F�s�I@4c�I�<�@5I%M�@�@63��[�@7!�/`@@85XF�@9/�`��@:	�����@;�J~8@<��iS@=��7��@>,pZ���@?@��0�D@@,��B��@@�߅��5@AM,}�@A�����        ?9�l��?f�˞5�K?�Nh�:��?��c�'�?�i��h.�?�W���?����36?�����e?�AL��9�?�GG�K�?ݢ�r�?�9�-,6U?�n\��
�?�'��?���|�?����}ę?�:�$$�@ $��O@�Kn�1@�U�#k@	G����@@�=nHQ@�I�f@��I�@L�p��@�(~�*@�EH[�.@�v�Ș@ h�lpަ@"����@#�Lթ�@%�Wi��@'�9qf*@)��R F�@,0d��D@.�.��LG@0�kO	��@1�I},�@3,��p�@4��ȈcP@6����i@7�7|�U�@9B|�@:�]i�@<�Y�;�@>��p��@@3��5e@A.#dr@B1|6ʍ�@C=��Q8@DS�=��?@Er���]�@F��q��l@G�I	ϕZ@I[�S�I@JK���V@K�A���@L�9��CQ@NS���F@O���W�J@P��p9�@QZ5�w=�@R��F��        ?V ����?��6s�?����{��?�q�����?�I�g�$?İ��B�=?�;C�f[V?�@2d��?�]Si&�??�	���$�?鿖�6_�?�/� �w�?��n6u�
?�J*���{?�"�3�Е@E��^q�@E^�Ĺ�@�m�f��@2�d���@&}6��&@��C�@ =��@��L�4!@;˓X��@�6u�B@.��l@!:�Tg@"�D�FW�@$̵6ǩ@&��MRf@(���z�0@*�2���@-4o����@/�����}@1;ϓ�@2T�}}��@3���QҦ@5O30a�@6��#d�/@8�	�
u@9�~��:�@;^5V�Q@=��s,L@>���ۖ@@\��s,�@AQ�;;?@BO�T���@CU�`J�@Dd�$(�m@E|7�r�d@F�S�I�@G�?�͂@H�� L�'@J0�hں�@Ksv�%��@L��؄�@N>>�xh@Op?5��@Pk�߼�@Q"Ka�$@Q���[�@R�Ў6�@Sb����        ?��SQ�W?�� �R\�?ٴ�ZH'�?���}F?�)�Q��X@ b�D8@H�L]_@6S�<@�Z�P�@!g�y�e@%@�ՠz@)�����@/�w�P@2M>�7%@5TT��(\@8��Y~��@<��]�@?�WE���@A����e@D�4;�@F;ȇ�@H��C�C>@K
�ƒ@M�����@P)��!�@Q��-Q�@SrL$��@T�V�<��@V*�{��@W�;7!\@Y�9-L�@[L�����@]!&/L�@_���@`{���H@a|�.��@b�[���C@c�*G���@d�H���@eʥ���@f�.�:��@h���w@iPy� �@j��J&@k̕�A��@m����@nd�VX@o����&@p�Y �@q=�3c@q�<�)�@r�ɸШ�@sf�Y!��@t&) v�@t���1��@u�F�A�4@vx��[�@wF&g(��@x��-(n@x�h��@y�"Sb"�@z��7�{�@{{��A�        ?c�5y�1?�ȍ��Q?��\�w+�?�L���L?ũʯf��?�!���j?��!#��?�7FYq�$?��#S�?�NF��?���`��?���?�ZE8��]?��WE;�@!h��^@韋�@�O�[-g@�v\�e@~Y�v%�@Ft�@��}1_P@�]T��@�wwŎ@Q��k��@��?�@��,@ Q�v4�@!��L�8@#Ɍؔ�@$xM�vx@%�P�1�@'�� � a@)!d��N�@*̩�8}�@,�֐�R�@.O���"@0��lH@1x�oK@2gH�N�@3�7LP�@4����x@5���(�@68VQf�@7XTI)�t@8�yw`�@9��B�/�@:���~z@<"ச��@=hKY��@>�A�E!�@@����@@��ᔞ�@Ad��sy@Bc_Q#@B��Z��@C��wQ�@DQ�1�B@E��pӅ@E�Խ@F�3;!�w@G{@zE@HN��'�	@I%ѯ�R�        ??`��?k�\|Wf0?�!�(�	?�;6����?�s+>�?��3F��J?�� �"?ʊ\4�4	?��Փ���?ٛ'�x?��O���>?��z�u��?�{<���?�3��`?���p�?�j�C�a?�UO7�L�@�P��p@��`�>�@O���@��L�=@ �F�@.��3�@��sd��@�82�N@��`XAP@��ؼ�"@֢�@!�A]o@#U!%���@%1`%^Ň@'(d���2@):�SRH@+h6�+@-���)B@0�6�Q@1L��$��@2�K�H]@3� �K�@5f���l@6�[)�@8l�����@:"�#b@;�;��@=g�2��O@?/��m�@@��#�@Aw�8`H�@Bs��p|�@Cw� �oi@D��_�Z@E��VV�@F��Y�i@G����@I�S�Qj@J?~~��V@K~�����@Lƞ�M2�@Np���@Oq<34� @Pj�dQ�@Q �3Q@Q��U��        ?T`��R?~�f��?�?.T㾔?�ᔳ&7�?��aS�?à�H�?��0���?�KF��K?�2�oҡ�?�[{�FA�?��&��>?��!��?� ���?��W�ӄ+?���4��%@��ǅ�@�L2@^t&XRq@�,��$@��e��7@��K�@�+��w@}�S{C�@1u���j@w��@,�p��1@!;����@"����@$�jM��@&ʄZw��@(����@+	Vl0��@-S��sQ"@/�%"U�@1 �:�m@2q��%��@3�B@��P@5BF8� @6����(�@8Q 25�@@9�45�@;�U�i@=^-���w@?-���@@���䬲@A~ϣ'q�@B?��O@C���@D�3�$�@E�ʑ	�	@F���\��@G�dʷ��@I2z[��@Jn a���@K�\���@L�2�T.Y@NT��^�@O���w�I@P���E�a@QD[����@R S����@R��fk�`@S�2��Wx        ?����Z�?�T��� �?�� �uZ?�YVv�5@ d�t��@	��jGu@��?�k5@!Mŗ��@!?{���@&��ג?@+i�8=�4@0�?��=@3�����@7����@;�Sv�A�@?�v�Һ6@B���C@D����?�@Gl�N��@I��G'�H@L�pr�W�@O�	��W@Qw��j�@S%*��$�@T湫v�'@V��1�k@X�b��O@Z�Ǵz�~@\��k�@^䍉��4@`���~;:@a���]@b�v�X�@d0V%�@ez�y�@f�b�sr@h0��F�~@i���l�*@k����@l�b���@n�z��@o�}P���@p�x�ɋ�@q���\��@r]1
�J-@s>9���@t$��A-�@u��� �@vCY@�@@v�L���@w��B3�J@x��
��@y����-@{ʟO�n@|��gF@}7҆�`@~U��'"C@x�c�@�P�8鍻@�������@���X�R�@�i[~۶@���
2�        ?l0��ɢ)?���{��?�u�R��r?���n/��?��N���?�e(�x,?�P��ou?醴��?��`��1�?�z�/���?��@���'@ @�&�T@q�P�=@�"�)�@
��`+}@�;i�S@�+w[M�@�w3��@]�!	V@��N�D�@�0��u$@����ȍ@ �C�U˩@"����@$0rْX]@%�3UM׺@'��r�d@)���݌@+����Ӵ@-� ���s@/�96�'@1; �@2I�-�ݫ@33��d�@4�'!�@y@6	�nEw�@7_4�̂3@8�Z��aT@:*AT�=@;���f�@= F��x�@>�^�N��@@ ���@*@@��!��@A�f�O�Q@B�G���@C�n���0@Df҇�@EQg?FK@FA"$9@G5�<k��@H/�VK @I.���n@J2�\-��@K;��Hue@LJ]�b�@M]j8Z^@Nu/A>KF@O�6�j@PZ�4��@P틳��6@Q�u%b��@R�q��c        ?P��mY�?�B�'� ?�Gaӊ��?�������?��Rh�R?����?�x�Q{�c?��� џ�?�\w�W?��q::�?�*��8{�?�`.���?��0pz N?��u3�h@ ���6�@��P��@4-�ș�@��� @4��Ņ@��B�@_�Cat@���<�@�x��|�@FQ���@ 7D�
@�@" �$��[@#��bɧ�@%��5TN5@(�}�9K@*]բ��@,�#����@/P'�εZ@0�9���@2e�F��@3����@5j���S@77��X@8��/���@:x����@<L��hj@>40E�b@@����@A�-ғ-@B-�c�@CG
C�t@Dj�Cμ@E���f��@F��I�hY@H�^
��@IVh�7\0@J��x��@L�^�gr@Mm{3�@N��Fw@P,A�J��@P�e�o�@Q�ws<)�@R�x-�\+@SRh��jy@T(KH��1@U ͝�@U����U@VǮ�H@~        ?o3��P��?��Y�>?��]{�-?�.�Ho�?�ep%��?�6A���?�P1�:�L?��M�*7?����$q?�1���?��P���@����@�zXD�k@	�G�U�@d̦�=@��DQ]Q@w�w�@sk)h�n@�5%1@&��L^�@ ���]�@"��׽'N@%i,�@'VO���@)�fh	��@,M�\5�@/kA��n@0���ec�@2n�ʗt@4���]@5��F�[@7lB����@9@&�y7@;)�wU�v@=)����2@??�~��z@@�zN3B9@Aط���+@C��]ل@D@���@E�=�Pw@F��oI�X@H98r���@I�2"G��@K#�T@L�����|@N6ޔ5��@O�(���@P�q�ѱ@Q����@R��pⷠ@Sp9b�@TbwᚉY@U[���r@V\�\��j@WdJ=9��@XsE��.�@Y��D�$�@Z�!�e��@[��>@\��FtA@^,h���@_g�٘�        ?��_�\п?�h5���?��m�N�@�(�+�|@�)�!�/@R6!	�@#,C�n`Y@*W��]0@1Tߓ�M@6��Q8@;_65�@@��Уw@C�2���@G[fP�@K&��Y��@O:�j@Q���[��@T����@V�S�#��@Y2�%��@[�q5��@^�*�@�@`��%I�@b��@>Ya@d4W���@e�=�@g��o�p�@i�N��@k��+�@m�< ���@o�#�p�n@p��$��@r�wB�@sJ�>&a�@t�r[�M@u�_'�5@w^_��1@xbpA��f@y����B@{*�_�9�@|�>!m@~M�Z�@��Ff�@�����f@�g��z�5@�:H��h@��B[�L@��hQ�@����nE�@��}��@��+ҹ"@��î[U@�����:�@�-�#@�}=0D��@���ad^@����v�@���gǩ_@���N7�@��^8[��@�jB^3e�@����7@��C��
�        ?U&ǘ�-?���Q�`�?�H��5c�?�^��3k�?��Tdh?�B��Y�?ҚQ�D;�?�����ć?�":�QXT?�����?�x���/u?��?M��?�+՗��?��ϻ(�?��[hV~@ ԫ�,@w����@��*f?T@����2;@
�n���@���/V�@_�XwG@΢�t@֏�1B�@��Ã @��!�@�ű}C@��{�u@�q�2@ /��GD@!b��`P�@"��1h6@#��js
@%CWF�f�@&��V[s-@(�|�k�@)���ˤ�@+��i@,�0���@.D�i��@/�[�?@0�w�.��@1�`4�R @2�~T��@3��D]�@4�V�v��@5{d�@6|6�+�@7�a��6Y@8���d�@9��%׮@:��R��F@;��	�1@=�P��j@>7�kG�@?lr1@@S۔I�@@��t�=@A�w�1��@BAF�r@B�n�П@C���q33@DL�9���        ?P���Q}�?�-�$Tb�?��Gp�K�?��f�8�?��[�l?Ǆ�q�?��/S��?�U�j�v�?�B�`m�D?�T�`?�#�����?�Ēv!?��M}�J�?�K�r+��@ V:lBQ@U4�е�@�3ǤG�@
L{�N�f@K4]��@R� >@����@<p�/�@�7M���@��)���@9��"@!9^I�I@#��� @$��2'@&�_!�@)%��8G@+N1e�y�@-��(�zL@04̵�$@1bP5���@2�x�j@4.�LNBe@5�/ ��@7>�ꨊ@8�Cʂ�<@:��_SZ@<Vt�:9;@>,�]��L@@
����@A7�oP@B����@C���:a@D8A
��I@E[�3+@F�c���@G�V�_�8@H�5��@JF�|�@K��"Dg@@L�~�s�@N_�@O���A@P�o�]9`@Qi��0%�@R1��*)6@R�Gu��@S��4q@T����(@U��`�d�        ?4�}��1?b���N}@?�%� -|j?��&�hJ?��9n�?�Vx�Pk)?��KK25"?�+�@�?�5c��e?� % .�?�[V��?�)Y��?�D�B%-?��6Br?�c���?�e�`�5?����}�@ �kj1@⩻�Td@���@	�x墮@ck��$@�(�惔@�	A��@�xf���@3�[(-�@*�� Q@#���4�@ ��[�X�@"w.d�ʜ@$Ta�a�@&N�g�%�@(g<�A�@*�-@U��@,�K;F׼@/j4kd1@1 B�V�@2[���@3�bM��@5Eﭵ��@6��N���@8unn��@:'�N��'@;���@=å��9�@?�b@@� �_��@A���|"@B�cN�+@D	���wV@E.���<@F]�<���@G�c�&�@H�d1��@J'�t�	@K���@L�p�v��@NO��b��@O�N�5�@P����Y@Qk����W@R8�(As@S	����        ?��dRƖ?��gpD��?���ɦ$u?��f��?�r9#�M�@�;�@B����@���=W@���c�@#@��3D8@(�7�w%@-g9F�@1�Y$�rp@4␅��@8e�Q�@<2g��@@$P!vm�@BT�]��@D��m?�9@G&�� +@I��Ъ�@L��b/
@O��7�0E@QLi��@R�
����@T����Nu@Vd/�r�y@X>��!�@Z,�2���@\/N�5]�@^E�"�ĩ@`8A�0��@aW��'u@b�N��
@c�
��5@d���l@f;X�@g���w@h�5�X�@jS��m�@k�~���@mB����@nʳC�F�@p.�:��@p�tݚ��@qє|Ji)@r�ٖ��@s�>��@tnh?W��@uXHĦYl@vG�+bM�@w<��C�@x7���6@y8#���@z>j��#@{Jk�Z�@|\"�sس@}s�}�(�@~��$���@�pL٣�@�m�)5�E@���(��@��޿���        ?[�CY��?������e?��v�`�?�V�h�*�?�f�f�@?˵�"M�?�R]��i%?�7�='?������?�ڴ:��?���,�'?�,m��P�?��e"�\?���c˗�?�KP1�*@a��q�G@��a�7�@�ޭ�Ѻ@	k�i+�@sο겭@�@��+@�'�κ�@N���c�@.	-tRa@$�|�!_@2m��ԗ@W�d.@�`6��@�К@P�@!*�6�I�@"l��!@#��5J�-@%d�E��@&|:HM�@'��e@)n!G�3�@*�����5@,����R@.5���o@/�=�^��@0тf�a�@1���{�@2���̘@3�U���@4��=��@5��
Vp @6��(�`@7��F&�@8��9u@9�4�R��@:�w�;�@;��	="�@=9){�@>F�BAo�@?zF���:@@Y�\��@@�Ǟ=�f@A��\\��@BB}e{�@B�X���@C�0�э�@DF;;s�@D��
t�        ?P$Q�i	�?}?����:?����#;?���`X�?�@��e��?�����?��$,fQ�?�R�I?߶@��?��^��?�a� |�?�Z{,2��?��qv�x?�m��ױ?����.o@�\�3u@x��u@
Hw���s@|P����@�S�8�@ݐI�J@��Ȇ�C@�w���-@����S�@ 6DA�/X@"��'c@$���@&(+`��@(i!Ĥ�@*��7�\@-Wܩ �=@0����@1o<����@2�l���5@4��責�@6)��ź�@7�ڑ!A@9�1JJ�@;�7<Hi�@=�@��F�@?����)@@�OgH��@BD�Y�@C<�+��Q@Duv՜@E�?��h@G	] 9�q@He��%�@I��R�NH@KB�k>��@L���@NQX��D�@O끺,�+@P�)4��I@Q��%j�@R�Ƿ��@Si��%�d@TV��~N@UJ]���s@VDw���@WE B"�@XL^�c[@YZ7Ʃ�%        ?L�Td�?u�gN�h�?�(/%K?�rWDI��?�4爟:!?�51�|�B?��hϛ�?П����?��GF	4?�|`�|�?㻾���I?���$0�?�=� ?��m����?��X��r�?�,KD�k�@  �G��@��}�U@���pf�@Ήd���@JP6Ǣ�@?��p@����@A4� @�D�e@v�U�@ŕ�m�W@�w�*n@ �te�,/@"eR�E��@$��F}@%�١-��@'���c@)��l���@+�����@-��<�(@0�??�@1.�Qcg�@2c� 2M@3�rG��@4�5~c3@6MF{H��@7�����@9&l�(��@:��/�9@<1!��@=����@?m�o@@��o �b@Am$�a]@BQ��C��@C<P9�,�@D-W��@E#����d@F �e{�@G#�p��M@H,Y���T@I;���@JO�y<t�@KjW53T@L����@M��B��@N���D"O        ?�bk��^?����_?�W�ǟ?��w"LO@ 7��@	��2�)	@��\�*@�J�s�@!�J� @%ׂr=c@+2���@0��G�W@3�;�
@7k�{ ��@;K4�`C�@?wPW[(�@A����@DZ�WH2@F�RF���@I�8�+%Y@Lj����y@Og�DZ��@QE���L�@R�"=�6u@T��;b@Vp���@XO�a�0@ZCLc{1?@\J��A'R@^e��Q�@`Jt�Qϱ@al!�vl~@b���s�@c��a�x�@e.Q�	�@fX��D@g�vF�E&@i�]x��@ju�f�@k�u�F�>@mgER��@n�D����@p@�*��@qֳ���@q�o��@r�7jd	@s�q:�O@ty�c�by@u`��=/�@vM*���@w>e����@x4��,�f@y/Ϩ^�t@z/����N@{5F�#@|?2}1�@}N:jjz@~b0�~�u@{[� c@�LjS��@�ݻ���@�qzH_�@��K"�X        ?X�@�&�?��Iʒ��?�2]ˠ?��ȝ�A?�
Oa�?ɗ'���?��P��'?�zhy��?�A�>'f?���q?���~�?��x�Bw?�C0	�Gq?��9��?����@ 0��@�WB�
<@�K@�E9:�@
�3*�j@�Gʙ��@k��4�@��y��@�IN5�@�SAh8@�|�o�J@þ��0[@�=�b�E@"��ا@ :8�"�@!o.��D	@"���X#�@#��Dq�<@%U�8�@&�?�d"@()Eh��@)��.�@+,����@,��*��@.^�>�E@0�w^��@0�0��=�@1�r�9��@2���?ݓ@3�٣�T�@4�o��x@5�Q#�@6����@7�,��"�@8���15�@9�����@:��^��U@;�a��J@= '����@>+IN�E2@?\��t�@@Jb��c�@@雊��@A����+@B1���V_@B���@C�_K��@D7%��6        ?JI���?x�C6�y?�r��?��{f���?�B
Nb9?$��?�{Ox�,?ԕou���?�s��Y|l?��!>	G�?��L`�?�Kt��(r?�z�����?��d#�|?��Qd��@.xL�@E��nR@�9o�!@s�J0�@��)���@����i@q�m��@�y��@��4��,@�h�h@ �l��@!��c��X@#��5o�L@%��*a5@'�I$�-@)���pU@,�B_@.e�bi�@0tl��a@1Ť��t@3&�����@4���K9@6rt/ˇ@7���]<J@9N�#�I@;��S-g@<��,��@>��Mx'S@@C����@A@��;đ@BF��拂@CV7��5@Dn��(�*@E���m�@F������@G�J�<�a@I.d�!�@Jv���@K�f����@M"ry��G@N�Hl��~@O��V��(@P�L��G�@Qx�Fu��@R>�I�y�@S
R��Ʋ@S���|�@T�[��_�        ?<̆�G�?h5ᔚ��?�>�h�~?� �"�|?��9;J?��aeR�?�]����?�~3`=.I?�y~N�|?�n� b?� ��e�*?���_��?�wG��f�?����?�W^�n�?��
�̩~?��[xŬ@��w^@���M��@�%VЊ@�3�;�@��Тޥ@.�T�#y@�^:Sld@A���!@F<^ܽ@,Z(���@ ;�L\8y@!��J��@#���8��@%���$o@(��N�n@*GY}I#@,�P��/@/5��+��@0�M^|@2Z�c��@3շzN�;@5d��?L>@7�q�o@8�k1��J@:�4�B@<g�.�)@>\@/��@@3^��@AB��7��@B]�/��@C��1(E/@D����z@E�Z�eV�@G9``�|@H�����L@I�<�uZK@KW>�Æ�@L�����@NPİi��@O�eQ�}d@P��
�&)@Q�K���
@Ri�����@SH�.��'@T.Ml��@U��	��        ?�ρ���~?��H�N�?��y��?�٣�#��?��P�0�@9��go@R�yzN@��#g$�@���=o@#7e���>@'���m-@-S�;�܎@1��K �e@4�b%��@8Y� �&�@<&ٟ�m�@@4��X@BP�L}�@D��\y��@G%n�V�k@Iɍ��c@L��ݔ��@O���T�@QPjc�a@R𽅰�r@T�X.e�0@Vn��	5@XKy���@Z<YB�@\B#q ÿ@^\s���@@`E�	�D@agUJUt�@b�<ʲ��@c�S@B�@e	��V�@fS�M@x�@g�I%��0@i�0N�@jo@�D	@k��*f�@m^|d���@n�?/� �@p;8��@q�����@q�4vHj�@r��@s���� @tq��C�@uY!�q�@vE�㠲�@w7Z�x�~@x.^�#ω@y*����@z,W�H�p@{3[U~E�@|?���S@}Q��N�@~h���g@���1@�T�E&@��ԛ�@�~�@\�i        ?H���,��?t�]��?���C��?��Vɷ��?�p���w?�O�o�d(?���\�?͌0]�Г?�Ƙ�V�]?َ��eΜ?�fBnѷ?�.g�u?��©0?�R/��b�?�IOR(?�D��p6?�"{�y/�?�6���;�?��Ȩ�X;@ �th@�3%:�B@�Q���@���@���o@
l��0?@�0��@]���+@ �>v��@`�y�@�*d�}@K�$��@�2nq@p����@�( �e@�<��@��lY��@f�����@ �� �\U@!�`��nB@"��xk]@#�a�{�@$�����@%��q<��@&���&"�@'��(g@)!L�@*OHu`�@+��~�	R@,���aO�@. �͙�'@/H�%�Y�@0K�m�y @0� 96c@1��u�@2T+���@3�_��@3��٠�|@4x��V�D@55�Y�	�@5�����S@6�L+�p @7���H�@8IM��t`        ?4^چ���?c>��,>�?��3���?������?��Kk\� ?�@:6�7`?�[s���[?�ϫ��I?ϸ΢S?��eƺ�?�:&Tf?�Pi�k�?�;.�a:�?�J�w�#?�Ԃ֑�?���4X&E?�z_�K@ �q��@�!K-��@�[��>@	IyJ�@��W]g@~Md�zz@�ە�ٳ@ ���^@��hV�.@4fK�~U@��P@ j�&�@!�;X��@#f_R�x�@%65gh$�@'��I(@)!]�S�@+=Y�s�i@-s]q�}+@/÷�Ȍf@1[ \�@2ZS�P�@3��!�[@5	F$��@6u�3�n@7���a@9xk7�u�@;Lv�,~@<����w�@>h�Q���@@��\!|@@�{��'�@A����@T@B�v��{@C�/b��%@D�beӶ�@E�S�S@GZX�	@H1���@IX	,��`@J�^��5@K���K�@L��$�@NA#)_%\@O�jpe@Pr�j}�        ?>��,D�?i �1�ݻ?�����=�?��8��� ?�q��,>D?�(ۘ��?��&�/�?�w�k��?����xh?�r*շu�?�>d+���?�؃.��?�(��I�?����(�?�jW���-?���2�?��u�P@}�ڰ.d@�e�D�@ض21�@�Km*@��l��%@�N~4�@T�jd��@���T��@�lb��@��*jZ�@�֞�}�@!�0��X@#l�l	@%Y+КH@'dV@U)�@)�:��#@+ׇ��<@.@�	FZY@0e�j�O�@1�9��b�@3!��= U@4��8�<�@6#s�_�@7��8�@9l@##�@;,���&@<�O1�N�@>�`#@@m�����@AsM�G�-@B����K@C��e,!e@D�zSO@E�B��P@G"�x�@Hb�Wzj@I���!�@K�<m�@Lby���@Mˤ�o��@O?w�C�@P^���r@Q#=�@Q�cw��@R�(��6�@S�_�ff        ?����4�J?�BKA��H?� 9g�&?�8i�a��?�ݸP��i?����P� @ ,���o@��4��@4�{~@z��,�@o�,�@���7�@"�e�@%o*�oX�@)�Y@-/��u�@0��0�W\@2�kB��@5ti#��@8A�;%�@:�;�$1�@=̎T`*�@@s��@��@B�ʇ@C�C��@E�EJ�ZG@Gz}�@Ip�y�]�@K|n@Ly�@M�I\�m@O�zg�R@Q�fp�@R@�P�@S{5UCŐ@T�_'i@V�O;9;@Wl�H��@X�vh���@ZB���MN@[�4��@]B!{�3�@^�[>�:@`5js��@aB��@a�/ �|5@b�+��SB@c�2aꅓ@d�;@el>�(@f\2T��0@gQ��M!@hJ��̘@iIS�@�@jL����@kTμ�0E@la� /!@ms\���p@n�ʡ�/a@o�D��@pb�ѭyC@p��p�٠@q������@r!
��T�