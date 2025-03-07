CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T105135        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?�<��oX?���M�uy?��-�Ď?�݈�}?�~�|U�|?�/4]&;?��T6�@ R��;�@e�f�n�@3�y� @�]m�r�@�u��F@���(�5@��[��@ ���$@#���L�!@&Qm" o�@)T�Xi�@,��}��@/��v�eq@1ʤ����@3���z8�@5�T��~�@7؃���M@:q�[e[@<gHĚ��@>�5Y�z"@@�0 f��@Bso��/@Cem�b��@D� �?�@FP�!�A@Gڗ?{�n@Ir>��@Kl�\��@L��]	@N�V�a�@P+���^I@Q����@R�kd��@S#xD!0@T��1#@UL����@VA�A@W1cg)@XL9�'@Ym�L���@Z��LQՑ@[Ŀv`�}@\��=��@^7D?z��@_z��j.@`b�T��@a��%�@a�*A�{@bh0���@c��#�@c��I�@d��#�	@eL�ʣ/�@f|_��@f�H5���@g�@@C8�        ?�|�]u?��A��VK?�U%8�?���#���?�4��_�&?�ܚ[:%I@�G���h@D61�/t@���<@�E�ie@#H%H:U
@)1X�y�@0���ԅ@4@�J�)�@9g��',@>�Y�O��@BgO���@E���P@I�u	��m@N?
�W�@Q���@T0� ���@W=b��@Z<	�di@]��1��@`���o@b��ۍ�R@d�N��@f��oh�4@icez�k@k�X��8@n�T���@p�o�'�@r:����K@s�·��=@ut��h��@w0!���@x��F���@z�6���@|�!�N=�@~�!\�މ@��LK� @��D4I�@��.��@�����D�@�7�4Cm�@�~�}8�Y@�Ч��@�-.� 3@��s�WP@�r�s�&@��%�U��@�
�P�r�@�NFb��@������@��6�`��@��Q��O@��F�w�@���>2�@�s^ �g*@�aDy�z@�Tb�o�_@�L�^��i        ?������?�˗��^??�`%�4�?�'�e�?����ַ?�!�}�?�q����K@>��%@q��h	@x9x��@֩2��r@#WԒJ�@(�F�x�@.�����o@2׿\(�"@6ד�`�@;[�(�*@@4��@C�|`:@F��0V@I{�e��b@M+eLr@P��͊�@R��VK��@U����@W�LH��@Z$��}�@\�����@_䚥�� @a��'��e@c&:�<�@d�����@f����֕@h�d�VE@j���~�@l��
U�4@n�Z��\�@p}F�P��@q�1i�@r�����f@t�r R@u^	+}�@v�j�TY�@x�'LMz@yx����@z�:w�3P@|l}�Ǝ@}��)U�@�5}�@��`�'r�@�l>b��@�G���@�(��@���i�@��˱��@��#sEb�@���h���@��7΂�@���3	��@���3��8@����
X@�3'�a@�-���        ?��+-�<@�!퍔�@��".�@/�H�r2@;�4�z3�@EXo���<@N���Ë�@U|"K��@[�+]�@a��T�b\@f	���]�@j��G�<@p7��;�:@s?x�Ěc@v��hdF@z5K��-@~&5��@�3�~D<i@�|��7�w@��%���@����<��@�O��.�@�>��{��@�����-@�L��%�L@�-~z܋@��XDH�X@��f����@��D曅�@��ۈ�m�@��2r;5@�������@�"c)1)@�P g�2�@�����@��@�.}}@����@�j#�@��)�
3@�1��vZ1@��l8%�@� ��H�s@��D|1?�@�Ԋ�5@��^ֈjz@���ܚG@����@�j]0�B�@�J��G��@�/�fģn@�VT��@�	�W�J,@���7��@��uu��@�������@��1��@�)|T�`@�����@�*�lz�@�E�l�5�@�3���7@��C
�0�@�\e��a�        ?vgӰ��?��Po�k�?��g��V�?��5���?۲~\�l�?�\A��z?�%���6?�`�m��5?��QHQO�@��@|@�I/Kx�@lO�$��@���x&@ ��(@�1�Z�G@�9��LE@ �|Y��u@"��W7�@%�WCX��@(;��5�@+'�9�@.E
X1��@0�`�줕@2�����@4lGx*@6e^�5@8y9k�(@:��t��@<��	t�S@?\�In�@@�W�@BAմ��@C���PzB@E5k�c@F�+����@H����@I��O�I@KV��#m�@M�؀�@N֐��@PW`�QM@QJ����4@RF�7�q�@SJj��P@TVn�of*@Uj���֚@V���IO@W��/�9@Xؿ�ߒ@Z*qh�!@[L��ʸ@\���Q@]��)\@_9+w��?@`L���j@a �Hi@a����s@bv��t[�@c8C��sp@c���2�t@d��>��@e�i��i�@fi+��a\        ?q�V�(N?������?�I�Q��?� �y*�B?�Z4�l�?� .�z�d?�27�WI�@PZ�tT�@
g��>r@N�"�%[@���۵�@ �z�R@$��#r@)ٶދ�O@/鷄ұK@3i�&�]@7P�<@;�d��:@@D�	�v@B�N �ot@E��_��@I���J�@L����@P'����@R,��Kjh@TV��2�@V��*�=�@Y�~0(@[�%��؝@^-��@`�:�nJ�@bAE��m@c���·�@e���\<@g_~�K@i>Ǆ��9@k3�y��R@m>�ZÂ@o_�ck<�@p�y'.	�@q�qc��@s$��ð@tb�j��@u�>Z�y�@w��
(^@xb���@yϴ����@{HؐllN@|�'<e @~_���/5@��[��@��ľ��@��y7>�=@��;@�(@�yT S�@@�g�;E��@�\��C>3@�W�0�՛@�Y�>M�&@�b/z�@�p�ո��@��;X�<@��(��O        ?m��̀?��Y��^?�,SX]3�?�}����?�����?�@��Ĳ?��Y �|@  ��De@��ܙ42@�9D��@�3��K-@4���k@#x�Gt��@(���Gl@.��9���@2��Fz�@6�Y�M��@;}�����@@G���{@C*�R�]@F3+ma@I��|��@MQ?��v(@P�y��@R��>��@U1��8��@W���U��@Zc�!rı@]?6� ��@`$0,B�@a�~��W�@cr�s@e<&!���@gدXhT@idc_�@k(��{h5@mR�@���@o���)<�@p��BU�W@r1ӑ�J@sv�(N�@t�!'r��@v'�]A��@w��xb4@y
Le�G�@z�^����@|
��@}�H���@f2���@��e�p��@�p��x�@�X�
D�@�Fr�1�@�;3�zc@�6S�i�-@�7�c��1@�?����@�M�%
�@�bfˉ)�@�}@G8��@��d���Q@������@��s˭5�        ?�(1OM�
?�H����@�9��@xIb�f@+F|��ٌ@5�А�Z@?�1B�@F�A��@MA��[]�@R�(.��8@W�M�t�X@]�p@a�
x
"V@d�2����@h��/H�@l��Td�@po� ���@r�e �^l@uQ�l
�@x	�͒?f@z�\����@~����&@�� r�jZ@�rخ���@�Pi���@�I0l��@�]�1g�@���oi�@�ڈ�:��@�C͍{0@����I
@�6��@�@��#/�^�@�|ߓ.�@���}��@��!զ+@���[�9U@�\!}��@�����@���U�z�@�`�{$�@�W2����@�U��{$g@�]��2@�ly�4�@��K_줰@����$�j@��+�i�@��'�r3�@�7��$��@�y�;���@����ً@��ZrƼ@�r�@�jߔ^IL@� ���w@��D#QA�@��ɔ��V@�\��{�@�#y0���@��#y~�@���o��Q@�����z        ?�CL�?���O�?�L���%Z?بPml�?��V��?���v��?����J�_@ � @6p���@T��@�L@�,-�?R@{̻��@���t�(@nm�'k@!�|���D@$�[9���@'��^��r@*���S,�@."D�k@0�xPĮ�@2҉�#۪@4ނ�F6@7��H��@9M�! �h@;�{��@>1�uv
�@@h��Ǩ@A�Ma�@C2�
׾�@D����N�@F9[���@G�'׎��@I{�?�@K3�6�@L����@NК�p�@PZ�b�O�@QT�h@��@RU�ǚ�k@S^Y�kw�@TnRxM�@U��2���@V�9�c��@W�w<�@X�&�ݻ�@Z+`�D@@[f���^X@\�^�F�@]�D;�@_C�ɪ�@`MK�ֆ@`��ؕ�a@a�N2���@be����K@cE�q�@c�{�+O@d�.�>N@ea^�h@f)�@w�@f�8���1@g�����@h���}�@ij�x�        ?z�7��7�?���O^�?¶�N�Z?��R.Ձ?��4�r�?���*�~?�|N�
%�@60|��@0�JGS@���a@�0�Kp@!�f�P@&�6Z`@,�%@1��Pi'@5O�:�g�@9���q�w@>Dm��"@A�F����@D�b��}@GӪ .�@KI|]��@O	j���@Q�%S�@S��,�k@V�3�4�@X�"l�L@[11��_�@^ �-��y@`}(��{�@b'kV3:@c����w@es�c	T�@gF�м,�@i04p-1�@k/���@mF"TOPV@os8��l@p۫F�@r	W�e��@sB�j؎�@t��i�D�@u����]�@w5�r=$@x��wv�@z%��u@{�g�-+Z@}"�cݾ�@~�qiַ�@�1!rS@�
#��@��A���M@��ya�@����T�@��5��;j@������@��U��� @���K@��Ζt�o@���+�ȹ@�Ӊ�p�@��r���@�Ws���        ?��0OX�^?��/�QW{?ǀ��h��?�;�$�l?�<�n?�x�؄�u?�����m @3;�F@D���a�@����@>��f@"��L�;�@'����e@->��	{�@1���2OK@5����|@9���R@>BC+�k@A��mE��@Dy�'���@G�s���{@J�kYMg�@N}��OJ�@Q201��@SJ����@U��j��B@W�t/�7@Z|�%��^@]2�M\�[@`�����@a��!���@c%Ҡ�S�@d��E#�@f��;�@hq[/���@j`�wD�@lf:�Ca@n����/@pZ��5�@q~�@B��@r�`*���@s�?ZK�@u0tB2�@v����@w��G[k,@yJ�͌^�@z��>�@|AQ<���@}�e3�v@gR����@���+'�@�^k
$�@�<�(��C@�!�b#Q@�Fl=@����G�2@����,�@��K��g@��?jp.@��~�"y�@���vo@����p�@�5@���        ?�,U�|K@2����@ 7ۤ~ɸ@0��ha�@=���R�s@F�o�,S�@P��ԯ6@V����J@]�����@b�=vZ_�@gC'y�6�@lB����@p��Z6>@s�I��]�@w,�Ӧ�@z�(mP�+@~��@��@�LKJ@�xpE��*@��~)��$@�9�]�J@�ϊ�64@��&n�a�@�3p�mLo@����j�4@�G�ArӲ@�����c�@��	��	@�q���]@�N�����@�?;����@�B��֘]@�,s,���@�A2"�Q@�_#���X@����@���ADƘ@��.R�G@�6/"r�@��s�1@��8�;�@�:e��@����'%�@�֨��@��	r ��@��?����@�S����@��k@�@��`I@�����@������@�|�5^��@�_[E�}w@�Fhf�;@�1�R��@�!ќ���@�!���@��u��@��X�d�@�?�4�@���4�@���GI@��� eG        ?~�X���?��[581?��ۗ'V?��|W�`Q?ݻ�2�)�?�d=����?�	9[�	?�|����?�2|�@��ŞEJ@��Q7@�pf��9@g�8�g@�l����@�u�R�@���$�@!"��6$@#�j��� @&(Q�@��@(�v�AE}@+ꗞ�@/X6�M\@17���� @2���UL*@4�_Sθ�@6�%� ܀@8�{W��@;���s�@=Zk��>�@?�)�iا@A�h���@Bc�:c��@C�#��@E�5��@F��n+u3@HE�b'�@I��Yҥ�@K,��-�@L�Q#Fs�@N��]>B@P ���@Q9)�bc@Q�Y <�@R��.\3@S��vM�@T�k�#��@U�T'��@V�O��[@XFk��@Y,t�P(@Z:?�!�@[_j]BJ@\���ǣ @]��~�ե@^���� f@`�K��@`�����@a^���@b�~_Es@b�	�1^2@c]{^��<@d�;�T@d�]����        ?q�ȵ�Q�?��-�T�?�h���n�?ϟz���0?�?�t3D�?�u'�;��?�m�XY�@�Ê�F�@��0��@���m}{@�*��CY@!����d@'A�"���@-��ۓ�@2m�w�#�@6��&��@;is=�!t@@e�{ȃI@Cgt��}@F��n�x�@Jg:�i@Nk>0���@Qe����@S�ax��@VSR��E@Ya�C`�@\��0�m@_*�xr@I@aA���@c���.�@d�/�P�@f濶��@h��4o�=@k2O^�w�@m��K��f@o��a��@q;�{u�@r������@s�4ʌ@u]��6��@v��_���@xh{�)��@z��pj�@{�[P��@}e�>�=�@,�#��N@���v�[@�sZ|I�@�lQ�-�k@�l�R�*�@�t�GZj,@��e*��@��r#�S�@�����h@�����#�@�T�}��@�8���@�r<�2Wm@����@�O@�����@�$/v<.�@���V��@�|��p�D        ?vF�l1(?��>i _(?�[�绾�?�,�r2?�S��}�R?�v��0@2?��G��F@�XZiC�@+p��O@�:Q��^@������@ ����@%��5�Z@+h0n][,@1'�[T@4�]H�3$@9sX_6$@=拾4��@A�]�8�@D��@G�Qq��@K��uO�@Oq��I�@Q�$��H@T��|�@V���?N@Y4v5p�@\ ]<�@^�q���@aǒr�@b���r@d�X�t@fb�Ƒ@hXe�E�@jg=UXqs@l�TS��@n��`�8@p�"��?@q�͛���@s�#i�l@tm�*��@u��a�c�@w?��?��@x��>l=�@zG� ��@{�V&�}�@}���:�@:��40�@�~��W:@�f�k�`g@�U��gN�@�L���o@�IV�_�@�M�C�!F@�Y1����@�k���_@������@��j>`�@��m�xo}@���N��@�3չJ�8@�q.�A��@���a��[        ?�G���?�D�
7j@�εZE�@ Z��b@,�xK�W@6��l̰@@l����j@F�pW:Ķ@M����@S?��0�@XK&�l�@]���O^�@a�:��S�@eD�B��@iE��4@m-Z1@�@pż�^4I@s-�s���@u�$�lv@x�B�O]Q@{���F��@~�2}}20@���@�Ё���@������@��7b}�@�ì�<c@���J8�S@�;ᙩ�4@��|�	�e@�O�*�h@�X��M/@���녷~@���P�@����hZ�@���|P�@��kg��@�%�P#@�ɪ��[3@�{�X�@��Z�Br@�"�{��@������@�� �9��@��U��3�@���V�D	@�۞\�!@��yZ�@��dU�@�M�ՙ`@�+$���@�M��C50@�v]��p�@�����7@�ض7��n@�	>�o\�@���<��@�K�
�y�@���f�e@��0��:�@�D< /J@��~y��@�����p1        ?����sg8?���x?ƦK[��C?�E�Gk??��b�.?�-�w�?�q�����?���!�3@ﳡN�@	�
EK��@��D�@NQ�Pi@�w��W@J���T�@�g�W��@"cᬢ�i@%���^@'�/[8�@*���w@.4E~�VT@0Ӊ7�g@2������@4���`�w@6��i�>B@8��3#j@:�,~�0;@=L���Eg@?�?/w��@A$�kY@Bv��[M@C���ۍ@ED�S�@F�Z��/8@HI��FIJ@I�Ȱ��@K��N�x@M9 %;��@N�1VqUw@Pd��Y��@QS��y�(@RI��ʌ@SF�B@�@TK~1�9@UW��Yb>@Vk(H�_�@W�E�≫@X��Ԩ�@Y�%� %�@[��(@\>p�,�@]~�Pݼ�@^���.��@`F7��@`���n�Z@ae�~�a�@b���u�@b�ZY�4�@c��Qq_�@dG�6S�c@e	-�>�@eΑ'ژ�@f���$��@gd�qPC�        ?t:@�+?��58�i??������?��]<MU�?������W?��O��?��3�.@[fD�@���x�@����@�
J��V@!\a�:�@&(��/Fy@+��r"@1;ݽo�@4�X�Ry@8�B��@=��d�[_@Au���k�@DZ��3&$@G���p^@Kd{��@N�rzFz�@Qv���@S���:�x@V͘��D@X�ݬ2�@[\�`�~�@^Fɖ���@`����,^@bT�;Fr@d�ل'|@e�48��@gԻXD�@i�D��j@k��*&��@n<��M6�@pJCF��2@q��Q��@rˣ�p��@t!u���%@u��]|�@v�z��A,@xz�e�@z
��1�@{��	��d@}Z;'��@\���@�t0h;I@�c���G�@�[g�� @�[H�W8�@�cv�mn@�t����@��+��@����b�@�ح��^@�}�>�@�GK��@��xat+@���N[��@�/�&�@�GAJs��        ?s�$�$�?�CC��?�R2t�?�5�e��?�w��l�?����ݖ?�g��K@ �<��9@7Xޟ_@��~�8@i3�u!@AS��M@"��$�
�@'j����@,��!�5@1�a��@5���.@9PJ�ȴ@=j��e��@A"�Up��@C�,C��@F��|��h@I�	�%:@MO��S��@P� N�'@R}`�a��@T��G=�@V�!!�,@YM%�'�@[ݾ);@^�0���j@`���V@b=�2f��@cծjă�@e�m�ydc@gD:����@id��6�@k;.y:@m���@o$(tBe�@p��ya@q�8�-��@r�N��@t6�(P-�@u}=�|H�@v��,���@x.F���@y��v�	@{�U�8�@|�	9�W@~%���W@�?����@����}�@��|6޷�@�t��YC.@�]uwi�@�L��ǲ@�B�hz�@�?��T�@�C
B�VC@�M>�A�t@�^=�x�
@�v[�&        ?�}�+��i?�R���kv@�p��@'�
b��@5뺭F�@@��2^@H�Q�*@P�DӜ�@U�LYa��@\����@a�=��/�@eq���@i�7��S�@n���V�@q�M��@tϱ�xs�@w�	����@{D[��4@~ܭ!V@�Z~���l@�g�{��@�����Y@��~�V(_@�T|:��@�暪��|@���i�2�@�9�>�u�@���'�0}@�E��@��@��;̑��@�����X@�]?Y�Ŗ@�3�'�@��}�:@���?��@��s�Ӓn@���ڗ�v@���|�6�@��K��@�DNn�S@�D��4.@��(<�`�@��;Bm�@�#+9>	@��N8@���:�ǵ@�Z��"�@��QN*�@���7��R@�w� �2@�Dl��3�@��\��b@��;㫳@��c�ܕ�@��HQ��@��J�@�@��kXPeG@�q���@�h�+@�c��2*�@�dD��IU@�j(�_A�@�uFv	C+        ?v��� �?�t�My�?��Q��6�?ˠЛ�̲?�Đ�M�?�e�w�?���.�?�5N0���?��O�/�'@^�]PtW@ט$]�@
�����I@I	}��h@oT�%@��dye'@�6w�]@�
�ņ�@!��K��@$��˳@&�qx.,�@)��5�)@,��4l�@/�iX�r�@1�J�F@3L3h��@5,L3�3
@7%���+�@98�h�o�@;ep4�#�@=�x�n(�@@	��H@AEM:��@B�5ތf@C������@ER�D!9-@F�[
��@HLS�/��@Iޟ����@K^�s1]@M.�
��@N��dM<W@P]���@QKgK#�@RAn��Q�@S?C��N@TD�U�+�@UR�ֿ�X@Vh�`��@W���8B@X�"�N@Y؞� 6/@[]}��@\LP ~ �@]��#X�@^�_-�7@`���oP@`ˡ'��@a{?n�@b7�FC�Q@b�<
w2@c�&���@dx�n�T�@eA0q$        ?v`=��?�[��Jj?�b�u'g?�!�*"0?����Q�P?���Pz�?�y/S`@TA4�Ɩ@��q�L@wDn�@E_&���@!E��9�<@&7�&C��@,4���7@1i0�5@5Ot�j�@9��808@>��E!�@B2��5�s@ET[��@Hʿ_)@L����}�@PbN��@R���z�@U�B4 @W�ڽ��@Z�����@]�OfD�K@`}/_�4@b<��1@dP;|�~@f��E{s@h*A�9.@j`m��@l�ݵ�x�@o)Fu4�@p������@r9�5�8@s��X.0A@u ��P��@v��Q"�@xL���7]@y��ʖ9C@{��C��-@}��d�� @x����@���J�)�@��Jv��@��C��6@��cG�y@����=�@�3Pp?	@�h�(�@������=@��~~�3@�C���;@��o��*?@�Q���i@�xFP2�@�y�x��@�<E�[��@��G��@�йov�h        ?tS�@��?��m�A��?�iR��re?ҡoV�?���Yy�?���ZE?�����S@eq��@q�/�f�@m|	�@p���E@!�9'eG�@&�䝅�@,�\��\@1�ٴ���@5�y�Y�@9�+`M@>�)�/_@Brӏ̓@EFX	R@HV
�S��@K�ւ��@O��H���@Q��!a��@T4o2��@V�|��@Y-�k��@[�b|�L�@^�b0f�@`���p@b��	��@dK:b���@fh1T3@h n����@i���'��@l�E��@nC�DyN�@pE\SY7^@qub]��%@r��D"*@s�(mQQ@uQ%���@v�
q̮@x#�3��-@y�m�C�@{+d�î@|�&��71@~hm�0I@��v�@���Z�@��2�!j@��[�$Ew@���Ww�@�����}�@����ϵ�@��4זI�@�Ӣ�k-@��5-}[�@����y@�2��%��@�`��v�r@��D��@�@��Ρ�        ?�)��j?�!W�)�@���I^n@ 2,�;�@,��h§@6��c�@@�|��@@GP�xrq@O���ֽ@T��*��@Y'ݑ�Ff@^�#��=@b�hp�Y@fZ�IRY�@jWjd�s@n���.(@q��+�R@tP|��`@w)�%��@z��i@}J��
@�Z䂗oK@�,%��@��q<B�@�#�����@�J�F���@���6��@��N�^@�pz��@�J`c��@�e����@�Ӏz�1N@�P��Q$@��B��@�{{�HG�@�(�z��@��p�[=Y@�����p@��2��@��\��%o@���L7Bu@�ʚ�C&�@��P���@����U@�h-��@�F��%�@�|�UϫJ@��c
ߕ�@�e��_�@�T� �@��D�p&N@�6��R@�@E�ִ~@����L��@����<@���eq2@�J�:&@�7���@��
:�x@��wW�n@��t#y�@�~�(�5@�c���Ľ        ?�7�?���K�s�?���[+?�w�f�?��ᄱ�?��q�m?�O�m�*@�P��"@j��x��@�y��D�@�9�@����@ �L��@"��t-$@&1Ϊ{eU@)�uHJ�A@-zn�1<@0��	
�@2���T�@5@�CfH@7��.p��@:L�?m�p@=���^>@?�K�<^�@Au�i���@C	�N�¸@D�Y�@Fg7���@H1BwY�@J�n�?a@K����9@M�٬���@P�:��@Q��

@R6eb:��@S[?�p�.@T�%���]@U���E6@V��Ck��@XH���*�@Y�2p�@Z�Z �y@\Wo�v@]�F����@_7����@`Z����C@a}��B�@a�wh
#@b�AYS@c���@@dS醍��@e+�ޅa$@f,��>@f�y��GA@g���+@h�i����@i�Dl�@j��X��@k�����@l��.�@m}��o��@nc�Q~�@o��,M��        ?��ۨJ�?�J��_�_?�Md��h?��y�e?��U=M�@�jKoJ�@k����v@dM���S@ґpv�@"�Э��@(8s�1�@.�C�$��@3��jqi@7o�9�5�@<Trʨ@@�ہ�~@C�+c`]@Ga�Z@K�(\��@O7�P԰@Q��%܏�@TB�'�@V�f��@Y��I5@\����@_�g_w�8@a�t�3s�@cy9���@eeb@�l�@gmHҧ6q@i�=d�cM@kш�K^@n.lr_`:@pT���4@q�q��<�@r�o^��@tb!K�?@@uٞwO-'@w_���L@x�OB	�@z������@|M(Sa�@~��u)�@��=�4'@��2cg�@���.e@����t~@��V7@��-{��@�{����@�'�a�?@�Ny5e
�@�}2Y���@���Up�@��7����@�8���q�@����>�@����T�@����m�@�P��T�{@��.v50@���p�@@���r`)7        ?���
?�aૈ�?���||S?ڿ��ڽK?�����?�!N0�q@m��qt�@	�K�Ŏ@�5���@n�����@ �EQ�6@&F�@�=@,��Tb@1�O���B@5����(@:;3AEj@?m\�ʵ�@B��~��U@E�!���@Ia��\£@MC�ƍA�@P�W�9V@S	I`��@U�����%@X(�N��@Z��hI�T@^{f�B
@`�/X�I@bU��ǿ�@d$�
�@f:���@h�$In@j-lER�R@le����@n�&��l@p���n�@qِ� '�@s-����@t��S�{@u��8O@w}�#��1@y
�?<		@z�V}ߺ@|PՊ�@~
*��(s@�g�^�R@���1�c@���ܩ^@�� �7@����<@�·ZdX@���C	�=@���DN��@�~h	�@�A����@�qĲ^��@��z-��@���Uc�@�0*~Ռ�@�1ޚ@�k,�C@�Y����@�͜7���        ?��{C@ �@	֤h�@%��<_b@7��xN5@D2���@O�U5(�Z@V��:�C@_?�Gw�@d��#�#�@j4R=9�@pM ~5B�@s�¡�t@w�(���@|1��a�Q@�y N�@�1R�@���7Yf@�Ϙ�S��@����Cn@�e={�l�@�ѹ�dp@�g��B�@�jP�@��0��F�@�����k@�� ��@�~�l��@���o0@���	�@�3�?t��@��8��yQ@�Ó1ۈ@�����@�4��2�@�ե#46�@����@�>�> �)@�H���@��zS�@���kM@��k�xK�@����Y8@�Ӊ$3k,@���Y���@��$e,��@��
&���@����P�@�6�D�zF@�[>5��@��Hj}�@�����)�@��h^�@�ˡ�:�@��u.�e>@�S�F*��@�����a@���ܛ@�I����Q@�����@ĥ�7�@�Wi8q�@��IM�q@�§d�[�        ?�<�����?��oxYv8?�!4�?�?��r��Z?�ܠ�sRl?��~:�fL@C=77-@��ڜ
�@�S��@�&ލy�@j<f�|�@��%Jl:@!�<�l��@$�*�`@(k?�Z�@,*�`w2�@0���@2B�X	�a@4�#�!=�@7V~��@9��BDq�@<a��@?I<�J �@A,8'���@B�;{g_�@Du�9[>@F6�G.I@H)p?]�@I�G�؃�@K� `�ȸ@M���#"~@P��o+@Q$g^8g�@RF1��@Sp���@T�m�uI�@U������@W&-���@Xt+���@Y�վ-]3@[* t��@\� @��d@^c�Ô�@_{1F5{�@`~#��@aB�ف{W@bP�b�@b��+�@c�0�Z@d|6���@eT��]@f/���S�@g@�f@g�2��E@h���V{�@iî���@j�8=�A�@k���Q�[@l��7�Z�@m��2Ӛ�@n���h@o��ot�@pM#C>~�        ?vP�0?�AԶGr?����q�z?ҡL]��E?���?�)�?��6t��c?��J�6��@\g�1�@M�wm~@��B�@����ɂ@#�gd ��@)���=R@0:��"��@40+F̤@8���s�@=�E$͞@A�8�
Ln@E����@H��1/�Z@Lz�i1@P\�k�B�@R�Kn"��@U&iαk�@W��Kp�@Z��{�@]���T$Q@`z�Q��A@b1��
�@dd[�݇@e�e#��I@g�����@jۡ��@l>��}!b@n�����6@p|�����@q�_�ش�@ssZ��<@tm��@@u�o,$k�@wQ��"�@x؊���@zm}_|/�@|u��?�@}��SH�@������@����yv@����M?0@��s�f\�@��ODǸ<@��?�6 �@��E֝�a@��`�A^�@���MΎ @���G,�9@����@�._��|�@�b���=3@������E@��4y7F@���՝�@���<)��@�hX����        ?��L�wN?��W?n?�C��[�)?�wڻ�%v?�٘�<?�t�<�}@e�\��e@A���@,a�]��@�04��@!�
ړv�@&f�=:>@,ܛ�$�@1G3�v6�@4���!gm@9.�NZ�@=�'�U"�@A�
Fm�@DjeI�ND@G��\E@J��"dPi@N��;��@Q[8�xT@S��a@U�T��O?@XCe��@Zޏ��@]��J��@`E�W�j�@a�B��K�@cj�����@e=�F@f߄+Ơ�@h��ų�@j��d�9�@l��(�@n�ӗp@pp��);�@q�J�@�@r���s֌@s�ri�@u'ޭ�@vo}��C(@w����ԝ@y$x^�W@z�Q���@{�*jΙ@}s��Ca�@~�13�\�@�F�{��@�r�w�~@����b�@��wɒ'@���%��@���s�b�@�r�� (<@�c�=_�@�YDH���@�U/��=}@�V��#:@�^_T���@�k��x�K@�~λ���        ?���,@��y��@(�b?9ig@9A8��K>@E��,I��@P���oL�@W���8_q@_�Rߎ,@d�6��Y�@jJ��6u�@p;?���@s��Y$�J@wl����@{�vL$@��?�	n@�fk���"@��ӎbF@��V���G@���6Dͮ@�����]@��� �8@�M��h@�$?̎��@�:��׷@���-MY@�7�F�|�@�l�c`�@��,H�z�@���g���@����{�!@��	0�I@�`���dm@���q�@�#e��@���;2!�@�Aj-?Y@��+F��@�!���p@���G���@�/�^6�@���éC@��-��D@���Q?:@��23�j@���R�@���~��@�t��^��@�mzpE�@�j��j�@�m%&S@�sڠ�@�;�XS@��0;�h�@���УD�@���;��@��e���@�~F�5�@�����p@��6�0�!@�?�d,@��%Xg��@�uv���@� �P,0        ?��Gɘ�?���z���?�	�L�H?��;iJ��?�[yX?贷N E�?��$��ګ?�������@ [�}�x@��]iq~@
5�C��$@rkw��@Ue��@���wU@��ʲ�@E�dc9r@!��#���@$�.M��,@'FQ��@*5�ܚ��@-X�rx��@0W�ݰ�y@2F��@3�-�G@5�(8�A�@8cXA�!@:@7��:O@<���Y��@>���c�@@�A����@Bչ@Cq#pR�@D���
�@F]��ʱ�@G��K���@I�j,��@K/�6�/�@L�"��@N��i��@PE��^@Q9�k�
V@R5����@S88dE��@TB��D@UU�'��@Vn�sWxp@W��o>�@X��n�K�@Y�3i�2@[sp>Hd@\\�3Z��@]��Kv@^��u@`!$R�<@`ΕIÑ�@a�h���@b4Ce��@b얝�4u@c��,��@dhk��e@e+�0�A�@e�W�1$�@f��o3�0        ?r4���?��$���?��� �P�?�R���d5?�#{6�k�?��10HI?��0��?��q�7�@%�[�@ڣI�3�@���V7@X����h@!��j��@&�>�PZ@+f$?Ӄ@0��/'@4%q�y��@7��i�K@<J�5�7+@@�cV(�:@C%*<IQ�@Fߵ��3@I$�^H��@L����˧@PeX矶@R���@T2�����@VwBcK�@X�Zo�M@[u��g�~@^1D�ľ@`�4^��@bz���@c�L.lϫ@eaݲ�W�@g*�=��G@i	�2�0�@j���!��@m�u�1@o1���@p�,���@q���@sS/��@t[q'\?>@u�a2�@wt�\#�@xp���ͦ@y��ć��@{i���^�@|�n���@~�>�S�$@�!���I�@��:���U@����}�@��ͭE�U@������@��M6�!^@���l���@��+`bM@����@@���k��r@��",�|@�¤��        ?xV��zi?�e��N�?�o�|3?�%2@�C?࢑�=?촐:e�?��{=1��@g�W/@oůr)S@�2���@��s�@Zy��G�@"����@'z���fm@,���_Ji@1��<�Dm@5,�Q�%y@9+����@=�b���.@AI�bSb@D�����@F�|CHi�@JA}?C�@M�Bi��@P��(�Z@R�j��`@Uj���@Wu��,�p@Y����@\��b0|@_�ByqS@aKJK|�@b�n�Z�@d�����@fa���/@hCG�zj�@j<�x=��@lN�|r$@nz�pH@p_KgNݨ@q�cAQ=@r�{�Lu�@t�w��g@ujJ���@v�K��@x?�^�}x@y�,�:��@{LP�m�^@|�k��"@~��J*�@�#�MA�2@��t�\@���WwH�@�����@�ڒ�a�@��\���@��wC��@���G�Ӈ@���^~�@�"�8?A@�Go�6֟@�seQ�'@���i�o"        ?�̗���?��r��x]@�$[;��@"Ӱj�ћ@0u��.�@9�V�^ @B�X{t�+@I��&��6@P�
xJ�)@U�}o���@[�K��@`��z�@c��n��P@g�Kd��@k�3� @p"��wy@r��[
�@u67�f�@x��Y_Z@{"� �@~\�7���@����x8x@��c�i/@�� _�@�ɋy� <@���:I@�D�o��@�����~@����ª@�nK�x)[@���H�x@�CU཭�@��Z��{@�W3��,@�������@���p䭂@�l���7@�>�q�[�@��j�%�@�	�J�uj@�dt�BA@��@6�@�&}I���@�@KS��@�a�)}�@����kn�@��4�%}n@��I,�3�@�6*e�0%@�~Ҋ�*�@��;�<b@�'`��'R@�C�{���@��f	�D@��F��@�j�;6��@�)�<�!@�����@��-�-@�2��p�@�N"���+@� ���uW@��ǻ��        ?s�@p6�?�檭j4�?��-��?�!�OG?ֻJV���?�9J���C?��.���?�����BZ?���>��@ /��O�@])FƠ�@	;��u@Y
���@�Me��@N0(M�@�ir;��@�i�2\0@ b�{@I�@"�N"�C�@%���@'�O¶�
@*J�k��@-0�\��@0!��WK&@1�F<��T@3y����N@5H�P&|5@7/��K�@9/4�=GL@;G���)�@=y��\N�@?�'�O&�@Au*�@BWN��a�@C�ˀ>+@E�9Q@Fl:�.Ɗ@G�eP��@Ij�� g^@J��3A9@L���#N�@NR��Vh�@P��o@P�.q�p@Qݱ���{@R���@S�L(�v8@T����@U��[1'�@V��G�t�@X����@Y)(�=U�@ZP���U@[~�`�@\���{7@]�YG�M�@_5f\خ@`@\�n�-@`骣��@a��,ɤ�@bG1v��}@b�l�0�@c�Oy��{        ?pg>�b8$?���W���?�g�+87V?�Ƕ>V?��e<��?M�28?�]��IK�@��C��4@��Y�@�&@Bڲ@��Yr�@"��f�@(2� W�T@.ǚ$���@3<�ѕ�@7�ͰW�@<���E@A?�pp@Dz�t2�@H�yՎ�@L돘@P:�K>�@R��@UB���ft@X�,a�	@[/F1=��@^S���@a��n��@b����cO@d�]��VB@gr����@ib��j��@k�~���@nX\�n�@p�V��s�@q��[@sf�E��@t���P@v��&�&a@x?s�M.�@zG^L��@{�E�S�@}��qꯊ@�aU7(@��tJ�ar@���c�0@����3@�'	F�q@�Q���7�@��9-��@��G�5N@���ؓ@�X~��S�@���v9�@�G[��@��Gbu�@�������@��;�Ŝ�@�~Pf�Q�@�G���+@�y�-��@�慣�c.@��0�}��        ?r\x��o?��s�9 k?�+c���?϶^�+$�?ߢ;�Fo-?��35c[?�s\��$�@ ��I��@u�(ĸ�@𩓴��@���#�@��0˖@"�M�l�&@'��ⳡ�@-D�Dv�@1Ãƍ��@5IY��cy@97p�\��@=�o`���@A-fk��@C�l�Ɉ@F�g��<�@I��E�#M@Mm���@PP8�/r@R:.>��@TEE}0>R@Vr&C��F@X�ow���@[3��h�@]Ɏ��S@`A���+�@a��x~M@c2��޻@d�2�'�@fn�2&��@h(�F�w�@i�����@kׇbqC@m��0p�L@o�־��@p����|@rB��g @s0�eA�@t[��1�B@u�*�%@v�0b�@x�_^�@yk��?p@z�Ew�Y�@|.����@}��>lC@=����@�N�uaI�@����)@��ue���@��=�v��@���?��@�b�h�+y@�A��"t!@�&H�&�[@�tY�`@��tk��=        ?�M;Zq�@?�{�NF�@	Ә*�@��0�@)�& B@4߯e�W@>����@E����@M Y��@R��xs�@W�e(��=@]o��հ�@a��mJ@ej�b��@iQY�|mz@m�����@q"���Q@s�(���@vigگ�H@y[��99�@|���"�@�;��?�@��d)��@��
��G@��\���@��g�q�B@���@�^^�t�@��?O�ϝ@��^͐��@����g@�}���.@��긭�@��:����@��O�7�@�����l@�����@�U��]�@�3��hQ�@��Gv�x�@����9ϖ@���h@�����k@��k[ajH@��R8*�@�'>��@�? ���@�y$ӑM�@���R��@�'!��_@�X�W�TE@����3�@�q�s\!@���FsD@�z��-��@�8Vyc�@��"���@����Z�@���z\�@�XX�3@�*�Rm�@�m�3X@��V�?        ?�{Y�#�p?�:e���=?�XJ�l��?�]bϲ�?�3�u5�?�\-�h�?���,z�?��P�ȐB@���Fu6@�:jL_H@�ԞB	�@�>S!hZ@O:%�@C�)n@���F�@!�I�?��@$�&���@&��4Ǘ#@)�^*!�@,�?��F�@/�q���@1�LK�X@3V��6�@54�M��'@7+4��JA@99��+�@;a
S���@=��)��K@?�2��.@A5AZ��F@Bza���/@C�D}�7@E* ���@F��u� �@H�O�@I�]{��@Ke�t�@L���)�@Nd�ߋ�@PN�ћ�@P�c�/#@Qռ��@R�R?�	�@S��z�.@T��,��@U�	Ԛ�@V�{��@W����@X��&��@Y슦�̇@[
i�2@\-@#�n@]VG�0�@^�B%�o@_���z��@`zC�l�@a2%��0@a�;�!�m@bc.�uj@c$�J�@c��#F�]@df���V@e/X&i�        ?w��ʮ�?���G�?�=��?�԰N�T�?�$>ies�?����-�?���gC��@O�S�T�@
����@�f��	@�]��9@,R�@#�;Ək@(�3H�@.^_g!t�@2lU���@6f`)�@:)A��W�@>��:L_1@A�3�g\@D���d�@G�~���@J��_=	�@N\!��@Q�E��G@SG�Ů�@UH+s��@W�X5�p�@Z��$�-@\���hh�@_xK-�Tn@a3���s@b�oZ3�@d`	9�,�@f�O���@g���:o@i�_E�H@k�T��5�@mêx�J@o�L�"a�@q�xCB/@r7� ��b@sk2С�@t�I23�@u���[1@wK���jW@x�)�DR@z�64�V@{���.@}�����@~��(���@�'��E�b@��r��\@��L�?��@��ZQ܈�@����*�W@��)
��'@����I�p@��B@��p�c�h@��*�Y��@��=/�A9@�����:�        ?|?��k�?�e��:r?���8�
�?Ң�6�p?ᘡ�Q�6?����U�?�N-豲@BY����@y0�qM@�1Sy1K@I�?	��@��m�Ya@"fSuE@&�ǚ3A�@,C�Y��i@1$B����@4�Rt�y�@8X����@<��T@@�.w��?@C0�48�,@E���4�@I	�5�@LU'�E@O�7.q��@Q�J�b��@S�މ�f@V���>q@Xc$��5x@Z�?_.�@]t��\�@`�1��@a��l @c��9�@d��dƦ�@f_���Q�@h"�:;�0@i��S"s�@k�<���@m�I���g@o��A��@q/,�x@r5�9���@sa> @��@t��DZ��@u��|R�@w%���l@x}�TUځ@y�/��@{OO����@|�a���@~N�G��@�3x"@���7F��@���}=�h@�m�Ұ@�M����@�3&��k�@�*q@�,�o@�	2�8@�@h��6@�[��        ?�	f�#��@
�
��@��w�?@)�s���@6�U�̕@A�dF@HZ���x�@P�|7)��@U��[K`@[C�M�iy@`��X� �@d``�8.6@hE��q�@l�Rt���@p����S�@sr7`�@u��T[.@x����@{���[�H@~�?�>�@�(����@��2)\=@��yhRZ�@��3���@�ĒY,KX@����w�r@�4�2�@����kD@�k��[�@�L�g��8@��y�?��@�&ho-|@�uG��J@��J�k@�|ruT��@�	'RsU@���D��@�j��o�.@�*��`�@��nZBF@��>��m@�ۍ���"@��IA��5@��\�>@�ۮQ�Y@��%��H@���fFT@�6zZ�@�1O�f�@�UP<�b@��0��@���=�A@�㸎�@�VR�@���f\�^@�R�/��Q@��ѩ��@��":G@�N
z�3@����U�@�����@�c��T.w@�����        ?��p>�D?�������?�8e���?�bС���?��8�g��?��K�h?�{�m곫?��@�t?@�IO�@�jB�V@$�W���@�~���@���0.@z2�g@�!��@"f��A�@%"��7@(��7t@+9̻90�@.��[]v`@1�k@2�!��;�@4����6�@7&o�1@9I*�bER@;��WPZ�@>O�.c�@@H�@��r@A��	�.e@B��<�n@Dl7Xe@E�
��@Gvth��@I�hZ[c@J�����@Lt{�_��@N<[~A42@P	�P&�U@P��j��[@Q��˗�b@R��L�v@T6��V[@U�?�@V+^|T�P@WK1�M|�@Xr�|��q@Y�L�($@Z�d��@\,���@][�����@^�c����@_�����@`������@a`���@b\Z�@bГO�j@c���V'�@dP��{i@e�g���@e� ��@f����F@g�)(Y@@hWN1d:w        ?v����*?��{>v'?���w?�)���6?�u훭�?�|?աj�?�3R�H0�@Eۻ��@	ĥ�B�O@��R�@�;�T��@�\���@#��>3�@(\icH(�@-� kh��@2$+��@5�pX���@9�|,0;@>t�"A�@AwDBE��@D� ,��@F�%PȈ(@J��O��@MmU�ĳv@P�HE镏@RkBh8#@Tt�1�h2@V��("�@X�ŪN@[S�e_�@]���}��@`Fi�`'@a��G8[�@c%ܚZ�@d�hV��@fI��iz0@g�X��I[@i��YB@k��sҘ@mb���@oV�ne�@p���铑@q��ޯxX@r�63%�@s�ߧ9@u���:�@vH�k4-@w��K�#�@x��3�]�@z�=�.+@{u6��Q@|��BE�@~H� 6o@�!�H�@�����@�jzr&a+@�7G��&�@�	��A�<@��X� @���IK%�@����1:�@��u(�6�@�x���z3        ?x�=���?����C#?� ����?�)�q���?���C�?�E5�Z8?�j]����@U��o��@
I��"�@(����@U��Z�5@�	���@$Q&h(G�@)|v;��@/si��@3 ���]�@6��wuWd@;FX��s@@$���@B�T��g@E���2��@H���#f�@L!�mթu@O�d�<�@Q�d%�,@T	_��D�@VP��g��@X���S@[S�M���@^+ax$�@`z�J婻@bJ�Y@c�9.�ʅ@eN�ci�@g�"�@h��93@j�d-xk�@l�K?^�@o�KT�@p��F
ʁ@qï��_@r� U�@t2]v?�@u{s��^@v��&��@x0�lt�@y���ڴ@{Y�-�h@|�.7���@~/���x@�mC�9
@��
`��@��)4���@�{�i��i@�d��wL@�TB�@�I��P	@�FT,�x@�I2�DK�@�R���f@�b��d@�yx߇@��C$}         ?�`�h��@2�Rf@*����@*y����@7,X͂�m@B6^��@J1��j�@Q�"'\uS@W�3m�d@^1x=l�w@b�Rc�J�@f��}G@k��C-o@pWݷ<S@s!��ϕf@v,	��
�@ywSճF1@}���!@�j=�˲@�s�|M�F@���j�x�@������@�^5�z�@��(��@���{D��@����b�@�?J�aD<@�Ϭ=O��@�q��R�@�&S�/��@�������@�œ�ۼ9@���� �@��i��õ@�_`~�n�@�p�a	�@���Y�CL@��gcA8�@��a��V@��0H!�@�V�(I1.@�����2@����M@�St��T@���#�4�@�+�í^G@����_o@����&�g@�\�	�!@�(�4��@����/�%@��u���@��:�[��@����BG@�n��#3�@�XV�R�@�G��o�@�:� :G�@�3^B�&E@�0�B�uj@�3�:.7h@�;
����@�Gr�A6�        ?���kW?���*4��?�ih�9��?��e��?�rI%o�?�$��,�?�E��ˆ�?�Y�s��@j���A�@���@�M`��@_�V�)@�H/[hg@�n���@��KZ�P@"^����@%3���@'�߶�D�@+����E@.jC=�N�@0���O�@2�;1@4�3p��@6���9�@9�*���@;f�K�$a@=ѻ�	��@@,�D�ZE@A��%�F@B����@DR��>�@E�Q,_��@Gcmo\f�@I4:��_@J��:��M@Lr8���@NA�ۺ�@P��x܃@Q��)��@R���ל@S҅
b�@T!C{�w�@U9�����@VZ�V"}:@W��/s	"@X�8��W�@Y�ژ�@[03����@\y��`�@]�z~3�&@_%'X/��@`CkR��@@`�E$O��@a�#�v�@bn���@c.�e�DU@c����A�@d��0�E�@e��3}��@fZ굇��@g0�bt@h	B��/@h撘�-        ?���2w?��5.	�?�b�7�?��k�I�?�[elK?���S�X`@��9(�i@��o8@(Q�r\@��U3�@#�o0��@)O���r@/���U@3�ь��$@8 �?́@<����@A'8��O�@D-}Q�+@G�	rd��@K-Q�ZS@O,`�2��@Q��9�@T���x�@V��3���@YVc��x@\<|�(��@_S޾��y@aNȈ�K�@cPd��W@d�W�@fٍ0�~4@h�N�s��@kҗ��@mY����&@o��S��z@q����@rm�����@s˭����@u8�M���@v�"�^�@x@׽�<O@y�K>39�@{��(uO@}B�#�@Q�e�J@�u��[@�k7��or@�i�� ��@�p�)rl�@����e=@��z�ٍ@����T�@��	��@�<�~��@�OW��'�@��t��|�@��� �U@�7#�e��@�����4@���.�@�9��D��@���� u_@���BN�        ?r�|�?�aU˰@?�=��P��?�ֳ����?���3w?B��k?���Ixm6@ T�%�T@�KE\��@q_�D�@G ~,h@!E����@&.���^@+�v|/� @1D?� �r@5�����@9G�G���@>���22@A��	��n@D�k8˲�@G��m@K$Z����@N� e)�P@Qo��[@S���0d�@U��[ϟ@XR��3��@Z�lr
�@]�YK:@`G�

��@aΏ�.�1@ciq�V� @e���A�@f��+*@h�,i��#@j�.$\c@l��1� �@n�q��=@ps@���\@q�=��{@r�Z��D@s�כ�U�@u8��!��@v�tA��v@w�oX��(@y@�~�&�@z��#@@|(�WR?@}�Ȥ��@>����N@�m[I�ӎ@�A)��m�@������@��A�U�@��;�	Z@��%>s��@�����=@��E��9@��x �e�@��gw�4@��6ݣH@��l4��@��y�C�        ?ӯ��D?��m�,#@f�0��@*j"aߙ�@7�x̓0�@B�|�	�@KG(M��@Rҋ-�:�@X�$׀��@_�ǈS@c�r����@h^a9¾6@mN>��W@@q^lt�	@tU�6c�@w�f�;.@{�c��3@~�4���@�b~"ǳG@��Z�(�@�Ș�Ң�@�/��	�@����:@�h!����@�=��@����9@�&���@��Kc�1@�|X���@�D5�V+�@��8��@��>���@�=�^�@���޶3@�-�>��{@�O�_��@�{'T�{-@�����q@��i���@�?���\@��!��Q�@��@fl�@@�fI���@��Bq��x@�a-�\ˀ@��&�i�@���q@�<@����H�@�m!��`�@�I�-�T@�,*���@���ue@� ��
@����.@��bf$�@��Qg�@��IR�@��y���@�
�!�]@�^v�Pb@�2����@�R��Egr@�<q�S�        ?}��9���?��Ɣ[�?��Dv��?��̬\�?�ؗB:�p?��j:��?�Rq�1kY?�Iz��@ �	��$@v[�	x�@
�	���@lш
@�r��1G@u���@��Z��H@�U���@"X5D^�@$�od���@'�#ҩ�@*�$��j@-�G8�a@0���i�u@2n����@4U�j��]@6X)z���@8v/A�U[@:���
f�@=��6��@?w����J@A�
3�@BY��*n�@C�{���@E2G��U@F�*�x�@HGB�g��@I���5�@K��C60@MZH��@O*�T�@P�ݛη�@Q~k�T�@R)�Ʈ�@S�>ZwN@T�A�S@U��0@V�3�U�@W��Γ�4@Y/��-ͷ@Zj/��7@[�����x@\�����@^IɌ�Q;@_�����a@`���Α@a9qJ���@a�$�b��@b���@cr�e�>@d8ɽۋ@eϠ��m@e��-�N@f���"��@gy�Z�        ?m��3Z�;?�%���|?� 
8�V�?�� �ʢ�?�����9?�La��5?�d\�q�@VX�)Bp@	z�%��W@�qS��@w�W��@ 3��?@$�L�$t@*��~��@0�����n@4>bӰI@8y��`V@=<shj��@AFc�5��@D8O.=\@Gu�mq��@Kv�C�@N�ɇ��@Q�F��@S�̑(��@V4V��O�@X̷#��b@[��?�QL@^�-.@`�Q��QY@bz�<�@d9|���@f����@h�q��@j	�#���@l+���~@nfܑLc<@p]��RW+@q��Mx@r����@t*-:���@u�j����@v�Є��@xlm7�@y�Mv���@{�}Q͑�@}&��@~������@�G��f�n@�,&�x@�bA��t@�	m8�A�@�N[��u@�zG:�@��݀:$@�F��.\@�*��V�@�FT���@�h�.�|,@��g;�!a@���(��Q@���p�.@�9T'v        ?|���U�?������4?���Oa?�ٔ�|�?����U?�=d��<�?�W����@q����@5���@��C�K@���[�>@!����@&`x
��@,�M@1H�QO@5���S�@97nԋD@=���7	@A����t@D|���@G�i��s@K �M�W�@N��h�@Qzbk
h�@S�4���@V4o��@X���k�@[-S���@^���)@`�Rd��@bak�$@c�@��%�@e�)g%��@gXO�@iE���|�@kJG((�@mdܺ�J�@o��"�و@p���@rgU?]�@sZ�m� �@t��tZ��@u�P��d�@wR���xs@x�h��_@z1�� '@{�;���@}@5����@~����`�@�>��~�)@�����@���M��@��s��^d@��U��@�����@@����`�@�����}@���QB��@���o*A�@��+ȍjU@��h����@��]����@����4F        ?ͦ�<b/�?���㸗�@���_$@!��<o�@/K�nV��@8����@A��6E@H��T�"@PT��Oo�@T�h�+�@Z,H��85@`����@cO����@f�8���@j��jU�]@o?ç^4�@q�ʠ�.@t�N��<@wE���@z6||���@}Z�ꭠ�@�Y�#��@�����@� �<� @�����L@��vG��@�B�԰��@��K�/5@��ڊ�{�@��>���@�vހI@�k.�^�@��H��a@�Q�1��@�����@�rl�)}l@���|�@�ͅ��@��L����@�2 �) U@�"���@��P�2@��Ԙ8�@�!�W�P%@�0�M��@�F|]�i@�c�Go+�@��})dw@������'@���FqO�@�"�Z��d@�d����?@��.ys�$@���Υ�@���*�S@�[?�j;s@���9�@������@���~� �@�?$��Z@�]�Uta@��Hoz�@����V        ?�W~���\?�&�m�,?��j��a�?����mZ?߸]`B�?�-���?�CS�|?�7��8:�@ �ׯ��@l�S,L@
�L�f�@g�o���@��މ�E@o��Eo�@{N�HU9@� ��@"WAa�Б@$�n�Ph@'��m~�a@*���짷@-�#5�_�@0�*L?Z@2m�Yq~�@4ULd���@6X��P@8xY��R@:�W?+�@=�xln@?���i@@A
��Y�@Bb�Hדa@Cɰ1*�r@E?zǡ�@F�E��3@HX0�Iѳ@I�^���@K���0�{@MpR�ȵ@OA��i��@P�����@Q��{e��@R���^><@S��~�vY@T�a�;Ͳ@U���ݰ@V��(!%@XT�`�@Y>���@Zy�lk^�@[�GϏ@]	�0�@^]+�`o#@_��[i@`�q4��!@aF?�dRC@bR���1@b��Q8��@c�K��@dL2L��y@ej�HF"@e����Z@f��ʇ�_@g�N[o\G        ?v�@b���?�'\0�H�?�r]��?�;:���<?�}b)پ*?�H�M��?��"73�@�%}�a�@���7C@�@��@1z���@$wGx�|�@*;Y0.�@0y�h��"@4V�M��@8�{��z@=�c#`~$@A���y�@D���ێ@G��zM�@K�l!`r�@O�W"B�)@Q@@�@T=����@V���t��@YZ]㗱Q@\)�P�@�@_%����@a'?�� �@b�3ڻ�7@d����@fl���@h\^�K��@jc8a���@l�G���@n����>@p�����@q��I1�L@r�< ��4@t:�`�@u�aX��@v��c��x@x[�,~�$@yӘElP�@{V�Q�@|����a@~����TS@��NL�@���w06�@������Z@���$b��@������@��6�_�@��5?�@��dQ!@��qѷ�@��0f��@��RMo�@���}��@���&V�L@����@��ȆU�@�C F�        ?y=K V=�?�vPB�ه?� �)Ff?��̉�.?��<�4�?�e	�Ã?��l�1+O@2B�@�!���@��~@�w�L�@#��6�}@)vʊ1�@/��n�Km@3��@ 0@7�u ���@<�ʇ<�@@�ոlt=@C�3t�@G>�o�hY@J���Lm@N�5�Td@Q��1ޣ@@S�M��*@VW#f��)@Y˃p�a@[�A\@A@^��[�4#@azi#@bٜmt�8@d�--�@f����T�@h�H7��@j֕x�pW@mؤBO@o{b����@p�@0�-p@rI>�pK@s�Ў�1�@u�W�@v�;Ա�@xZ{C�@y���Y�@{N!��f@}�t�@~�IY鳚@�O~ޤR@�Ak��@�;��K��@�=�in�'@�G��S�@�Y�;Ȩ@�s��e��@��c���@��(k��@���9'�@�*���Z@�l;�<@���x��?@�oD�{@�0{�[!�@��7�5rS@������J        ?�TU#��?�[�����@� �ΰ@%2;��=|@2�����"@>/�,���@F2�Ir��@Nڟ����@T�O-B�@Z�xRڀ4@`��	?�@d��~)'@h�0M�C�@m����l@qr�g��R@tU���O�@wy����U@z�'�W̓@~�6Ԓ@�>��)��@�Z�AG�o@����_@��G|���@��X�{2�@�9�,�@�`J��,@���^N�@�9�bA�@��(�� @��M�~@�Q���@�8s�I
r@�4�Jb�e@�F̄��I@�7C1	@�V&{�-@���'�@�����2F@��ρ�W@�@0�>xC@���0���@��W�[w@�gV�>�!@��s��@�f�n>9�@���W��@�KI<̰@� r}R�@����F�@��gu��@��?2S =@��^R�@���]рl@���6q@���2��@���8 ��@��k�|i@��G+�@��i9ҁ[@����ה@�-��g3j@�Z��F[`@�G:k@ n        ?|�MY��?��B"̼_?�	�v�@�?�1���E?ޢ1x��?�J���M?������?��V/�{p@ d����&@J��-@
r@~̡t@<�0,c@��Vs@Nn�W/y@_���+\@�����@"N��7�?@$�G��T�@'�G):�@*�{��|�@-س\��@0�UX��@2h�G^ {@4N=���W@6N��<�&@8jY���@:�C���w@<�=��@?a��ɴ4@@���}�@BHu�E�Q@C��cٴ@E�h��m@F�Z���'@H$w*�@I�2af�@K_��[M@M��^V�@N�� ��@PV|��8^@QGJi�D�@R?b
�@S>��5�@TE_A_�M@US:8���@VhLpD�@W��.
�@X����0@YҶ��^v@[����@\=�;�=�@]}�B'��@^���
 @`	����@`�o3Z�@ab�,/*@b���?�@b�֜��.@c��~�O@d>�%�&�@d��;�0@e�Ǎѱ�@f�ThXJ        ?�m��@&\?������?�;���?��u
�?��[�`aE?�M�8,�@cܺ�I�@�@:�	6@D"�SaU@��"b@$����@+B���I�@1y�����@5����Ε@;4��h(@@� �с@C���G�y@G�	�}=@LL1�@Ph֪�2g@Sè�"#@U��O�4@Y
ϧZ��@\v6�lYp@`�U˛�@b.���L@d=�Ia��@f��u�@i9O�@k�y��)�@nx�7G@p���̅@rM�.�$@s�;�@u���@w�aO��@y�,5�v5@{��:�y@@}�HNy�<@�	Ҷ��@��xg�-@�K�5Ɵ@�������@����1@�3��2@��bDI�G@��V��R@��Ǥ��@����l�@�������@�[���<�@���g7 �@�h]�u@�Oq�	�@�=`�g@�1Q8�)�@�,!8/a@�-�$o��@�5����2@�D��@�YJe��i@�u�/_@��aޜQ        ?��Ơ�?�"��?ŸP)�:?��&�RK?�x���TU?�&�]���@�7�v��@
���B�@	.J�w�@D���Ew@!�[��@&�-�@-K�
� |@2]qG��@6��l@;��f��@@�!�(RK@C���0@G�/��@J�a�ve�@Od��W@Q�oQ4X�@TN�J�5@V��U�,\@Y��!H��@\��R��@`&M�,@a�sgs��@cʴ���H@e�Z�q @g���8�@j���@lj�S��@nڑ���_@p�E�H_@r
6�@sn�P�@t�p$��@veE�&�R@w�%���@y�-O�My@{Hf0*�@}��]&@~ք���?@�Z8T� �@�P��6��@�N�0hٿ@�T�O��c@�b.�H�2@�w(����@���_r8�@����3�_@�ㄶ���@��&	�2@�Q���"@������:@�ݏ0�2{@�.�H��@�C�ʬB@���(O@���)9��@�^���@��k�
�        ?�h�;��@"����@��@,U�,Ɔ@9w��5CJ@DR!םc@M�c�h��@T��)�k�@[��8��;@a�B~"{@f~���@k����@p�銌�(@s�\����@w�V��@{cۗ�F;@��C�@�E�ѩ�@����쌹@�+}`�@��8����@����D֔@��%���@�ʒ�1H@���X�k@�z8���@�x�V̪C@��ڛ%j�@��Sb�4W@��ϗ7@�;�ѹ��@�|�y]�@��Y���@�'P0�@���e�@�~�3@��5�a�@�" ����@��['�@�t��%��@�4�XS�@��Һ��@�n��Y�@�d4殳@�`̍l
@�d�ʏg�@�oʆ$?@@��,][�@���	�ت@������@��:�x@��Z��@�J^F@��IYP<�@�ˋz..�@�]�=�@��d�M�a@�`�{�c@��Z|�~@��ŭ�!�@�z7���E@�3�/�b@���H��        ?x�	��?�H?���a�Eu?��OJ�C�?�htܤ �?�7����?������?����Q�?�*{�#%@���� �@������@���͊�@l����@�Tqu�g@b:����@\����@ Wfi3:@"�U��z�@%-��y	G@'�͒�2�@*����4@-��s(&@0{y-h��@2.N��P@3�ľ�@5�2���7@7����d�@9�q�_E@<�+��@>[
�j�@@\����[@A�N�i�?@B��z�@D5���G�@E�?�W�@G�R��@H���.��@J	]���@K��ĺ�T@M?�F�.�@N���@PT��}�`@Q8�Q'�g@R#P
n�{@SEͤI@T��q@U	��k]@V��8��@W|Hl��@X)�vS@YAU5u��@Z_��҇�@[�N�<e^@\���ϋ3@]����@_�@`-�A�@`�5˸�c@av�E9�@b ���mJ@b��c\�@c~�*� 9@d2��&ex        ?k�'y{�>?��ǦV^3?�̦���?����	�?�+�����?�m�5'�?�9X�7�P?��_)�s�@��uX@^��M-�@� �v �@G�xT�>@!����=	@&KĨ�H�@+���B@0�ڢ�'J@4��7�R@8��҂g�@<�ٖ��@@��ŋ�;@C�K�[��@F�<6��@I�3l��!@Mm�O6�@P��2�r@R�T�:��@T��D���@W+��R@Y�pZ�@\Iнt��@_���@�@a�]���@b���2d@d1A���@e�nahGf@g�|��qk@i��	*�@k���JY@m��Gv@o���f_^@p����@rqA.��@sL�%J2#@t���5ͤ@u��m��@w%�LUK@x��0�.�@y�r���@{g`ם@|�9���@~y���#�@�
���	@�޷k�C�@��W��@������8@��	�y @�n�h�k�@�c�t�@�]�
v=�@�_;��@�g�D�@�v��N�0@��tª�>        ?i��_�?�A>�r�"?�bI�o2�?���H��?شј�|;?�K�y#�?�h�`>3�?�t=�U�P@��є�@t9d��@��z1@�4��QJ@!;z��D@%�J򕅑@+B"x���@0�q=�H@4C�rba�@8@�gd�@<��Ux�@@Թp/&]@C�a\�5�@F�R�b@I�1|e@Md�vw=�@P����@R����
n@T�0��mS@WN���"�@Y��Z�@\�wن�@_o}�'�@a=s�x�@b�4��@d�W��z�@fT-�@��@h4
H#_@j+�<�"@l9�(;�@n`)+���@pOE��n�@qz�P?[@r�*�{@s���?-�@uE���@v�?R:�V@x1*��@y���Hm�@{éd�#@|��t�@~,�!�@��^�r@���c�@�����=�@��^/D@�z���b�@�n��9<�@�h��OK�@�i�[� q@�p��:@�}�!�ag@����*X�@��wI"�@�˰��Q        ?�~�>e�?������@	S��O@ �|&K@(Qy38@3W�g�@;�����@C5��l��@I}$��+@Pb>��Ȃ@T��e�@Y<8�ި@^{���@b&|K��@eY�L��@h�����@l�K��X�@p_�)Oiz@r�Y����@t�&�9:@wt����@z!���N@|�"]6��@��:w�@��x��:@�8K#�7�@������1@��|���@���}���@��gþL�@��vq��h@���ΨS@��_m�X�@���|��g@��|���@�6B��}@������@��q��P@�6�$f+ @��QC�	�@���x�u@���$�#4@�&>�
��@��t�Hdg@���a/�@��]z)G@�bh�q��@�C���.@�+
B��@��(y�@�	ަ+��@��P$T@��8�8@��%��@�
�3��M@�%Pr�M@�-)W�2@�F�l���@�fAS�>@��YY�j@�[�A�@��T)yQ@��q
s�        ?z}@IY�F?��Q|/�Z?��!�wҰ?��SP�?�O�_v�Z?����9�?�n��w�?����a�?��qHȃ@7�A�@	(����@�.�W�@_��#R�@���ht@Pȋvq4@9v���@ ��J��_@"��~?��@%^߾%@V@'�@ҷ�x@*���(i@-�?���@0B�%�9 @1���T@3��4&r@5Bq���@7�'< �@8�ʞ��v@:�8#�@@=�(W�@?*� `�@@�҇gy@A�y�m�@C	p��%@DD�8~0�@E�ITҰ@F�!���#@H4:3��@I�����@Ksu��@L߷�m�@N��U@O�(�{w0@P�����@Qd��eE@R;S�Q}@S����@S��<&u@T�x܏�@U�B�S��@V�m[Z i@W������@X���MD@Y�"G�P�@Z�ƅ��@[�ȍ=�k@\�'2��@]�፲g�@_�y���@`�Z�a@`�3_,@a=5��
M@a��Y�Fs        ?u�N�iB?���$��@?��$��p?� ?���L?����`�?�&�	ɣ?��/:�Q@ՆR�y�@	n[^�'"@{���@R~ϕ�F@XS�U@�@#R�����@()�a�_�@-�� Z1*@2'��@5��j�J�@9��ܮ��@>R���@Ao�S�6�@Dq�PK@F��_@J"���@M���шH@P�x�Z�@R��X�1�@T�y�f@V�¯�@Y���@[�s��~@^.��c8P@`u����@a��|!�4@cg�P�)@d���)�@f�����@hY򒏏�@j$�w��@ln��2@m��e9�#@o�KUץ@qo{���@r\���C@s9��WS�@tbX�+�~@u�~4κ�@v�sdY�@x>{���@ye�.���@z�g�S�@|"�N@@}���O�@8��W�@�D G��@�	��)��@����{@��;��� @�wl�h��@�P�����@�.~))-+@�Z�pV�@����)�@��v��V        ?y/���?�6oF���?��<S���?ӭ�xf~?�Jٓ�	K?��>�@H�?�ʯ�9E@"!'	��@܈�F�@�#��;5@���sܺ@!f#\x*�@&6z-��@+��[���@1&y��@4ֿ��E2@9 y�/�@=���h��@Aj2����@DC���(@Gb��|�@J�eg:��@Nx��`�@Q9�R(��@S\�e��@U�O�� @Xm#6]@Z�����@]r7=WJ�@`.����@a�ؑ�3@cXP�P�@e:�l�@f�ܝ�ȩ@h�xZtQ
@j�Ld��@l��~��@n��ƣ�@p��5{@q��3��:@r�M�͓@t+5_E��@uw%>��@v��7�@x2��3D�@y�TfG�I@{H@|��Z�4@~:V �wh@��ACq@�� b��@��Ϋ��@�����o�@�mg<H��@�]C�`�C@�S���OP@�PE��T�@�Sw�vtY@�]'=T~L@�mX_�S@��x��@��IԄ{|@��eI�        ?�kw��Kl?��r7o�9@)��|�@$r�Q
G�@2
��(@@<J(�^�@D�n�(	�@L����@Ry想�@W��#߫<@]:ۮ��@a���&k@eG���Z�@i�O�@m@�� ��@p�Z_W��@sF�j�B�@uڂ5r�3@x�(&ֻ@{��Yͽ@~�P�%%�@��}�1�@���/�]@�n"tnV�@�OJ�%��@�E�o�v�@�Q�ԕ^�@�sN���@���CI�@�{-�ج@��ys�@���\ݜ@�.!l65�@�b ۃc@��uD�9�@�B]��֌@�����@�0��G�@��/�Fu�@�J�
�6x@��PH\�@������@��]��@��P��;�@�d�LuML@�N����7@�>A!��6@�3O��,�@�-�e�@�.ͩ*@�3�Þu�@�>� ��@�OB�Y�e@�e>]���@������Y@��w�seJ@�ǯ:�@�y�vN��@�!R�Pk@��Lm%N	@�K#�~�U@����=@��� ��Z        ?{ɷ�z��?��]Gx��?�f�~�.?�*e��?ܖ��~-?�l�t?�?�gY9�.?���d6o?����.@"�i�{@�(���@=��d #@�(��h@�J{i@uF�s��@^�@��q@ N.SĨ�@"�٤���@%;�Sl@'� y�:@*~K%��@-{v���@0S�G1½@2Lo�e@3��@5��LMo@7���H�W@9�+����@;��:��t@>Z���@@9Q�x*@At��ai�@B��Q�@D���@EvOYǜo@F�;�Hp�@He�8U�@I�� >�@K�
s��@M3���@N�\�&O�@PVf�w�@Q?��(�@R.��>�@S%m1�D�@T# ���@U'�]��m@V3�DH
@WFi��ٌ@X`C]	G@Y�*���U@Z��W��@[�]-9|@]&�:��@^K2��0�@_�A�g�@`m)G"��@a2]A�@a¼f&��@br�V�l3@c&Ri`@c�\B�{�@d��$��        ?zί�Sr?�7-$�?��_�\?�>z��Sf?�t����?��at?�ϰ-�@��-6)�@
�ɼ�Kh@_�C�@����z�@ �f�Ӳ@$|,��Q@)���e�@/�ˤ<@3P��D<u@7:z�M/�@;�/�y�<@@C�9s\@B�����(@E�ݽ3@IA�n�F}@Lԭy�@PZ�@&�5@Rs�- �@T����<@W"�@Y��fI9@\}��0�+@_n���Y�@aG��O
@b�4.�U�@d�!�P�@f�B�4j@hs��BTJ@j|�6@��@l�H� ��@nه���e@p�B�G�@q��k���@s[����@te+�͜F@u�I�N�@w0���k@x�����@z2K]Ő�@{�q'��@}jH��<@�_��>@�l���d`@�R՞ �A@�?��iQ�@�4 R �@�/MCE�@�1�`ta@�:�2�@�K8�F��@�b���l@��Z�Qڃ@��ф}@��
�R�f@�4_�=@�CZ�1�(        ?t��z�?���_��4?�qZ���?�d|��Q?�7姨�a?�jvF�i?��ז/_h@I�W��@��߉�@G ��e@:w�^��@m��u�@#~�m+�O@(����-@.R��B
@2|4;8�{@6@�s�� @:|���@@?5�d�@B7��gH@Eg*g�@H>��L�@K�I���@Oe����G@Q�xp��c@S�$��|@V0�<��@X���S�@[Q[�-@^!&o�A@`���u=@b"�c���@c���J@e�����@gj���O@i\�8���@kge⻰@m�y��x@o���-@q�����@rF��=�@s�0΄�0@t��Dә�@v?UWS��@w�x7��@y)��{�8@z�����@|L)���@}���Q�@�yUs�@��T)�$�@���:M%@����KF�@������@���FK�@����+*@�����1@���4���@��-m�%@� ���71@�0�Q�
@�h|w�Y�@����,*        ?���(�?�V��A�@&$�g�@"%m� �-@/�G1u
�@97���=@B98�H�@I���n@P�E>&�L@U*h�\;@Zi~�§�@`&M�'�@ck�_��@gs+;�:@j���ް@oHC�ڟ@q�ny{ы@t{���@w.).��@zQ�nL@}%��$Y@�6K��GF@��)�_~�@���j�N:@���46��@��Lr�¢@�����@�-�0@@��<TLc]@��-cC@����2n@�"����L@��n!�J@��aSQf�@�~���ݭ@���;�@��-�N�@�[l�x@�f�3�w@��_7��@�ݦ�+m�@�Ѩ֧JN@������@���sS{�@���bDv@��ň��@��\���@�%�8�*n@�M���]@�}d�[a|@���b��F@��M�RKc@�9�P�v�@��Z[C&n@�nXjDF�@��֗��@��Tg��@��쏪m@�>�L��@���ǅ-@������@��&�z@�L&���        ?�-��G6?�?�*�?ý�R�8^?���b�U?�=�_���?��h)O?���_�%?���~.v�@P]I�@y^%}4r@�#6��@�ay��@�� @�	��.:@���xYI@"Z��<�C@%�z��@(���@+R3��@.������@130b+@3#28=S@50 �]$s@7ZMp�:�@9����@<��(�@>�+��oo@@���P�@A��偹�@Ciu@�@D�֖�@FzպmT@H�E"��@I��o�c@K��h��@Ma[i�c@OD0&�k�@P��kۯ@Q��^�[@R���;B�@S�>�Y?�@Tٕ?��@U��߳�@W,���j$@XcX+�z@Y��g��@Z�پ{��@\=����@]��T�0b@^��4�@`5GP�1u@`�ư@�@a��MH$�@buFx<y#@c>|�}Y�@dH�N�4@dު���@e���1j�@f�9�W{!@gqkD�@hV=��V�@i?�����@j-՘�2o        ?{+�5{�?��W�?�5�w�?��,�n��?�4��Xx?��x=�P�?�����@#����@�`-��@�laE@�ʚq��@$4�Zk�@)�_P���@0#1>@3��G�3�@8����@<Ҝ��$@Ag.~ra@C���bP@G-�YMf@J��W�u�@N{�rV@QKЪ�@S��iB�@U�ԧu*@Xlш<"@["��g@^L����@`��(��@b&1l��"@c�����1@e� ��@g��q�m�@i��j��@k�����@mǵ[��)@p�n�}�@q5�>=��@rq߾A�@s���L�@uZ^�@vru��C@w��8#��@y^�Z��@z腓#�H@|װ�GD@~$����@�$9/�^@�ˮ�[·@���LVZM@��ǻd8�@����"j@����9�@��~L{��@��lQ~�@�� ;&*~@��:�f�V@����
��@����u|@�C�Ab�@�z�۸y:@��k���@���x�X        ?{u{���?���_��O?�t´ؑM?����;��?�\,�X�?�LE?��D��"@q'B'@�m�b2@J���#@ݯ��m�@#} �X��@(�O6瓏@/ ,P��@@3'Zi��B@7:jJ���@;�0"�?@@s�R�c�@CD��9d�@F[�M�@I�A�v��@Md#��M>@P����@R�tJ�@U��W�h@W�Q���@Z��ˀ@\�Ŋ��@_�8�ܦ@ah���@c�U~T@d�B3-<\@f�jPM�@hbaUyL@jWV��hz@lbv�9��@n��p�Q@p]�=��@q�>�w3@r���3M@s�!/	�,@u?���@v���&@w�
j	r@yb��է�@z�嫦�@|^抷�@}��+�
@�*5�a�@���L|�A@�r?��z@�Q�1`1i@�6���<D@�"N�@���@�	���>@���)��@�	[��@�hԯ^D@������@�3��PG@�MO����@�l��o�        ?�q��?�a�h:�@��-�}a@& ��i�@3g�a��@>��t�<@FN�&�@N�O+��@Tt���q�@ZN����@`�.���@dGo�]�@h��S�@m2��Q_�@q.��O�@tgK -~@w���F@zi���B�@}�{��P�@����KX�@����	�v@�)�1���@�{�a e�@����yv@�����@�FX̵�@��	�,�@���%!�@�,T_ ��@����.�@��i �_�@�_6G4is@�Aj_���@�7.e\��@�@�$4��@��%�L@��ż�@�ꨰXP@��ƭbu@�OD??@��*��f@�ݓ�0C�@�4�o^)�@��?j\N�@��[���@�y��R�@��(#���@�D��zf@�ھ��Z@�����@������&@���(�3�@�y��@�a��]Q�@�O�/��[@�B�`���@�;�~�1A@�:^U-e�@�>gG
��@�G�1Me@�W��}=@�k�����@���d��        ?��j._�(?�e`�:q?äT"�(?Ԃ��=e?���|zO?��.k?�Q63��J?����*�@s5�^�@��p�mG@���pϗ@�;��@�,���w@ңݶ�@H~�5�@!�qk7�@$4�z�@'��1��@*��3/�@-`e3�@0n�.Y��@2J4#p|?@4B5j��Q@6WD2���@8�����@:�jN�b@=F���@?�b*L$@A>\�n�@B�92$�@D�E�@~@E��J�@G,(E��@H��_�@J�rj��@LE2���j@N�?�jT@O�jH���@P�TU�{�@Q��H=�Y@SBZ�@T{�|�@U3���@VVTP��1@W��{Y�a@X��f@�@Y�e:9@[5�Y�@\��"�10@]��q�@_4��V��@`M(�'K@a�1�k�@a��8Q@b~�R��@cAi5[�@d�e@d԰�6�@e��̱��@fx�J��@gQRG��@h-�P�l@i��i�        ?~��#9!?����?�3 ]��P?׺8�7}�?�2+$|�?�)ps���@ & ��+@Y�ȵ�@�&�oC�@Hr,�c�@ QY0�~@%_%���]@+a�D�46@16a��Gy@5H���[U@9�!�"�G@?6��+��@B�
Z�E@E�ٙ��Q@I�cujc�@M��0b��@P��l��@SV��%�@U���]	@X�l]�'�@[���Ɠ@^���@a.��4�@c;N�
�@d�����@gzi�@i1�/M�l@k~�Ϲ�@m�(���@p:E�wa@q����ǎ@r������@tj\:D�W@u��u\�B@w��]S@y+w~�6s@z���t�@|�J�l�@~]N���@�3Q�
@�/�Qp��@�4'{��@�AAӛ@�V�SN�@�tr�t�@������@��%52�V@�����@�B�C��B@��(T!8@�ޅ�4�@�9х- @��C�4�@������R@�@͏@� q�>@�ĕ��<�@��9�7        ?s�Gk7Ք?���z�{�?���MrE�?љ�� ��?��@��\?��c���=?�?{{\�@,^i�H@zU:	 @�bC&@@�`kH4@"�ar�@'㊾2�@./n��%@2�T^Jw�@6��f�L@;��+,gA@@z�K/@Co'T�@F�Y��y@JLy�H�@N:���1@Q?���M@S�q;��)@VM���@X�R侠o@[��?=�@^�п��@`����1@b�΢9��@d�y��{-@fn���2@hw��C@j���uXK@l�����@o8K��w@p�p����@r#kF���@s}) ���@t����$@v]���@w��Ys�@y{�쬤@{"
�:��@|�1��g�@~�>p)M/@�:$叇s@�-3�mԅ@�(SG�S�@�+���ׄ@�6� }t@�J@����@�e�>ˉ	@��dJz0�@��VG��@�����@�$�k��@�h�:p�P@���KcAz@��5=�@�2���@����@����ez�        ?�_��G7�?��pw>?a@2�1J�@%@'��/�@2�Y	��@=?�g�T@EC��ㆾ@MN̰Z�@Sf�J�@X�aJㅇ@_0,��$@c#��`��@g��Z�w@k|�*�d�@p(U�,@r�3x�%�@u�V� �9@x��B��@|3-0=�@���F(�@���o���@���F�>�@���z��@�Ro���@����@�`@�\��g�I@�u�c%@�z�财@��^ �@���K�@�8.�� @��k��@��̺
@����ѭ@�����7=@���g��@�����w�@���k>M�@�7�.hR@�NWZ�K�@��5`��@���ƻ��@�^��@�v�A/Q�@���Gr@�LBk��'@��|����@�M�6/�@�o���K�@�=��F�?@��yp�@��Ҫ/��@�ɭ���@��S��-@�����{p@��rK�]@�|mN8`1@�v�3p�@�v�c��@�|ޒiL@����A�*@����'�@���[��t        ?�����d?�,�uJޭ?��^���?����=�;?�	5n�ۅ?�QUC�f�?��b�F�L?�%7��PI@����i@
?H8.Q@]�&V��@ o�c�@	�G@ze�nh@ �&�@#L�Z�\@&#wb@)0�l>R�@,tC#�=@/�x[��m@1��B�@3�\���X@5��BX�@8@OԻ�@:Iน�t@<���	��@?/��v�T@@�@F��@BB�-y$�@C�07��@E%�d��r@F�
���@H@q5�8`@I��Z�O�@K�@!2��@MQ�2��@O"m��@P|N�1y�@Qp�����@Rk�����@Sn�q�<@Tws�W	@U�և �:@V�K�r�i@W��4�4�@X�c�T@ZK;�ƫ@[DBť�@\p�ζ@]��]��@_��ʉ�@`.n�~f@`ھ0��@a�ʌd�y@b>�P]��@b�&���s@c�yrZ�@dp�VC��@e3d� &�@e��`~��@f�M��@g�^����@hd,�j        ?��v2!�?�eK ��?ż����?��yH�?��N�?�0A�"T�?���K5@@�{t�42@���?!(@��@�½�ȡ@$&<���@)�L,@/�{B��@3���5�@7���;@<�}~/v;@@�3ӗq�@C��Zm5�@G5�O��@J�9�Đ@N��A{�@Q}�����@S�1�@Mo@VF;}�7�@X���=�6@[ȶ�<8@^�
�o{@aO�<�@b��RI��@d�tk�R@fvn��@hz�K@j��A,U�@l��$Ź@o&�Q�I@p��ß�@r+�:�d@sf�CV�l@t�õ?�@v;YԐ&<@w����@yJ�W���@z�X�|�@|��hĨT@~T�"2@�gZ�O�@����c�8@���)��@��L+��@��� ܾ�@��S�C@� ���j@�?��Y�@�h`��'@�����xH@�ө��T@���?�i@�b��K��@�����q�@����@������@�w by        ?p(_��T?���hO�?��E���?� 4��a?ܖ�(�<�?���u��?�&��M��@ Q�0Fd@�iM@��8�@�>�w��@kp��!@#���y�u@(��q�@/γ3)�@3��<@7�G�@;��,���@@JB%`�@CX>��w@F$���yA@I��_�
�@M)T�V�@P���
Mq@R�޸��|@U�[�M_@Wz�1N��@ZMskc-@\��f:@_�
��[�@a��W�B�@c5ڋǿ�@d�)��b}@f�L�1Z@h�㍓��@j��1��O@l���
@o0vG���@p�M����@q��tdÌ@s;�L��@t�ѽb^z@u��[5@wN�l�+^@xóWX�G@zE �lw@{�-��$@}m��5o@C�]@�d�q��{@�EX�ڝ@�+�!�ϯ@�O��@��4�~@��g{ �@�<>��@�"�x��@�zA��B@�/Et���@�I�-c�Q@�j>U��@��o�Z\@@��p{�s        ?�O��u�@ w/�Ҷ^@���@��@(�����@5�ّ��@@�A�i�)@H(f��x@P���[-�@U�`��!@[��C(+(@a/p9!f@d�`(e�@i"F�D�@m��-�a�@q` T�a@ts�yUD@w
s�@z3���	C@}�M�)c@���i��@��}޶�U@��	V&�0@�� Sя�@��G$�@�Q�d9*@��'��.t@�6'�@��2�1ռ@��6$M��@�z.e��@����_@���!zV@�D����l@��C��@���t�0T@��>��<@�<��,�@�5[`<�@�5^�81�@�<��W��@�K�Ǻ�D@�b���@������@��BgJ�?@��Q1w�@���a@�>jp��@���Sq^@���tU�@���j�@�9����@�饦$�@��i)O��@�T�}	F\@�X��@�τ�@�@��~���@�YBȅ6�@�#�<Y�@��!~M�G@��7t^)@���ϟ:@�s���>.        ?v�m��P?�Q��8?��HW{��?��]84��?ڟ&/�Z�?�"9�^g?���ԏ??�d���J?�[ib2@0Cx/@�7t�l1@��E��@���b@�6��nt@=-��WH@�>�H�@��-���@!��A_�@#�d�.@&Z�p��@(��|��@+����A@.�$M�vz@0��
R�t@2z`��G @4+ө��@5�V�g@7�8���@9�s��e@;���w��@=�>Q�6�@?��~�2@AL���U@B@N����@CrQ�C�@D�c�U^@E��e�@GD�!33@H�aG�^@J��<h@Kr��X@L��eٕ�@Nn�ԁ3@O�񾾠;@P��}�@Q���@Roz����@SI�r�BZ@T)>���@U{	n3@U����o@V䏂�U�@W�a��1j@X�{1!�@Y˙8�@�@Z�5[?@[�T���}@\ކQ�@]����@_�d�٩@`��o�@`���>@a/�9��        ?g���}7?��Z�R�p?�3���3�?Ʃ���q�?�5����N?��@�b�?�J\��?��?6Ie@�u=_!�@�;��W�@�$ǥ�@"�vv�D@ M[/A�@$���=��@)�~�kh@/�B�,��@3N��I�@7$eŘ��@;p����@@���"4@B�^�	J@E�Kd3j�@H��˟��@LL6^���@P�@�
@R�
�g@T9��+��@V�o���m@Y��@[�}���@^����Bb@`�vxeF�@b^��beg@d�i��@eҡQsm(@g�#k�r@i��ژH@k�GFZ#�@m۶����@pK��i@q;�c��-@rv	)�W@s�Յq��@u���@vu�^}@w�&Ow�@ye7��D@z��b�5@|�cz��@~6��}h�@��77��@��ϮА�@�ů=��@��D��+@��H�L�@�������@��	4?5@��1�m@��8R@�,�ou�@�1����@�b (Bq�@��<��KM        ?j�lNf��?�����?�Cr*9�?�e��r�&?�v��O�X?�����4�?��+��,?��'86�@ȳ;L��@
B;M��r@�����N@lQI&P@+�89�@#����@'�����@,�_�C/@1x�+݈�@4ئ��� @8��6)�m@<Ȭbm�@@� �R,@C2�t�P@E�����@H��y�@L��f�A@O�-�~�@Q��|��d@S���Ev@U��U��@Wۭ�G�E@Z3w���	@\��n@��@_G�}~�@a�;S�@br�<Zg�@c�#��X@e�-W�H@g+���v�@h�j+�@j�'ݐv@l�ø���@nr��u�@p8��+e�@qA��XB�@rS�R�,�@so�.$@t���	��@u��@F�@v�J���@x:@�r,�@y��z/|h@z��j��@|6w5�M@}�ϭ�J@��@�D�כ2g@�*K���@��e׮IR@���q�)�@�k���Z�@�A�{��@�˲l�S@��я'�        ?ĊQG,�?�d���yl@Ч��~@��E.�@'�w�N	�@2�8U��@;S꿋�@B���@H��*�y@P8/�.@TP���@X��i��@]��~)@a�ԫm�@d�J!g@g��Y@k��B�@oY�ϩ�@q��h�d@t/vrP@v}�u�*�@y
�@��@{�y��~@~���X�@��`�|��@�c�	��@��pE@�@���>x�@���Q�K@�~��ҙ�@�w+w�l�@��(�ϕ@����87@��F��E?@��h��@�<��#�@�t+$��@����z�@�ױ{�@�VO�[z@����D�@���f@��q���@��k�"@���.;`@��QU��@�_2��@�0�)0�@�^]yt@��_H�@�³#b@����D�h@��-X~�C@��B�(�@�r�f]>�@�j��{=�@�g㇂̴@�i��%-@�pR}˹@�{�O4�@��3#'
�@��p;�r�@�]��#L4        ?{����{?�p��b?�՜��W�?�@��C�v?��~Q�]?���0[?�:�}�mD?�]�|	�@ �j���@���Cf@l�_9�@��6�f~@g��a^�@P��oR@�ּ��t@ ��U@#3���'@%����@(���N�@,}Kt�@/�Ţ]Ӧ@1���#��@3���8r@5�ָy@7��lY�%@:b\�l@<r�7@>�G��G@@�>N��@B9���ԧ@C����@E8FĮy@F���7$T@Hz�N��@J6,�R`�@L��zq@M�h$1�I@Oѭ^�b:@P����t�@Q�I��:S@Sט��@T$�D��@UK)n���@V{��@W�����|@X��7��@ZD����@[�_��@\�����@^e�٤�@_�^-So�@`�f�{��@an��Wh@b7x�Gz@c�ы]�@c�+�`��@d�p����@e��Z�u@fk���@gR)��O�@h=j|Eݵ@i-��?Y@j"��/w�        ?o`�Y^�f?��M��1�?���a� ?͙+����?� �0?���U�jG?�]���@ ��;��@�@����@^��Ue@����@���Lx@$�-l�@)c���c)@/���Z�@3T(J�g@7\Gg:�@;�a�;�Z@@|��%�@CM^�W�@Fg��{�@@I�'�A5l@M�O!��@P�d� �M@R���!�)@UL6{k��@W�T�R�Y@Z�1�
��@]_�<���@`6Y��F�@aԃ?	@c���v��@eYh�?�#@g@��ο@iA�me�$@k\O�t�@m�s|iɑ@o�:�#�@q$b�:E�@rf�>��@s�����@u��w7�@v��3P��@w�0���@y��4:�4@{!�h@|��&*�@~u��h`�@���b*�@��X�@���!�[�@��`�~(�@��O�@�����1�@�D�"�x@�ݒ�@�>]W��R@�e�E#r�@��AR��@�̺D|��@�C�~F�@�S䙊��@���4�Z        ?�-��D?�h�%b?�~#t�f�?����ry?��/Mn-�?�Y�uj�^@�k���@�ɱ�@�[y^�6@�K�nO@#*�%{~@(�?���@/5��i��@3mV�;�@7��1��@<�we�x�@A0��I�@DPb?��u@G�˷�r	@K�/��@Oİ�EY�@R)*e��,@T�|�o/�@WL�&��@Z+��3��@]@�Zz��@`EЊ��@b�[�@c�~�7@e�dȢ�@g���M�@j+��B@llP��@n�d���v@p�'#Jk@rIN��F@s�Q< �@t�z����@v��<0@x7�Ia�@y�Y���@{����@}M��+@,J{�^@������@����~@���H<�@����,@���<�;7@��*5HGw@�%/$��7@�_��U�@�������@��Jrt��@�K�{���@����E@��ģ�o@�I���&�@�
k�&z�@�Ќ���@���*�A`@�l�����@�C  �/        ?�wJV�?�ے�bHH@n�ċJ@&<ԕD��@4��0@@�gFʥ@G�ǜr�Y@P�:��@V���@\�||�S@bȣ�a�@fER-��2@k{�KP@p(C�F�@s��t3�@vG�2@/�@y�}$y�>@}�o��J�@��I�v-@�	ܝڻ�@�gY� ��@��kj�f@������@�~s� �@�DL�J�e@���⩇@����*@�\οR B@�>�� �:@�8��[@�KS����@�v���	@��tDj��@��f՘@�H�U>�[@���|v_�@��&K�?@�K�� �@�������@�;��H`@���%C<@�c��7��@����@����;�@��֏{�@���4�Z@����&�@���1�y@��rBo��@���_�q@����^8@��;]�7t@�����@���@�I�?o�@��QJ@���c�@@�	����@�-ug;�@�����[@��R�lv@�=��m�@��"u�9�        ?�? 
�0?�~$�?�}3R+ ?��?ś�~?�ApV8<�?���
QPw?�.�^XԶ?��z9_@�@���J @
�V]�@���|�$@EI[Ng�@E�}2@�M!�@ ��`��k@#Eh��
�@&�롈 @(��R0�@,�@�@/tM�H	@1}}e��[@3Y��z~�@5NV�Sn@7[�79?�@9��2Bj�@;�J��#H@>E�Zuy@@F�ܣ��@A��	��@B߷��@D?r�EC@E�
�@G%y1��P@H����[�@J>�q�5@KޜFD��@M�9F@OD��p��@P�f7�f�@Qn�	�h�@R^щ4�z@SU,
{�@TQ�	\U�@UUB{e�@V_���@Won��3@X�o��|@Y�#�{��@ZȠ�i�@@[���@]&P���@^_�v
@_�63u*@`s�D���@amv%��@aƇI���@buD�!4@c'���v@cݥ^�}T@d�@��.L@eTm�� @f"K�E�@f�S��s�        ?q�x�&?���x;<?��i�\X�?Μ=�Q/?�#]�&�?�AUrJ�;?���	?���r��@��Jo@T._�@���Ă@a�5���@!{V��@%��N�~4@+ ʍ�H@0g��\�%@3�8]W�@7W��o	Z@;h�2}�@?��a�@Bf,��q�@E�[f��@G��Q��2@K/���@Nw���*@Q	snx��@R�p���@Usj��@W1x��@Y�53@[���Z?�@^�zUv@`��V�/�@b	U��'@c���Y%@e�8~O�@f���1�@hr��>�=@j<~����@lp[4�@n
O��Q@pO;�K@q�R�>�@r*G~�d@sK4X�@tv��;�@u��=�0�@v�����@x8p[U��@y��1kĿ@z��Y�[@|\1�j;�@}Ӵ�j=5@V��چq@�ra�0N,@�?A�jKu@��Y�@�@��{��^�@����+�@��K���"@���$�Ā@��5�6�@�~i��\        ?�Y�L���?�Z�˚@G?�8>��M�?�I�Ve��?�z�|�\?�rt{�T@�#��i@�W{u��@u&�L@��H�@@��e;#@#���eR@)&�P�#@/*�ߨ�H@3�z@6�"X�N�@;Q�e��@@t�yAc@B�j�Wɞ@Eɺ�-�@I��^@L���%��@P6��W�@RH^w�Q@T�A���@V���}@YkC"���@\��-�@^��� �@`��Ix�@b�%�Y�@dFE�)�@f	�m��@g�)�_�@i���C�@kء�6A�@m��y��@p��Ɛ�@q8dp�@rhZ1�I@s��%/w
@t�k�52@v<��hb�@w�:�w��@yZ�X�@zw�T��9@{�#8)O@}�Ф���@8Ǻ�@�^�Ϻ6L@�5�H�l�@��y�nz@��b����@�ݧ�8H&@�˜�gٽ@��<�=�t@�����<@��k��;@�����.@�����@����l�L@��J8!�(@�Pe�        ?�@[{��<@�%�g��@i�+@+�p�#�@8�[�_�S@C&���@K�����&@R��2�T@Xު�(�l@_��%��@c����4@g��)@l�-�_Կ@p�
�ǭ5@s�^�:@v���qA@y��EO��@}T��R�@��)��xW@�t����J@��
��j(@��F-���@��_�o!;@�cW.�@��0kp�@�C�14K(@���~���@�6qB7@����\u@��**-:@�����T~@�WO_�l]@�����@�ү͍�@��v.�C@�D�;��@�=)���L@�=8ej��@�D��Y@�S����@�i��YƝ@���,�L�@�������@��R�*w�@�{���@�I9	43@���)�^�@�װ����@�*�� @�B����@����(@��& /�=@�b\�c��@����uA@����@��ٕ:�@�n�Bz�}@�;�H�X�@��0�q'@���AX@����r�u@��L���@�w{g�x�        ?�g�g�z?���"��?���o�'?���	?�qo3;�S?�Q�E+�?��"����?�8�K@�2T\�6@�l�τ)@��|4�@v�*�@���=��@��hh��@�k���@ Ҟ�Kz~@#Ml��
@%�xD$@(�\��i@+�L�̎@/ �ɟ��@1IE�@3��"g@5��c3�@7�Kޟb@9.����@;h�a�@=�ȷ\�@@Ɠ�{�@A\�t��@B��ߊ�@DtX�r@E}����@F��JNZ@H���Q86@J���i�@K�a�I��@Mwc/��@O:4�(�@P��s�A�@Qv]r�@Rm��zZ@Sl�y�~.@Tsnt��@U�Ä���@V�Б�@[@W����@X�1+��r@Z�i�@[=�z��3@\z��@]�(2^[�@_���@`/����@`�����@a����,
@bE��&M�@b��U*@c��6Kr�@d٤|�@eE��Z�@f����@f�$=�
�        ?q�A7g?������?�B�e[��?����9��?�K�K�?�5(�/?���!�@E��uU@	* S[@�vs8@��5��@t�����@$A����@)����5�@/�D�B@3e����+@7e�7��@;�U\�_@@r�{�M@C7���8�@FCPF�÷@I�����x@M7T��) @P�␥��@R����Hn@T���+�@Wd�D e@Y��@KMw@\�[��KD@_�6���@ai&���@c�k�@d��#@f��\/�	@h�0��R@j��;I�@l�1�%�@n���9l@p��d���@q�(G@s�t1�@tec~s�@u�p=s�~@w,��c�u@x����>l@z*���@{�1����@}_���:f@ ��%�@�fe���@�La/��@�9�z^"�@�.xZ�#@�)��o�@�- .y�S@�7ަT��@�J0#:xx@�d)��)@���D�P�@��d���A@���f.�@�;�|��@�[���z/        ?}���<�L?�z��7?����pA�?��iI��?�9�;��?�M�@�Q3?��}?}�@�`�0�@s4V�0@Lz�	��@%�S�l@!�/O
U@&�4��c@,J��@@1o;���@5/ZE��e@9k�s~�@>*�"?�E@A�}�IH�@D�����@G�H���O@KQrg]+@O�����@Q�<��Q@S���S=@V,�$u�@X�AH[K�@[f67"Z�@^C9N�x�@`���y@b@dO:��@c�=9��0@e��b�F@g�F��>=@i����I@k�hȞ�@m����pT@o���2�@q){��N@r`��b�S@s��'`1@t�I�6�R@vR���[m@w��B���@y4`:��@z��f�;@|J��� |@}��F�t\@������@��h����@��WD+G@�w%��8@�h�;� @�a���x@�aWZN@�h.�Î^@�v.z�d@��d~�ջ@����v�@�˵P�Q0@����s��@�)�_]�s@�c���        ?Ү��!O?����Q=@��$x@$���eqG@2#���s@<m Б�@D�U���#@L[�]��@R��/Y�O@W�`�
@]�m��y�@bG�>��M@e�$`�@j�̻ul@n�����m@q������@ta;��|@w=� V�@zP��`�3@}�b��=Q@��$)�]p@�m�@�g�G�\'@���BJ@����!@�'C�4@�s���@� ���'@�T݀0�R@����;@�+%�+9k@�����@�>*�'$@�޶�9T�@��D�@�OVܽ8@���6ߪ@� #����@���"m;@��aJӡ�@�}�($@�@���@�.3��@�Q��>�@�|�T7�t@������@��V���@�4�h��@�����l�@������@�<�JQ;@�So'v7]@��tF7�@���sw3@��S/2ι@�TJ��A@�Ő7p@���z�G�@��J�D�<@��U-�T�@�z�pdw�@�\�<�ت@�C�QN�        ?���b�l*?�9X�	FF?�:G���!?�G� k�?���J���?����?�^8��?�	�>vJ�@����i-@��o(@���#@2w�@�s�4��@�
�TF@,G̸@!y����'@$V�^�@&�%w�#�@)�ҽ���@,�+&��@0.��J^j@1�� �έ@3�8���@5�f/!�@8]�\�@:;�`@ �@<��;�;@?�V��@@�u/��@B#~��,@C����@D�<�|�@F��Rކ@H�z�@I�F���<@Knpd�<�@M1to�b@O���eu@Ps�v*ˇ@Qm�^�$�@Ro�H�V�@Sz&��@T���@U����r @Vʑ3�K@W���`�@Y)R_� @Ze"�@[���^gl@\�1��F@^IG� F�@_��U���@`�$7A��@a;-rd	@a�뙙�H@b�k��R@cw��1�@d=��z�@e�B4�@e�%(0@f��p�55@g���4�@h]Fz��        ?w���?�IVxY?���Hz?ԍ���Ȭ?�����?�-Nfkx�?��U��1g@�P�]��@U�����@�E�ɌC@Ŏ{l@$9D���"@)�>��Ly@0]�R~:�@4E)N�@8�g�:`�@=ˍv���@A��f��@D�5o�@Hg����n@LADCU)@P;�DDl@R��s�@U ��ܛ�@W�N�_��@Z���is@]��6p͓@`s�^�M)@b2b��@d }��@fW�?+z@h]2�1@j?+�@l��٘)@n�6���@p�%��
@r	>�EU�@sg��^~�@t�zH�~�@vQ�(h>@w��v�.@yw'�<z�@{ Y�h�6@|ء�go@~��Z�@�;Z|8�@�.Q��m@�(�<��(@�+V��T�@�5|J�,�@�Gu=lZ�@�aO�r��@���y�p@�����SQ@���<;�N@���Lw^@�[P���@����r�@��o6O�0@�)�j�j@���ؓ��@����C@�L��N��        ?~B��&�a?��r�q�?�%���c?�;6�)8�?傼1�pV?��5%r?�t���@�@Xio@@��y��@����@�.Ѱ@"�-� �Z@(=��Ͽ�@.c+��@2��;�v�@6�ddK�@;ao�)x@@Cu���_@C!=I;I�@FM8�[1@I�m�Ȍ�@M����,�@P��X@S"�"R�g@U������@X/X����@Z�Q�3�@]�d@�@`��rM#�@bH�D=��@d\Ǜ��@e�4L�sH@g������@j���@lK���X*@n��r�&�@p���!a�@q�䫟$@s��v�@t{'
�|�@u�9��T�@web���,@x�$1��@z�&)]-@|.���R@}�{��@�ݙEF@�� (��.@���l:�@���=�7@���oE�@����b@��U�G��@�ű��@��&�O��@���=W�@�*S�F@�Z��?@����
o@�Ο��L@�zD�xO@�/�'��@���1�d        ?�~�W�?��?c@�@�Ah�ژ@'�q��@4�}t��o@@i�Q�-@G߷S�h�@Pq�e''�@U��#�?�@[��`���@amB��@eYS��j(@i��)yM@n����@q�(N�:@tϹ�kL8@w��,��@{Tk����@~��$�ס@�nݮ6e@��Z�2�@���3�Y@��[��\@�����@�.)ك�O@��(�y@�l"^a)@����r��@��> ��D@�58M��@������@��!PKCV@���N:~@��tW�>�@��%�7�T@���"D�@���Z�i�@�#�;��@�Q���x@���ӄ#@��bw�ú@�5"�:]@�pbM2�@���4�K�@�=����@��f���L@�5Rt؉@�`Z���$@�+G�l@��m���f@�����A�@��V,�@��mA��@�o�����@�Z��[�@�I3�h�	@�=�_���@�7�f�O@�5�o�1�@�9}+�:�@�Bw9��@�P�^�^�@�c��h�(        ?��b��?�_oW��?�KUx�I�?�kե��r?��?W�5?����m?�{0\���?����qp@c_|ڟ)@
!����@;�xv�@����@ʺ�/�@'� $F_@ ujl8\�@#
���V�@%�+\�^@(���Ki8@,���J-@/s	��sN@1��l�@3xw��	@5�l�뤲@7�*KU�@9�[
@<Nm�:��@>ͤJ*��@@�{Ǥ�@BQ~�r+@C�l�FM@D�ߠ:T3@F��ލ��@H$'���@I���q�v@K���4��@MS�`���@O. ��[@P�)���/@Q�Oa��@R�����@S��D-Ts@T�/4�@U�7x«�@V�Q�dE@X#%���@YYYN�,@Z��x�y�@[�?s��$@]-!�i@^�	��7�@_�l6m/�@`���7��@a]Ş�y�@b5��_;@b����@c����@di����@e7o򗼮@f	ǩ8j�@f��z%�@g��Bd�E@h��nϜ�@i�Z�)*        ?{�r�+�?��H-��r?ømhc��?�	�@KP?�;����_?�~#?zt?���$]�m@F�-�<v@�3
��@��;��@ʈER�@"�=���(@'�O�D�@-�0љf�@2=��l�@6 �5'�@:���c��@?p�\��@Btr�0�%@Ezl���@ḤT��@Lm�$Rn@P/�����@RR���Q@T�'%P�@W0��#@Y����@\�w�@_�H�	?@ab��U�@c%	R��@d���N��@f��XUCZ@h�'�
�@j�24��@l���H@oB��@p�C�Gi]@r�� .@s];��r�@t�F`���@v8�:6`@w�6�2�C@ya�^ڥ@z��_:@|L���2@}�2�ϭ@�PkF]^@�Ü0
p�@���p��Q@���;D{@���dD�@���n},�@���=��@���E�6�@���A�KL@�yf��@�4qW�@�g���.Y@��&X���@���Q��@�2\��UY@�C��i        ?��ޖ�h�?�-�w���?�S��tE?ܭ0l�f?��#0	�A?�����y@�*�+5�@j���kW@N��u�@:�55�@!MX�G��@&I��x�@, �(��u@1q���~�@5O�.~8@9��J��@>�\!Y@B�[@aS@E��s@Hp�'=A@L�6t��@P� ��Y@R5��'HH@T�h���v@W�| @Y�m4�T�@\� ��\�@_�*	|��@a�WI�]@c?�K�@e��H��@g
�=�z@i&_�ȡ@kC�ZOOc@m����C[@o��ļU�@q8h���[@r�n-x�@s�à��@uV�I�9<@v�@���@xcԛ���@z�W�ub@{��P�T�@}qH3�2A@A���m@��|<���@����=lN@���g�<@��J��@���p�@��_�8�@�������@���Nʄ@�S�5^�@��-�w�@���Lb��@�4V��z=@��H]�ia@����.��@������@�sA"��@�5�_,Q�        ?������@�.x��@ÛW��@,ˏ����@9�+�2�{@D@L9*n@M�1 %l@T]h�iC@Z�p��U�@a99$��@e}�9��@jD%b�ˮ@o�J�@r�H�60@u��
>7@yZ��0��@}����@���R��@��=׃�@�.z��@�z��G�@��Ҩ��@�Բ-Q!�@���i"��@�e-�	�@� m(�C@���:�=@�s�%@�L�I��@�:����6@�> ~��@�V�첛s@�B� �ђ@�ec��r@��8�w@���<���@���f�@�_m��O�@��EW�\@� �a� �@��!�U��@�!�W�I@��z�5�n@�+&bb&@�e��@�:.{�(	@��u�P	@��Y)��[@��h���@��#�Y`W@���ڇ?	@���RW�@����خ&@��&��:c@���x�a@�ţ*Ӝ@�ٌ#�?N@��B	-@�@��s�6@�80���@�1�2�H�@��\��� @�e��:�        ?�(��g?����L��?�b(h��?��Qj�?�ۯ/u�?���Xv�?�����^J@ �N-Sz�@\�{�s@�zݺ@�@[b@�1�Q�@/�6ɶN@�����@"/�h
��@%�(+�@(9rV��@+���y�@/<��ذv@1�ʲ�ӡ@3�{��@5й��CP@8"֥@�@:�'&��
@=+H���@?���i&@A]dX���@B�qon:@Dj0�0W�@F
�:�;@G���:	@I�rP���@KV{�Ah@M=�Y@O7�J�@P��:W�>@Q�{r��@R�S[<yc@S�/��@UX}�c@VM�[ǭ�@W��+�L@X�6++�g@Z'���f@[��M��f@\���3@^Za���@_���u�u@`���+<	@at8��D@b@��TA@c��_��@c���a�@d��<Sg�@e�Y�о�@f��PLa�@gy���@hj�ͧ��@ia/{�<�@j\��.&~@k]�	uP�@ld�H�r@mo��G�        ?F"%��m?�cb_� ?�_[T��?��K���?�`V~	?��T��W�?������@�����@��(g"}@��95�@���A �@#�3gl@)j-e0��@/��p�O�@3���A�@7��.	7�@<[�7�@@̜��<@C���I��@F�F�kf�@Jrߍ��@NLW=���@Q=�E<�~@S�K���S@U�Hq�@X�����@[aQ��B/@^a���@`�T!��@b|�[��@dI�2�O@f1���^@h4Cw��@jR���3�@l���`�X@n㢢��f@p���=@q���INx@sK ?�"�@t�2�B;'@v&[���D@w���O�}@y>��Ԝc@z��u�Q@|���BN�@~W�7F��@�=��<W@��a�*I@� #\��@����@����@����3�@�8#��u,@�Z��Nz@��Nx"@������A@���H)�#@�:H"{�@��`��N�@����*�@���8�@��C\�%@����ƴ        ?��,��Z�?�j�Y�?�;3�U��?�`��]�?�}���?�?7�vB?�_�z��o@��ć�S@	�
eܩ@���0jt@3�x���@"�?nh��@(���@.<��7@2l�BA�@6Q���@:�*��ʋ@?��:@B�Eo�@E���u�@H٣=�ʏ@Lsb��1@P.	ȵ7�@RJ��b&�@T�$�(m@W�V�@Y���P��@\e�GϪ�@_Z��@a>Ń[�m@b焨�q�@d��*>�@f�����@hq�ᓱL@j{tD��@l�S���@n�}�"C)@p�?�@qϷ�0�@s=�!��@te�Z���@u���#@w/l���@x��W���@z-0&��@{�^�7�&@}^�r���@�jUY@�b-`��@�E]69�!@�/���@�P�訿@��|��@�u�@�i3�us@�!�h�0m@�34%Q�@�Ke�@�i�k���@���6�+@��:�`�b@��-NG@�'���'`        ?�j�M�Y�@��lL @�K���@-��Α@9qF�W@C����<�@L��)��@S�6o���@ZV�)�@`�𷥄@d�G
wߍ@iW�l�)�@nvW�;Y@rn{�v@u&>-h@x�%���@|,+3�[�@�F1�0@�+��e�2@�nϏsH�@��ܴ�@�gҖ�|=@�n� ^�@��42�@� ��f�@��7�*Z�@�A��"�@� Z�%�@��3�e/@��Y�[Ei@���be(�@���/p7�@������@�?<cz�@�9�T��@�k�Zs�l@����:�@��_R��@�C�>{�!@���(&J@��g�@��7�c�@��㟿��@���P�@�|�W�}@��<KB|@����W�@��O|��@�|B�@�e�4,�m@�VCr�^@�Ly�!u@�I,3(�@�K���/�@�U)t{1M@�d����H@�zW��$�@��V[}��@���!U�b@��D�!�@��J��F@��zs��4@�@$Z�}�        ?�+�u�b[?���DW��?�ݛ���?�)C��?���>Q?�@�/F0?�m�@��\gT@�Dx�@0���@P�#�=T@��@P�]�#@"Q�H��*@%bA�0$@(�)�wb@,N�me��@0z`�޹@2(���/@4^�Q��.@6���I�@96��w@;��2��Z@>���6��@@��V��@BNi�!�@C鈊���@E�bvu�@GXǃ��@I+��P`�@KI�͓@M�zKB�@Oj�ڕ@P�ǋlh:@Q��4�0@R��<<�!@TL�3~@U:S$�`�@Vz�V��@W�tH��@Y�L�h}@Zs��#ٱ@[ڮ'�4p@]K{O�x @^�&��B@`%Yڒ��@`�>X�@a���?��@b��z8�@c_�c�7�@d:�e*:g@e�"{W@e�)���G@f�o�M`�@g�dD��j@h��5�3@i�1�E`�@j����Z�@k�R*=�@l�0��U`@mʑ>��@n�k��@o��x�w        ?�\;o��?�)���?�k�Ѩ�?���1T�?��Z��y?��%�?� @�>l�j@	?��^_@��#u{@P���1@ ?Q<u�@$��{w!@*m�H~@0v��r��@44k��ڪ@8w1�+42@=F��6[@AT�[F�B@DS\��I�@G�+��M�@KD'����@O<���@Q�]�PT@TD�j�@V��`Eki@YU�5W5@\;?��p�@_R���&�@aN���Q@c���n@d�Һ��@f��Id@h��@��^@k��B�@mYHF�\�@o�xӞ@q�$	@rhz��P@s�X��-'@u,�ę��@v�� �@x*7}Q�D@y��*���@{bO!`D@}x�AU4@~�}5k��@�R��A�F@�B5C���@�9>�y"k@�7��O2@�>&:4�@�Lf���@�a�˗�x@�<��Z2@������@�џ���^@����H�@�C�'d7z@���m���@��v�A@�<�PĐ@���yN�G@�vs[�L        ?uR:����?��etċ?���/�s�?�1����?��"
z�r?���?��&lP@
�Т6@
�lb�@%h���@x*���@ '��^@$�֥�E@*C�y�@0�kv��@3����h�@7���Pr�@<A=D)Ea@@�n�@Ct��C�@F�x~��@I�G�Ⴞ@M��U��e@P�:�b0�@R麶�4a@U7LV�w�@W�Є#P~@ZQ�=�m@]��=N+@`�/�E@a�6�^	@cJ����@e|ZR�^@f���a@h��� NN@j�dX�Z@mF�Tn�@o<�1��@p�V��=�@q��t$s<@sB6]��@t�}Ȇ*�@u��g�s�@wZc�Q��@x�@��;@zW��FB@{�_w��@}���c�,@9�q{@�z���1�@�_M���@�Ky���E@�>�BvС@�8��}<�@�9֣	!�@�B3½�4@�Q�TA��@�hgh �@��A���o@��H��x*@��z���@�
ס�x@�E\u1J        ?�pl�*�s@*�<@!y2��1@1y�����@>~s]2@G+�)��!@P�/u0A@V�q��$@]���H�@bɇ��J�@gLE���S@lV\,f+@p�<y4(@t��t�@w^M��lE@{ "��@~�zU�r@��D�g_6@�Ժ����@�>*�s"@���s(S@����|Pt@�i;
t��@�����%�@�S4��=r@��/Kso@����,`@���6�@��v��1@��*\��@��>Jd�}@���!��T@�
���Q@�7__�_@�n�7��@�������@��8����@�V��9��@����֨@�(�!WO@��l�C">@�'m>_�@���W?x@�)����@��ʣ���@�դj���@��<5�k@��DtE�@��{��@�ps\�+\@�d��颤@�^�.�9M@�]�h�g@�bn�z��@�l8��t�@�{>$Y��@��vr�oG@���-�tD@��b��@��	K L�@��䱯�g@� �g[Ս@��C�2�        ?�m��?�=k"��\?���&�8�?�ڕ���#?���}�?���"�G?���Et�?���a a�@e�!�@��\î�@(�⼵�@�@�&�@���(@��D�@�iK�2S@ `�f�9@"g�x��"@$�T�f�@'����c@*���Ov�@-�����@0��#+p�@2B�}�-�@4���G@6�m�*y@8�7�d@:?2@�y@<~�ƙ p@>��X]@@���&�2@A�]��@C@��)z%@D��}qv@F��ϭ@G��%I��@I@�%�@J�Eoy@LQ�o�U@N3FW�@O�_��d0@P�DƲ�@Q�g��1@R��&�@S�<N @T��ʮ��@U���g@VəS@W��:��@Y�0t�@Z*T�iH�@[X�`�1@\�E�/@]�zgv�@_�!�@`,2���@`�� w�u@a�6G��@b0��:�-@b�7�A\�@c���,d@dU!�}�@e�6��[@e�ު}�W        ?pB>V%?�O��ͬ�?�4(���n?�m&��pv?��q�Q�j?����`�?�<dpx5�@ ^Gk��@��$*uY@�@��W@
���^@�����@#ˑoܗ�@)#���*@/^^�~�@3Fh�=3r@7^��U�@@;�`m�@@�(�J�@Cw"�D:�@F��Xu@J!�|hV�@M�_�<@Q	�Z�'�@SE���r
@U�-���^@XC~�{@[��Vڡ@]�A���@`��| @b21i��@c�'��l@e�Q��4@g���P�@i�Wd��@k�v�T|@n%K(H�@p4�uz��@qi�F� Y@r�@���@s�,����@uS�D��@v���Y!0@x.���z@y�5�n�[@{; Bn�@|ԂD�ϑ@~z�W��8@���*z)@���"���@��Ftu�@��.l��@������@�����$�@��;�޸d@���=I@��wD��i@��-/J@�����[�@� �5
@�IB��@�yq�B��@�������        ?pY.0u�=?����N�a?�g}�J!X?�b�m]��?�s�脵*?�7*)�E'?�0��?�I��@��1r�@�ES��@v����H@B��G@@".�<�@&�ķ�4@,v�;�V@1d{���@4���1�@8����T@={Tz@A7�|���@C�i���@F��퐍@J!�c7c@M� ����@P��1�@R��]'@Tє�P!s@W���@Y~����@\	���|-@^���
6�@`Ô�xZ@b=;W��@c���g@ed`� w�@g)v��@h�]�1j�@j�����@l�)�1�@nwp��$@p>B��@qI%��Z@r\�dq�r@sy�~ʱ@t��2}=@u�g��@w^�\'�@x?ٞD':@y��h�`M@z�?L�^�@|.ĸk@}�c���@~�b��7@�4�
�@��8�ك@����o�b@�v����v@�?����@���/�@�ތ�t�@��'#X.@�������@�k�Q���        ?̣f>��?�U�p=��@�1l[�@!�~�0H�@.̳7�7�@8)��9�@A�I%�=?@H+H��@O�V4I8@Tv��F�@Y���L�@@_T�]H�\@bޭѱ�@fi9�^��@jK�6�r�@n���7k@q���G��@tґ�I@v��9=�W@y�1&t<�@|��;v@ݼ�q^�@�������@�z
�%(�@�fV�wJ@�l�����@��"�x��@��ȳ<�@����7�@�E�:��@���}$�@���;�`�@�<')�M@���綞@�"�I��@����H�@�>f���@��=Q�L�@����	jR@�LQ�Hz�@��`G�q�@�wuN��O@�jt��{@�di$���@�e\(��@�mT���^@�|X�W_@��j��W�@���v�!�@�Ӿ<1�f@�� �@�1WP���@�jƍTQ�@��U\4{(@��
��6�@���:$w9@�L�4�@���B�g@����7�@�b����.@�����2@���M��[@��ˤ�u        ?x����9?��瘒�?���1�p?�ŋ�Cf?ْ�G�V4?�=N� =�?��#���?�W�<&�?�7����d@~����@�c$G�@
�{4Q��@=g���a@P���5 @�cC���@]����D@Z���#�@!S���@#�2��T�@&��@(�ƺS�/@+�X�5Y�@.�B��$@0�
���(@2}�P��@4<�i��;@6�mJ��@7�k͹Z�@:Q�C &@<����@>Q�5��@@Nh��0@A�'�"��@B�,P p@Dw���@E_r !I@F�͹�M�@H0�4J�&@I�$�#.@K3���@L���P+�@NhWfU@P
����@P��(@Qʧ[���@R�5'�0�@S�;D=I�@T��_�.�@U��\���@V�պ�t�@W�k�ĳ'@X��wJ3D@Y�䶇K@Z��PC��@\h���@]@�x@^s�fj(@_����ִ@`w���@a�\�L@a�ݒ��h@blp�2+�@c�yzF�        ?l�����?���u�E?�6aZ�?�j�v	in?�&ȼ��?蜲Y�2;?�iT<c?�?���~��2@XP>81�@��<V?%@��v�l�@�\��@#s�Njg�@(�����@.��?砷@2���B9@6�����@;���oV�@@P�f�C�@C$?N���@FC,���@I�
_4i@MmO�۫�@P�����@R�c��>M@UO�{[�@Wگ	�
~@Z�RN���@]z�*���@`H�w�v�@a��zu@c�~��@e}1�~/@gkP!���@is=�-z@k�*#��@m�f�i��@p��Y@qL�z�u�@r�i����@s烬x"�@uIe֣�@v�%���]@x6�*YQ@y�q�@{\�:O�{@}����@~��o�Or@�?ӫ~N�@�)b���@�.��<R@�?��@���̊@�K��5�@�&Pƺrt@�;����u@�Xm��S@�|�gCN@��
��0@���3�{�@�*�c�l@�V�ӀY�@������        ?ia &к?�8�d�p9?�p�?}�D?�B���C?��>Ng�?�xX��ڙ?�Gu�{{?���T�q�@C��m�@���@5L�c�d@Ũ�o�@!QG-��@%�+��@+V_�J;J@0����JJ@4F��mA�@8;p�M�:@<���.9-@@�HK@Cx�p:�p@Fmh�<��@I��3��@M#Y�h�6@Pt4���@R{/k%j[@T�Zഴ0@V�f5+�k@Yq�;$Wj@\��&�@^�����@`�H�f@bo���/@d<��@e�ۑn8�@g�U�?�#@il�V��@k_�"@��@mhF�z�@o��ȹ~�@p�Z$B@r ~�eF@s/c���@ti]*@u���E.�@v� }�@xWK�If�@y����h@{,��T!@|�ߤ�Χ@~.\HmO@�<"!z�@���J��|@��[4Z�@�Z�g��u@�9-p��9@�_����@��ź@��\��_D@��*"3��@�儲n��@��oa���@���U5�:        ?đ��NY�?�'G� @�(���@����m-@%��j�0r@1F�!+��@9CýPh@Ax��@G.�a9a�@M͠�AĈ@R�C�t1�@V���@[����<R@`}���D@cc��p`E@f��w�G@i���
�@m�:���@p��@r�V��@uDP��@w�yv��)@zD?>�=P@|�
����@�<�d�@�q��G<@����!@������@�o{&k�@�A`y��V@�'��vG�@�"A	;�@�1��A!@�*�"S&@�G���:@�nhdN�L@����,��@���Au@� �U�V{@�p��s �@���TY|"@�/��f�@����>vG@��,Fn@����&1@���M2@��/��8q@���1��@�����L@�kƃ9��@�O; wn�@�8\����@�',�-�@��9�Y�@��Wcɩ@��U���@���"5�@�%���h@�6��bZ@�L�z�r}@�h���3�@��zf�@�Y	�ߎO