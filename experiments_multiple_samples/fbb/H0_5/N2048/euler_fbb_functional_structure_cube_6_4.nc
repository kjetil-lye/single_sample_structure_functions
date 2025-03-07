CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T105120        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            @               ?�������?��M��P?�⽼T@�@	1��t�@D� (@!�M���@)m�[�@1zې�o0@7P�q�@=�'
R��@Bk�N��(@F�۬Y:T@K�Z>��@P�eH�@R�]�f��@U��͇�@X����r�@\:#K���@_�+��0)@a����@c�j q@e�<#|]�@h.�0�5@j��=��z@l�$��@oz��<,,@q<.?@rm�S��t@sي}lbd@uQ�E��?@v�Mh�F�@xf���}%@zRƀ>@{��r��@}]��@����@�q���t�@�[z�M'@�J1�:X�@�>z̑�@�7뼂V@�5���@�8"�9@�?����E@�L��&@�^R�c�@�t!�^�@�����"@���{|A�@��J�h@��\�x@��G�@���-aך@�D��@��^<�@�~�j�@�_��@��hY�@�c�c�@��2a�O@���+��)@�X�J��@����y�        ?=� {*?qz5��K%?��EZM��?���c�T?�k�q��?��MF�?��T.0O�?���j��?ҭ��`�?�J�P�8?���>5��?�  ���?�[����?� o�$�?�_i�*?�ȹ��	?������?��{L��?���a��
@�R>F�@��&тB@��#��Q@	l��ZL@���}�=@�DRO@���P�@�v) �g@��NhC@;G-�9�@���g߲@fw�Q��@ #�L�e@!���:�@#Vt�� �@%m��@&�O��s@)���r�@+)�eG{�@-s�O�;@/��_[��@1<�#��\@2��Ok�@4��d�M@5�O����@7?��@8�PpeL;@:��XP�@<�5X�%�@>�̊�f�@@w��є�@A����@B�,��.@D���B@E\���Z�@F�[���e@H1��^@I�[��@KK�OL'V@L�n�%'�@N�M���i@PA��z�@Q4Z���@R1ÿ��        ?�ԇ"�+?���ɢ7?�%D@x?�[�f?�UDiH?���~x@��t�@��j/�@eG����@]��y@e���4@��1`�Y@�z �@"S/�'@%U��&N@'�ܶAa�@+��Ų1@.E,��r�@0�	X��.@2���ۼ@4��N��@6��X��@8�n2��r@:���7@= z��@?]֏��@@��z���@B4y+�@C�FW�@D�����@Fh�Jz��@G�6�F@I����@K.�+n@L�:�7��@N��:9�@PM4ۢh�@QH�~�@RO�6Z?S@Sa9RSY@T~d-��@U�[����@V�t@\@XZS�@Yl\Ǣ�w@Z�ш��@\0��d�F@]�D��h@_+��w�@`_k/X@a0@�Ǎ,@b���{o@b��+�J@cЏ`�GW@d�^e�R�@e�76 ��@f�7'��@g�ur=7�@h��Κ��@i���K<@k
��!`�@l4d�Ɲ�@mf�T        @+�0�D�@[��MU�"@v�<�(��@����w��@����@��x]'h@�).maA@�\�Dϸ�@�UV�O�o@����_�@���F��@�n�@��C<�v�@�����O@�-[��x@҆���A@�"�Q3@רm�&�V@�o���i@�Z�1	@�3��G@���<�x[@�r�W�>�@�+<�hs@��B�@�˚ڱ�K@��q9��@��r�d@�Ȼ�@�`$`��@�p"���@򆙥��v@�R(bօ@��ڝ�t@���|��@�9
�>%@�QQ����@���y�Sr@��̝�@��N�=�@�X\"���@��a�Y@�����9[A �f@I�AY��!��A��wbA�"#��Au�����A.;�!��A�D(d�A��G�>;Af5�E~A'�^�A뀻P��A�_bPhkA	yM�p�MA
CG�DAD�e�A�:k��A�.��jA~�U7�ARy�]W�A'֍0<�        ?=�@,�D?s@�%{�?���+�b?���W�)?�u��z?�Ĩ��?�[�>e��?�]oj9f?�e����?��]�/��?�E��'?����W�h?�s���-?�ӑ?|�@?�@�@
m��x@S��[@18��@�N0_@��C��1@旾&#d@k<�y�@ ��)(�@"+�I0k�@$`�~t�@&�����@)7�gqR@+���y5a@.�-U\@0��7��f@2?��X�@3�p$�q@5q78i2@7"y%�I@8�W��@:�R��o�@<���
q@>�����5@@D��ki@AN����@Ba1��F@C|�-q��@D�p,@EϰU��@G��$'�@HI��n$�@I��e�e�@J���n�@LLb)�v @M��=-*@O+����@PUR8��@Q�Xm@Q�7�&�@R�z�N��@S�����@T_͙�~=@U>V��-@V"-�J�@W]	��@W��6B��@X��ȸ��@Y�[�r8�        ?$��&�~?U���,�?zB����?�K/ǌ?���E�y?��`6�L�?�R�v�?��M�?_?�>i"J�(?�4��sY?�ho�M�?���؆X�?�	a��he?���,T?�Z־B�"?�=� �BL?��#�Gx`?�����3�@��V!@�����T@	!��w@հ��<6@z9#n�6@�.S��@0Aj��@�Ia��`@ŠSzx@��� ��@ ����L�@"���|@$�-���@&��6��@(�KSrUz@+rPç�o@.��_�@0y-��S@1���M�@3��d��O@5O�j�@7 WC	�@9�؋� @;N��@=7NG���@?yӮ�-@@�&�P@B0X7�S�@C���6Fv@D����@Fg�L\�@G����C@I���
a@KZ��88@M,"y�@O����3@P�����@Q�Jrʬu@R��ۥp@S�>��R@T�q��D@V�?蔒@W`{խ@X���З@Z�q�        ?/�!�! ]?b֞@o�?�+�t*�?���F�-?��d����?���?&T�?�bh���?�>e?͋#q?�ͧ^�?���:�?��t��?�2���!?���!?�_Glh�?�h�mQ?�-كZ�?���Aޣ	?������?� �E��@p����@1���z@J�_��@
��Q�@���:L�@wәs�Y@�a�x<�@|�l7@c \#
�@�H��@ a��C�@!��4��@$ �����@&@�&`s�@(�Ȼ7�W@+PUhNl@.$F�b�K@0��&���@27	��E@3�����|@5�'���=@7���I��@9���'�]@<k��@>qJKg�@@v��N@A��3h�:@C)M���@D�ʼ�}�@F'�l�@G�d ��@Iw��I��@K?�ZW_N@M�-4�X@O��]@P���c��@Q��OQt�@R����+@S�us��@U �K�f]@VeK-tM�@W�$j�:�@Y�`˹        ?����}�?񬲥	lB@g}�qX�@*r3�E�5@;o�vz�@H삅&�@R�l�k>@[���ʥ�@cS��3�j@iԉ6b�A@p�F@uE.�.��@z��ek�@�XF����@����$��@��K�n@��4ܻ�@���1�G@���
��e@�2c� ��@�����@��EL���@�p�ۥ�@��R�u�@��5ް�@��5�L^M@�SG'�=@�"p�#�@��6�]�@����@��ź��3@�E��nh@���ҁ/�@����"/�@����^�@�]�P�w@�GLM�B@�^��8@�"����@�-5;.��@�?��D�@�Y�!g�Q@�{�;�n�@Ʀk]'�@��w`v�1@�<b�1@�Y۸g�@˧`����@����
�0@�\���wk@��s���@К<���@�Ve�@Ya@�����U@��.l%�@ӣ�X�6@�p�)�e@�B��I�@����i@��5�@��W��@ز�w�Y�@ٚ&�mX^        ?W����!?��ю�?�hM}.C?�x�M�'K?�����d�?�2}4?�Z��[�?��^~��?�dG��?��}���@Mj��h@3��TR�@	�WQzZ@8;����@��ު�@s��C�<@p���@�t,��@&��|@ ؁���@"�%�zs�@$͡���@&�B��)@)2þ)�8@+�Հ�=@.	���A�@0Ph��@1�J'<�@3 iJ�@4�/� �@6�x�:@7��ݭ��@9`�+���@;�x��@<�6��@>�����d@@_A~b�@A`�7";�@Bk"v.�@C~���X@D��S�TO@E��L��N@F�兞@H͛�º@I[�}1ļ@J���p!@K��a�M@MCK�)��@N��+�e%@P�뷷@P�o%�S@Qs�g� @R2oRua@R��6��d@S�3���@T�v��n@US���@V%�%*��@V�i����@W����?@X�N��W9@Y�W/i�@Zx9�IC        ?n����?U�W#��+?{��RE?�߂ʔz?�4���&�?��Y�ҳ?���8{8I?ɭK��b?�|��B?ٍ��?�r#���?�d3��g?�Pn��?�((��?���G��?��ֺ^6�@׾F��@��3ۓ@��ʇ�@��+��@��=�$*@���G�A@K�HeB�@M��
�@ gj�\�@"�D͉�@%��sfK@(�6B��&@,P�?�p�@05,@@2+#6�"X@4y���K�@6���`)@9�2�)�@<�Y�Ⱖ@?��F��@A���@C��V@E�¾�@G���@J(K-�4u@L��C��:@OC6τ>@QI��@R���f�@T,9@U�
�,��@Ww7��a@YMSi�,@[<R:�@]DI��:�@_f���@`��PM�@a�bL�@c9Ҁ��@d�;�IRt@e�T��>@gA����a@h�`����@j>��L�@k���@m{d[�@o1�d���        ??��F�?.?u�އ��?������?�2�Ob�?��M��%W?����f?����9T�?�ET�/I?��} �?���;)�?�*�]	?��]3ӯF?�C��M@ 	= ��@��d./@�m_�@����@v���O@�*S7]�@��_�A�@��@�i@��]��@K.S>l@��B��@�f�	2@ 1�p�#�@!�&Q>�"@#c��C{�@%(IZ�@'�AH�@)�M�@+9o�?�@-�S����@/�Ӕf��@1N����@2�� Z�@40�p���@5�`v�q�@7u�-z��@9@�k|d@;&��@�l@=*zpU;@?L���%U@@���S&�@A���a@C8u�ic@D���a&@E�G�KmO@G_�Pi@H�G��@J{Y/�s�@L$��K�@M�B"U
�@O�+��R@P�Wm�I@Q�5&�?�@R�(�mE�@S���7�@T��{�D@VSs��t@W:���z@XqF��?�@Y�R
�        ?�G^Q�vN@Q��T,�@%�|u�@<��ݠ��@MTQ��S�@Y@+Ż�q@c}X�� 3@k�[�˔@r�����h@x��\։�@~��e=@�~�F1#@���Y(��@�R��Wت@���yƵ@��Q�� }@�V�L.��@�L�0�t@�w]�ڧ�@�ִ�)|_@�5y8'�F@�E.��@�GծI*@�3�U��@�g�e�x�@��9N�aj@�"\��@�Tp�%d@��@��{@�W���@�u�Ljm�@���d��@�����m@���w@@��R�g;@��i�0@�Vqpv�:@���N��@�1����@��>Q�u@��w���@�#nvHk@�9���@�V�A�S�@�|5�&�@ȩpt�n�@��q�;�@�A�0=�@�_�p65@ͬx8;c@� ��%k�@�.�Nm��@���b�O�@ї-j�"@�Qh��@���bG�@���Ka�@ԗ�#?��@�aі�b@�/�O6R�@�(��-L@��ta�@دr�9��        ?4��S��?lx�e+�L?��b�?�?�ԩ�?�-�Ќ�?�(�y)��?�٫0�?���Ⴔ%?ڝn���?�6&�Pyp?�D1?��?���8ڮ?���юJ?��h����?�'%��?��$�e�4?�N���W@ ���^�@@���ן�@)�L�	@e�\b9@	櫳�%�@�.�AZ�@G)i��@I2�@���U"�@"M�C�$@��nR+@r#��_w@2���M�@l����@���MT@ڀ
���@ o�y1S�@!z���)f@"���&R�@#�i�5Bg@$�#��H�@%��t%.�@'8M��b@(y�lbV@)Ę,,�$@+Sѕ6&@,w�v�c@-�b$��T@/S�յ�@0g���3�@1+ʞ5�x@1�
�<J@2����@3��Rs�@4s4�r�}@5S�̮��@6:�RQ@7'��I�@8p11:�@9^ů!@:��[�g@;|�z�@<)��sa�@=<�5k@>V�׬{�@?vRh�o�        ?�b��?X[�-�?�hKU?�{�WR�?���՟t:?���rK'?�E�� M?�CD����?�gɇ*ye?�^��0�u?٪�I�:O?ߡ@��D-?�$�����?��<9N��?���h?�[BPbB�?��!)q�?����"h?���i���?��>�7+r?�,��~�@ �hh<@�H�1@�XT|d@v�nb1z@
%�ˇ�@ͭ�itN@їyK��@�M,�@P�7)y2@<1,V<�@P�~�@��T��<@�й��J@�1���@ �'[6@"A�n��@#����@%�D<&�x@'�*Di@)�!p��@+�eb}�@.C�
u��@0hF�C?@1ŉ��g�@3:�4�;g@4��D��@6q83�@84�G�@:�Y.�v@<�T���@>/j�s�@@6-��L@AeX�XG@B��\���@C�)�\85@E\��Sj�@Fԩ��@H_�0e��@I��u���@K�hߡ�c@Mz���Y6@OX1�Y��        ?ds� �I?CT�={?c� �S?z��z��?��(+p�/?��=qq^?�ڵ���^?�x$�7?�W��)�?��+K/p?���7���?���\ћ?��Y�n�'?�deB(�?Л	�L?�@� #uE?؏u�d4?ݠ�0�?��X=)�@?�?:B(F?�E���S?��$�� �?�j�y�|?��V�\�6?�6�h�Y?�1n
f�Q@ X�han@��k��@��v� �@鍹��X@u���@3��@`��3�@Ǵ6�l�@kno@N0I߬@tKo1�@ p?���@"J��2�@$K�R�@&s��p	�@(�LF�Py@+A7=8�@-�L
�@0_�_&�@1�]����@3}�M�@53����@7Ά�*�@8�7���@:�4�-&@=�D�SG@?_��h*�@@����@B#�=���@Cv5ۭ9�@D�
��@FO����@G�9�ؼ(@Iq�Ӫ�@K�]3�@L�1��H�@N�zm�8e        ?�;sYN3<?�и��*�@H��A��@y�7���@+1k&{@7f��l@A�,��.o@Im��*�_@Qg�is�@U�Չ��@[�,�3�'@`�$��O@dM@4�@�@hS�Mtk@l(>ґE@pLRq�^]@r�'7�5@u?#�G�@w���В�@zۜ�=ِ@}�\28�K@��u�ܳb@�:����&@��CU���@���9��@��\5�@���E�Z@���HP*�@�ۼp�^�@��*QX@�+8�
}@�X�&��y@��0�ڨr@�ѸrB��@�d]{_%@�sP*�Ǟ@�Ӡ���r@�>�A�j�@��:��}4@�4��i�@�����@�,R@�M8@����8@��r��@���ߚ�%@��w���+@��5m,w@�pR�`�@�g�o&@�d����@@�i('��@�u8��@��K���@��n(�@�ŉQq�?@��5�ǵ@�!a|���@�-_�q9@���"���@�q�e��@��q��@��ʛ=��@�s}sg�e        ?P�����?���Xּ2?�<��3:�?�Ja�?Ѵ	1߮h?�~o�X0?�-��J�?����O�?���CӾI?������	@ �[ L3@l��Օ�@�/�@�!��F�@�MuVö@w�!���@;�4�19@.a���@N�i�΂@�a9}�@!����ޡ@#b��$�%@%P.���@'U*'��@)q����@+��48��@-�l@�@0*[�m]�@1g�L�	@2�y0]�@4�~�]@5d�_�IV@6�D��?}@8G$:�7@9Ɇ.	9@;W��w�@<�@3��Y@>��h��@@$B��'@A'�m�m@A�/����@B�km��A@C���ȅ@D���{tP@E� *��@F��hr;q@G��5@H���Ѽ�@I���-�@K!{p��@L;(��@Mh�=C?@N�Y?EZ�@O�c�@P�˛�a@Q3`���*@Q�~Cc��@R����L@S:v�V��@S�vF�G�@T����@Ue�e)u�@V'^ҩ        ?SH��4�?��Ӑ���?���[ڨ�?��|�%��?������?�T: �7?�JK5�=�?�����?����/�@�,�d��@ԭYy��@8�&�D@	���x:@1�*]>�@���~F@7v�y�Q@ A�R�@"�:��O@$Q�Y�@&�pJ^�@))]�c�@+��J�
@.�beC~@0ќ�@2iw#3>�@4��Xi@5�AO�u@7�����'@9�5y|�m@;����@><n� b@@Q�6�~�@A�R�
@Bk�5@D[=I-Q�@E�$�>Wt@Go�%��@InHD��@J�2�4w�@L����:@N�E%
@PT�rvt�@Qe	�\��@R�Ό��@S�qҦ�t@T�.u��W@V&>hj��@Ww����@X�B�y��@ZD�TQw$@[�\~���@]J��o!�@^�{w��@`E���@a!O��&@b���Ӎ@b���^�@c�2'V�Z@dޢ���d@e�b�@f��y�/@hn��@i!�l�C        ?'�p��z�?a4�[ۦ?��}5���?�1H̙��?��%@h#�?�.�<��?�<>��?ĭ=k!�n?��01�g?�]��Ot?�u���P'?�`�e��?���fܝ?�	߱�Y�?�=���P?�٩�B?��x��b�?�x�[�P?��O�ͷ.?���ea��@XҶ+�@���Q2@��ȿ�@
-���H@�����v@����g�@�uz��@�@v�%@-�Z&�C@��1G@?�O�@ �öo/�@"�p���y@$���}�@&�{�1@)KK�́�@+֮	 �@.�9,�@0�{���	@2T|%�0�@4��Y;@5��Q�c@7�'��?@9��Ha�@;��@vN@>I�i��@@_���,@A�Z�pe�@Co��nS@D�}\���@F�	}'@G���;oF@I_���@K*N� &@M;�z�@O:�Ia�@P�`ۅ�@Q�#�6@@R�P���@S鍈B[�@U"�����@Vh����@W��9�ҽ        ?�u��@U�s"�@-�E��D@COchWX@S!h�tk@`CwY�@hR�B��@q��/`@v����@}o!����@�_Z�e�@�ff��-@��b�H!@��-ʋ�6@�X�˸@����@�v�A>@�A��d;@�d2x��@�����@��ij�p@��'*��'@��<Aj	@���޺��@��/ڏ^T@�챩�@�r�+@��@��P���L@�0C!�Nj@�|4���7@��"C?\�@�5�.O@���򒶖@��I�lU@��\��@�* ��![@�ę,�@�f>Q}ԡ@��y���@�gjh��@�I��
�@�2N�zo@� l�zl�@�s��+B@��kN@����o�@�=�@�!��@�5:��@�O$^݄@�o��'�Y@͗K�B
@��ɴ�^�@��c��o@Мi΍|@�>-t�D@������$@ҍ��4�@�:�[�s�@��
�f�@ԡ c	�4@�Z&�`��@�*��)�        ?A�bU��?x#�bޫ�?����>?��� w�?�o��̭�?ˈ�?��?Է&�(z�?���x�g6?�>)l��i?���m�?�L
�U�?�qf�Ǿ?��q%a�?��AM^"�?��.#D@7Z���:@�lɴ_@	�0鹏@��<@o����Q@[���l@�`�OF@U T �@���cP@� '��f@��$;��@�pR���@��]ȫ#@���v�@ �8�KP@!0�h�@"i��3�@#�	�m)?@%̐�~-@&h?+�Nm@'ھ����@)\����@*�
���@,�73��@.@4��ڊ@0 ��-�@0��y�@1�}#1G@2�-���@3�,���I@4ܝ��a�@5��)�*@7	b�h 	@8,�Z��s@9Yls��u@:��nZM@;�_6�4�@=��|@>e���%@?��9Kk�@@��r*@AG��HC�@B#�VGV@B�3.g�z@C�3�	�@DR;j�q@E!a��@E����2         >�"�T'?"w���S?F*�';.?`(�~�z�?q͌�L�?��у�-5?��I�Dh?�[���)6?�bR�>��?�0�t�0?�y=�4�O?�q�R	�?��8���?�mX�/&?�ATҍ��?��:vO�?р���� ?՛�MB�?�o	��.?�X�"��?�L���?�"/�?�f�7�?�-��p<?���7�^�?�2�k˧m?��Y�4�?��uߏ`@:9���@�]�:�@����@	�3�?�@Nk����@�z�[��@�\S?ǩ@n�#[a@�e�D�~@wg	2g@�����@ p�H��@"B݉+5@$:���@&\���@(�M+�cs@+& P��}@-�L��	@0X�V�u�@1�pE��@3�"ظ�@5J�6;a@7+9RZ�@9+E/��@;K5dX��@=��1�n@?�.5�[@A<����@B��[-kM@C�/�T �@Ex�U�1�@G	QR�Ǆ@H�'��8�@Jg�Za�k@L6�	���        ?;FV{BY|?r_&|.V�?�G5��D?��2���?�Q�	�?�?�-�k2�?�y�S=?���<�?ۢU�S5�?���[�?�Խ���?�ɋ��?ﯸ{\�?�R��e?�ԓ�n�l?�IL����?���W�2@ ���H�d@��ȝi�@�>��@h<��e�@���Ź@,��@�_c�@�T
$�v@�+w��@ǜ[���@�aZ��y@�i��Z@!S�o��@#Rgo3�@%��OJ"H@'냉��@*��x8�$@-k��=@0E��e�w@1���W<c@3́O}@@5�K���@7����@:9ź�@<�!t:��@?W��O�@A# Wk@B��&��!@D59b�=@E���d@G�����@I�٥;�i@K�d�Y@M琏��t@P@_M�@QQ�u�@R��F���@S��*2@Ud\/Y�@V�J�7@X}����@Z*K��@[�X.I`@]����w,@_����6@`�D*%�        ?��M��|?�9W���@�M���@.���>@>��5)�@H��b��@R��4>�]@Y���Ҏ@a)��?'@e�>�~�@k�>hav@pU"��T@sd�8VA@v��~���@z6 +0ƫ@}���!�@��[��C�@��ܔF@�M倞�#@��,$@@�T}�J�@��\C���@�k�R��@�#�_*o@���9�@�3�U-�@��NM#i�@�����[@�\���G@�?�x��P@�9����~@�K��K�5@��SI�@�ݧ���x@�.>@�J$� �O@���zڨ@���I;@�R3x��@���+�<�@�Dy�1"@�����*@�j/=�}@�*�T7O@��ī�g@�����]�@����ś�@���*.��@��|�?�@��5�1��@���IԙF@���4�&[@����;�+@��N�`�@��k�n��@�	��3@�1uF�@�fe�P@��2)m @�s�����@��~2]G@�Ê��dD@�q@���         ?XL�(�F�?���m�&?������p?� T����?�-���R�?��r�c��?���ou�?���fX{?��9^���@gp�֛@�pJ�c@���-@�,�
�@�EZ��@���}0I@��5��@��Ll�@ �w��0�@"��^N�@$��o���@&�Q��=@)-I8�]@+�ӎv@.;��@0T/��!(@1�+�5�q@3�"��\@4�uԣ@6�ؽ�@7��.��Y@99�4K��@:�X��@<�_ٝ@>a�1��o@@IP���@A
Z�X@B���n@B�ux���@Dy"Y�@E�s�?@FTt��@G6����@HTlI�e*@Iy<ᗭ@J���K�>@K�S���@M�3�K$@NMu����@O������@PomD�5�@Q�N�x�@Q�Y�"s�@RuH-�|�@S(���.�@S����'@T�ՠ�h�@UUғ��]@V�TM��@V�$RO��@W�O�b�`@Xh]O%(1@Y45��*�@Z�f�.        ?IgpgE?���%��?�b<~Jf�?�{�M��@?шӊI�?��\.a��?��s��?�	 �?���i�D?����\e@a�G}�@C��t�@	�;(�S@2�����@��</{�@a�����@X��Z�?@����R�@�V��2@ ���h�@"���,�@$�#vpQ@'0��9,@)�ǜ��	@,5���V�@.�MÕ�@0�����@2�ƌ�E@44�#mց@5�*����@7��ێ*�@9��R{�a@;�4��n@>/�R��~@@C�5"�N@A�a�y@B�'5iT2@D)��-@E�
���@G�cѾ�@H����@JK֋�O�@Lr�j�@M�GHu�@O��@D�M@P͡�5�@QЙ>��@R��*�@S�ꭑZ�@U�A��@VFa  �@W[V��@X��� @Z6�4@[p��p�@\٬���a@^O^ud�2@_�p�h"@`��R��@a�f�W�@bU5�@#|@c1�m^s@d0�V�        ?)�� MU�?f h�?���N#?��E���?��Cq?�9���W?ƍd����?�/Q�,?��Z�3�?����7U?�n�/[�5?��tRj�?��D� 
?��ۗ�%?��L���?�vR�en?�JAzT�?�~4Ҭ,@�^D��@�?���@Qr�d`@
Q��jYG@���K�@���	�(@�D�c�J@����%D@�emئ@TG��=�@�u��	@�ٱ#P@ �AQޡ@"�R%�n!@$e;W��@&Nv�!!@(Zf��@*��f��@,���=�@/bbpE�P@1ǝ9�@2r�K@R@3�en�w@5�u�#r!@7Hl1�@9r�h@;��32�@=yo_�@?0�o$�@@��4q�@A�oO��3@C,��g�@D~���0@E�h �@GU~X�D�@H�Q��4@JsF����@L�j��(@M�s�?L@O��|plT@P��~
2P@Q�ȑ��@R���a��@S�?G1�-@T�J��s        ?�aس��@a玍�@1�յ�)e@F�R1�!�@Vfj�F@b�/��j	@l�G5+�@s�`�2:>@z9���@�������@��p�Y� @�n�F��@�X�Z�*�@��e ��@����s �@���?t�@���l��@�ATo��@���h�TP@��̸�@��h�D�I@��G����@�����!@��x���@�H�0<f�@��S���@����G:@�J��6q@��
�m@��7j��@�O� ��@���5��>@�1� 9�@���~:�@�=�
SqC@��IK��:@�r���I@��n��w9@�h�D�2K@�G�M�Be@�,@��c@���q�/@�aS�S@��Z��w@���"��@��$d`A�@���n�@��GQG�@��I�:�@���x��@�9wI~��@�X^��G@�|�L� n@�S8}�k�@���)��@х�壬@�"\��@�������@�c���J @�TN
A�@ԯg
P@�X׸vU@���k�W        ?h�p�7�?���{fIz?��{i+�&?Հ�hQ�3?�����(?�g�<��?�*%��ܘ@[�T�ۯ@�G�5�g@�[�Wv�@�R�+��@ ߺ���@���@!7���@#���f@&����t@*/��T&�@-�oht��@0���'D@2�r��#@4���B�@6�ގ��{@8�<��y@;&�l�_*@=��*bY@@����@AMĖ�w@B��(!�X@D02���@EtE�(!�@F�#��R�@Hs��U��@J���#@K�ǿ�-@MG��L�@N��US�@P["��@Q>�ZGKK@R'.��m@S���c@T�&:6v@T��n̡@U�Ns`@V�t�Dd@X�$�x�@Y�ŉ�P@Z%�Io��@[<�lR92@\Y;T�a<@]{C˒I�@^��m��@_�5���z@`����T@au�gH@a����0?@b_�s�t@c=�S�w@c����R@dY�fl@e���@e�nL	@fm�p0;@g%0Jk�        ?Nc���?��Ԑe�H?�A����?�n�)A?�����E?��׼�?�hp��?�\i�i�?���g��?���.w{r@y<�@�@,A���@z%^1�9@��L��L@	�] �@�tF�P@ԟ(��@ ��k�@#& G�g@%ډK�vV@(��o�ro@+��G D�@/o���C@1��ҟ�@3�_ �u'@5�� ,��@7���m��@:n��mjr@=G`I��@?̽��@A^Ͱ�>@B�T6a�@D���x�@FVo�<x@H1�Љ@J&ǈ�Jt@L8�v�l�@Nh�.0-�@P[�� �@Q�A�2�k@R��7B�2@T6\a���@U����@W$�*ݿ<@X�� 0��@Zf���@\*�?s��@^�x��E@_�Kw
��@a	 W��I@b x�9A@cFw���@d{b�z\@e����Rk@g6���]@hv�綔y@i���f6�@kmfm��@mDL�@n����v�@p-��%@q���@q����y�        ?F���o�?z<��H�?�@?2�}�?��Uf��?�C�ӰZ?���f��?Ѡ
�j�?�mU��?�-i�c:�?����!?�����vS?��t3���?�(�P5��?�үn�lS?���`Tc?�i�!�b9@2�D�#@�ED&7@�e�^2,@@�?Yu5@�Ӂ��m@e,�&��@��{|��@�:k���@a�T�uZ@�[�P@����@ ���=��@"T켮R�@$+��A��@&$fї�N@(@��@*��eMN@,�P�/�-@/3���@1�]~�%@2��"ߧ@4"��fG@5�pG	�@7���>�@9j��v��@;e��RFI@=R�`@?�և˟@A	�L2C@BGO�7��@C�X\0O4@D��S8�@Fo�eOS @G�b�j�@I��]0�@KK�"�+n@M���t@N����iP@Pw���U8@Q��B��@R�W3'�%@S�?q�@T��äl@V(�2��o@Wvsu��@XҐ�{s�@Z>�a%��        ?�N���c@�-lTw�@?����q^@S��!+@cI��\n�@o�y.»@w��O�^�@�����5@�(z�D�@�d����@������ @��u���@��sGVz@�H�Xx3�@���N��@�4�%6@��^i1b�@���s�@�)r��@�#3�1�@�׍�"�@��a�
S�@�z{1�M @�h�S�}�@�iܽ-1|@�}�Ö'l@����h�@��ŽU�n@����:@�C�(���@�{G���5@Ļܺ��@�0wf�@�V��-@Ȱ�D^�@�&��}�@�}w1kt@��?]b @�iЏ���@���&��@к�Hh�@уB���7@�O���@� �[3@��68��S@��8y̖@ը,> �@և�@�k�9xG<@�S�p�Z@�?��4��@�0.SY�@�$�.�@�-\t��@�3��z@���$��@�%��y�c@��ԝ@ࡗ�l�@�,���@�3g҉t@�JF4��S@���}��A        ?R
y�}�?�])/�.b?�=.~U-?��-㚔U?����"�?ծ�B�ϲ?�Hyyak?�ͼNf��?�a��1	?�Z���]?�XL����?��T���|@�/���<@�Ɖ��@�'�=M@C�"�ZH@%V�>C�@Kq�L@�6�"�d@��}���@��6-��@>���B@	��U@!�i@"���x�@$.�ej@%�#��%N@'��b-��@)v���?@+^˷R"�@-Z�@��@/j�o��A@0�&�"��@1�O"S@3�H��Z@4A]BMpa@5���X.@6��W�0�@8��i��@9z�Όl@:�F!�N�@<S@*G��@=����@?O���@@l`\�T�@A4��Ҭ@B ��Q�a@B�~���@C�V9���@Dvm���@EM�'�ܩ@F(0
�#@G�FF��@G��w@H����`x@I�g9:@J����@K�`N�=�@L� ���@M}{����@N{̓��@O;G�̆@PC�k*�        >��
�l��?0�/��H\?S`�r��?j+�;Ԍ?{FO�x?�@���5?�!�:i��?�[L~��?�
@	_%k?�cũirP?�B�h�%D?���qZ~?��$�W?Ê�9���?ȉ�ۃ?�{���-?ҿ�Fm?��RF�e,?ۙ�Q�u?��Z�[&�?�(E�"?�>T7�$+?�F�ASz?��Ij+W;?�q��0X.?�D���;?�e��F�W?�٧h9�y?��1�Z��@��l7N�@,6.� @�����@	V���	�@B�sG	X@n!�ު@nHE��3@I�Ϲ�@KyvK5�@v�H��@�\��@U�P�/@���@! �j��#@"���@$L��e��@&$�K�)@( �g��@*CS| cb@,���w]�@/���X@0�p���@2@&fO[�@3�V��u�@5cF!��@7:O]]@8�},���@:�^��u�@=9~�
@?<p�k�@@˺8�h�@BbS���@C]�'-��@D�F��2�        ?1�%�6'?e	&��?�p
y��?��=c�$?��u~Pj?��-�r�?�m� W?ʋ�L0��?�:)ǚe�?�.h.w]�?�C��r�Q?����� Q?蹧^B�2?�uDwE��?�an�?�i���?��\iw%?����7�@�"���@��CR.@	���O2@���&s@7�ЯW,@�3C(�@�Z��2@�e�<h?@�Y�2��@ <��J+@"0���$�@$L����@&�Y��Uc@)P\+)H@+�-��@.m����@0�6Oi��@2L��rB#@3�Y�gT�@5���[[�@7��i�*�@9��l��@;ۂVu8�@>��W�(@@>P�`@A~z��e@B�ui;�`@D2&�E��@E����T@G0~M9��@H���r@J���tE@LJ�̈�u@N,�;}<@Pw|"�@Q,�E@R6�1��@S^�n$@T�R�S@U�>8��r@W04{���@X��Lb��@Z[f�[@[�Ӳ9P�@],���        ?�ws�?�X
@*W��z@1�`���@Ah��j4�@L�'����@U��?�VH@^R�wb��@d v�h��@i���@o����)�@se���8�@w�ax�q@{!���{@oS��m?@����Z@�s���@��B:�@����(�@���J�W@��Wy۽@�^�rs�@���z��@��Ɣ�iI@��?����@�b��*L�@�U��Y܊@�]���9@�{i�@�W�Kx��@�}pA�ܙ@��*��%�@��c&G�W@�8w ���@���?�@�� ���@�hz=�#N@���JZ��@�s��,��@��|V�@���F�.�@��H�3@��9r���@�nWC�y�@�UY���1@�@����@�0�N*4�@�$��}}@��e��@�r)O@��>�@�Q�@�&?G��@�4<�j�@�G�ȋ]@�a,D���@�����^@�S�k#;@���d_�}@����С@�$'SQ��@�����1�@�m���	�        ?NϮ˃�?�j��I�?����;4�?�؞���^?ɻ���vq?�$��9?�xF֝�y?���W /?�����?�=+�|?�f��@k?�����@ ����7t@����@��m�c@
_E��+@��� �@�#q(�I@���^�@��Es@?@��X:@��ތ&�@0A�o@�
���$@���lj�@!?W�,��@"�m�r�@#��T8�@%<�}�@&����@(d�3T@)���~(P@+_�~Y�@,�����@./�_f�R@/��<��@0�#F��@1�3�+��@2k��k|�@3Kh[�:�@4/�]Ǐ�@5��@6��(@6�e���Q@7�4�@8�<�N~1@9��L@:�:)@<���@=��j�@>,���dQ@?K;�b<@@7�02/@@��`Z��@Ad�S[?@B  wLz�@B�@��J�@C?J�h:z@C�-����@D�֔=P�@E3/S��e@E�">3�@F��#���        ?P���?P�����#?q\�>�&?��	����?�GC�K�?��*��?�*6s� ?�7��T�?�3�b4�?��횡�?Á�.F�R?��`��(?�L���E?ѰtYS?�:�K
�x?�]��t�?�7�zM�?���B\�?�GZ�U5J?�+3u�L�?���0yʓ?�y����?�$4�N�?��F�Y��?����y��@ Bm��R'@�7�;�3@�����@	�r�	�@�@A��@a�h�K@�� r�@.*�@C!@�ZZ�:E@]�$Q@r���q5@!��l��@#O��@%Y8ρ�/@'Ɣ��@*j�UH'_@-I/¶j�@02�'זW@1��A��@3�8�c%�@5���R�[@7�n�`@:T�E@<��ojPr@?+e���@A �6��@B�f���Q@D#�+&Ւ@E�c�[�@G��m��@I�p��@K�`6��@N	Hq{�5@P4AT$�B@Qv4O��@R�*a��@T3�7���@U���Y        ?I�n�w�=?�.��x�?�uS��?�ߌ�z�*?�Y�\�{�?��UK1j?�m�EҺ�?��<'���?�� �?�?�u+ �O`?��QL�M?�2�Y9v?��H�N5�@ n�L�o@,�K]E�@&��x@	[�ǹ$�@Ђ!\�@B�v�5�@?-�K`�@^[a/�@��oK!�@掅(@�D"M��@I���H@ ���\@" �
@#��+J�@%`�{N�@'({�r��@)	�V��@+��qK@-E��#�@/K�Oe	P@0���m!@2�t�"�@3M��pܤ@4��&��@6-c��@7�����@9���d@:��u��@<t���@>> ecd�@@ �h�Q@A�����@B	5��@C|�q��@D6:�ƻ�@E\�����@F��ό</@G��AbWO@I'��W@Jm�8d�{@K�^1:��@MA��m�@N�ɰ6�_@P$� �@P�a*�p�@Q��,[P�@R�E	�@S|�[�L�@Tc���O        ?�7�$駯@�J֕��@&j?v�@<2Vȥ�@K9zՖ@Vqm�Ã@`�M���p@g:	$�4�@n�j3��!@s��&,Q@x@q�D��@}]�T&`@�t^�u6Q@�nڹ�:@����Ff@���:���@��A>l	�@�#B�9�@�a.ä@� �i�u�@�>v�x�)@�o��@��q~�*�@�<'B��@�9Ӧ~��@�v��B��@��v��'�@�X��i^@�\�c�=�@���]`P@�I0W@���y�c�@�����@�o[��:$@��t�p+�@�q��IB@�~:3��s@�F�N�@� �`h;@���!Ǽ�@������_@���`���@�`S"�u�@�<jJ|#@@�-���@���+e.@��=��h�@�����=�@��n=��@��P�ف�@���Iwr�@�����@��)�ή@��o4&�~@�]�F�@�������@�n J��@���z�-v@?�=�@��l1�@è��4ξ@�<T,b4�@���v�I�        ?A�U���?��z��7?�}��!��?�R��d?�#�pFr?֘��d�u?�Зn�?�<{i!�
?����?�Ih��з?��<���i?�|��ne@ ϻ4?�@�?�)
@v¿��@	�4B��@ҤH9@%J%M@��/�m@��jc9@s�Q�@:Aڨ@���N3�@����@���1�@!H�ժ�@"ſH'24@$Xh͙ţ@& =� kn@'�_��>@)���F
D@+xA��@v@-v�z+X@/��_�@0��.��@1�,޽�@3(�Ѷ��@4`�˲��@5��^"�@6�\.�,�@8O�����@9����3/@;+����2@<�M��)�@>:�Gqr@?�WM�2@@�c����@A�^�NB)@B~��+�@Ci�_e �@D\eu�@EV-W���@FW�g��g@Ga�n�S�@Hs)��hb@I�����@J��k;��@K���?�@MP��hR@N>��)@O}AJn�1@Paͻ��@Q�m�        ??��v?�j�e���?�}`OM�8?��.AS��?��m��?Җ�z�d�?��Ϊ��$?�#�E���?�[
��"V?���x�n?�>�D�?�7F9�?��v:-?�����@ y0�`�@��3
4�@�Q͍�@���m�@
����F@�}�,@���@`ԧ���@ �O%V�@��a�,'@�K�o�3@�k4k�@�ҮX��@2����@ȑ�*��@!Lud�}[@"�,@��i@$}��!p�@&K-02��@(>���0f@*Z�U��@,�8��`�@/`�Ԏ@0�	>��3@2=Q�`@3�����@5S���V@7eW9�R@8�3����@:�x��O�@<����n@>�u���+@@�"�'w�@A�`2�v@B�D�SY@D/)&
@E�hĐ�@F�eNW?�@Hd��5@I�1T�h�@K����2@M.�Fk�3@N�K��Ѓ@P[�,Ma@@QK_gS�}@RC��z��@SEQLo�@TO�3���@Ub�Q��        ?U�T&�?R�����?sθ��8?��$���?����\?����7�<?��?�><]?��M�]_�?�K;�s�G?�!��d?��Zf�?�p�,!z?�	�æ�?�]�C��~?��j�[h?�YX��?�~%Xp�?�I�<}�w?��X��?�>`q??�į���I?���!8@ �L@�@�Ł�S�@���,$@
9[�3�@- J+�@N��i˴@�k��y�@�l���z@�w��M@�`��@ hPZR�@"{	��r@$��w.�@'?/O���@)��b�@,쫜܆�@0����@1�6�S*�@3���*�b@5�V�z�P@7�"�j@:@���@<ů-��@?x�����@A.4�>e@B�L����@D_Pa�I=@F!�2��e@H���� @J ����*@L!{��O@Nd��M@Pf�W<@Q��� @S	�R|@T{*�Ӵa@V /�#�@W��*_I@Y[�$%K�@[.m�5@]�BF�D        ?�����\@{��y1@)vm�-@@��jXt@P �Z8�@Y����@b��A'@i6��G\�@p+�5���@t�<� [@x/���\k@|�ԩM�h@��
�[��@�&&I>7�@�Ʊ��Ir@���${@�v*d�\�@��+[>�@��ye2@���h��F@�a��5�@�E�{��@�EP��!D@�`�ʤܓ@����!@��T`-��@����$�@��N��{@�U'����@������@�3�S�|�@����_�q@�M�}%��@����p��@���4��@�cVp@�;%*�@��� �@����%�q@���zG�@�;�p@�2�c�@�/�����@�R�m�n@����:@�����!�@��d�@�N0��{\@��&o��@����B�@�B ���@� �\�#@��H����@j�n9@�^YD��@�3G���@��2h6Q@����e@�Ӌ6���@ǾFa�@Ȯ ���@ɢ�:��@ʛ�\���        ?M��>�?�l���?��E���?���,ŵ?�Aj��P?�bx���?ߚW�?���\��.?�Հw ��?�\�{6;?���>�y?����Aυ@ k�;��e@DX��@S����@	��6�@�@@@d�|�@Y��BS@i��iy�@��}X�@�k�Z@AX�� @�����@ /��h�@!����F�@"�
#CN@$w���r�@&wJ�\@'�Ķ�	�@)Qo�l�R@+{ �8�@,�<k<)@.���ї@0^x���@1b�.c�@2pS��a@3���/߲@4��A�j@5���I�@7���@8>�k��:@9��y=*/@:�rm��z@<*_h(�@=��d�6@>��2�D@@3�GO;@@�Wir�@A�̬�ĩ@Bz|e�NT@CE���#@D~�@D����@E�2-9�@F��"�-�@G~�M�@Hdnv8A@IN`�N1�@J<�bٔ�@K/���@L'=B��U@M#PD��g        ?�T�Z?EM��T�%?fO8F���?{�����`?�B�Y� ?�L�GG?�Wp�W ?��:z�?��̮��?�y��k�?�M��-o?��v�zJ?��)�N��?��F��m?�iZ�FgJ?��{%2#?�/���ʃ?���^?�?�v����?�X,�U?�c|'�u?��G��Q�?� �Tk�?��U��?�K&�?���>���?�(Q��?�&���=j@ Մ�F�F@a#{2�@<�r'��@	oTo��@��@�p2@z�{O_@����&@q1Y2f@���@�E"�ƺ@� i�@ �N̳�@"�-1:@$��]$��@&�D��]@)8>nGR�@+�;���@.�����<@0��!W3@2dH`�+@4����@5�P��@7��K�6@9�̰Ȗ�@<3�Ő�@>��s�"@@��-�@Aَ���R@C?o���@D�/>�@FGK"��@G�<u�@I�uɎ�@Kpj�`��@MT�,qf�        ?��]o�$?N�5@�))?o��F	?L?�����j?�Ttq �?�&ˆH�?�%���?��[Z�j�?�>�he$S?��O��U�?�"����?�{5m5V�?�W����?��\H�?��K�=�?�ݢOh�?�/�\�, ?�YZ$SS�?���~zQ?���h�O?�js�~�?� �[%�?�#U6�?�������?�tw�Z��@ ��Y�8@\�
9l@��X@@	/���@��k~&@88��9@W��:l�@�mQ?��@M$�ʟu@-)����@W�vh�@ i�B�{o@"R�m�@$j��g@&�3�ʵ%@)1psuL�@+�R.2��@.ۅ����@1q�.�@2�5͂�s@4�-��Q@6�����@8س@.5@;3�gz@=��Q�@@9΀	��@A��	���@C@�(�b@D� �Ӭ�@F���Z6�@H�OѢ�V@J�Ps�S@L��da@O7�o{Cq@P�M��@R,���Q�@S�����@U�C-�=        ?���+��*?��2jq@z0���@&���ER@5�ж�v@A�x���@J�O�o >@R|c�G0t@Xy�ޒ�R@_DzQ
�@cm`��@g�@���@l1�� @p���@sA�(��@v=ɧ(�@y.�@ػ@|o���e�@������@��79ʕu@����Ɗd@���q���@��esMp3@���$�I@�c�u�6@������$@���'l@�
OӋ�@�q��p�:@�遟8�@�r�
ޅ�@�;z��@��x�K�@�y�b�d�@�K�FG�8@�1��G-�@��k�QZf@��ڽ'R�@��7�(�@�ƕh�(�@��Z�"�@��W�D�@�RC����@��'FQ@��=�x��@�9�����@��>ls@��6'�@�|�ؗPq@�~���@�C�ӹ�L@��
�_@��K�P_�@��I�1�H@����J��@�m�@��@�Q㊆R@�<���@�+�ze@� k�>��@��q�4@���z@@���$�s        ?Od�� ��?����Ȅ?����F?�d���?ҫ]7��*?ޟ�w�y�?氣�(�?�f��T�?���c;�V?�Mۨ���@ AV'��U@�1����@S�;/�@IB�0@����2@�p�@dܥQ@�as��@���[�@Q����@6�>op@!	��@"������@$SB��W-@&偯p@'ț��@)�w�f|y@+~�"��k@-q���j@/u�G�66@0��e��@1��f��@2�1h:s@4n$K@5;�׆�W@6lG�>��@7��+� @8�Ꭳ�@:(����@;u',�u@<�r:ȶ�@>"mɇJ@?����c@@u$7	&
@A,Rw[u@A�>zRe�@B��T���@Cd��;E�@D(��2�@D�-��@E���@F�w��SO@G[[��p�@H0пv&E@I	��+j�@I�i���@J��Æ֪@K��ʤ�#@L�g���@M}�^h�R@NlQ-��D@O^���;�@P*?���        ?G[ӭv��?�n�h��?��<]�Q?�5o,�L ?�' ޖ_�?�J$��?�U��?�N5oġ�?�+�s��?�_�=jP?��F��<@��v�.b@��:�p@	u���@���v@H��$:@Ye�$�o@�\nW��@{�&���@ ͢[�H;@#�b�]@%�<P�i8@(FU3];@+=�H!�t@.x���@0����@2�^�=	�@4�PXr�@7+��K�@9�+K��;@<%t4p�@>�N��5�@@����@B�<Brȅ@D@���Q@F�r�ע@H<��wx@J}��@LU�����@N�\n�Ϥ@P�Ƶ�@Q�5�Ĺ�@S]���B@T�U�@Vy�D��@X,���U@Y�+�{/�@[�} ���@]�]z��J@`�4�@a#kE�c�@bT�3���@c�����@d��N�@fT�����@g��,���@ia���@@kjV��*@l�B_��@n��>��@p?�{�@q@�d`Q@rM��d2        ?����|?K;��i$U?m- i���?��u�H�?��ӻ��v?�g�WT6?�����G�?�'��}�?�r��a�?��?}?�
wg-�?�l$��G?���;�/?ӧ0���b?�V�x8�?�7�ln�?���x�F?�e����?���Kw?�Kk�<�?�_�
��?�I����?��2�� 	?�2�����?�@{�z@��2�ʴ@V|� �m@#~�@
��]�@C��^��@e�1�D�@P~�A�)@dSB,@�K�콟@so#�@����*@wu嵻�@ ���&�@"V��$�
@$�]i�@%��c��@'�G�<��@)��3cNX@,%�5�@.k�s��3@0qZ;�0�@1���W(�@3 ^+�o@4��6�d@6��X@7�T*&V%@9kZ^�C�@;4�7�S@=�Uxo?@?U�E @@��}�1I@A����@B��½Y�@C��Vl։@E2e�ڪ�@F|���
�@G���@I;Αgn�        ?Ҽ��3��@Z�J&�@2IciO@F��2̈́@U��^gm@a�����@j�5�H�@q݅��@wV��F)�@}h�p�@��%r'p@���3�I"@�}��#�@��O��	@����q@�W����@�����X@�a���.�@�ig���@��?t�@�s���p@� ��n1@����Zl@�LmcI�@���H�@��(׎�}@��ȿ7�@���H$�@���8F��@�e:�ep:@�x�ӛ;W@���Ju�w@��1���@��Űa�@�1-!|�@�Xi�@����?3�@��`@�?Ǒ�>@�����Mt@�{�� @�n<�v�@�q�R�ee@�/�}n�@��D�zt@¹KW��o@Ä_ �
�@�S��6�=@�'�B�M	@� �XU�@��sI��@��I��{f@ȩpňT@ɗw�>@ʊQvo��@˃JS2�T@̂->K�@͆��ܒP@Α!��;@ϡ}4���@�[�}�Y�@���cу;@�{���        ?R��2��?���,f�?�s!�ϼ?�I!��?�M��	��?�Gi,%�?㵠^���?뽇�C;�?򏕅\��?���b?���tN�O@H1���@��F@	�s���@*+dL�@b����@؉�@8�@x�ܾ>@B'SmAe@5z#s�I@R�1�4@!L�Sז�@#괩v�@$��^�@&���^Z@(��!xυ@*�`G�@,�%^�@/	�t��@0��C�&@1��8��@3�O��@4Lx/Co{@5�@��$@6��I�P�@8@�'��@9�
����@;a�^j@<� ;y�@=�_����@?z�Ɖ�|@@��OxK�@AI_9%8G@B��]̣@B�h�h��@C���ؑ@D�Uێ@Ec�:1��@F?��ъ@G@zȴ6@H��N^c@H����k@I�`�0i�@J��Թw@K�s��@L��jF@M�`�5�@N�Z}o�~@O{�i�F@P;9�h)	@P�Uo��"@Q:�3��@Q�έS        ?!Z�#g�?]ya���?~����.?�(�(AP�?�K�Z�?��L( �?���O��?��#���?�~�$&$?ȋ�Κ�?�%:��?�  ��P�?Ձ/��\�?�>2�̌?�e��\S3?�wN~�?�-�n{�?�dГ�w?����0H�?�gԿUc?��1A?�I�7�?��?W��?�a���V?�t�3^L�@ '�/��x@P��g�=@�T�y&�@m��"k@
nGMKz�@ñ���=@��{�+Q@���1h@�v^\@~lJ���@5�)��c@0��2#@ 8��f�@!�m��@#��M�1�@&	��Kd@(R�n�*@*���!�@-{˻�@00xZ@1������@3m�n��@5;��I�@7+7ʕ)@9=����Z@;th���@=��M���@@*I|+�@A�V0KM@B�E2
	@Dk���h@Fa���@G��v��~@It��B�@KQ��ҥ,@MGjHЛ�@OV{1�O@P��m��        ?2Xu޾??g-�Dp�?�=b��bn?�����"�?��J��?��R���?�#5�i�?���$7�?�Lhr��?�]�J�D�?��#��X?�����%?��w��?������?��#��?�q]��6W?��Ngd#?�6���}?�L,�2�@���߯�@�3^�I @rf3���@	'�"�=�@�7�@C9��@X�a1@0�=��e@-��0�@P)K��@��F�y@�Nx(@�,m�@ ���& @"=��^2@#֌�bmK@%��)�#U@'Y"��=@)E�R��@+QW<+�@-}<�0�:@/� �b@1>Wz��@2i��B��@3�c�
@5;��z\�@6�(Ot��@8c��S@:@_�ƍ@;���%�@=�e��@?�ʵ>��@@�����+@Be��x�@CC)V�D@D��҉@E�5�G�@G)S|��@H�����@J!�L k@K��d/�@MO�k�8@Oh+�PR@Pj.b�l        ?�F�j���?�)�P�W�@	6���@3%&< ��@BŤ���l@Omv�}M?@W��GA��@`�&�I�}@fM@Cg@l��8�z@q�a�d�@uϡ�g�@zh�V$;@~���|@��	ZU�@��_�z�@�^��Ǳ@�c�ɒ�@��H�Pq@�{��^_5@�B����@� �� @�F'�*�@�Rh0�@�A@ �B�@�z�/�@�ɁR-�\@����,L�@�՞á�P@�J�H�@�qg��<`@�Ϊ�Ƭ@�5� �q@��e����@� Om��~@��?����@�.�15i@��W�YE@�0��3@��̷�@��?� �Y@�����@����\h@�urZ�G�@�\>�k�@�G���*@�5�eN;�@�(��c��@��2�Eg@��>��m@���Hm�@�ުT@@�#�͛�@�.]C�a@�<�� �@�'�Uּ2@���3��@�?�=�P@�ΐ8S�n@�_�Ԩ�@���]~t@È'��v@������        ?E.dg��?�02���?�`�.��?�z���?��s�O?�Bf�h?�?�Š��h?��:y+�>?�GG7><i?���w4��?�fK�@��)�D$@v�:��@
����@[�ԡ�t@/"��h�@�o�/J�@�ƺtx@��כ�@Mq���@ ��N��*@"���5�x@$|��9�e@&~�����@(�)Z$�@*�S�o�@-s��ԕ@/}̳i�@0�Y3q��@2J��r@3�T��Q�@5@���@6��F��@8ż�%@9��%S�l@;/#Q�,s@<�s?"�@>�����@@--�F@A|����@B�s��@C �޷^@C��\ܫ�@EI�� @F��Rm@G$Ǐ���@H>����@I^��u��@J��vJ@K���i�@L�3g�8@N$"��@&@Of�<��@PW���u@Q ��w@Q���'F@RZ�˸-�@SJ	���@S�6�Sz@T|�5�e�@U9&�Y+@U��>+��@V��]"�H        ?9- R�7?~��ZX9?��[p?��m?���X�}?�&����?ℐT=�S?�,����?�x��-��?�a�mik{?�а[�.K@ ��CF�@%�|��;@��+�@�A����@�p��|@<!3��@�aG7>@�U��*@�bC���@λ�1�@��w��@!��|OB@#n[{I��@%Qwp��3@'QqM��@)ozx�B�@+��XK�@.
�x!~�@0ExAwQ�@1�L�F U@2��g�~U@4s�=Y�D@5��;��|@7�N��!�@9Y�)-@;(.�.�@=��q�@?t|SL@@��V'dX@A�����@Bۻ�±k@D�Z@E]襹��@F�DD��@H!�Z|gR@I���
�@K,�N�@L�=��U{@N������@P(�{N��@Q^T���@RX2�@�@S�,-�@T0����]@UP�/W �@V}Vׂ�@W�!2'�@X�V��a�@ZSS
�X@[�p9a��@](
�Y�@^�}�%Y        ?A�p��?|��vn?��g,���?�Sa!��?�Fr�de?�"D�P��?�L�ۃlr?�����@�?��tX�@ a6�a�D@��ʺ�V@��M0��@W�t�@W2'��@����@�M�w�@"=�y�'*@%T���B�@(�B~G�@,o�T�[e@0=��ɶ	@2p���B@4Ҍ�[��@7e��^E�@:-I���@=+�I�#@@1@�X@A�N.�P@C ��:@E�0�b]@GԞ�)�@J��@Ln��I@N�B�O��@P�,�:7@R.\@+��@S����u�@U-Øk��@V�4�|�@Xwb�`%�@Z8u��gU@\�H��8@]�ܐ�`@_��4\�/@`�to��|@bu�uS)@c&�!�5�@dI���@eu��͉$@f���^{�@g�5��a@i0�/$�'@j��7#O:@k۰,+g�@m?9L*@n��� ?�@p�8��U@pХ.c2@q�>��@r^��i��@s-0���@t �J�%�@t�j(�D        ?��Iطۦ@I-6e�6@-�ߠI�?@EQ���}@V�R\�w@c�e��|@n����@vS'%?��@~co�:ڄ@������M@��1?@���%2G@��a4b�@�'���{�@��<��@�k�]t@�3.��Sm@���&��@���C�d�@���伫�@�M��;�@�)�*�!@��Ұȉ�@�!���Q@��Ïw@�pk���@�0�Ui��@�X/�2@����@���P�)F@�ׄO���@�uh@��H�Y'4@¡M��/@��\bJ]S@��V	 ^@���'@�X�� ��@ș�u�i@����o�@�2̈́��7@̊�sGݜ@�靛��@�O�5bC@�^��Nc�@���|��@�ִ�*.@җ��w@�\hf�6Y@�$T-�F�@��>jZ�@վ?�r�@֐@ڰ	@�e�kO�@�>Wx��@�l�-N�@��ڱ���@�ܟe���@�·���@ܬ!P��@ݘ�o��@ވ����@�|7
��        ?("��$?c7��D�;?�k����?�j��|�?��|��?�����-?�ɔ2�^�?Ёq�)<�?֕T<��W?ݝ����R?�����g?�E.��k?�95ό?����r�?��a���?�� �T�?�|�w4Ѧ?�7��p+@@GT_�@=gE�)g@��H��@��y6�s@
{���M�@0 �ϼ$@�V�@�����@@[6�@�?��o@�gV��Y@R���M�@9"Z��@3覢��@C���"�@ 4$vWp�@!Q%���)@"x�y�D&@#����:@$�_)��@&2<7�]@'�E�{*@(�G�Vh@*Pw�h[@+��s�"@-G2;�g�@.���@06Fu�bs@1|����@1���K��@2�4����@3��;�z�@4�!��:@5��5��@6y.���@7xE�4.�@8~4]�q{@9�i
��@:���@;��-�C�@<��b׳�@>޼��@?5&q��@@6ZV�N�@@��q��        ?2��uS��?i����)?��4�v<?�ݗ�
�?����Hv?��NAP�?�=��F�?��e��>?�"_�8��?�2�K �?�Ӆ���?��>�>��?��<̛��?���X�U?���R��?�^ ���?��& �/�@+�
�	@�5]'�@��� rt@
���@A���-v@?_�@:���@fN�]��@��v�*~@�ۢ^e�@��ȱ��@ a� K Q@"f���@#���҉@&��� @(8��<{@*�]�b�@-D��V�@/��]�/�@1c��eV�@2�S�!n@4����k3@6n4��&�@8X�K��@:cx dnK@<�4l]�@>�D@��B@@��3�a�@A�#x3�	@CY�j�R�@DϺ�w�@F[;ގ1@G���Z�l@I�C�E�Z@K�3��@MmZkR_�@Onp�^��@PĘ�oV@Q�-�s��@SXE�p�@T=|8�@U�����@V�H\ti�@X7�1��4@Y�� �ø@[,0k��        ?C9vq��?v�>�?���7�?��?���K?�s+A�؁?�����"�?؁�����?������	?詢^r_,?�D<��U?��EU�~?��ر��P?�| ��@��~6�@\l��E�@
/�<���@a�n(�@|�BR$@���T_|@�}�%��@��gZ�@�m��@ 7��0QW@"�w�O�@$)T���X@&_5i��P@(���?@+P�Q.�@.���c@0���~]@2���$@3�Лs/�@5�,�i@7z�s6H�@9������@;��K��@=��8��@@6�w��@@A�X�?ɴ@B��&`x@DP_QJ%@E�8����@GqKg�W|@I"b|���@J�X=di�@L���@NN�G@Pj|Ɉ~d@Q�$5�C�@R���s��@S�;�a;�@U� ���@Vn{x��@Wџ�(�@YE��n>�@Z�=�K�S@\e^�#@^F�AM�@_ѕ��m�@`�nD�4�@a������@b��g-�@cִ3#s�        ?�y(�,�I?�� &f&@��.ť@0�[�ܾ@A���P
@N�"ig@X��@��@aW����@g��rq@n�];c�@sv^`[ʆ@w�uH�#�@|��\��@�*����@�4�c�@�E�͟�@��Q��@�U_54�@��Y��@�1�G3��@�f�[N��@��h��)�@�6G���@���@^ �@��
6@�9�)ce�@��Q3_j@�S���@��R�$@��7�)@���Me9�@�d�x�~>@�X���@�_����e@��E�l�
@�ԑ�tx�@��ڔ�j@�!5`�@�V�c�@��W�u��@��/T
��@�4>`w�@���:[��@����H@�m��"��@��/��%@�9@�(�@�8.��W@��qn�X�@£�	��)@�|����N@�Z�岡f@�>w���A@�'P���L@�{���@��@Xi�@��A��@�����@��}Fg�@�
�ϟnm@�$�5�@�*���jb@�B*��ӌ        ?=)�T(��?yG�,�5�?���e~C~?�10��6�?�d�+m�?І��G�_?�A`��\�?��4��n�?�&�g �?�L���!�?󮯦;�?�+/͞>?��=�:�@;��[�R@ ׺ڥ @:[�nA=@
��YA�@�`n�@ٯ���z@ȁ�zA @�@�}Mj@�<�D��@��l@@c+�W�P@�v:i�@ eĮ��@!`ơycu@"�,<V��@$yڎ�v@%�����@'��$��@(�q/��(@*9=,M@+��<�z@-�����@/��,k@0èǻ�@1���S�@2ח�nP�@3�W�C�@5���g@6QP��2@7�>�`@8��ً@:D#-v@;���JP�@=-����@>��؈�[@@)BVWDv@@�Q��@A�t��@B�,��2@C��<��@D�����[@E��5�=z@F�� ��@G�,���@H��K!�@I�`��C@J���NI@L!�d<@MU�1|S@N��a�V        ??/���8?WQ��V_ ?z0���c?�2m���?��$�p&?���Ղ�?���~��?�؀v� ?�RR��?��2֑�?�9���$�?�Kari`?׊Vp��?�n��`@M?��8Z��?�E��+b�?����{?�=gŞ-?���<s�?�K3�U�q?�g��T�?��o:�[?�ѲA
q#@��0�Q@�jl�@6k
IM8@	,�(��@l����@���4��@��F'�@y�)��@VxW6y�@�8p~�h@�J�>@fR����@ � �s1@"n��#�J@$:*���@&&S&Q�,@(4w@\xu@*f�װ'@,�j�kx@/8��TX�@0�y��d�@2T�'j��@3�-�0E7@5a8��aD@7��$v@8��BZ2@:�cot�@<�,�|a�@>�>B�� @@[/|�Ya@Ay�$�@B� Y2(>@C���ޯX@E)��WV@F�W����@G�c�D�-@Ibh0���@J�PU�@L����|f@N-gpw�        ?$���g?TA ��!?w��J�?��jN��?�D{�?�o?��Z�?�kǤ}�7?�2Zr�6^?ɽ����L?ч8�p��?�1�9�^�?�Z���T?��G���?���0�?�]��o�?��n���T?��i\'_\?�8�>�?�~�M�gv@�u��ˢ@�ԡ8@/6- �@�n.�'@�s�J;@ HGC�@���`�y@�|E�@�/��F@��Q��@ �I谴@!ݼp���@#��i���@%���F�@'�k{���@*#��~@,�b�lL@/;cGzP@0섍�eJ@2^��x?k@3�Nt��@5�`N�*�@7@!uA�@9���@; ��h>�@=Z;���@?3����>@@�'�x[@A���&@C8���R@D��p�kj@E�l�K@Gy�~Q��@I�%��@J�e42�@LtG�͹@NI��/Ε@P�
(h@Q����@R/CdO�:@SL��1_#@TxujX`(@U�co�0�@V�2_��        ?�@ T�w��@"g�n$@8��֥�@H����@T�Ҩ�N@_!�@�'�@eϿ]�A�@mZTߜ@r����<F@wZk�@{�(ds@�����1@��|��@�� q~�@��K���@�-�C
@�^���\�@�;�Q�@�+Йu
�@�.F
U��@�Ax���@�c�N�]@���g[)�@��vx�.@��V�O�@����[@��@�N�@�=�=�o@����8@�膱
@�Q}�ۦ@�ȿ!��@�O �l�%@��o�-��@��y��@�"�{�8@�����@��f��]�@���I��@���!+Q>@��{w�@�;��@�DI9�C@�vswx^@��m`�w@� c�f��@�Xh!p�^@���@�w@�-�bhI�@�U'K��@������@��'#��+@µ3W#\�@Ì�uw��@�j�I�jq@�O|(nl�@�:i��J�@�+����@�"���@� n>��@�$󑁥@�.�͖        ?P��4��?����?��/�˺�?�]��1�?Ϗ���?���OvC�?�0<�q��?��atP?�i�PGc?�%1h�?�"ҍu@ S��I@I��is@sGk���@	̸����@T{�Ai@��F��@rB^[�@u1��x4@��A"G@�!2�7�@�o5Zs@Ck���C@��9��N@!�0���@"N�!xQ�@#�KAS(@$�]Y��@&Ea�WD�@'�}��`@)?���@*��;>Af@+�B�1&A@-y"�C��@/ �F�y�@0H$;�1@1�k��@1���@2�W��� @3����@4nbP�v�@5PW�ҋ�@67�n�@7"Փ��@8��3.�@9	���@:q��²@;���=@<��@=��;�@>-��_@?G|���@@3[�mK�@@�i䄳�@A\��T��@A�q1@B�|&O@C3���M@C��6mt@D\ɩ@E)�s��l@E�Z��+	@F��h�у        ?�x�F�{?[�,7�}?;p%7?����|?��d&hi�?�õ#,9?�5@ �-?�eΊ�Q?�Mo�n��?�1y�׹�?��֔��?�BP[P�p?ඌrr� ?�;��CG ?�?O9�?��RO�\?������7?��'��?�B��7 ?����0?�>o�k@�5?�B�@���ϴ�@�d:H�0@
�'��8'@n0X\2�@/�D1@Y!2m.�@�E��!@Kr����@3,� �@0Y�I~@ �ᙦ�K@"��R]@$��p��@&�A���@)����@+}+�P�	@.$Ҭ�J@0}2V��@1�U�z$�@3�<e�WN@5KX��>@7*h�jQ@8�>�懷@:�2�/�3@=��t�%@?D��׬a@@�e1ֈR@B!)F?D@CGw�g@D����ŭ@F���b2@Gy�آ@IpR|@J����c@LJ��@N
��� @O�
��G�@P��W�@Q��_���@R�S ?"@T�� z�        ?@��c�t?u#Z�=8�?����O�?�9j��#?��%u��?ǩ^(��?��i�?ٱ0��?�cĩ�i}?�.|��?���_��?��'&_"]?���X���?��'m�4�?��ܥ�(@��d��U@0����@	���@$A:�!@iyj���@�2B�@�����@��r��@��	�@ ��v��F@"�� �e@$�1Ui��@'g~�ZC_@*�q�+7@,�����@/臒��@1���%�@3S�N\(@50~� �z@7,��+I�@9J�K��&@;�Z����@=����=@@>�B\��@A����H^@C�eV�/@D�A�Kր@F*�tq@G�gH^@I��U�@K��Gty@M��/�{@O�]�(6�@P�5H!�@R"<orU�@S]�=i߳@T��-@V�����@Wu�1͚�@X�Q��@�@Z�!ǌ��@\5Z>�=@]��kq�@_Ɔxޞ�@`�D���@a��RTA@b�z��@c�sA
�        ?�^�Vy@>��,/@"��<|��@7����
@G�$~�@R�s�P�R@[�F���@c/���7@i)�5@o��a}��@sp���@wQ�{�a@{w~X�e/@�~��@�DJ|�/�@��1?�>@�Da|O6�@��zά3�@��a��x@��C��_�@�@?���@��;R|a�@�W���j�@���ki�@�������@�K8�W�@�&q���@��C�Ao@��p���@�4ѭ#�@�#�8�I@��<��@���@�/@�ձ��@�'Y�2@��Yd�@��� �@�+�a�N@�?�0C �@�Xܔ���@�wC�WP�@��Kv�w�@��9��
R@��W��@�����>@����8J<@�V� ��@����,�@��
���@�Sk�g �@���c�@���U���@�s;W���@�0��iC@����*@��A�K=@��N�b��@�T5�%�@�(���D@�U2�@����(�@��t�̘ @����#��        ?7×���?sLu[�??���w�vU?�ԕRA?����΂?�bC�5?��S�v(G?׵9T�>?ߪphL�?�^u�b<�?�vGpG?�:�z�;?�e��?�3�ˆ�?��̵��H?���6�K@W3a{i@_��NA@�/GT+R@��ɺ�z@Sv��j@O6v�Pp@�?���@d�n�$'@$�d�U.@�eKE&v@�:ζ@�|�o�g@;�*��@5��
Z�@ >_��s@!mz����@"�M���t@#�\B\@%B*v���@&�̈2��@(B�}Ә@)��bO��@+��_�@,��<RJ@.D��9�@/�>�cI@0��9�@1��a�@2��r�@3��q��@4��>��@5�)��G�@6�����@7��:�'4@8���4��@:�F5@;P�Ss�@<��e�R@=��Y%�@?Y�Z�@@8=͑@"@@�=�V��@A��_�Z
@BR�f�@C܌��~@CϤ?���@D��6�h�        ?K�8�e?M�#�7<�?rQ�-�x?�J�X:?���^�r�?������?��T5�M|?��+��G�?���,�?�K�;\b�?��]�O)?�T��PA�?�c:l	�;?����?�g�h�Fo?�-��J��?�w5���?�)�,�q?��E�$q�?����M�?�y�>Ư�?�bY;Hy@ ����@U/>�Pu@�n$�@	�ۡs@��g�$�@#lL���@8V�9l�@�w��|I@��	�@�����@��Ru�D@ ��P��@!��V�U_@#����~@&CR��@(XA+q�*@*�d�z@-�5.f)@0<��h�@1ͫ��@3|����@5I6�>$@76�ם��@9E�H,�D@;x��rT@=�-�±E@@'@�#d@Az�Ndj�@B� j��@DaT؅��@E�O�u�@G�o�R��@Ii!D�#�@KH���a�@MB��j@OY8i#k5@P�U���]@Q�=J#�@S'��pL@Tq�Ro�@U�Q�        ?�KW�n?AZ�����?c�-��W?|#ʋ��?�	���0L?�Q�T���?�b�T�^T?���^Y?�ڐ�Qť?�g����?ǲ�uv?ϋz*4R�?Ԝ.lA�^?ڃ��_7�?�ӑ&���?�?�ª?�.b�Ӆ?����:�?���+q?��S!�?�FE�jk�@ ���\D@��¶�@0sG4�@
�g�*�@4�� ��@����@�Y��٠@_o�/@~)��%�@�]�@ �ҰC��@"��T,,�@%��Me@'p�6%@*�B9m3@,���%��@/����d@1��(�@3S�����@5:J@�zc@7FB��@9y��y��@;֫�4zX@>_�D�:�@@�8|F�@A���N3�@C�ݣ�@E3R�sS@F�U�WKT@H����Fv@J�3�l�@L� i�f@O*A�ɔ�@P����@R?W�V�@SP��H�?@T�$�Ν@V#r�5<�@W��+�!@Y>�j}Te@Z�)�<�@\��җ7Y        ?���'��?�t�]@���TZ@#��R\�@3�(��A�@@�s��P�@Ij�Zu!�@Q����p�@X)�b��@_C a�+@c��͋�@h�h	��@mZ��9@qD)����@t=�/��o@wyCZ��@z����*@~����@�aڕ�`c@���͠�@��!�Z��@�GG)�S�@��*�@�������@�@�R��@��):��@�`G��-�@��uF�@��S�R¸@����<�t@�������@��N��n�@���A���@�j��#��@���E8 �@���ޢ�@���-�	@�)�<�H�@�t�;-�@��m��@�(��"�z@����e��@�	�h���@����'T@��xۘ1@�Z	�^J@�-��w��@�Ǖ~g�@��2���@��KRG��@����B�@����e�@��ΥU�3@��%<DV@���?��(@���0?nu@��[�'�"@�+�2��@�:PԘ�@�j��[�2@��yys�@�p�L���@��\��F        ?ajn:�X?����Q�&?���ɗ�?�|�%?���I9?��;>T�?�44>։?��>j��H@r�Ay��@�@�㹊@�"��۹@L���x�@ۈ�@;���@s�DtP@!�]�{�@$#E.��L@&����@)�Pۚm�@,ӆ}�O@0
�OvA@1�9���@3�ޥiM@5}	6'�@7=��@9�;�a��@;�z��a~@>��� �@@@�f39�@A�w��@B�� �@D%  �@E�s�\ʿ@F���X��@H{�n@J�.��f@K��C!V�@MF��x��@N��a��7@P\�`��@QC�H!@R0�3�[�@S$F4^*�@T|�í�@UI	��@V&�[�$@W4�}|i@XJ!����@Yf�l>*�@Z��n���@[�a�]�k@\�Bb�G
@^&r�=@_k+o0,T@`\R�y+@a��.`@a�Fs��@bk�O�J@c$u�^�@c���+].@d����t�@ej��@f4�!%,i        ?P�= V�?�է��$?�]��
�?�7��5?ҕ��D>�?ޮ����?�j���?�_�Z�A?���eu?����0�?���}]r�@9��v�@�c�J�@
��6��@��i,�j@��iW�c@J�?C�@��px@� u@sBFZz�@ �%�e��@"��"�^�@$�,��@&���,!�@)f�O8�D@,�V��@.����@0��{@2t���}�@4��	�@5��ŗ�@7��<J7e@9��C^�@;���G:@=� ����@?ʗ����@A�C	�?@B@51�@C�5�IP�@D��ie\@F4�����@G�����@I�;�>@J��T�-@L1x�@"@M�|7��@Okw�ݺ�@P���4@Q`�� @R;>]1h�@S�
�A�@S�����@T�z��N@U�#�pu@V�v]��@W�vߦ��@X�=�'@Y��`�@Z±O�B�@[ަ]��
@]�~g�.@^<2կe@_���N         ?u�]�0ϥ?��Y����?η�t��?�{u"ۅf?���邷@��7��F@D�D=�@[:��"�@�;�K{@ ˞B%=@%���7�@)����;,@.�R��>l@2��($
@5�I�i�@8.��J�Y@;�ۼ�o@? 4��@AV����@CDF�l��@EG���@G`BL�|@I�A��ho@K�L䁚\@N)EL4�@PK��
�@Q�괵�'@R�:�t|�@T-C�h	@U�^ݣ~�@V�Xk��)@Xn�4l@Y�.�F�@[zJOL�U@]�)-@^�'�j{@`02�1��@a�b���@a�����@bָ��L=@cĘ�$�^@d�qL�g�@e�W/B@f�a�W�@g������@h�b"�t�@iص�{L�@j���2@lF����@m="��X�@nmԣ|�@o��F��	@pty�@q(�Xʔ@q��P0)�@rq���@s#��ˣ�@sۑ�:�@t���u��@uXZ��?�@vaL@o�@v毃J8@w�'��T        ?�J��o @0̏,�	@Q�fZv�h@g��o���@w^�e��@����,:a@�z���&@��k+�ú@�;�(��@�U�@�i 1U�3@����F@���7Ce_@�͡��@@�w�Y�i@�EN�-�@�59=x�e@�F�޽��@�<��`�@��\]S�@à`WF @�j�J��@�El<QH�@�0�Ea&@�,>�9�@�8U�E�@�T�,�f@���0W�/@�޼h@����"@�2�\���@�h���fc@֦����@���#A8@�:ު��@ڑ�#b@��H��@�U�d�@�YI�@�՟��O@���}��@���6}@�a�~M�@�+��'q@��"JĘ@����T0�@���J@�{쁳zR@�[��2
@�@�ƙt�@�+u��@�&4�<y@�7�)%@�	%p��@��F�qp@�"�L��@�5����V@�("��Fm@���j@�M��8�@��i�V�s@�~��rV@��B��        ?D�
�_��?~�#�z�?�gC�Kj�?�D���?���e�6?��-��h�?Ӂ���?�q��%L?�G�g�&?�nH
���?�"���\?�;�'U�?�\|*^�$?�M��Ň)?�sG'�<?�͊遪
?�^Q	��@���վ;@���׊�@�g{TO@��O�@
S��S@�"�̙@j��G(@p +X�@|U�G@�,�t�@Я�@�����@�T����@ywSi�@C�5�`@C�j�@ ��+��@!��F�8@"��#@##�T���@$@u�Px3@%fc��My@&�cc��@'�:��@)�ht�,@*V�)�ȝ@+���lu@-1pQc�@.b�``�@/�^���@0�	u*�@1[�]0Y@2�����@2ᇡ�@3�'RZ�@4v�(�I@5F�ݍ[�@6�~"n@6��ݺ�@7�h
{N@8��ʽ%@9�j�ҋ@:m��m�@;U4��A-@<@u�^�@=/��ۂ�        ?_[��#�?B�a���?c�����?yge�F�?��[��?�N�d��?�b�ν��?�[���A?�Ҷ�F�?���̹�?�`��]W?�
0-f�?É�v�?�s����(?�l祩	�?��
v[�?�3�]�?�q9�1h2?�Z�]{�?�Lז`?�w���?���?�Y�[�?��u��O?������?�����e@_;{��@5<T�^@�)0���@�8K�s@����r@_��M�u@V�b�@�ء$
@j�
���@ ��3�@#$�5��@%�����	@(� �v&@+�͵��@/a�K_Ri@1�'xvC@3ȼ��@6"pXy@8�Ä�@;�d��mt@>���@@�pY�C@B��%��v@D�b�]=}@F�4<kz�@I�o���@K��Ϭ�
@N*��	e�@P<I�{�@RZ���@S���3@U]x��$y@W6��En�@Y.�tiC�@[G9�K�@]�3!H�@_���y<        ?%c��\e�?]*%R��?|~��5�d?�0O �q�?��pwq?���?���@Z4?�`�R�?���a?���d,<Z?��j�c��?Ϩk��jh?�
t���~?ֱ"#N%?��;��?ߙIߝ��?ₓ�Nu�?嚲�??�!j���V?�#c��A?�֦����?�eه�g?�Eo���?�{wE��?�؀L@ ���\�@��|�� @�	��!@��v;!@
�;�E��@�@���7@��GY@x�V�e@}�m�@������@
�3��y@��cy�@T�,;�@ �,��q@"7E���@#��|p�@%�����@'���lP�@)�� N_�@+��z�@.:�h�@0[I%EV@1���s(>@3j��1�@4�����@6#��v�@7�-϶�W@9�ܴ�=@;v9� Y�@=r}��tS@?���^�d@@��@�Ⱦ@Bƪ�5u@CJB�Q k@D��-l@E�K�,$@Gj��ۜ�@H�/��        ?��'D�?�L����@���@/t�H�@<����/�@F�����@P+Z�%@U�zH���@[�VG@aCH���@d�X�]�M@h��_���@l�=:y��@p�F*�Oo@r��Ra�@uy�#?O�@x�#f�@z�F��X#@}��8�@�}�޲8@�$�6W�\@���XK�@��A�k	@�����@�����9@��2}���@��0n㶥@����Q@�?4Yz�I@�ysY?;�@����9�@�#
�_@�|Xލ8�@��:ϭ@�y ����@��f�o@��-���@�z���@�%o�%�@�twJ�@�F�`�@��iu�@�nna�@�0^m��C@�KS�ʵ@�n'p>"@���
���@�����>@����Bj@�E��jO@��1Ӑ�@�����`@�[���@��X�JuL@�{�c$ps@�2�eK@����@��?*�:@�j�<rx�@�/ӥ֋E@��>ڐb@���9\��@��?�Qo        ?f���l2?�3�����?��Sr�?��mD��?��evF~?��kx���?�'ġ��0?�R�"fϸ?�b�O�@�R����@�
��@̽��l@zPQ�@=�f�@/�ۭ.�@Ng-1ٽ@�8�dT�@ o���n@!����@#���f�/@%�F�*@'���Xd�@)��%��@,	.'D�@.J_ ��@0N���o�@1��3GT@2��t)/@3�0�$��@5K��Q�@6�� ��@8�D���@9l96]�@:♨x�^@<e�4��@=�$�ʴ�@?��{�B�@@��v���@A6��7@Bbח�UY@CLv%�S	@D;��Z�]@E0��F�[@F*��v>@G)��~&�@H-�1��B@I64���@JC3%�R@KTp���@Li��ظ0@M���F�@N��'ۖ@O�k`�F�@Pr.�Qt@Q��҅�@Q��v�@R1�L��@Rɺg}�@Sc.m��@S��K��q@T�|��@U7�$��i@U�g\�SS        ?G��h;/?H�6�1�?i�����?�!����?��)����?�c�A��k?���1.2g?���dKU~?�Џ,ɼ�?�:���?����� ?£=�W?�(K
��?̅�}ʜ�?�rw-�?�9�Wr�?ٴҢ��?� ��/�?�58�?�D�b�U?� v�M�?�p��f��?򌉊t9?���CsX?�r���2q?���	`"v@(�'��@�jG1G7@�
tH#@	�)�q>�@R0���l@���0A@���P8�@[��K{@�x0�p�@_��\��@cG��f@ T8����@" �Xz8@$� ��@&�&���@(T�� Ö@*��`f>�@-U�׻�m@0����d@1��i~�:@3'(di+�@4܄?�(@6�"�w�
@8�>.�"�@:� ��7(@<�"'���@?7�	��Q@@�
��ۑ@B&�X �@C�0z��6@D��dOz�@F���*_<@H+%â�t@I���sַ@K�jJ��b@M��7?��@O�
�d�y        ?F���~\?x���[�?�ʹ�A�?���a���?���C�4�?Ƿp�#�?���^��v?��Ȭ�gr?�|r�:<8?� Tb�ό?�S�<9e�?���ϲf?�;��V?��V�W�?���F�G?���d�0_@���{�>@���x@��~��@	��WM�@�����@榑�I�@��3��@���o�@���x�@�*���@Q��ؒ"@ݴ��}�@�9��y�@!@jި�C@"ΎRM�R@$w`�0u�@&<M��<"@(�&�{J@* zf�բ@,B���:@.�Iު�@0w�����@1�٬��@3��.-@4�,�"_@6H��'�@7��Ȓ4@9L�ժ}u@;��jA�@<�}l%��@>�)��I@@y��Em@A��d�P@B��u5�@C�?3�-�@E�أ��@Fl���@G�yLR[@I3d��@J���@L5k	c�a@M̀�|�a@Ou	f�(@P��S�@Qy�Kq@Rd�1vc	@SXG#�        ?�a ���@-����@*���t@@o��ק�@O7XK�;�@Yg���@b��lV �@i��Q���@p��*��@uQ�t�N@z7�ҰF@����@��Ouw�F@����m�2@�򦾤�@�c|W�@����)@��{���@��>ɂ��@����ʌ@��pp8J@�\�|]�@���OG�@�Ƃ��/@�����@����2@�a����@���~�@�$D�M�4@��^����@�u��6/@�� g"�@�-4Q� �@��˧�^@�{�o@�������@������6@�w��#3Z@�oB��x�@�nP����@�tv�;�$@��z��|�@��/N��@��n����@��G�'�@��a���@�$2T<�@�W,��@��.�@����d�P@���@�9@�.�A"@��H��@���O@�-��2@���6��@Đ[Q�`�@�E�P� U@��\ݍ�!@Ʒ�m���@�t�����@�4KiC�;@��Y��F�        ?2nY�7f�?j�4j�G<?�DP9T�%?�VK?,>�?�X���0�?�Z'����?��x@X0�?�s
$��y?�L�,���?��V��g?��a�Is?�����?�y%N?��g��В?����	?�C�O
�?�2���y/?�S��w
�?��M�Ŕ@88mQU@�܎���@�e�&Z/@���@	<�@�U�@���1�`@���F@K�:��<@�5qb�@�z�H"@��P�B@���0@�ihp��@t�+u�@>�R4�@�y*�@5��Mu@ �hLb�@!��n��k@"�p�"p@#���(�@%��y�@&Y"L� @'�q���@(��wF�@*\���B@+����@-B�VeMt@.�.$"o+@0+=.{�@0�U�G*@1�ɍFe�@2���$�@3pV
$\@4a�\�Έ@5H�@q�p@65*qAT�@7&Âp'@8�vTY�@9�6aj�@:Sɛ��@;"QHnw@<.�r��@=A ~��v        ?�g`�K�?A���� ?e! �ְ
?}ouB�B?�Ȫ��|?�"�T��L?�p%AD,?�v�/�'?��:`?�w�Et�L?�CӸm��?Ȯ����?�!NP$3�?�c�N�=_?���ф ?�:�8�D�?�QT�j�?�]T��\M?�Y?�'?�m��p��?������?�)�f?��4���?��ev�s�@ ���t�@4b.R��@)�1]�@	"�>�@���0�N@,��0�V@>�3G.4@�k��g�@��ƶ�@�P'��@�ڦ�O3@�|$��@!�=`�$@#p�oR�l@%n���@'��,�۝@)�#�v2@,X�>��@.�	T[m�@0��r�M@2i��-@@4�\��@5��t>g@7�/8�,�@9z�\7@;�ꦖ^.@=�w-�A�@?�`Q,�@A5�&���@B~���@C�L����@EE;-���@FŐ��	4@HZP9�.@JIzS�@K�->��@M�z�J�@O�
��<@P�`�_�'        ?=� �}?D�Q���H?e�ɍپ�?|[AG2?�v��YJ�?�RǇ,��?�����?�#���?���+Hy?��U�yk?�d�G�=>?�ؚ�?ʻ��a�?�Ź���?���f�ʏ?ٵ]"�?�toU���?��|�Xq?�t4c��?�9A��A?�t����?�{�\�"?��� ���?���p��?�Q�iF�@*��L@���TQ@#�a�-@�C5x8@���1@�S�?��@b�ǂ��@���J@�Q@3���7@ ]@h��@"Jr���@$c�=�aK@&�mu�\_@)&xIC�@+��[�FM@.���c>@0�b�ý@2��֧��@4f��^��@6T��L��@8dW�v@:����֙@<�U���@?mɁ��@A	�\T�
@Bp���@C�$����@E$}���@G'��v#@H�-�f�	@J����m�@L��%[�;@N�h�Y��@Pn_l��@Q�����@R����@S���[�        ?�ɡ#?�9�~<�@x�FY܀@))b�_�@'���n�V@4��@>%|��@E��@K�(��3@Q�M�ޟ@V�\�@Z�c�26�@_��I5�M@b�����Y@e���4k�@hɠ�a� @l%��!S�@o�
����@q�<T�_�@s�K�)4@u��o4 @x!���� @z�#��@|����@��QI�@�1��h��@�������@�+�Ήo�@�Ş�[M,@�s8q��j@�5��'�n@�ǚ�bP@���cg�r@�T�Ӷ7@��q��@��4��v@��c~��@�B�`W@�U�c_�o@��>n�e�@�
+�9ه@�x����/@��X�e��@�}����A@��ꠈ@��+�[�@��̒P�:@��(`"�@�y�N��>@�e��?�@�W��@�O����@�M:i��[@�P�a�k<@�Y�e+@�i��/�@�~.���8@��Tkt �@����ʮ@��_���@���=��@�"�/Ĥ:@��wXX;{        ?X1xTD�s?��M-BU7?�F�QD?������?��ͻ<Y?�e�l�?ꗷg�?򭼋)�N?��N(�r?��r-�� @�Tf�6@+�A,`@��a��@�ǒDz@����@}�Vw@�c)N��@�s��J4@�#Ǎ�@!���3W@#��D@:@%\����@'H��Km@)F���;@+X�u�fy@-��9Q}@/��e�*�@1� -�@2>��R�@3�=�	@4�����@6+\� �@7��,K�@9���z�@:����@<ڃ�h@=������@?]�z���@@�EG��@Ai���[ @BP�r�@C<^#3u!@D.k���@E&/08��@F#�&,1;@G&�qM�@H/Cq�:B@I=�(��@JQ�-�5M@KkCe/^�@L��*�n�@M��O�j.@NܚdW=@Pv\	)�@P����@QC�k�i@Q� K�.@R�*�΋w@S9جY@S��R�|�@T�ӹ���@UQ�h]+�@VfrƋ        ? 7�(��?Ecw!�f�?m�|y��\?�H!�� !?�G��C0�?�_��?Z�?���QB>�?���'��1?��J,�}O?��
���#?��-�Q�?���KM�?܃r�MKf?�w\�Ns?�'wM��?�bo��l?�:w��6?��;P�(?�A\߬�?����c�?���39,C@ �x&�@*�bFɱ@a�a�r@	8HQ���@���u�{@X�*÷�@�����@��f�hr@��gk�@i)��K�@����'@ �o�N!@"_��!Ѭ@$i�UR{@&�1O��@)d��@+�Cҟ�@.m#�g�@0�����@2[1滁@4��B<@5�P16/J@8�u�W@:*��% @<y��'��@>�'����@@�����@B/D$�@C�8 @E@r�bB@F����@H����My@J��	�@L�d9���@N�����\@Pk�1�h@Q��D�>@R��g��	@TO�5P�@Ufu��e�@V�ů�k�@XC�(J�        ?o�-��"-?����B��?�:C��6�?�Y_���?���_;?�L�y2��@Z�Ga�@#^B�@h&�$%@�J����@ ��^l]�@$�*� 7�@(��U�v@-u��@1F��(@44ɧ�@6��O�A@: ���|�@=���O@@��]��@B����6�@D��:��Y@F�ɤA<�@I���@K��=Uɶ@N6�:��@P}�eq�t@Q��k@S}%J��@U�1@V���i|E@X�ڌd�@Zt2J�F@\h���u�@^t-�@`KjH��@ah¤�h@b�K-�@c�<`kS�@e
�X�ވ@fZ(����@g���>N	@i�"��S@j��ZT-�@lnu�@m��O��@oLyשH�@p|�_��@qZǻ2�@r?�^�c�@s+�j�A$@t"���`@u����,@v�T�@w%��!��@x7(��.�@yP:?$�'@zq t�@{�ǵ�P�@|�d�3�.@~��$,c@C�-�.~@�F#��'�        ?�R%�r�@V�8E�N@4pn���@J���'�`@Z���&8S@f�וn�@q4�'p@w�I��؋@ƒl�bY@�V.��GL@�Gux�5G@��ܠg�K@�M�_g��@�|���F@��C_ӎ@��h�q��@�-�
�7*@�3U����@�Q�Q��S@������@������O@�<�,Q(@��eN�@�(t�9@���R`��@��[��@�Z�oiV@�ݨW}�B@�o��j'@�VM��T@��.�#�@��d���@�X��~��@���7:�@���S�@�`^n�@�+���@�B���ʅ@�cE(��
@ƍ,C' �@���r��X@����ɏ@�D���Q@˕{<�l�@��3ܦw@�T�����@���ɝ`@Н�N�R	@�_4$O�9@�%��s�@���H�G�@��,'�N�@Ԛ�:%�@�v���@�Y6!�w@�A�Y�]n@�0 �@�$��,,�@��}��c@� ��� @�(%Y�@�5�`��@�J vC��        ?Z1,ТT�?���K�?��|쨥?�G���, ?���ے"?��to�?�/f s?�:~;M*�@�Իa[�@W1��@����@/�{�j@�r�,�Q@�TB���@�Y�U@ ���c�@#P�*�"@%�-A�3)@(Y�P�@+N��/@-�(Ǽw�@0q	r �@1��>R�@3����Ke@5G��i&w@7}6�$�@8�d�"�@:�I��@<�:�3�P@>�O��`�@@R�>���@Aa����a@Bx�F�8@C�8ڦ�@D���x��@E�(C���@G(���n�@Hi���6�@I�����@K4i0��@La�!���@M��i%K@O3j��@�@PU��2@QE4�A@Q�A{
~�@R�)�/�@Ssh���@TGs�T@U *W"�d@U�i�
�M@V�̅�X@W�J���O@X�֙C�@Y�]�{d�@Z����h@[����k@\�M�@]��߄]�@^�.���,@_�?y�;@`h����@`�<�*S}        ?7�n��2�?y��;�?�}R� q�?���0{S?¾�f�ǽ?Ϛn�r�h?���М#?��w3�!�?��s�!�?�M2'/I?�K�=��?�	���?��<��@ ���us@�N�iW�@3|�g]�@
�"i�X(@�gh@�e��*�@]h�!o@"�2C��@-Z�xT@�iϑ��@ � �^�@"��0q�;@$��G�@'�k��@)�e(Rv@,m[�~<@/k��_�@1R���0@3G�@4�$"u�@6�P���@9�_j�n@;X��E��@=�U��R<@@/��S/@A�~Z�@CP��@D�� Ѹ@F4]�^��@G��ٖ�7@I���{'Y@K�����@M��@N.@O����@P��/��@R#���J@SWw��
5@T�m��H@U��Sl@WA�(�2@X�a�x�b@Z _&�@[��k\��@]5+<E�@^�[]A@`@Њz @a���z@b}�h��@b�Fi#@c�8�o+�        ?:zg�U�?ph~�V�P?�I[r?�?��ǝ?�R�� �?���[R�?΢��5$�?���@c?�e��j?�03a�y?��6�x�?��K"�$s?���~��?���c9�&?�w֚G^�?�̛�xwc@I����@�(����@ː��~�@	�ί^r@`�bͽj@�R��v@�H��PM@�7��Z�@#sQE%@��7���@r}/@E�@h�ay�A@!K��K�@# (T�N�@$���e�@&������@(�v.Bn8@+H"�r@-z��e�@0[��"g@1]��@2κۉ�@4X��'�@5�,u�z�@7���<@9�v��,�@;� �h@=�����~@?�-�x��@AtVt�6@B[�Ut�@C���u�@E���9A@F�����@H����H@I����j�@K�_=%/@MWXa�E�@OF�򜋁@P�6�f7�@Q��0�;.@R۬�k��@Tc��@UJ����|@V����@W��ǌ�q@Yi<�68        ?Ѩ�S\�@o���_J@1u,
:�@F�N���@V�����d@b�|Q�@lM
�!��@s��'���@z#���@��9<�M@��D�8��@��E���@��3�w�@�z�R��"@�;.�gx�@�*)w��@�Gw��{�@����&��@��!�K"T@�Y��A�@�D*Xr��@�EL>?��@�\���@���<R��@����:�h@�(Ϥ��@��3qp�`@�̹��#@�\+Ա��@��L��g@�/eF�@���	�lL@��>d/�@��i�o��@�T��`V@������-@�Jk��*@�|R�E�@�X�&�@�:�z�p@�"����@�ū[$T@����@�����^�@����G��@���i�*@�$A&~@���\m@�5W��0�@�TR�q)w@�y��F@Φ_s�@�ل��_�@Љ�r�@�*q�@�������@�t�ߢt\@�o��X8@��gd�N�@�~�ۜ<�@�3�6�A�@��e��ͤ@֨�O��        ?6�<L���?n�/��`?�J�XY&?�x]�ۀ?���fHM�?�b�,|�?�$�<H(?��[�?������?�zB�H��?���F���?�����?�8t�@�_?�4:���?�m���y?������?��1�X��@ �T��� @ܚO�U�@S��#N@f\�ٓi@	؅avʿ@h�fr�@�]	��@�c��t@f���~�@��(��W@~xH�%*@!�sQ_7@�4���@�p���@hKK��@I��Z�F@ e���@!�SS�V@"%�cXz�@#5]ug�f@$L��y
r@%k�W��@&��=��m@'��aj4;@(����>@*1q)|��@+u��Y@,���!u�@.���>�@/jL(�q@0d�
�e@17�F� @1��y�@2���Ls@3HA|J`@4w{3�@4��>@b�@5���ɔ�@6s�<I"@7L&IB�@8+f�v�@9�moL�@9����@:�/�BA@;�2'\�@<ݚ��        >܊�ގ��?�`�(?Bk
��R?ZC���M�?l
՞!Z?yI�Ï�r?�������?�8ai�?���`��?��?3Q?�A˞��?�W4�X4?�e9���)?��<�a�?��J����?�3I��?�}��%��?Ҳ�%��?�xv߈s�?�-V�$�M?����0��?��S<�?�	�#8$?��us�V?�ǰ�o
?�����g$?���g��?�\�[��@KQJ��@<�|=�c@�rnP�@9�3Vר@+8`DD@s�>c�g@�x6nS@� ����@��][@?���a@ �F�S�q@#.u�9�@%A����@'�Z&W@*W�����@-;�c�Hs@00/�@1��\��@3��w�]�@5�����@7泸h�f@:;LJ~�_@<��ﱳ�@?o�0$,@A*i�Z@B�V�[�H@D]�(��@F ��Ę@H ����@I��A��@L��8)�@NU| u=Z@PW�6t{n@Q�q�H@R�;���        ?/{���_�?c����_?�Y���?��d�S�?��M
�+?�����?�=��a��?�����?хqtM�?�Ť�O�?���k�n?��͇�j?�����?��g.�?�l�5?���y9A&?������?�?v>k��?��U�4X?���}\��@-G,h�@������@J X��:@
7pp��@h9+���@p��%�@T`  @_�P��@��TH@�m��@�L�w�E@O�g1o@ �]׳�@":��K�z@#�X�T�@%�B+�.@'��K��@)�Z%Ys�@+���`@.S��H��@0i���P4@1�Í��@3&�fۿ�@4����i@6;�AV�;@7�q���Q@9�{���@;���X�[@=�ƺީd@?��	'�@@���B�@B��K�b@CZn�Cb�@D�2��@F:�養@G�^�v&@I:D;�8@J�2T�@Lg�$��h@N3p�#?)@P
�5{��@Qq�J[@Ry��d        ?��|����?�Ts��b;@��"�m@�7���G@(�񲊳�@5%?q�^@@&��Z�r@F�Ȗ�@N��ԙ%�@S�q���@X�I'��@^L���@b&�^��w@eg�g$@h� >&�@l�6��Ç@pS?
���@rqv�a$�@t��^0�@w
V���@y�� ��,@|C+���@~�>��@���9�<%@�N��i�@�ر�6@W@�rW�E��@�4h
{9@�֑0d@����V��@�}�A�Rb@�j���\�@�4�u�S�@�<<j���@�Lq$,��@�e����@��!|��@��L���@���|�Aj@���}@�Z��/�@����Ձ&@���\�;@�K�o�m@���U���@���"@��[���@�y�y�D�@�7�r���@�����@��G�R/@��A�>��@�W�!ws@�+�|�.�@���ϔ@����@���c���@���/���@���@^7@��˟vu@���%K�j@���{Op@���މ�q        ?c���Ob?�	qp��;?��Y���?̡-�P�?۫���u�?滸�D�A?�̟���N?��Y�z?�>v���@&��A-@ZT�Tc@�իj�@o�r_No@o����@�5���@�*��@�kK>�@����u�@ �C"�UL@"k[��0@$����9@%���"@'mi�bk @)):;��T@*���$�@,�����@.�:�1@0.ܬq��@15� �Z@2 -�s�@3��N@3�x��|�@4����.@6Ap���@7�=H�X@80��BUf@9W�:��@:�W�p,@;֑=�1@=1��jv2@>������@@�&�x]@@׻f��@A�	|��@B|����@CX�g�8@@D:j���@E ���v�@F���ZV@F���q�@G�.3h�@H�e��Q@I⦢�=�@J���[��@K����M�@L�@�99�@M�|_4�m@N�M� ��@O�`�iv�@P�4Foȷ@Q�C@Q�"�@RM� �V        ?�'�b2�?N
ˀ�p�?s�Uz��?��aT(?��405r+?���"3�?�����?�gA=�[�?���q���?�n@�mB�?т�3�̿?�ܫ�"�?�ը|@r�?�@�@�W?�{鱫?�%�����?�L�	�S�?����L?�?�`�ve?����?��?��+&��
?������!@ T,�~�@�66��@�'�/�@�3��� @
�N�@���~@�|�Ջh@��BN�@ƴ;H@�
���@s,d�@�Pr@���阄@ �![��@"�5�$f@$Y�� �@&<.hd�@(B�d@*m,�/�@,����
�@/;���E@0��Û��@2\����G@3ߏ�n{@5{�a]u�@72��v@9�v�@:����Lq@<��7/X�@?,m�Z$@@����@A�r�t��@C=�.+�@D��u3��@FU���8@G�����@I!�PܳI@J͒W��P@L�	c"@Nf�E��@P*���X�        ?w%�e�?��Z7�m?���?�h@M'?�&C���?�ms���?��K�y$@:<ZJ��@�d��@�\��@�H7^t@4�F�8>@А��]@��.{*�@���Ie�@.9�)�@!?���u�@"���"ĵ@$�=-K��@&�5mcM@(�h�6�g@*˹b��@-
(1x�@/TB�n@0㪵Q��@2./\4��@3����S�@4�?S�y�@6�&��@8�/"�@9׽���v@;�o�+E�@=��V�>*@?�^U-@A ;�W/�@B4��e�@C~�"���@D��ƫ~�@F[��6�o@G�M�4�@I�EC��@Ke���l@ME����M@O=:�>@P�.2A��@Q�h�U�}@R�]]���@T-n��h@U: S%��@V|��z@W�&�ڤ�@Y'�_��]@Z����@\N���@]�G��H�@_�1x�@`P��A��@a �-
�6@a��W;w@bѐ� 8@c�
�;�@d���:*@e�~��a        ?�P��ߗ@%�d4z�@EJ�Y�6@ZJ͓��@h��.S>�@t�NQ@}���-@������@�?��@�K𶤮9@�ߩ ]�@�Fچ���@��m�!;�@��᝷rw@�����'@���7Y��@��no��t@��ўljy@�ֻ���J@��HƸEE@�(����@�^{I"�@���E@��� (�V@��o@�@�@��f@�l�Hi�@��ɢ�@��ȉ��@�El�-�@�@r�6,�@�����>�@�����>@��� P@�u��%�@�n���l�@�*���Q	@��f\�Y@��ޙ@��@Ü��H��@ă�<�g@�uG_̱�@�oܲH��@�r��G�@�|]��?�@Ɍ���Q-@ʣ8�  �@˿janl@��QD@��TQ��@�3L6/@�1����X@�˒��b�@�gL%"�@��wfS@ң'``cp@�B��M�@��l�G�@Ԅ�p��l@�&[}*�"@��PB��	@�jW�F@�C��Z        ?gl�h.�?�F	u�?����O&?���axt?�e��`0�?�m Y��?��� ���?�H��fy�@�s΢}@	d�6�x;@׸,�D@~*۰m"@g/8��@��aAAK@ �[2��@"�#{��@%%o�8�B@'��we@*�$��^�@-�SDg�@0��~�A�@2;�Wn+�@3���P6�@5�.�}lo@7ē6V�0@9� ��2�@;��h��@>(f�@@ n�K��@AI�X�G@B}l0�T@C�7"C@EuĖ�@FVI�m�;@G��/ �e@I���@J��� ��@L	 ��ޝ@M�~4u�j@O ��B�@P]m~��!@Q/�o@R��i@R�P"���@S�3��@T�:�
�@U�g�Z)@V���uF@W�0<7�@X|��Ƽ@Y}��ܚ�@Z�ix�e@[�f��R7@\��vd��@]���j��@^�	���	@_�x�?	�@`�{Uq@a�s/@a�X����@bOn0���@b�%�ٞa@c�	t�(        ?(腼��?g]�_}ݖ?���+��?�vGr-?���NPQq?�:�q�/�?���>���?�p����?ڜ=����?�yy�.�?�9��J�?뎎����?�;�*�?��W���?��M�S?�nf���c?���U�@���F@�M�;��@$*��?�@	�ô�{�@�����/@�HܗU@�q/)O�@��	�@������@�3�uw@��+,!@Zb����@�~�k�r@ �^Ʒ;�@"3�`�g�@#��1�m%@%N�+S*t@' ��q�;@(��|��D@*�Ʋ֦@,����@.��-^u@0������@1��C#�@3
$��@4c�:�@5�v�|�@7O�b�W�@8�Ŕ�@:���;��@<N{3�@>#���g�@@�-��@A	��#Q@B�Nq�@C2Jzh�@DYǟ�b�@E��r��@F�|EZ{�@H$�˺�@I������@J�b��%@Lz[�m�@@N���@O����@P�楹4�        ?�9��`uw?�v��v?�MĖ�/?��
.�i�@�v�I"�@������@��@�d0@&^� vb�@-������@3J��H�@8Ҹ��@=Ll]��@Az��RO@D��m�N@G��Ե�@K*EC���@NƬ�j�@QI��@SE��@UY�pԐ%@W�y�"�@Y�c}i1~@\�*T��@^��aD��@`����}t@a���k��@c8���=@d�]��v@f.�Ve-@g��.atz@i&/qQ��@j�,�@lk�p:M�@n#>N�y�@o�^yNY�@p�-.�V@q�J7+QE@r�7�8��@s�&��v@t�F�W�u@u�����H@w置H�@x(�s*
 @yU�i��@z�v��+@{ʁN��@}�2>�{@~d�v>�@���QQ@��^���@�I��ɣQ@�g�.�@��^w�*�@����7�@�Y�R|I�@�*��a��@� �P.C@���^`�@��O3��8@���s��c@����$�@����}Y@�~��4PD        ?����@'�]�V!p@I���?R�@`�T!d�y@p��'��@|�㨾�H@�T��E�@�x�6[1�@�5|(ήc@�p�J��6@�1��$f�@��}<��@�&��`�@���NIx@�,���o@�������@�W�}��@�!C���k@��-��@��2���@�!Gc���@��}��{~@�~}bR0@�D³:�@@�KŮ�@�b�hO@���`XT�@������9@��:�G#@�,����@�2+,O#@�R��+��@�z���@ժi26@��f�%�@� d���@�f�)�@ڴ�t-�W@�	��w@�f�":f@���Y�@�v���q@��,J��T@ᒩ�@r�@�S�@|�G@��)��@���R1#c@�c\�}�@�~�o|�@�R�,x@�*�����@�X?�O�@����@���뼓@ꯧ�'��@�7��@�{i`Q�@�zp_��@�p��,�@�iU��@�3��F@�\��`@�5c�Y��        ?@��ʛi�?zM�G�?��e�?� ����T?�	G��Y?�)��(��?تZ��Q?�}�rsΛ?狝~�8�?�~n{�?�+j��3j?��:��+?�_�e�@ � ��^�@� C���@��!Q$@
(¹Rh4@��	L[�@��x�=\@ֆH��Z@l��:@RNOѡn@�����b@X���A@1�τO@ �q�\�@"yr��Va@$aN=@%��څc�@'y��^/�@)O�]@�@+<e���!@-?��p��@/Z1�A@@0�� ��@1�)�\s)@3�u)�0@4TB�Ú�@5��H@6驻�S@8D.����@9���!@;z*U��@<�RU��@>�e:@?�@c�/�@@�s�U��@As�Z}@BL��:*6@C+�CD@D{9C�@D��y~@E�g��Wd@F�䤧@Gꅇ���@H�����@J pѣ*a@K����@L2ls��.@MU��%�@N���)R�@O�d�O@Pu�.D        ?.�0vmi?o�\6�?�`���fN?�)�}�3�?�F�}�߻?Ȱ�:>?�F�N�	�?�񞿷�J?�<ۮ��?�hg���?�}�J7<�?��V��$?����2Wn?���3�q@q����@r�:>L@(����@�N��@�Njf��@�Ȏ�L@嗴�`�@2�z"�-@!��IŒ�@$�B/KD�@'��|.�@*מ���p@.`����@1{�K=�@31����*@5p�@X��@7�Ύq�@:q|��6@=4���s@@M�lO�@A���+�@CLga�@E߄C��@F��7�S)@H���@J��+@Mȉ�mp@O`C���@P�k"-��@R#����@St��UI�@T�uW�K�@VF���Y@Wɻ� �'@Y^?�Sޠ@[!��@\���@�@^�fc�	@`7�s*9@a29�|�j@b8+#t��@cI)�bjk@de�s�@e���&�@f���Q�@h��@iO���<�@j����G8@l�i�Ld        ?1SE�?R�1֜1?t�/=L�N?���Mt�?�/���dx?��(���?����즱?��Mdd?�a��Ɩ?˼�!b��?�b�� ?������?މ"Z Ǉ?�B���F?����!?��d��?� �C$^?��� %{?�p[n��?��� ���@�.�È�@	E-0�@	ɋ,�Ѱ@���A��@X�h{�@����Q@��WƐ@�~�؁%@r�"C$�@ �0O}�@"�x N!�@$�x@I@'Bw	�!@)ҳTX�t@,�o���=@/��v@1O�I��M@2�8N͋@4�Ϡ�2�@6��k՜�@8�e��J@:�6�ա�@<���7�S@?8te���@@�]:A�@B �<�6�@C|?t�/�@D��Η@Fg�p(;@G�y�B��@I�Y��Z�@KW9�Bm�@M$��`@O����I@P�+n�@Q�ˬh�'@R��e��@S��v>�h@T�&�ޚ@V�V
0p@Wa�Hp�@X�e/K��@Z#Ec        ?��KL�?��aL��@J��N2@0��|�q@A/`��@M<t�p^@Vh�v���@_��&�@e���c�@k���|�@q����UO@u��Ngtk@zP9&�@����@�)]�d|@� �7@��BJ@�ga�r�@���V/@�T�t[@�O�f��b@�i$��@���𵐙@���\�B]@�kX�'g@��i�S�/@�����fV@�D�L"�d@��Z���@�M�:��Z@���@@���m��@�b��8@�9r[�k/@�"���@�?>��M@�U�1I�@�&���c@�?����@�a����@���/��J@���l�}@��}�W(�@�C��P�@������@���d8@�J�CWh@���;I?�@�=]w_p@������4@����˜$@�c�0�c@�3��u+�@��'���@���v�@��㮲��@ƫz�U��@Ǘ���a�@ȉ�+��@Ɂ���@�a#0��@˂�:�n�@̌eU+�        ?;V �e�?t��ir�?��^OC�?�Q*�#/.?�6-Hd�?�2�$��?����Fy�?�_˨3�$?�B�0k��?�b�l��?�iZ�Y��?�f�R��;?���h*��?���'��@�Ͱ|�@�H�ĥ�@����@
��O�TZ@R�x��}@� ��
@��S�(@��G+P@"���@L����@��8�$}@�q�@ T�V&%@!���<f>@#�Q�eW@$���b�@& ֊�@'��86h@)-r��޼@*�J@;C~@,�}��K@.b@Q^��@0�~A�@1{\B�@2)Cy@3m��@4$��3�@59ΐ��@6V�0�u@7{���@8���1@9�SEl�@;��-�r@<V�M���@=��O@>�m�D��@@#�ͫ�@@�骝��@A�	��@@B9n���@B��r�m@C���NV@Dm&�^��@E0�Eȓ@E��@��@F�!��@G��y]�o@Hjm����@IGr�U�        ?# ��(�?d�v: ?��
���?� �����?��_���?�cW��z@?ɋ���?�or[w�?�5B�Ҽ8?����b3�?�)�͍�?�j�-ve�?�3��n��?�@ӏ�?�o�=�!?��ϳ��E@ V�咇�@�p:t�@9KE��@	�I�w�|@�� N�}@�*5�@�/�`F�@QXr ބ@fI�A��@�]R�q$@ L�XIwF@"bd�c�c@$���+�N@'2`x"T@)�K<��@,�{�dŜ@0 ����@1�ʩ��@3��8�[@5�{tb�@859��r@:�f<q�@=F��]@@����@A��ŵXT@C,+�^{@D�����@F�#Z
9c@H��'��@J���R�@L��(�҈@OU���ԩ@P�&D�;�@R7M�fM�@S��:߲�@U��ݿc@V�'�ܣ@X.ܯ���@Y�e�n�@[�&�[�@]w���g�@_ddq9��@`��1�\@a��ߣ��@b�YkL�@c��-S�@e0��==        ?@fE���?tÖ�q�{?�[r�l�?�0!��?�� �v�,?ʜi��?�tNB�@�?��gB�-?�D��L?�!*���?�m
�i(�?�3M���	?�	%��ә?�:�/��b?��7��@`n��f@���r@��UK/@ͭg�@e�n�W�@�<%��@��Q�5@���j]�@i��$v@q2ըL�@�溣q�@�dV�=@ ��se �@"#�|��@#�X�Y@%_�h�Sp@'#z���@)A����@*�$�@-M��K@/K����@0��\�@2.�ǣ�@3X"}��@4�B2�'p@6$ ����@7��:�D@98 @I5�@:�by<�@<�	c-,	@>e��R�@@#�o]�@@A �O¤@B$��M�5@C5�CԞ@DQ�1���@EyE$\��@F�W����@G�QwX�@I6q���a@J���Yb@K�D��N@Mc���@N�7x��@P6P7���@Q����@Q��@R�e���z        ?��t��?�l��!�F@4D�N@/�^H��@@dܲU��@L\�gY�@U��YJ@_1�<�@e��u�@k,�cɯ�@qdA3�@t�g�)@x����2@}�Q?�@�/Gd�z@��6o=��@��	���f@�����n@��BG�GU@���c�u@�ȿ���^@��Ay�m@���d�i@����U�w@��f����@��`��a@�:T�Is@�N��M�@��]��@���	��@�"ҙ���@��n$H�@��ԟ��)@�[�2�@�ّ�A��@�c_���@���ؓ�V@�����l�@�"]���@���c�D:@���BJk�@�ņU.u�@���Z[@��6�8�@����@������@��گ	�@��%�D@��1�{v�@��=� �@��I��@��V�@�y]��@�&�d�@�&��/@��@qݔG@�S�/���@��(2sOe@$��#@�+y' ��@����w$1@�xrRR�@�%��        ?Q���;W>?�c׮���?�g墲�]?�u���m�?�w��gB?���| W!?��Қ?�J�k�t?���=��R?�����i?����eI�@���;�c@d��a@	�!�Y��@��h<w�@˭�f-�@��6��@0a��N@�9|�X�@��ˈ�B@�"=@$��d��@ ���h@"UIh�H@#�4����@%GMGo(�@&�P.Ʃ�@(mXֳ�H@*�If\�@+ѹ��@-��	+@/���9�O@0� �@1�0g~��@2���m��@3����3@5+�7���@6j�;�@7�/E��@9�q�~
@:�!���@<
rTޱ�@=���3��@?HL�䴁@@�a��<T@Aj��+�@B\�J��@CYS섯P@D_��ȉ@Ep3+�@F�or��`@G����6j@Hܛ����@J]���S@KU����@L���N8u@M�����@OS�����@P]�/�s�@Qʠb�@Q�x��.@R���9<@SX�5��        ?1si���?n�~�$l4?�jX�&;�?�^�;��?�ZC�{r?��()OK*?�4�U�?���?�{�0�ؐ?�m#�	�?�O
n��?�X�R�?�w_A��?��un9�?��[£r!?�3�$�4?�����S�?�|�=��r@ n��@���x!@�98�@����^�@�Ɇz1@pv��'@�-V�w�@�9�X@^�0I@�MO$@< -�4@A9M���@!h�X�}�@#\e��~@%G<���@'��ZX��@*`P��N@-%f�%�@0����~@1��g�`:@3w��L�@5^'�=91@7i�Ux�@9�O�j!P@;����&a@>}��\~@@��K��n@BlP���@C�..��q@E3Sj>K@F���K @H�a ҟ@J��@��@L�	�N�@O���CQ@P�eY���@Q彨�b�@S1r�r@T���r@U�2� @W�]� tz@Y'��
@Z�$�k�N@\��fq|@^Y�|M        >�E�?%����$?F�V'�?\�^o�j?kyu��(�?w1��p?��i���~?���l�?�
�]�?�}���?�Q��#?�u~�?��nFk�?��L�&�D?��z�J��?�jNa�?�IvYp�?��-qw;?�)KJ_��?�C�*Q�.?���;Y?�`�Q|2?�p$R�\?�"ؘt�?�z�p_�b?�J.�!?휀��Z9?�>�L��w?��[�7?�CN��*?�w�� �)?�A��<�@9k��&@���)�@����I@�uD2W�@��?	�^@2Y!3@f5㥳@Zf�L��@xt=���@£Uɫ�@;mp��@�]���@����~@!k���@#59ѻA@$��D�ԗ@&������@(���^T@*�d"Č@-/lʠw�@/����>@1E���@2wB���@3�	b�3@5q$RQ�_@7~XT;�@8�x!�:X@:�ݗ��@<q���P@>n5DB9�@@Bk��_�        ?�8���@��H�@&����xz@;ߘ��E@J:�L`y�@U�2Gn�@^��L�J-@e�vЎb@k^+�|�E@q5�;B�q@ue^��:@y=�\��>@}���un.@�=�|P�@��ƃY�Q@�j2�&� @�2� ��@�bq�2�@�#`EB@�$�2�`�@��n~�@�w�)�p6@�6��(\@��d��<@���a]�@��Z��߾@���}z9@��NO�r@����8��@��%y+�@�=�6e�@�qʿ��@����e�@��X�-:@�c�I��@��̆YB�@�W=�1�@��;�}�@��3����@�'~�G�@����+@�e�0Z@�xT��@�-�ba2@�#ѓ�@�F�o]´@�uB��@��98��@����T�@�I��_|@��w���@�!�u��@������@��$��h"@�Mo�V�)@����UJ@��*�@�Ǜ���P@ħA��6@Ōy���@�w�l���@�i	-#iP@�`#�:�a        ?!��̣�?SX�����?v�}�9?�P��R�?�	�E?)�?��*���?���3�`?�d㙡͏?�~|>{?�K�`�<?�1��[u?֍���?ۜMO`?�I�f�?��O�E��?�Go���?��\��]?�R���9?��c��V�?�m�A�z?�L��*Q?��m��?�5����@  M݋[�@ِ%K��@���&�T@�6�(�@��(�i@	�F�2�@���k@o̥��a@w��h@ǈ���@'w��\�@�,�� @�e@@��z��@Q����@2~k%�@��_R�@��}�j�@ L����	@!L�}٘@"Vl�2��@#iƓ���@$��é�@%��H�2�@&�c��Y@(���[@)\`퀶�@*�Y�e��@+�>�>)"@-]�{�@.��5��@0�7CM�@0������@1��,��1@2N�{�@@32�X�@3�~��9K@4���T�@5_�<D��@6)A��m        >�?�2�˺?>�]��M.?b^�^QBd?yU�r���?�o���~?��xu��
?���I�͓?�lHw"?����߿?�C#�r�	?�%��&��?�)?�Q��?��z��DM?ͯ�$]N?�/�E@-=?�W��o?ڦ1�Ed?���_Y?���)?�yL.K?�C�^?�	��u��?�>?�N�?���=�A�?�3)��a�?���֕?����@p@�2Pc@�<N��@FgO�e@
<�ߋ6@|��F@���km�@tΥ���@���@g�@�˞�@V�e}XG@�%��@���}�@!�<�ea@"��T9�N@$��ŋ��@&oVaF��@(�(� �%@*����6�@-�M,�@/�Z���@1��l^@2�V>���@4��l��@5�VE3@7H8��4@9
�+ 1@:����@<ᓅ>+�@>��P���@@���@��@A��Y���@B�NX�@D'�@�,@Ex#�]�5@F�"��c+@HG�I��        >��=}�+?1��n��?TMŢ(K?l5�����?}�r:� R?��'ŉ�?�~rq?�8$���b?�_�.Ly?�L�vHI?�1��ۚ�?��>�6��?ÍY�v@?�uٴB#P?�g��n�?���D�~?�}\A���?��ˡ	Z?�5��/�?�u�Ew��?�"�Vk??��w�Fջ?��U!�U?�/N(6��@ " ��B�@�O�u@G��f�@	��-k@	-�}!@J�`�D@�]V�@������@�C��[�@�Ѭ�X�@ K[�'?�@"C����)@$et|`s�@&�h���J@),,[ ��@+�j����@.�ͮ�L�@0�|�"(@2zB_,Y4@43z��n@6��ꏿ@7�+���.@:��@</O�p��@>w�g���@@oe���@A���ؔ�@C����@Dj����@E����k-@Gg�f{�|@I@цC�@J�!Ȩ��@Lk�j �@N>A�9@P/��	�@Q_�e�@R��d��@S(����H        ?�o.�$�?П38�Ke?�s();s�@
���<.�@�J}�&@'�bd�~&@2uSs)�@:�8_Nӊ@BCFD�]@G�s�л�@N)�[�K]@R�kR�@Vې�1��@[p�O�8@`A9���d@c
��n�p@f�-H`@if�P��@l���o�0@pj��<�*@ryH��"#@t���^+�@v�?�M
�@yp�����@|�@~�z^�;�@����8�@�O�	z�0@��Cd,�@��~m�@�E��]@�ǽ?��@���0G[@��W��F@��Et8]f@����a��@��=�\�@�Х�jp�@�޿��m@�=���@��ꕀBR@�����>@�3���&@��V����@��]�,�@���">>@�Ѩ$ê@�Sf����@�""����@���c5�W@�κρ�@��&X,�@���3l5�@�s����*@�\�I0��@�H���o�@�6�IE�@�%�87�@��b��@��;�U@���o�@���9��e@��p���