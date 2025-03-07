CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T112211        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?�H�F�{�?ܗ �|s?���$WJ�?�)��iY�@��GjE@
6~h��W@>���@�'��'@�J�ͭ�@ x��C1@"�g��@%�҂�@(����r@,7�A0~@/�j"p��@1���Wl,@3k�%�rf@5Q����@7G>��-@9K���m@;_;�{B@=��w��@?����ݴ@@���@B��kxx@CH�����@Dz�E H�@E�]$�E@F��O��@H6�iS��@I���"|�@J�M�@L&�&\�{@M�Ŝ0@N�@rÃ2@P#�9��(@P�g�R\@Q�Q��?@RK�[�k@@SsV��@Sǐ�9@T��ҟ	R@UL���x�@V�q��@Vڰ�B�=@W�Fg&@Xq�֒��@Y@'/|]<@Z�Sc^@Z��a::�@[��Ai�s@\��(ZaG@]i!_��@^D>X��@_!n��h!@` P��@`p�Ǖ:@`�yX��o@aUH��@aȋ��%@b=��Xm@b�wܶ�@c(��o�4        ?Œ�V��?ᱦ�TB�?�W6��?���e�B@��d@�:�M�@�H��hi@䎙Y@!��5�/@%ᨩl<�@*�~��@.�ʑ@1��<C��@4Y����@7O�s��@9���by@@=�M#3@@��¨@A�Q��c�@C{�;|�@EG��%�@G#���=�@I�� ��@K�@�V0@M��-�c@O:��K��@P�*�wO@QҴn��@R��V��?@T&k�љI@U[W~<�L@V�w�=�@Wڭ�s�@Y$�l�Q�@Zu�R'�@[ͺ'��@],=�/�b@^�\��A)@_�X��@`���ck'@as���S@b3=�U@b�����@c�L�%c@d��-�@eO�@fyM<��@f��l"�[@g��4K@h�$B�@it��I@jP����A@k0���l@l����@l��񪓳@m�8�[�@n���:��@o�p\=@pQ���E@p�qǐ�@qDh�bCC@q��-ʕ�@r;��LX        ?�.KWZ7Y?��)����?�ԉ���@ ����@wk����@8�fBYo@��V��[@�U�@"]�eT`�@&UK�E�B@*�f0h@/F'.8�@2�?�5�@4�e���@7��o%��@:{Vӵ�@=����@@f�>yZ�@B��J�@Cد_�z�@E�(+3C�@G���?:U@I����@K�E��@M�P3W7@O˔���@Qh�(t@R$��8�.@SP��b@T��}��@U�5��w@V���f�@XGѶ2@Y�㴣��@Z��
���@\M��@]��lH��@_t��a�@`GԱ�a�@a1�c\h@a���Q@b���K�p@cLYA��@dA��1.@d�.�ҭ9@e�f�b�@f��Md��@gV�s��S@h.8�;)H@i��T!�@i忒��a@jŠs��`@k�3��S�@l�p�$@muḶ��@n_���P@oL���W@p$���T@p�'�C�@qf�~@q�߃O��@r	���f}@r�ub��        ?�8��*?�P^�å�@-�1o��@U���Nj@�|7�@!V4����@'	�>
�p@-m�ͳ:@2;iSN�@6��hT@:,Vz�`@>�g��B@A�o �?;@DB2��@F�����@I\�l�@L/m�H=@Ol�]3@Q݋H�@R��r�pN@TI��r�@U�P�Y�@W���w�@Y{l���@[O�1» @]/���Q�@_���0@`��Lل�@a��E%�x@b�Ύ?14@c��N�#@d��Hz�=@e�o�|�@f�H���@@h �U��@i(�u�i@jSxȒ�
@k���bG@l�Эx$f@m�j�9@o,�Da�
@p7
��R�@p�WE-@q�ۆN@r&[��%@rϰ�P(@s{�q�@t(����@t�s�@u��u�T�@v=�@��@v򖌔LK@w��x
~@xc[8iu@y��r�"@y�ҫ�d@z��?��@{[���]@|ݽ��@|㣼N
@}�?Ш�w@~r�`��@<��;�        ?��Gа<?ڨ�qE0?���͠�?�z���L@�m���k@��BaUF@#�C�@q�6�T@ _�8X@+��Iƞ@!ƴ��>�@$��Hu@'�%�|�@*��z/�@.��x� @0��ɽ��@2�}�g�@4`\S�@6G�#��@8>���M-@:D^�/AZ@<Xq����@>z����@@U:v��|@As�Kq\�@B����@CćU`Ԯ@D�9tm��@F-���@Gk��L�1@H��	l@I�-�R@KF�7�@L�/X(�s@M�м���@OS���y�@P[� ���@Q���@QǞg�	�@R�)骗�@S=��@S�X>��i@T���Jd@U~�8O�@VC����@W
�q9��@W�\r�ѷ@X��_`.�@Ym�P��l@Z=Q:�@[%�e}@[�����@\���Z�2@]�c$��C@^i��Y @_E��e�	@`o�3*�@`�
0��W@`����@ab�F��@a�7k5:I@bHZ}*0@b�W�!z        ?��f�m�?��R{I$�?��Gޯ@ �rz�@WT�H��@#쥜�>@�n��،@fg!E�@"Q����@&KCi���@*�	�Sr�@/D�^=@2 bY��(@4�nh�O@7���N��@:�l��@=��ǣ�*@@w'��@B+i�kH@C�q?��@Eʸu=B@G� �@I��V�X@K��>j�q@M�1�d�@P�?Qθ@Q#� B@RJ��1+@Syg���"@T��mk_M@U�����@W3b�m�C@X�(*�٧@Y�"����@[/8>���@\�Nnp>@]�L_�f�@_j�RE�@`pOE��@a.���@a�bB@b��-�:�@c~�[K�@dIsp>fo@e�=~_W@e�|(7�'@f�	e#�@g��/��@ho��@iMTr�m@j-�����@k|��A�@k�<�/5@l޶�gG�@m��� $u@n���Me�@o�.�8�@pM�z�JC@p�p��e@qD��g��@q���	��@r@t� ��@r�E܉N        ?�֢A�D�?���v{�?�~���.�?����å�@���K@�!��_@��\+�@ ���@"��ͭ�@&
$kB*@*L����O@.���|�@1�T�VO�@4����/@7CڨMU@:+=�6��@=8i�U�H@@4��G�
@A�Z�5@C�+<���@Ehm �@GE���@I3�{ך�@K1�]�!�@M?~r@Sr@O\���'@P����z�@Q�����@S�턊z@T4Xކ�@Ug���@V����@W�N�@Y+W�<�@Zz��+F@[�1bK@]*��L�@^����V@_�ӹD;@`���mzt@ak��e�@b(�ܼZ9@b�ȁ)�@c���Q�\@dqZ��x�@e9�n�@f�|T5@f��z^@g�|+���@hv��:J�@iL^.M�V@j$���@j�U�(�@k�}���w@l�V;@m��]��@n�.���@oh��22>@p(��5V�@p�BD�@q�{��@q���'��@rf����        ?�����?�*g�@[�;@F��N�@���+��@ ���m@&�P��@,&����@1n���g}@5�S~��@8����E�@='�/�5�@@�	���@CH�I�@E��2�E@Hh�@-m@J����(@M}�����@P+A?�<�@Q���Mw�@S'o0@T�re9b@VQ���*@W�P��
�@Y�$�r�@[a@�&�@]%g�/�?@^�Z�j��@`epJ
C�@aU�3�0@bJ�fjw�@cDY��u�@dB/ƽ%9@eDK�i@fJ��5.a@gT��k�>@hc`$9EC@iu��
p@j����@k�z��@l�ͨ�S�@m�Ef�}�@o
\ñ�@p��˞+@p��6�+@qGkle��@q��4ʖ@r|#o�ǅ@s��{�@s�g�Pl�@tWm
Q@t�K��@u���^@v@���@v���̠@w�a��&�@x7[�J�@x�ʗ�@y�~߃r~@z:�Mֽ@z��g�@@{��w���@|I団'�        ?����H?ڏD�w��?��;�j?�l���]�@�GFӂY@z�z`cO@!r��2L@oCh�#@�m+�_@'e]��j@!����8@$�ֵ��@'�<��M�@*����A@.�N*}@0��_#[P@2{��k�@4Q�qY�@67C�Sb@8+��/@:/{�8_@<A��a�@>b�"�@@HgUZ@Ae�rMƑ@B���#�@C�S�q2@D����@F��x=u@GX$e�@H�L��on@I�)��`�@K/�H��@L�O�i!�@M�bH_�@O7�S8��@PL���a@Q �X1��@Q��Dƚg@Ro+Ou[&@S* ��@S�*���@T���Ţ�@UhZL�J�@V,N?�l@V�s- ��@W��)}��@X�4���R@YQ��w�@Z `'��@@Z�g�ߐ@[æw��c@\�6����@]n���Ϙ@^F���\@_!C�K@_���s�@`mS�?��@`���a@aM��۷@a�ݻ��@b1v�0@b���@�,        ?Ō�m�y?ᡷe��?�r�Bq�?��(�BM@��� @�g�Y�q@�B���?@�4o-�U@"��@%��`1��@*4�?�Q@.��&Dm@1��?���@4xz��D@7=���e�@:)��R@=;�e��@@9�<�=�@A�Ȟ�;�@C���I�@Eznhr@G]�޾�@IRd1�Ç@KX/F�}@Mng=R9@O��I��@P���Lo@R	Gs	6@S4mW=�m@TgC��@U���&K�@V�}=��w@X,�a�ؗ@Y}�2�@ZԈy�7_@\3�|q�@]���^�*@_�m%
�@`;�u�>/@`��>��@a�͟���@b|$т��@cB�|��@dg���$@d�C��@e�9�gu@f|Cf�i*@gRY�渝@h+u��@i��z�_@i��s�Z@jȦ�w�@k���J��@l�Yn�@m�kV#�@nm_�Wev@o]�C���@p(9�z�'@p�\1�@q&��@q����)w@rT�]/@r�ZsÈ�        ?�V@�meJ?��ҭ@U�?��iX��@ 4<#<�@�ߖU�K@[��/�@/�C��i@���n@"���ֻ@@&�g��.@*�wK�Ȣ@/���wX�@2X7�0�@5����@7�Z ���@:��V��@>ZE��@@��?l�@B_��#@D*2�,v@F<&u`@G�º�>�@I���j�@LN���@N)�G��{@P.-k���@QO���N@RyR����@S����k�@T�	���@V$��7�@WmU�Ox�@X�(��$@ZF�n('@[r�ba]@\��/CV�@^DU�xRw@_��B��@`��96��@aYIO@b��*@b�	jq�@c��Ǯk@dz�[��@eJ�k�W!@f�r�@f�J⯓@g�m��@h�sA��@i�RA+�@jj ����@kNt��7�@l5�����@m�@��G@ns�2�@n�N�M��@o�  6@pp��x>H@p�>��Mq@qh���R@@q��=���@rf9��@r��Oh        ?�
��v�?�M����@,���@WF5�f@�4%�@!Z��m,@'��N�&@-vJ��@2@Y��ڬ@6�i�Q�@:0�u슅@>�`{���@A���۪1@D����?@F��jAW@IV9VL�&@L$�|�@O�����@QWDX��@R�7�@T9�~PD{@U�\���@W�,+���@Y]�*\�@[,��B@]q�I��@^�B�@`m«���@ak��S�@bm�`)"�@cujԣ�@d�4Ln�*@e����@f���t�@g� ��H@h�b�1�@jU%�5H@k4㪢�G@lb�·'�@m�����@n̂�_��@p�o��@p���v�@qE��ANe@q�Z�n@r�|���$@s7~�5�@s�|&���@t�n^���@u;K�x:9@u���)�@v��!�]3@wP t�`@xdoz�]@x�rkэS@yuD���,@z/����}@z�!)>�|@{�#���@|i�Ը@}+@���W@}�V�Y�@~����R        ?�+y;?ڋ@W/Q�?�� �Q?�eI�#mV@�����@tb��@Ѻ鋫@n�_&��@"�C=�@2G���@!��)+0@$���rm�@'��6v��@*ۣ���B@.,Pʆ��@0�d9��S@2��c��@4xk�^��@6eE���-@8b%�,�@:n�'�A@<��< ��@>�F3R@@wI�?�@A�G�H�@Bŧr�A3@C� ��L�@E.�F��@Fm8x^�!@G��|�@H�[�y�$@JL�U�8�@K�&p{�k@L�΢9@N`uCm��@O�?�/��@P��U�@QRIP,@Rs�B��@R���@S�8h�ٰ@TM�j��@U�,:��@U��R1�@V�;���@Wn���@X<�k��Q@Y�&�ɧ@YޔTٳ9@Z���L#@[�r�R�f@\`G/��@]9�*@^�tX�N@^���<�@_����@`Y��ʎ�@`����Q�@a<��@�@a��i@b#�)f\@b�e��@c�z�X*        ?�%��|��?�i�u}�[?�>_Kd�?�(��G@�$��@����@B�H�@��OG٬@!�J�M+�@%��m��@)ڨ��Z@.^E"��C@1�O�^/0@4*�׵��@6��ph�k@9������@<�IHL;�@?��I��@A������@CPO��n�@E�J],�@F�گy)@H�.���@JЯ�v�@L��<�=@N�xt
	@P���u�@Q��zu�@Rȳz�@S��d\��@U"M�f��@VY��1t�@W��1�(9@X�J��@Z'��׏�@[ycv�ǘ@\э���K@^/�,�@_��'�,@`�`R7@a8!��@a�Q�$?@b��߭�@cr��� T@d6�:���@d�1��!#@eƘ�-t)@f��]��@gae�N�@h2���.~@i� S%y@i��Tm�@j�ۻ�oq@k�.�/��@ln��>tC@mO�,y�@n1},�'@oDb��+@o�V�U�V@psW�&�@p�!�؊@q`v���@q�(�B�        ?�.��N?��Ք,{�?����-�@ ��qj@���l2@E��nf@�u��@�S�'}�@"��o��@&���e�E@*�Y���@/�5�|�@2Y�0h�@5�d�e@7�T5;_@:��<j��@>��u�@@��1rb�@Brs܄~m@DB7���y@F$�d�@HP� �N@J  �@L8~f>��@NbbJ)r@PN��AZ @Qt�+0��@R��D�@S�Ng�
�@U��6�@V^&��@W���f@Y�IL�@Z^���0�@[Ü�{ @]/�k�*�@^�����6@`e�/2@`���5ˣ@a��7<�@bZw�-ju@c%G��-)@c�k�ov@d��YO`s@e��(��[@fqdW���@gLn�}.@h*�ݶ��@i���I@i�(��${@j�}��jH@k����-@l�"���@m�DctBC@n�V��9@o�A���@p@~^��@p�?��2�@q=`�@q�ܔF4@@r?��Fz�@r�ըw_@sGJđ�        ?��$�ԩ?�kY�@X�4h�@C(�b[�@�<񦮤@ �8�Rq�@&5�
CG@,%�m��@1n�;��@5��wcG@8�JH^�k@=-/zR@@�1KH>@C"Lg<!@E���S5E@H#R��� @J�=�2��@M��O�"�@P7��I@Q�mJ%�@S:_���@T�m�1k@Vk���­@Xp�@Y�ԣB @[���QI�@]RN�@_%HT_[j@`�&�8�@ati�zӃ@blL��\@ch��UX�@dir�E[@enxQ�H�@fw�}���@g��	��C@h������@i��J�x@jÙ�@k��>ƺ�@l��
H��@n#;�c@oI�y`�e@p9�K���@p�UԊ��@qhz��w�@r+* ��@r�_��
@s:�ĕ@s�+�T�@tw�QY��@u���i=@u��jY�5@v^P��}W@w�1Mt@w� W2xq@xP]!և�@x����@y�]9@J @zMi�s�@z��rE��@{��&Ҫn@|S��B�C        ?�8*�Ij?ڄ�A(��?���-�j?�sl�^��@���Ca�@��l���@@$U8hn@�(�Q��@k����@�<�_@"X��BP@$�g�I`�@(y3#��@+W��쑿@.�qPhd@1'Q1![@3 ���z@4�Ժx@6�9.'"@8�gK��A@;�rN�@=@m
=�,@?}z��}�@@��a��r@BxPdm@CGb��O@D��8�v�@Eƶ��0@G�z�?�@Ha��,nm@I�t�*zH@K���D�@L|M@)��@M�L�=N@OX����@Ph>�W�@Q&����~@Q�1�Dz@R�N�i@St�qI
@T?��H@U�+�:�@U�34���@V�:�%sV@W��^3V@X^4���@Y9�$��@Zy	�fQ@Z��S ��@[��Ch@@\�o�b��@]����S@^�(P�@_�0.@`7��tJ0@`���Cp@a*��=@a�v+G�@b"x_�#@b�Ǆ��@c�Wk@c���WZ@d����        ?ƻ�Y+@?⑏m5�j?�j]���@ ��c��@	*��rZ@���%!@���@eKD�^@"����[Q@'W�_�@+�p�c��@0)ӗ�@2�;L�K @5{+Q��@8b�&�@;r���@>�
?�@A,~�o@B��P��@D�ж�l@F�$�PL@H��A.�@J�>���@L�qG��T@N���c�@P�ܳA �@Q��RD��@R�y.�@T �^�0j@Ub:�>�U@V�n���+@W�o���i@YU Y�\@Z�e!��m@\!��4�@]�:�*`@_�zGƊ@`@
� �@aO��F~@a�����@b�1ف�@c]��i=@d-�����@e ���@e��u�Z@f��6�x@g�8*��@hm5�R@iO��J:@j5���@k�9&q�@l
�IZ��@l����a@m� �g @n�=��$@o�܎L��@pi)�*@�@p���i�<@qgա��@q�=����@rl��@r�b��~@su��횧        ?Ĳ6*:\
?�j� �d�?�TxoƎ�?�Y�E��	@�W�I�@��l��@g5u��@F��L@!�Xo�G@%ɞ�/#�@)��ҮU�@.��R�
�@1��%#�h@4C�j.�'@6��e��@9�'�V��@<��m�*]@@g����@A�A��0�@Cf�D-k@E0*��@G
�e
��@H��e&��@J��}f�@L��iB3@Oݔ�~@P���yQ�@Q�I~gH�@R�nyK��@T�>A��@U?�<���@VyE��5@W���+�a@Y��֯0@ZO�{m`@[���li@] O29Z@^bBz]�@_ʌr�z@`������@aV�N�^@b9�l�@bԎ$���@c�С@d]�r�8@e&���E@e�%!B@f�M����@g���|��@hf�u�*z@i=9���@j��4y�@j�b���"@k��O�,�@l��P6WZ@m�Q�9��@n{H���@oc��>@p'BL��@p��A�� @q�&}�c@q���D�X@r��1��        ?�Ms��\?�J��i�@3ܪ6�@7����Z@���@"O�IT.�@(]p�^}�@/)f+� Z@3T��[P@7j�M/��@;ґ�cw@@Da��}�@B�,ߝ�F@EjQS�T@H2�!#bg@K�u�@N(H0��,@P��-A�@RO.����@T��]��@U�&�!
@W�4
��@YyJ��@[gk�Z:@]c5��w�@_ld�}�@`�Y��y@a�� ��@b��tC��@d�JՎ@e-U���@fW���@g��l��@h�����C@i�(V�@k8���V@lq�Z'�@m�X��-@o���~`@p9��# @p��=�@q�2/LY@rK$�j�4@s �٩(Z@s��uj@tsq�XL�@u0r��I@u��q2j�@v����H�@wu��k��@x<9��^�@y iC	x@y�:Ek�@z�b[V�=@{l�O�@|>�r��b@}�	ꡯ@}��Q�@~����4@�O:#��@�;ݪMb�@��Nс@�Z���        ?��\�x?ە��If�?����[�?�M���@@���K�@	bZ��:@�M���@2lY2/�@�����@Qb��j�@"vm.<B@%o�	G�@@(�i,�f�@+�m��ے@/R���X@1u��Ky@3T�}<4;@5E�����@7G�<5�@9[[���@;rPU��@=�Ӟ���@?�"��a@A&�cdc@BW���'�@C�����@D��M�I@F���^�@GgC��@H�׀��@J>Ķ�L@K|U�ja*@L���+�@NV��@O�Y���@P�i,oO�@Qe�u��Y@R)��3�@R��A�#�@S��,�.u@T���6of@UWFȜ�g@V)�6>��@V�s��86@W��p=�5@X��k'�@Y��-���@Zk�E��p@[Mm�ݓC@\1_�b�@]���P0@^ G5��@^�)��@_�I޳r@`c�_a8@`ܔ��3�@aVo&j1�@a�]5��@bM[�i�@b�c����@cHq<$�@c�}5>�@dG�2�        ?�D��[�?�sa
�0D?�C���?�..��@�~�b@��j_#@C?8 �@�;Q��@!�6�md[@%�m�lc@)�8���@.be��0�@1�}c��@4/����@6�����@9�H��@<���=��@?�����@A��&��@C^�؇@E(�$k�@G�	wOK@H�Р�l@J����@L�P��@O94�/@P��k��@QÄ�۹�@R���@TEf��@UM�6�0�@V����c$@W�� �@Yxm���@Zl՛W�3@[���>�@]&0޺�T@^����h�@_�ll���@`�3�y��@atl�r�&@b4׃�O@b�j�b�
@c���@d�� Y�@eU�rk@f%��=>@f���I]@g�^���%@h�)��@i��N�J@jau���@kB� �7@l'0��j�@mF��<�@m�#͡p�@n����Z9@o��3N@pcKNF@p�lP�@qY�Z�}@q�Z�)@rTfgט        ?�s��#*�?�/J�l:�?�-�ʈl�@ kKo�?@�{�oB@����e@���#y@:je8��@"���@&�C��x�@+fXX_�O@0����@2���+	v@5lMP�@8T�#��"@;f��9l�@>����R�@A�l�@B��>K�@D��a��0@F��׆��@H��w2<�@J�3��@L�ۯo#@N�k�C`@P�h�8@Q����G@Ssfi�X@T?^���v@U��&u(�@V�u���r@X+kj�^�@Y����Pa@Z�N�c�@\`ј�@]�Ԏ��*@_V����@`n��4�)@a5�F��@b s�m��@b��9k��@c�*MN�@dv�w���@ePV��; @f-<��۬@g��R�_@g�vA{6@hض�|�r@i�X�@j�S{�%@k��'�O�@l�8MR�[@m��z@n�*Z	@o�sR�,@pD���ײ@p�=9~�@qKRОP@q�tIA��@rWYq/�&@r��G��@si����M@s��A�c        ?��R(��?�@�k�=p@��~�@Md:��@���M��@!TJ6�E@'��E��@-u���� @2C�����@6P��$@:@��U�@>���@A��%�HX@D+��*��@F����V�@I����@L[�j�f@OR����@Q2�c�@R��#��@Tp��b[s@V#�u܌�@W���3�u@Y���"@[�fJ��M@]p4��@_b(��p@`��Tus�@a�K�4��@b�m�� @c���+@d�o��@e�Otظ�@g�w�y�@hA$vyz�@ij�Hhd�@j���ɢ@kːR7yg@m�/i@n?#�I�@o��<Y@pbJ6)�@q�j-MU@q����@rVm5Z}B@sD�F��@s��鮜@t\��
l�@u�oֈ_@u�8��%@vt���9U@w*휢e{@w��9t�6@x��2�ն@yX^Z��#@z���Q.@zԫ;�U�@{�_-c�@|W����@}�J@}�m��%�@~���:��@q�^e        ?��"x9>�?�^�]�?Ꞛ��e?��1Ub1D@ �lya@���ezD@N�"_�@�ؕEW@~��Y@x��И@!e�0m}�@$8�g�`|@'4&V��-@*U�T R@-�8�0o2@0�S ʳ@2I�� q2@4!�О�	@6	���7�@8x�u@:
+���@<!����]@>Hep��C@@>��*��@A`�9A�y@B����t@C�͔e�}@D�v�fH@F-��7�;@Gqc�P��@H�d�!@y@J���J�@Ka�=�8@L�1e�_�@N j��e�@O�|��2�@P{)M�9@Q4�=��@Q�w���!@R��� �@Sr�5E}*@T7q���	@T��(�$@Uȡ�!I@V�}[ƀ@Wc�՗�%@X5j@8ں@Y	E�d@Y߉���@Z�,��Pw@[�'�vJ@\pq-<�@]P,b�b@^1�xB:@_�cs�a@_�;!"L�@`r\�מ@`�@�b@a^c@aՋ��;@bN
%Y�@bǐ�B@cB ��        ?ŴX���G?���~?��n�?����[��@1L;;چ@$t���@����]H@1�R0p�@"/.�G��@&�`Se@*dzbs͈@.�Md]��@1��x�@4�u7�>�@7V����@:A�ej\@=Peev�@@A��m+@A�Mţ�@C���@Ex���N@GWT1�y�@IF�D7�@KE�0cJ@MU�7�@Os��E(@P��\��@Q�/9�@S��ݸ@TA�/���@Uu���@V�ڔy@W�ο@Y;0�8�@Z�ZS�S�@[���!@]<0G��F@^����R@`����Y@`�`��L@au���@b2��9��@b�Z��h�@c��-�+@d|�N��@eE�	:�P@f2Py	@fߌ�&P1@g��b[i@h�>"�c�@iZ�W@@j3OVk�q@k�*��@k�n�v�@l̬t@m�R�*�a@n�Y����@o{�7�q@p2�$&�@p��?sH@q�t��@q��P�C@rW�b��        ?�1�F?��V�g?�9WZ�{@ Fc�)�p@�)��\@s�7g�@R?G.q,@�� �<@"�'S�f@&���Nz@+!bhw�@/�~N�� @2z���H�@5.���C@8S�W�c@;$�~@><-��G[@@�]�L�@B���U<�@DRd~���@F3��y�@H&��.�G@J+�����@LB$�^�@Ni�#9l@PQA��@Qu� �q^@R�����@S��v�E@UO"�@VZk��@W�T���@X����R@ZX"��)@[��R�m@]&�|�l�@^�Q�[��@`	tu
$@`��M��@a���q�@bT�	��!@c��\�@c��c�}@d�*�u�@e��\��@fkѢ{�q@gF�T��@h%N����@iħjK@i�Q��C�@j��5Z O@k�����@l��sr@m��I|@n�L5��@o�\\�8�@p?CͲs�@p�D�+��@q<��T{@q�{H�,@r?� ���@r�8����@sH!ߘ�        ?�qi�;~?�%Ė��@����$@�<�\��@H)Z� w@!��%DP�@'�]���@.5��Fۏ@2�U�pg�@6���B@:��H �D@?�� ���@B3�i�`�@D�e@�@Gv�+��z@JJR02�@M=����@P'�|���@Q���@Sf�0q��@U�Ź+@V���r~@X�O4���@Z�J���@\w�t�y�@^o.�sq�@`9z���g@aAo0� @bOS�B&@cc	�^�@d|r���@e�o�"�c@f���Z�@g�+��@iǥ�l�@jM�`�@k�Y �@lī�*G�@n�[�@oO�bL�~@pN\8�x@p��P�]@q�
e�@rOB��d@r���b�@s�K�<|@tdx>I�@u����@u���hs@v�ڔIuQ@wG�Z_@xˆ��"@xů\l�@y�{'�ܡ@zK&�?R�@{�䨪�@{����`&@|� Q9�D@}l�hO@~8�\X<�@���@�D.�q�@�T��g�y        ?��Cʰ?��-[�?�
��}�x?�5֥SG�@�\V�_@8\�zim@���L�@�.�2�a@�`��3@ ���F��@#j���N�@&t�=�@)�����@,��ե�Y@09AC��@2��	@3���k@5Ԡt�^�@7��Ғ�M@9�M��|@< ���P@>-�I���@@4�#&��@AYe��π@B�<m1v�@C��u���@D�Gb���@F15/`(�@Gw�D��@H�,�g�@J�+p,@Koת?@Lε$���@N3|�|�@O����@P�=��s@QBE�ƾ�@R ɥ�Z@R��z��=@S�
�ܮ�@TJ�@U���<�@U�<�A@V����?�@W|b�	��@XOF�*%i@Y$�"��@Y�l���@Z֬�`@[�c!�@\��!�N-@]t5d��@^XG�< 1@_>�M���@`�y�I,@`�g� N@a +�jG�@axwB�@a����1@bk9��W@b�mK�"@cb�8�H�@c��w�*�        ?�|I�Kl?�GP-Ϫ?�q�R�?�v!�A�@����u@�����@k����F@�7>vx1@!�k-"P@%�Ю�:J@*yս��@.�X�4$@1��8
��@4O1ɭ_�@7����@9�U��@<�Tv��@@#<��@A����@C����@EN7�E�@G.�(�@I����Y@K ��L�z@M2Ȝ���@OU1��K@P��K�)@Q��~�uo@S���[@T>8���G@UvF/v�@V��'��@W����@YJ�zˋ@Z�0��!@[�����@]_�e_@^�2��Fe@`����@`ًF�t@a��{��@b[=2a�Q@c ��}��@c���%j@d��F��@e�{��@fWb���>@g,��1Q�@hrN�@h�i��b�@i��.�<=@j��;Ze
@k�ɘ�@lj��;c@mTđ�Ϻ@nA\7�Y%@o0���x�@pnw[=�@p���.��@q��}#�@q�����z@r+Q�M@r���6        ?ı^WV�?�x�l�2�?�gR��<{?�}"�]c@����Z�@܋�@@��Z邚@�#ܣ�4@"p��o@%����k@*0���s�@.��e�m@1����@4u��'o@7;4���"@:'��,:�@=;>tqO�@@:!��1@A�/�L@C�t��N5@E}�'�t@Gb`3�ak@IXg�=/�@K_m�|�e@Mw.�nH@O�f��{9@P���H�+@RO� �@S<(�}�@To�A���@U�b|��@V�X��\@X8����@Y�tfq&;@Z�e��v@@\Cx� �@]���� @_���|@`F�>>u<@a�� G/@a��t�@b�C���@cQ��k��@d�|d@d�/���@e�[S#��@f��/��g@gh5��@hB�e;�@i 0ğ4�@j �bd�L@j� ȧ@k�?\!@l�T�a|@m�5'h�u@n��,�L,@o7|�VS@p9��aH@p� h�-�@q1�7��h@q��/@~@r.����@r�n�[Zn        ?��l����?� � �w@�]ףͿ@0��@�����@!3=l�P@&ޕD��@-9���@2m[l&[@5쳴�^'@:���@>hό�WR@A����@C�O&j9�@F���
(@ID�y G�@Lɀ��@OC�ܠ�@Q	5�D��@R�E	+?�@T>�J9@}@U���ޣ@W�>	��0@Ys=Aj��@[H՞�34@]*Яp�@_�]�s�@`���:�@a�k���@b�j{@c�cn���@d�E�� @eФ�� T@f�j6��@h�9$��@i<�-
�]@jkN���@k��CΛ0@l�l�͏@n�� �W@oW<+�bX@pO)@���@p�+�-�@q�>�wi�@rG��U�@r�y?��u@s�w��G�@tT�`��-@u���@u���)�	@vu�QT� @w/��۟A@w�*ba�@x��V�u�@yj:�g�"@z,� �9�@z�7?g�@{�͢V@|�l_��@}K���@~�$��@~�7�M�^@���r�        ?�Y&v��7?ܳ����?��GZ?�E�Y�l@�#^�{@
Y��@WD�az@��Ų@�+�AC@ '�ե@#{U��v@&	��S��@)7�x�@,���k�e@0m�.�@1ҎI:��@3�7 �!@5��Ib.@7�@�\8@9��lx��@;��UP�a@>d�D_�@@&ՙ��@AN+�% @B|��9�@C���0:@D���Aά@F0.[^�@Gy6�d��@HȠpn�@JK�/��@Kz�\�b@L��G�@NC�����@O�E���@P�Nn���@QN�!7gS@R���@R����@S��|��,@T[����@U%s#7`@U�d��@V�VBV\#@W�i"�@Xdڨ́�@Y:�N�jH@Z��|f�@Z� �b�@[��p*��@\�����@]��F@��@^m,' N�@_R��{�m@`+��H@`�~
�.@a��RP}@a~��N�(@a��N9�#@bp�@b�+��@ce-���@c�/��a�        ?şK����?�@j�	~?���{?��:ԝ#H@�	E�P@��z+@���@	�Z0D@"�w��@&A���@*HG�#�@.���Pp@1�
�I��@4���y.@7L��@::�Ue�~@=O;�䢺@@D�70�m@A��Z�$@C��W�@E�G�t�@GnZ~"+�@Id�y6�@Kls	@M� �XT@O��(��4@P�&@R�Y�I@SCM�8�@Tv����@U��ŭ�@V�����@X@&��+k@Y�i��@Z�"�b�@\Ka�HW@]�����L@_ �QJ��@`J�ZǸ@a��@a�'��H�@b��u�Q�@cV}�ˈ�@d!z�ex�@d���@e��)f�@f�4ks@gl�,��@hF�K���@i$C9�4�@j���v@j�ڒ��@k��ac��@l����7�@m�p&S�@n���>j@o�@��8�@p;!���@p�|DG�@q3+o�3@q�,OX�@r0{8-D@r��{�        ?ćN��?�`g��y�?�O�5w?�R�*�@�A��֙@�A�F��@a�%��@�8jT��@!����3f@%�߶�G@)��@�c@.�D~��u@1��3�S�@4@�n�p�@6��0h @9��pg �@<�x�D�/@@\�j�P@A��L�Y@Ch����@E3q�'$@G��2;"@H��5�P�@J��w;�Q@M	fk��@O(WL@P�S��'�@Q�~jwC�@R�f�`��@T�T��S@UU��O]@V�uʭ�w@W�?u��@Y$>҂�@Zw[MЗ1@[�{c�q	@]2���ID@^�d4���@`}yN@`�p���@a|�$�@b>
�t@cM B`�@cɰ���@d�,"k"@ea���K�@f2=Ղ�g@g��i[B@g�1��|@h������@i��M�2@jp��?l@kR��;b@l7JDw0@m����@n�؛@n��(��@o���g�@pky��ɒ@p�� ���@qa\s`�.@q�2�-�g@r\F=��        ?��G���b?�%����@:&�@0�)�wt@����@!/�Ù9�@&כ��QK@--�`U�y@2/.ܰ@5�sWT�@9��>�kp@>O-qV��@Av� ��*@C���:}@FujP�=@I"m2���@K�f���@N�8��Z�@P�ô�2@Ry&����@T����@U��@Wqx ��@Y2!4X)@Z��lT��@\օg��M@^��0S��@`S�x�@aPgW=�@bR"\1@cY�IE@dd�bF.�@eu�Yr�d@f��!��c@g�	���@h�,<�@i�ߩam@k=�3�@l=����@mnx��.�@n���fr@o��B=�Z@p�Z�ƌ@q-����y@q�c
*�J@ru �b�@s�I;�@s��㇁j@tnM�@u|Vx��@uȄ�o8@vxc�R�@w*r�3�@wݔ�u�^@x��~�a�@yI�s�\@z�g��L@z�N<l|@{y�ds�@|7���E�@|�?_:�j@}��&��@~{��_e        ?�i[�mQ<?��X�*�?� ��K?��c�$�8@Hu糼@��Qae@�&\#�@)���V�@�a_@��@�R� ;�@!��n���@${��l�@'�����_@*���Mr@-������@0��x���@2�[�$@4h���y�@6X����@8Y�M�y�@:j���#�@<���Y7@>��5@@}�D2w@A�;�P�{@B��f�ϥ@D	��0P@EFe�:@F��F?�@G�}z�)�@I%�w	�@J}:�S��@K�@��m�@M?�5Rl�@N��=t�@P1��@P�YjsF�@Q�`UI6t@RG6�4�/@S
ϏGCR@S���Z�@T�Tf��@Ue���r@V3�����@Wh��i�@W�~�ZC[@X�����q@Y��|)�@Z_AxAU@[;�T@@\tT��G@\�xI�6�@]ު\98�@^����U@_�u����@`J�e��@`�J�^�@a7Q@E@a��V��@b'���9(@b�q	C��@c(�́`@c�ң7        ?�vS��?�Y6�$:�?�0ȟ�@ a�]7�t@�^=\��@���Y�@m)�rt@��c@"�ؗ��i@&�"���@+Fo7i��@0e5��G@2���t�@5P�䗆�@84��9z�@;@�� is@>t�Z���@@���P�@B���s@D|IjN�;@FbL�?�@HZmx�@JdY��@Lŭn��@N�dH��@Pt��3B�@Q�
S���@R�K#0��@T���}@UA�p�~@V�����h@W�IgkR7@Y-]�,�@Z�����@[���;@][f���@^�IC7c	@`$����@`�ZN�Q@a�X��j@bn���9V@c94��y�@d�R�ڡ@d�A�h5<@e�����@f���[��@g[��Qi�@h8�)<=@i]"�B*@i�C@jໍ�#C@k�3�_n�@l�z��o>@m���\�@n�S,~��@o���Ѱ@p>��ٚ�@p���r�:@q8�ϯW0@q���!��@r7�T��@r����G@s<c��fP        ?�n��5�v?�:
�
�B?�&�ҝ�?�0H�F5@�� �@��'�ra@Ek+�f@�Bs��y@!��<A�@%����$�@)��A��@.y��7@1�pے6�@4A�H��@6����'�@9�D/�7@<�+H��@@ȯ��@A�o���@Cq�S-��@E>3%?Zl@G{�Ƕd@I	x�>��@K�9��k@M]Q�o@O4��P\�@P�D���@Q�����@R�ݒ��@T#F��0@UW�8���@V��sD�@Wրq��`@Y +��!�@Zp�TT11@[ǵ��vO@]%[8��+@^�n�K��@_��P�q@`�6���@am��C�@b+�:���@b�DF�Ӆ@c���#�@dx���lQ@eB�H�@fa����@f��I"N@g�/���Y@h�&�l��@i]�b^D�@j85�H�@k߭[o_@k�D�L�'@l�,5^Pg@m��@*�N@n�Xc��X@o��c��@p;R�م@p������@q*�:@q�Qq�% @r��2D6        ?����2I?�W����@�� Y�q@$�/��@v�M�;@!+�4���@&�P�n�!@-6��s��@2��>#�@5�q%��@:�}T�@>x��+t@@A�o`[�@D3C�@F���ͽ�@I^�扯Z@L6�/��@O,���Q@Q�#$[@R�� �T�@T]j0p@V��/�@W�SxQ�T@Y��H��@[yWz��@]`8R�B@_SV��
@`�9��@a�����@b��v��@cʷؿ��@d�l�h�@e��ͼ1�@g�9��@hDl �_@io��p��@j�V|o"@kղ�ը�@mܡ8@nN��Eƣ@o�>$��@pm%���@qh�/�@q���o@/@rfy.�@s2�ou@s������@tr����@u%�ä��@u�{J���@v�8k�{�@wI�LT��@x[>5@x��A��1@y~��ۛ�@z>�A>j@{ f��o@{���@|����Ӏ@}O�`��@~O�^ġ@~�y?�7/@�D�O�        ?�O�bNM?�亮AH�?��z�:-x?������@��S/@��4�x@@��f��@�L׽@C����"@O -�@!����Q@$�~Sv�k@'���1x@*���~hk@.���'�@0�����@2{�uw�@4Mp�i@6/ �tn@8�Po�@:��>
@<,[N�h6@>G�P��n@@8Ê��@AR�e�b@Bt4���m@C�� Ӊ&@D�k�\z�@E�"�,|@G6�Ay�@Hv:�R@I�g$�iA@K-o�,@LVq�H!�@M�9�;@O]���@P3����@P�4��% @Q�K�4�@RR�ç�c@S�/���@S��y@T���E�@UH� Vk@V�Pp�@Vб8_�@W��N�@Xa9(�0@Y,���.@Y��￭�@Z����@[�-(�w@\m>$���@]B9<�@^@6Xy@^���t@_̩vBe#@`T���1@`���-8@a4���@a�8���R@bF����@b�=���k        ?Ƴ�Zv?�lN���?�^$9�Y@ �5O�@	ݯ��@�˜�V@���%D@MA�+��@"�"C�v@&���ۄ]@+p�;��{@0ֵ��@2��i$0@5p�R$�@8X����@;i~f).�@>���f��@A��A�@B��ZF@D��\C@F��L�&@H�BZ�p]@J��3�3@L���l0@Nݳ:'F8@P�ƒ���@Q�&��x�@R��`��@T$��B]@Uf�D���@V���c>w@X;�9`�@Y[��Sq@Z�����@\%�@]����c
@_��&O@`Eaui@aʉ���@a���5�@b���	�@cd��̤0@d4�Y��@e��ߐY@eߒ��B@f���N�s@g��۵�@hw��b�k@i[)�V@jA��BH�@k+��V��@lQ�j0@m,�:�@m���U��@n�T�ݝ@o��/��@pre.��@p�8E���@qq���*�@q��:#J@rv���ʎ@r��ۄ�@s���4��        ?��nQ8R?�����?��ɇ?�P�,��@	f|~�@8���T@�֡g��@�5�]�@!Q?�ݲ�@%��B�`@) ��Q�@-��f���@1e��zW@3�}C��@65��:�W@8��@\@;����t@>��@A���.f@B�SU��m@Dk+R�7S@F1�'q.@H��#@I�Z#Q�&@Kᣵ]��@M��7:@@O�ٰ�i"@Q
�p��@R!1e}8!@S>���_@Tb��Q�@U��k�`@V���>�@W�F}�@@Y2�!�CF@Zv2 "�~@[��R�ײ@]�q�RL@^d)�@_��'+@`�|�M25@aBM���h@a�Ʒ�Ҹ@b��JT)O@cj|���&@d'��6�p@d�>�E��@e�Ie&�H@fm��x3�@g4�%�@g���C�k@h����O�@i��X$�@jf|dH0�@k8��Y��@l�Ep��@l�y��Q@m�n*֝�@n��˹��@or^u�f)@p(l�4o�@p���R�@q	ڎ/         ?�
�Q[o�?�8�q@��5�@<�� m�@�e���@!;;lR�@&��,�1@->�[y@2�p�h@5魚iו@9�<�A�@>Z���X�@A|�N���@C�`;�@F{q
�OV@I(M�)h@K�Nހi@N؝.�a@P�6�6��@R{��s�@T���@U�ϗ�^W@Ws3ݶ,�@Y3����@[ 	�'a�@\���8�@^�2A��C@`T��8�@aQU)�ɸ@bS4qޤC@cZD�Ǳ5@dfm@�R@ew�R�E@f�� ^�c@g��W09�@h��m]�@i�\�7�>@k9F]#P@lB�O\��@mt|�wW@n��)�u�@o�e.��@p�%��{�@q3��TP@q�Pfm�@r|�S�2"@s$�rt�@s�5�e=@ty��m1�@u'$5��@u�f{b��@v�{�q@w:]�@w�"�@x�n��0@y]�P�@zv��T@z�
ލ�E@{�M��kJ@|O9ʪ$@}ʵ-d@}����@~����h�        ?���R%s?��?�aN>?���Q1�?�v��3Q�@Y4Cߜ^@	zA�+@�Y@2��]1�@1K�x�@/�؇tm@"W��%h1@%>�`��@(J�׵�@+z���Rm@.�D��@1lVb��@2��jć@4�c�ƕ\@6�,u��@8���C�@:�0����@<���5J@>��F�-@@�K�w�@A�V�X�@B��3%B@C��@��@E����@FS	A���@G�?��@Hо$�\@J0B�(@Kd���5@L�.��S#@N�	ýN@Ok_-r�@Pf���u@Q�r��@Qϙ8[��@R��sִ@SA�����@S��D�{@T�P�)�z@U~5���<@VA9z$�J@WUPsſ@W͂B/n<@X���A�@Ya���@Z/%Tz�@Z�LgW��@[�\�\;@\�L��k7@]wjp�-@^M�u�F�@_&�Ims@` f^�@`n�H�n@`��GH�n@aLu�GO@a�䊷�@b.����@b���3�        ?����6m�?������?��]CU�0@ r��[@M�O�P�@�Y|��@�q�0��@FV[r<@":!�c+�@&*H4�t)@*q,Dza@/� �@1��:dH�@4�;G\s&@7a�$)�@:M\"5@=_D�z^�@@K�o�=@A���g�,@C�gV�@E�����@GkAș�D@I^�0k�$@Kb��)@Mw�	�@O���P0@P�nb��A@R
��AF�@S4�\�@Tf��X��@U��D�@V����vX@X(��ݱT@Yx[��|i@Z����@\,a6��H@]��_rI�@^�9ƺ*@`7�&��@`�Pf5j�@a��L`�S@bu��^*3@c;�-�b@d�~�߉@dЭ(b�@e���l�@fr
�?`@gGBxWT@hd��.�@h�p���@i�\�2��@j�^���@k���X��@l��o�;j@ml\��}@nW�{���@oF,����@p���@p�e�>P@qy�W��@q�Ѝ��@r
f��Q�@r�8\�n�        ?�4���5?�����~?����%sw?��0�%B�@[����@s�w�+3@���@6"����@!���z��@%`�:j��@)���H�,@-����Pd@1[����@3�m
�z@6�*�(�$@9ch�@�@<Y�g���@?sz�#,@AW�(~�+@Caa��g@D�ӎ�o
@F��[K��@HuI%�)@Jd�f�y)@Lc��c[�@Nq����@PGM'f*�@Q]"���$@Rz0��@S�W��=�@T�y�yw@U�{���@W4@C���@Xs��Pi,@Y��pԂ�@[���]�@\X�־�!@]��� �@_��Db�@`:тH��@`�M�zj�@a�����M@bc���5@c"��'J@c������@d�� ��@el��Q�@f5���tB@gS.��@g�gM�_J@h��X�N�@is
;^u�@jH�N�B�@k ^���@k����*�@l�����@m�����;@n����@oz!�\�	@p/� r@p��bA�]@q^��Tr@q�:���        ?�a1��`�?��@x�c@���b�@�~Ǆ� @�Rf��@ ɬ�n�A@&O<px
�@,~b�I_@1����f@5Y)-�&r@9S!C�y{@=�͜(@A�T�T@Cfj�p/@E�٢���@H|R�_�@K1@2�w@N[��/E@Pu�~�U#@Q���8�@S���3�z@U���Y�@V�m'�@Xv�K=�0@Z2���@[��-C��@]���^D@_��2��Q@`�WT�d�@a�1+,��@b��K�E@c�V�@d�s8SH.@e�2Ozr@f�A0�}Q@g��5�տ@i�ߙ_@j#w=w�t@kC{��q@lgx�7R�@m�SÒ�@n���%Y@o�;Ǥq@p��TY�R@q)��c��@qƥ��@re:�oJ�@sqZ
*�@s�>�4�.@tJ�>�5@t�x�2/,@u���;��@v=�!il�@v����@w���q�Q@x=�k}z@x�n���@y�����Y@zJ	�21 @z��֓�@{�q4��,@|b���!@}
�py        ?��g*?�I�`�Ú?�}Fl��>?���'�@���J��@
��d�@'r����@�?;r�@�&���^@ �71@"�"v��@%��ge@)	�͛�@,\��H�@/����@1�5�e
@3�oұ�z@5�C��Q@7�1�ͻ@9��u�f^@;�m4w��@=��L}:�@@!��u�@AKc~�T}@B|A�צ@@C�PS$}�@D�d��X�@F9X�׊@G�����@H�F*�+@J3Z���@K�$�Nof@L�����@Ne�ݞ��@O�w�w @P�m���@Qg�ڗ�@R)z��]@R�<��{@S������@T� ��Y@UL�� �@V�ὣ@V�dE��@WÈ��@X������@Yt�%� �@ZQe���@[/�*V��@\�ӊj@\�nǅ� @]�CujS@^�j��@_�ޘP(@`LΘ�@`�P���F@a<�iQ�_@a���b��@b1���@b������@c*�>�7#@c���r�@d'ޤ�D{        ?����A�&?�	���#y?��/YȬt@ �^���@~��9�@>��n�@�\|B�@��J�2@"k���@&h�p�@*�/�ȃ@/iI���@24##�
@4�/�h�J@7�A�M�@:�k,kb@=��#I2�@@���7O@B5�`g�?@C��\�B@Eӫ�~�@G��贏@I��P�V@K���jL@M�_e�c/@PwS�}S@Q",��1@RG�yI�@StȹF�!@T�e����@U�]'���@W(�V&	@Xr��?�2@Y��[�3@[e�]!@\z�{�@]�K��Z@_L363�@`_?�b�^@a�֐��@a���Rd@b�Y� Y�@cb����t@d+!]e$�@d�h�c4@eĎ��x@f����ī@giU�<$@h?�+%H@i0Ʊ��@i�0<1W}@j��x���@k�&�=�e@l�8t��@m�J�$�@nh��-��@oTm��@p!  �_�@p�8m��@q�a��v@q�I�e/b@r	u^f'@r��)        ?�0�)N?��,`�C�?��I����@ "�h�G@�D����@F�w���@�؜P�@����]�@"u���@&tkX�S@*�U�}g@/y����@2=b��h@4���L�@7��/d�f@:�� ͊?@=��M��@@�P��@B@��}�@DF��n@E�H7')|@G���.��@I�hX�B>@K��~q�0@M��x@P�Sf�v@Q-0o�ܡ@RS�����@S���p+�@T�g��U�@U�|�L@W8��a1�@X�Z7�&@Y��C�KI@[0J7�o@\�w0���@]�I��@_d�7D�@`l3+LH[@a)9�V(�@a�Wd�@b�q"^�@cr��Y@d;���*@e�,!f0@e֙VN@f�Dw�se@g|�su8@hS� �ҽ@i-��
�@j
-��@j�>N�!�@k��AH@l�����M@m����GJ@n~�J��M@oj'o�O�@p,Xhݗ@p�!��,@qkKe�0@q��/��@rs� ?@r�+2>�        ?ՙ,�J�L?����;?�@٤����@K�s�Y@Yl5�c@!g
�5@@&������@-���*@1�O��@5��=A@9ڪJ@Ǎ@>4Uj��T@Ah��iCg@C�P�h>@Fg9O|�-@I���ym@Kߙ���@N�F2)o�@P�l����@Rt�4��@TU�ǉ@U��1�Ye@Wp��͇�@Y2�I��@[-�.@\�(Kҙ=@^��4�@`X�����@aV�-r��@bY�ս��@cb����@dpm����@e�^�Q�e@f�N�-�@g�')��@h��m�"�@j >?l�@k+W7���@l[o�?�@m�H�DDY@n��C�4@p�,
��@p�E� �]@qF��?�@q����@r���
@s;*U�ԋ@s�=�m"<@t�O3�@uBXr��@u�R�23@v�6�@6X@wZ�g@,P@x�;~�@x��®*@y�j�す@z@��+�@z�^�p��@{���X��@|T��_�@}Bc���J@~"��ޠ@~͍���"        ?�IP�#�0?���`�S9?�=o��?��%[�/�@�x�ڦ@��4z��@VK��є@�Ց�@u�O�I@���+.�@"����@$�#��@'��[�+@++Lq���@.�3Da\@0�J�=�@2�+`� �@4����z@6���v`�@8�(��@:�ϧ#`%@<�����@>��I�9�@@���@A���;>@B��}�#N@D!bWV�@EO�9D-@F��X((�@G�ό��@I��r�@Jk���X�@K�3���@MB��@N|�<W�@O���H5@P��7�A�@Q^�$^3�@R6�_D�@R�	,_@S�+�C4@TV�<��@U(���&@U���]�@V���h��@Wq��j�"@X=�vWP�@Yhe�F�@Y�,���@Z�����@[�]�ѕ�@\U����@],�Ԍ�@^ڢ�G@^��=�@_�ٔd#W@`Mh�J�B@`�0�S5@a-£�@a��4*�@b6�=��@b�~�v@b��?�Y        ?�?�;�?�C���?� B�(@ U�<�, @�9�_�@}
ط��@]䱙��@^uGX@"��8:=@&���C��@+4	�)�@/��[��@2��	��@5A��/W�@8"s�� �@;+�_ɨ@>\��<_�@@�O�?C@B����@DjO�m@FM����m@HC��GǠ@JJԾ��(@Lc[�|m@N��D���@Pc��b�@Q���@R�Kl�UD@S�T��r@U(���8@Vmw���@W���S@Y_3S�@ZhC�I@[�E}>@]3Fa&��@^�%Ɗ��@`���o.@`ˀmN�@a�`���@bRr�pWb@c�M"��@c������@d�Z�EZG@e��sL��@fZ��@g1M-�:O@hl��p?@h�b���@i�&���@j�����@k�����@lw��'/.@mb�v4��@nO�"W:@o?ʶfG@p!�+�I@p��M�C�@qf{��@q�f��˻@r
��w��@r���d�@s
����5        ?���w��?�9[���?� ��D�?��޼Z�@:���'�@�w�]Y@�N/�_x@Tʆn��@"I$�:�)@&C$b�&@*������@/?H�W��@2���-M@4��fW�@7���ֲ@:��_8Ԃ@=��L�Ҳ@@y�a�c @B/_�@C��6��@E����P@G��z���@I��
6�@K���m0@Mᤁ�;E@P� _�@Q&��>/@RM�+St+@S|�~���@T��o\@@U�E�j�@W5�#�.@X�FW�)G@Y�ŀN��@[0B�˸�@\��Y�[�@]��AX{@_h����K@`o�Iq@a,�A9S�@a��ZI�@b�[�=*�@cy��w@dD&z�4]@e�!:~b@e����O�@f�@i�ٮ@g�j5(_@hdf����@i@,�	l�@j��ʳu@j��|S�@k�׺�,@l�dB#�@m�����@n�AD�I�@o�8�i�@p?�p�@p���"��@q3��B@q���*��@r,�Ҁ×@r��`�L        ?վ�%�?�`G��@�2|&_@����%@X�v(�o@!ן4�@&��<+��@,����t@1����ڧ@5�K~T�K@9żm��@>SaD�	@AU��G�e@C��a��@FGG�E|T@H�e��@K�{���/@N���f.x@P�j3� |@RM+E��@S�j�B�_@U�ʇ�@W4��� �@X����:@Z��`F�A@\�*]�@^`�����@`#+s�&�@a7���!@bGA�s1@c:�Pi�@d ����@e,S\$n+@f<:`�I�@gP�5�Ք@hi!at�g@i��'gi�@j����1�@kˌ#n�@l�;����@n �$>��@oP�x2�N@pBS�\bB@p���k�@q{[ w��@rh�t=@r�B^��@s]_;
E@t2�x�@t��J�@uMU�Z@u����m@v�2ryW@wJ3P2<@w��ԃr;@x�9)�@yS2G�i�@zr���@z����c@{g�1�I@|�Gm�@|���w�[@}�	�q�        ?���`P�?�v�Zn�?��.U�?�^�}�@��ꋻ�@v�+X��@!�5-(@r��l�@$C����@0��֧�@!�+b��8@$��mz@'���nz@*��M�ػ@.
=#�@0�A����@2}�C�3U@4RX-U-@66VX��l@8)_��@:+�95U@<:��R��@>X{Zu�b@@A��pW@A]��X�@B�TG��@C�\��@D��irT@Fn���	@GF��ɖ@H�5��M@I�.�y�@K�{��@Li�B���@M��/4a@O��m��@P>�cm�@P�+�|y�@Q�	>nU@R`{�q��@S|Y�"?@S�����@T��ˇk@U[� ��@V ��Fz@V��W'�@W���.��@X}����@YK�&�p|@Z9|�3@Z�փ'��@[×�t��@\�u�P�@]sb��\(@^NV��@_+E�ɹ�@`��@`uy�-@`��Q�@�@aY9���@ảΔ2T@b@�Vm1�@b��[Ԩ        ?�Ptm§I?�1s�`�G?���߯%@ ;f{@�ε�e@]9��0@1ղ�S�@�"9�S6@"����E	@&�Nka�@*���`��@/��K!e@2dGJg@5N96@7�@Z���@:�C ��[@>%jY�XU@@�Ǟ�@Bz�P&t�@DK�i�{�@F/���es@H&�q��@J/��F��@LKwR@Nx&����@P[n��(@Q�v���@R�J���@S��1�w@U.r�GE(@Vxȼ�@W���]�@Y#����@Z�x�ny@[�)�dE@]`���q�@^���8��@`-Yֻ�2@`�#,�@a�|_�<@b�i���@cTf�_@d'N�v@d�˗��@e��hw�@f�[e���@g�[f�@hzɤҥ�@ib���@jM�m慾@k<>����@l-�}ɽ�@m"�w8X`@n���@o\��R�@p
c|�m@p�$��V�@qnQ��@q�=��ݾ@r����@r�_����@s%��<j]@s�sb$��        ?���he�u?�C�)e�?�2C���@ f w���@�-y��@��j�!�@Z���%@���@"���_(@&�8���@*����5n@/�l�3�@2N$�\�@4���=.�@7��B_�r@:�}e�@=����@@~����@B,����e@C�(��E]@E�w�>m�@G�Pz���@I�`Lo	*@K�U�!��@M��1��@O����h@P�/�Rq�@R��@S;��E�(@Th��V��@U��u��@V�ls���@X�i��t@Ya��@Z���N��@\�WVG�@]`!�<E�@^���@`Ŷ�)_@`˯נŔ@a���d�h@bBh+�#�@c	�B|@cĭ���@d�	��T@eR%Z��@f�d��@f�t�ծ@g��B��#@h�F�V@ib����@j:DN��@kx �q@k���@l����&@m�`�u�G@n�����@oz��ɏ�@p1q2ks�@p�� �@q��w�@q����@rR�0�        ?����B�?��k�G@���+��@�!�7Ȼ@�cMO�@"�_��w@(��;�c@/��\��@3�Z�K��@7���@<3v��:;@@zy�j�@C ��bJ @E��`��@HxM��(�@Kghc){Z@Nwe[۝�@PӰ��@R{C�%��@T2>\l�@U���@W��_�@Y�15:@[�k�>@�@]�:��@w@_�U"���@`߼�x�v@a�5�#v@c
�:�R@d)���L@eOl�ɹ@fz%Z.�@g�=Pv�@h�=:vR@j-��@ka��r�@l�
�r@m���?�@oK��5Ө@pR_�8�@q���2S@q���G�e@rht��@s�XS@s�ѫ���@t�d)(:@uU��Z��@v ��'@v�7��ɂ@w��3̄�@xj���9�@y6 -h��@z���@zӒ�J�u@{�º�{�@|z+^�@}Pvt�@~)��<`�@b�0�K@�`��2B@�`;�)��@���q�$�@�Bn�(M�        ?���o�.�?�<j]�!?�f_Gۊ?�@np:@�3�Q@q�ì�@(����@�����U@Q:�:8@{�v��
@"1Y�Y�@$�o�}�@(
8%2�@+Ldyh@.����1�@1"u�>��@2�l3��@4�>Hx�U@6�u���@8�4�1@;\x���@=A1�� �@?����@@����@B%�ݣ�@CJ�˔�@D��t�0�@Eˎy�@GHM�L;@Hg�@=��@I��|�`@Kj����@L�k��mZ@M�ɹ�@O`>F�:�@Pk�V�<@Q*�7#�@Q�l�H�u@R�
s%�@Sx���;@TB�sI�@U�a�/@Uߌ]��@V��S�݋@W����O@X^�P��@Y8�fr�@Zy֕A�@Z����B@[�DY#�@\�O�V/@]��&>��@^���]�b@_t����H@`1 ��m@`��y��@a"#T~�@a�^h��@b��Lh�@b�8�X!A@c��v@c�~#�6@d?����        ?Ƶ��|?�Nl�Qr?�~zBS@ ��X��U@	M�t�@�#��*@�ϛ�+@�0���[@#؊*�@':�n��8@+��=�؃@0L��8S,@2��-@5��M\@8�����@;�0���M@>�"�:\�@A.x����@B�xS�Pe@DѽQ�3@F���J��@H��m,V2@J����@L�io��)@O0��5T�@P��㍏�@Q韋�~e@S*q�)@T]")!	@U�h����@V���U@XHn`:��@Y�����@[T���n@\{s�O@]�5
���@_n~��O�@`y��E�S@a?�I��j@b	P�}<�@b֐�kB@c�Z};�@d{��tu
@eS_�^%g@f.�i�#f@g�e6q@g��X��@h���y@i���S��@j�.'� @k� AVEP@l��x/XT@m~z�(�@nv �"�r@oqB�)e�@p7��m�@p�6M�]�@q:/�H�@q��K�}@rBj늈@rȠ��y@sP7�=�{@s�)��߿        ?�"�0��?��גZ��?�����>�@ �����@~#eB%@@B�W�M�@��'@�-hbkS@"x�	]K@&zVl���@*�b1S"�@/��KR�:@2F%4&eH@4��k�@7���?�@:�HHk@=����@@�U_D��@BK�;� @D&J�@@E�|c�(@G�S�J��@I�Zpń�@K�E���@N�_���@PSd 5@Q8��>��@R`$&T��@S�C�	�@T�}��@VR���l@WJ���N@X� �w@Y�)���@[FdM��@\��ӳ�@^���*@_�x\�R]@`{����@a:����@a�Q�6��@b�S9�@c��p���@dT�D5�@e#4ۑ�l@e��L�<@f��LRq@g���jw@hz���A�@iX<�XK�@j8d���@kbز8d@l-�%��@l�|���@m�7X�@n��K@o���^�@pS|_kr(@p�n��͏@qJ��RK@q�*���]@rF�Y�A@r��L�\�        ?�25�^�L?�CF����@1%�-Um@8M8J@�mu�@"Se��l@(c��*�I@/2̴�p�@3[|nC�@7s����@;ݯ���.@@K(u@B�2Y�dQ@Es�a�@H=7DB�l@K(�&_'�@N5�m���@P�a�n��@RW�b�eY@T`���@Uї�4j�@W��'�e!@Y���Dg�@[u6�:@]r�HU�@_|mD�Zr@`��Ď��@a�x��@b���g@dL]XL4@e8!���@fb�*�tx@g���T�<@h�d�>@jɔX�#@kHު��@l����?S@m��T��@o0�{�I@pDNB?�c@p��+z@q�U$��@rX:�u� @s��W�@sǙ9���@t��V;�@u@Ϋ�B@v ��z�#@vÆ��^t@w�[�I�G@xOt%eI@y��3@y�M���@z���^#�@{�֌��@|S�X�c�@}'���$�@}�j&�@~�8M�@�s5�<X@�FWjx�p@��r�Y{@�%��t        ?�5'gWGN?�׮��j?��n#��i?���˝B�@��6S@�YwF�@H� ,m�@�f�Y�@b���p@�SގN�@!��:��|@$����W;@'�I��-�@+(DCB	�@.��aH �@1>��Y5@2���x�@4��j��c@6�1qw�@8��6@:�=���@<�e�91C@?/�/�@@���H^�@A�����o@Cr�P�@DO
�@�O@E�{��t@FԜ1�@H!D�QN@ItM@J͎5�n@L,�B��@M�4�6޿@N�]u�_@P7#J:�M@P�k:�iZ@Q�wԉ�n@Rq8�/J@S4�g��=@S����n@T�%Ү�@U��TւW@V[9"d�X@W*�q+Y�@W����%/@X��}e��@Y�]PBo�@Z�+���@[Z��m%c@\7l�-@]J:^�@]�2�x��@^�	�o@_�F��s@`R�G/
@`�E0r@a<�;��@a���	C@b)��V�@b���z�@c[,I�z@c�䍝�y        ?���6��#?���>��(?��2�O��@ ����@d�E�8y@.���o@�W+I@|��5H�@"a:����@&_�t�C�@*�����@/e�7�@24a�6�@4߅-���@7�MOU@:��$h�@=х��F�@@�64q��@BDq�(�4@DcD߭@E��(�O@G׌�1��@Iַʍ�@K�&��@N�q��s@Pc2l҃@Q>�D٨�@Rh/N!@S��#E��@T��@V��X	N@W\��̉@X��7ӴN@ZY��7@[c;,�@\�Vه�@^6��XP�@_���@�@`��@��@aT/�3dz@b��P��@b����%@c���R@+@dz9��g@eK�8�#@f ��rTF@f���8,�@g���5�@h�W]�2_@i���f�1@jw���5@k_6o��@lI:ǝ�@m6E!u�@n%�v�@o��ԭ]@p�r�t�@p��Hf�@q ��J�A@qQٮ��@q�nDL�z@r�����@s��sT�        ?Ć����?�`��Te?�R�&Ft�?�_�D�V|@��v��@�{_��h@{�i��@�$�3<@"���|@%��h7�@*0���W�@.�$�2��@1ڭ�N۰@4y�(p�.@7A16�@:0���@=E�v4F�@@@�d��	@A�'���@C��V��w@E���j	@Go+*���@IgR&��@Kp�bP@M��8��T@O�Gؔ�@P�{���@Rٟ���@SJ6�Go@T1r��@U���p�@W VO��@XL5��]@Y�|{���@Z���U�@\[؜��K@]ĺ��'L@_4����@`U�b�q@a�����@a֯'5��@b�,�s��@cd��� @d0��:�@e &u���@e҂�.�@f����@g���{g�@h\-���F@i:�L�-�@jpGr��@k��@k�}Y�b9@l�����[@m�����@n�%O@o��f��@pL8�h��@p�Y���i@qEѲ^�@qě���@rD��l�@r�:3�?        ?��V+��?�}�U�b�@VU�R�y@Cl���@�x;&΃@ ��R��]@&,f@,5*;:8@1z��$�@5%��Z��@9���
,@=NZ��+@@����+@C>N�� @E��Լ�@HN��J�Y@Ky���@MќO泾@P]ȚeK�@Q��S�@Snv�b�@U	v �q�@V�q,�j�@Xc�Kկ@Z!|@[�/B`ύ@]���}�@_�m�ү@`k	��@a��]BY�@b�$�sw�@c�7�A�@d��*��@e�y���@f�~�Ck'@g��G�a@i�Glm@j0��g�@kRb��$@lx����@m���sE@n�uurh@pNq�5@p�}�[�C@q:�l�}@q��U@rz=1�Q@s�	^%<@s���
s@tg����@u�'�1j@u����@vb𞅃�@wq���@w�|G��@xml'-@y�^li@y�{��dU@z�X��)@{9���m�@{�9DG��@|�2D�D3@}a����        ?�G)]p�?��`J˂?�Y���?���~
@Ԫ���@���=�x@K���0@�7D���@P��}�h@]�<��j@!ߺ{��@$�8O�_�@'�����@*�#�ٶ�@.(�|��@0�ƇL�N@2��ZD�@4i�{�ۦ@6Qt1�I@8H�j�@:O�X��@<e�f�3@>�\���5@@^��Ǥ~@Adx�l�@B��/�@C�i(��@E
��l�A@FF5�.u�@G�T$�@H���G@Jna�@Kt.$vC^@L���I@N/f�Q@f@O��]R+�@P��>s.@Q9Mg�]_@Q�����P@R����9@Ss���}@T6A9��@T���J�@U�4F��@V���`S@W\/%n�@X+�T�j#@X���O�@Y҅ �e@Z�mr};)@[����m�@\^A�K	C@]< 9�o@^C����@^�����@_�Cy��@`ei���@`ك= K�@aO�d)B@aŤ��U�@b=F-��1@b������@c/����0        ?��ݦ�dS?�E ���?�n�n�>?��qW�#@x��7@���1q@�?F��@WD�ER�@!�E���@%|��&�@)�j�2@.�ђ@1t܇�A@4> ��j@6��ݪ(�@9��>�9@<��u'�@?��:1��@AuW9�8@C'���E�@D�p�Ō�@F�c����@H�� ��@J��ZQo&@L�<<���@N�:�T�@Ph%(h@Q�� ^.�@R�Eci�@S��_m{@T���Я@V)��T#@We���@X�$VJ*N@Yﴡ�@[>����@\����@]�a)��@_P����@`\I��*d@a�4;"@a��:�-�@b�W8�Z@cH����@d�v�@d��m*@e��ɿ��@fb.�»q@g/C�/@g�����w@h�:�R.Z@i�	���@j}X���"@kW�bgg@l3P��j@m�0�T@m�ګ?'�@n��@o��)�8�@pQ���y�@pƼ��R�@q<י��f@q��}��        ?ă��k?�g�[��I?�\�klq?�rȿ�X�@�9�6�@��c5�@�cN9@�@����@"-'Ι@%�B��u�@*DR���H@.�?���@1�����@4� S@7Ry��l@:CZHBO@=[ۼ��@@Lj��R@A��
�'@C� �a�s@E�Z�S�@G�r]"�@Iz!�U@K�!�t�@M�,P��@O���S�=@Q�"�>�@R,q�[�@S[:�n@T��%�N@U�J�q�@WU,e?@Xc�� ��@Y�݊�&@[#��	<@\x�s�^�@]�*#�$@_T�+�@`f��e�@a&2F��@a�+4�e}@b�rћ��@cx�@O�,@dE�p��|@e���ԣ@e��s���@f��&��@g�9����@ht���@iS�r_�@j5����p@k�ʞG@lex{m@l��@	{@m�P���O@n˔�Dve@o��D5(@pZ��|@p�/%��@qS�*)�@q�A#$3@rR/<�d�@r�[��l:        ?��t���?�H��@z@���1W@�Hn>�+@jF�<�/@ m�&��@%�~�a2F@+�0uh��@1O�X��D@4�]�Z�@8��
j�@=ѥP4�@@���w�@C�\�@E���Z�@H#�4�Kb@J�ot�	�@M� ��3@PDR���@Q�U� Jz@SS4�}@T�&�@V�5�r)�@XF��]��@Z�Ә��@[�n=�L�@]����@_���9 �@`�o��.@a�Ǘ�|a@b�A�0�@c���{�L@d�;��P"@e̎�T�@fߪ�!�?@g�y�#�@i����!@j4߯ �@kZN'?�f@l�!:�,4@m�F>g��@n��zN�@p�'yeE@p��B28@qJbքZ�@q�̲�]�@r�5XAX�@s4�٦��@s��@��@t�.R�Uj@u0Z%��@u�h,��@v�P�&P@w=��z@w��PD@x��>�$@yY��>�@z��_�@z�1����@{�WQ� @|C&��I�@}�&?,@}��%���        ?�P1��^�?��V�X?�0�?�Ďv`v@�O�j^|@��x7Y@[Ƽ�@�$�s�@{ciY��@�s�J�9@"
�vvx@$�_b�@'�b)V�H@+4���3�@.���X�r@1L-n�O@2�&4��@4�ྒ�@6���~��@8�Cχ@:��cO��@<�\�<�@?ۿ�Ʒ@@��O���@A���|f;@B��w�0,@D-�ei@&@Ehuu��G@F��"s/�@G�Dku�@I?8�R�@J�g��*@K����Ε@MN,Ņ�@N������@P�z2�@Pɥ q@Q��66�6@RD���!;@SEz�~�@Sʿ�~�@T��Z�@U[�C��@V(a��ke@V������@W�C2<?@X���<�@YtMKk��@ZM���ݳ@[)E_Ò�@\o��
�@\��R^�@]���I�@^�v���,@_�@rȠ@`A0ŧ�,@`�i���@a.�zP��@a�L;���@b �|,�@b������@c�e�wn@c�z5Q�        ?�p��7D?�� 
?�cjp54/?�c��h��@�ƠoCH@���U�@i֞e 1@����I�@!�	@%��,���@*��.�@.�x�Q�@1���g�@4T��k@7V���@9�N��}�@=�z:@@u���@A��&��@C��D��(@EPߗ�A@G0_|}�@I �*	�@K"+M�@M3��;l@OU��j��@P�ь���@Q�+�0@S�; ��@T<�q�@Ute�#Բ@V�!l���@W���{�@YF8@Z����i�@[����`�@]V��@^�#�X�@`Y*�@`�՝���@a�|-"@bOB@=C@c� �/@c��n"�@d���ȳi@ep���;o@f@W��K@g�#�m@g�?�\B7@h�bk��5@i�B����@jx�qE\�@kY�?8	@l;�&(�@m!~��ɏ@n	�ܑ��@n�-v��@o�H�6�y@phm(�%�@p�mE<=:@q[��F�2@q����@rS�q��{        ?���sY�?�B���,?�-!�Q?�*6���@��2��@���r̬@F�|xT\@��@!�3ن0�@%���tg�@)�|Z�X@.yn!��@1�;���@4A�T�eW@6�����n@9��6�@<�,w�L�@@���]�@A�YTb?�@Cs��8�!@EA19�@G`qsq�@I�fR�o@K�ٳ��@M촙
@O?Br�@P���/	\@Q�xġ2@R���@T-���%@Ud��{@V��
��@W�E	�R+@Y2��"@Z���)I�@[�9@�)C@]></.u@^�jT6'K@`	q��0]@`�iQ+�@a��]��@b@�Mu��@c>�<�@cʮ�u�@d�!�1�\@e`��OG@f/��o��@g'lk#@g�EQ�P�@h�8(���@i��0xt�@jgv��&^@kG���P�@l*���B�@m5��@m�n�*�@n�?ۿ�@oУ(mSF@p`HWl��@pـvd�@qS�ۺ`�@qϤ|��@rL�u.�        ?�fM�REa?�ń��~�@����Q�@����p@
A�@ �n�k@&m�@,�A�&�@1�IX���@5�?�O�A@9��M8��@=ԚnV�!@A2mgۭ@C���WV@F"�SiI`@H�K�G�,@K��*�@Nm}x��@P��񅷔@R@�� @Sُ�Z��@Uq8��a@W1��[~�@X�Ð�U�@Z��N ƽ@\�S ���@^t���#@`1gH4@a-�Ra@b/sw���@c6����@dC`^��@eU5.�֣@fl+*���@g�-X�Kk@h�'�cW�@i��˹#@j��(��@l)71��@m]b��2@n�/��}�@oӍ "4P@p��i��@q-ܢ���@q�4q�J@rz�Q�R@s$R0*r@s����@t}�J��L@u-�-9�@u�r�w�@v�EdՓo@wIZ��@x ̺��c@x�s��R@yu�����@z3g�R�@z�J��@{���d`�@|v���4�@};7�-�5@~��ϸ�@~ɠĊ��        ?������?����\�?�J�^���?��T�`�G@:���7@
�'H�H�@���T1@?����@OVY.]�@ ^w̎�@#A�J�@&L��g9.@)�PO*b@,�c�g@0+c��@1��ɗ��@3ܮN��f@5�"��
e@7�j+��@9���ZTN@;�\����@>-mh4�@@4C<`@AX��3@B���p!@C�Vl��@D�# J@F+�`n`@Go.�Q�@H�7�S=�@J	#L��@K^�\���@L�0�s�m@N^ʞc@O�KD?��@Pvbc�;S@Q.���@Q�{\2@R������@Sf\�B�#@T(]�DZ�@T�u���@U�VQ��v@V|?&��@WGd���W@X��ث�@X�1����@Y��j�4�@Z�Fs
�i@[^�6#2@\6;�ӽ�@]�t��R@]��oc�@^��g���@_��^��@`C����r@`�e|b(@a',����@a�7jî�@b#1��@b��fs�@b��P,@co�Q/|        ?ǧg3ާ�?�J�����?�&�����@-?����@
����
@Rk ��@o4�3�@UwP.��@#~�	�9@'��k��V@,>7��J@0�Օ�ߟ@3/�2�@5��T@8���r@<��45@?E��9[�@AWT�iH@C �@D���B��@F����#�@H�w�k��@J� bn�W@M=��v!@OO�E���@P�ݟ�~�@Q�5{�@S)��7��@Te�ِ�S@U���+1@V�v�8�W@XI0�c0�@Y��Un�{@[���'6@\r]4�@]�`�y@_]���2�@`o-��@a2�D�u@a�/�&ރ@b��i��@c����u@dd��g@e9Y� �c@fj܆��@f�;`@g�-JȜ@h����@i�u<x�d@jy0��@kc�:1u@lQ��jO@mBG����@n5�=?z�@o,+Z%'@p� ׍@p���?�-@q�Ϟ-�@q��D#�?@r�o�-v@r����4@s_80��@s�0B��!        ?�v��Z6E?�1��Ș?�ʫK��?��YS�@��:�T@��8!�@�Ϡ�#@Z�H��@!��z5�Z@%y�5@)��>jB�@.q�i@1m'�U@3�+��(2@6���P*@9x��#z@<oV��Q@?��DM@Ab��f�@C{	O�8@Dж��&�@F��'d&~@H~��9H�@Jmn(�ܣ@Lj��/�@Nwdi�m@PI)c���@Q]�/n�@RyJ����@S����Ŷ@T��y3@U�r�q�n@W*��/%�@Xg!��w�@Y���~�@Z�ާ��C@\A�E�7@]����L@^��ꈶ@`)^ND5@`�!|ǀ@a��4�
�@bJ�4�@c�2I�3@c��]���@d�W����@eGx3�@f"΅+�@f�M��f�@g��f@hl����C@i<n�nb@j<�4,@j�_-G�@@k��O��@l����Z�@mln��	@nI��E�B@o(��T�@p�BUO@pv�4)��@p镊���@q]V*�y�        ?���[���?��O��7�@�@��@�$Xs@���^@!�.V>�@'�6z��@.q��c@2�N
1@Q@6�8��@;�L��@?���^�@B1����@D�r��p@Gb�0tL@J*+�䓜@M��$��@P	XS�wU@Q���=3@S6Na�1�@T��=�@V��D@�W@X]����D@Z.�ٸ�@\�Y~�u@]� ᝦB@_��TZa@`�@���>@a���7�@ch�t�^@dX��@e-d���@fH�+o@gh=/e��@h�S��d�@i�H��3�@j��0os@l{�љ,@mQ�1R�@n�/8�@o�J/L=)@p�g����@q/W,$�S@q�i� ��@r�����@s*̔	�@s���N�@t�6�n@u8T�^�z@u�Y�j�@v�=� ��@wV��� �@x�FdF@x���9�@y����;@zC�=�V�@{-��ޗ@{�M֍3@|�:��/@}Kf
��g@~S�a��@~�Һ}P�@��ӕ�j        ?��V��m?���0�?�48i�?���Ze�@�Gq�j�@	��/�/;@�)y�@����M"@w���@͉J���@"�Ķ�	^@%�^���@(��	*s�@,S+k��L@/�>N���@1���-��@3���9�@5�],@7��)f�w@9������@;�v3�@>/)nX	@@>�m��@AmnE���@B�6����@Cⲧq@E(��(X~@FvB�c�@G�J�cM@I'�3��@J�0|���@K�0��@Md�z�`&@N�|[�bd@P-?��]@P�p�I�@Q������@R}!�A1�@SH��, @Tދn
�@T�9�T@U�1���@V�I�K�@Wl��k�@XI*�λ@Y(2守;@Z	���(.@Z�C�d��@[�%��;�@\��؂�#@]�^ӛ�L@^���P}@_�@�l"@`>ѫ>�@`���	W�@a4�$�c�@a�����@b/��4@b���s@c/-�X:@c���\�@d3��'�@d���Ci        ?Ƙ'���?��P��?�]��f
@ �F0�g�@	��c��@�� �>A@��@Py�e��@"�=v\�@&�����@+q��Hg1@0 `ŧ@2���nԉ@5pGq�T@8W�urx@;h(��P@>�ax�@A ���@Bĉej�@D�uyy@F�<�A�N@H���T@J�$@o�@L��p�X�@N��	�8�@P�?T�_@Q��6�@R�gE@@T+�ֳd@Unǭ��@V� $[YH@Xk���@Yh�u�6W@Z�`���@\5��cVf@]��1���@_!����@`P��&$@a���ϖ@a��19?@b���%�@cuUy�+�@dGn%�*@e#T���@e�~�9'@f�I�ȿ@g�ܐw��@h�ǿ���@iu˻L|�@j]�-�q�@kH���q�@l7S�k@m(栨Y@n�!�@o�c:�@p�8Il@p�7߻��@q�i�@q���6#@r�j �@r�jJ�k@sJ�&@s�w#Qٝ        ?�yv0& R?�v>�ك?�dg}��@ V�/R4�@�`k�ro@�%怳@jsx�}�@���{@"��zC�f@&���$U@+D���M@0C�@2�Yc�v@5N���@81m���@;<�tHq�@>o�e��U@@䵙��@B�����@Dw�����@F\�ۧ#@HT�o>�@J]A*#ʞ@Lw�6�`@N���̞]@PpM'g�$@Q���Yn@R����@S���@U;�~���@V�W�<Yt@WА��k�@Y&EvʿZ@Z�R���@[�Ksܬ@]R����@^�R>�k@`H��U�@`�KlC��@a��v:qq@bi?&�9@c3�!-@d �?�@d�%mvo�@e�H�9Y�@fyk,�]@gRk-�@h.y`�(w@iMV=F�@i��/Ê9@j�W{2��@k�yy�O@l�L����@m��k8�`@n�XG��@oq�-�q�@p2���8z@p�0:X�U@q*�Ȥ��@q���3�*@r'|��K@r����x@s(�鱡        ?�p����?򟫛��@�Va�J~@�o�3 @2��Yk@!�;�W@'�ҷ�y@.D�	�?@2�P��aX@6����xo@:�h�.)@?P�v��@B���K@D�,1_�@GAGj&1@J0X*��@L��yjp@O����N@Q�"��g@S2~�6@T�i13{@V�j��0@Xj]�=��@ZB�Dn��@\'��I@^�-�� @`Eʄm�@a��R�@bv7@c.i����@dEu�T��@eb# �t@f�VΝ�@g��|$V@h��l�	�@j�IF@kBbuAƻ@l~�d�!�@m���u@o�Y�@@p(d&UW@p��*��@qz�!��@r&N��f�@rԺ�sOD@s�QH$(/@t8	����@t�چj�h@u���OG�@v\��p�@w��s@w�b2LK�@x�+�Q�S@yS�$$�@zlgᰑ@z��s�@{�oucJ@|iTac@}2�Uʀ@}�f���G@~ˣI��@���B@�5�gMc�        ?�`F' �n?�'� '2�?�I/O�?��l�Nֵ@�duO�@��}�@k#]�1@���@���`5G@��J��@"���`@$��He�@'��Y�4@+0s@�@.�j���@1Z�5z�@2�2ߤ3�@4�W�\�@6�r�m.k@8�&����@:���џ@<��b"�@?qû�@@�"mA�(@Aї���@C~��@D8��;��@EwJ'k,@F����E@H	ޕ���@I]��~5�@J�z?C�q@L%(�@M�v�\L@N�p�>E@P3�����@P���?�@Q����@Rw��p�M@S?a�b�}@T
7��H@T�$6]@U��iI@V}#@��@WT&v�bA@X.!S���@Y	��@Y��*@Z�q���s@[�ڒIC@\�U��S@]������@^sa�p5@_c��9٨@`+ ,/@`���4�_@a!���n�@a��2�T@b^T�Gy@b���X4@c�l}�K@c�����@d#mJtR�        ?�Y��2?�EC�V?�Ù%VE?����U*@r�D I�@��l�@L�0��@Ve��@!�!�L�@%R�,@)�O��م@.+0q��@1~Q���@4;Mc9w@6ǁfc,�@9�l���-@<�O`�T[@?Հ1J�3@A�-7�k�@CK��DHW@E���
@F�R*W~@H� 7v��@Jߌ� .@LO�s@O8�t;�@P��A�b�@Q������@R�98s��@Tz�f�<@ULT�	@V���6�@W�hp}�X@YqA�@@Zq����'@[�F�d�@]/d�F�b@^���^�_@`_c��@`���9�@a~xuXc@b@m-{�@c��ŀ@c�层#�@d�P���t@eg��4�L@f9K��I@g����@g�1#H�@h��} %@i��*~�@j|���}@k_�F���@lE-���@m-��/�@n���@ouz��n@o���n�@pu=t�=@p��q���@ql�2[@q�FH�]@rh`0�E�        ?������?��cMu�?����I�?� _ũ\\@�v5��@!�$v@[@��E�E@��!.K0@!=��}�,@$�Y6��g@)ᩪ&v@-mt��@1�W�@3�$�%�@63�!k�@8�!�+�@;�Мz�@>�����@AL��\'@B���"u@D�}��%@FN����@H+�O��{@Jfc?�V@L�4��@N#)��@P~�'��@Q4�,݊C@RQ�m|�2@Su�9�wX@T���e�@U��rg�@WU|���@XLs�m)@Y�aOE�D@Z�
Q��@\5W�i/)@]�3��gc@^�ߚ�5@`,�xI	�@`�t8?@a��
^G@b[�@c\O�O@c޳�~,@d�1$Z@en[��(}@f:���y@g	��-�@g��}�p@h��ҡ��@i�d���@jb�
w'z@k@
9G@l��h2-@m�9�2@m�wW�@nϋ��j @o��<[p*@pSw!���@p�5���@qD2���f@q�i�F��        ?��rTw�?�\Ch���@4�d��,@z�M@��oB	H@ ��c+~@%�Z���@,0I��!@1k�PRX@5���0�@9�s�^@=G�Bv.�@@��{v;@CB���@E����+�@H]���͝@KXY[@M�<C�@Pq����@Q�Ns�N�@S�}��@U0���&@V���@X���Ϣ�@Zd4v�s�@\8�����@^��G�7@`?�p�@`��0M@a�$v��@c�p��@d&�m�@@e#���>�@f:� ���@gV}�n�@hw���@i���4�@jȭ��*@k��6ebI@m-��@ng4��K�@o��T�*@ptz�E�@qtkJ�p@q��� X�@rgZ�R&�@s7y4�w@s�M�C3h@tn�5M�=@u �m�@uӎ���@v�-gu�@w@ٕ]�@w���L�c@x�=u'@m@ys�ڨ��@z3�~b�@z�? �@{�c�d�v@|}�/G��@}D�pG�@~~l�G�@~�˖ �        ?���Æ�?�-�֫?�K}�Ͱ;?��Zh��@��nW(g@	�Pт��@�BS�@Q��Z��@#�i��@N�4�@"f�
H�@%M�ƴG�@(Z����@+��� �@.�#pz�@1+.�f@2�h�]�@4ѠXG�@6�HnJ��@8�󱛭F@:�<���@<�ǳ~@>�E���@@��*�vQ@A�n�|ù@B۩���@DBX��g@E;�9�g@FtW�@G� �� @H�߰�X�@JB���_@K����S�@L��r�@NCޠ���@O�lEb\@P�н�@Q:�1)o@Q�u�ۀn@R��pG�@Si�90�@T(��pw@T��O��@U�j���f@Vt�m�r�@W=
y�s@X��h�z@XԚ�4+@Y����p@Zt�R�Im@[H9����@\�v�|@\�9�2�@]�Ά�I@^�d����@_��MT�@`3��%@`�lt���@a���@a��z|�@a�*$]�@bp���F�@b���,�        ?�
Z[��G?�� ��?��6m�N@ fi�W@cN�X�@(�{/8@��(KQ@e��%�7@"OdL�b�@&F|�T(@*�����@/;;ZV�@2n����@4�y1C&@7��s�7@:�l�7�@=�&<A	S@@r�UѤ@B'/�B��@C�!�8@E�3Fs �@G�%���@I���c��@K�X���@M�a�V@P-�Os@Q%����@RL�e��@S|�oqi�@T���4�o@U��h�@W:���T@X�fFU��@Y�=�j�@[<Z�]�@\��"�GK@^�]"�@_~S�w@`{��Ti@a;ȏo�@a�'\>�@b��`��f@c��HÌ@d]	̑D�@e-|���@f"H��@f����@g�����@h������@io2��@jRJZ0J�@k8���@@l!����<@m�i���@m��6�U@n�/ѩ��@o�+�^@pn�g�@p�_��D@qj%&���@q�P&!�@rkܕ�8d@r��િu        ?�1=<	�?��)��?����'�?������@>��H#�@^t��@ڂ��8�@ڽ���@!x���9�@%@��U�@)[spu�@-�/��B�@1@�/R,@3Ĵ�(�8@6n�x�|@9<R���@@<.���y@?D�{L�@A>
Q֮@B���L�@D����@FvRZ��@HT����@JAvY�`V@L>7��L�@NJH���@P2cN�r@QGݻ�@Rb��1�@S����B@T����s+@U�uP���@W�v��S@XV!\R�@Y��(��@Z������@\7t�J��@]�-�Dd�@^�#<w�@`(yhc�@`�f,,�M@a�?�Ku@bO��
�@c����@c����@d������@eV���@fB+X��@f�V%��@g��}�&�@h�-�W@@iZ݈췀@j0���@k��ϫ�@k�^�'�@l��P-�]@m�uۢ9D@n}a�>d@o`�����@p"��<.�@p��&���@q�[E�@q���G�        ?�1���ŭ?���6�@i#kE�0@]ROq�@��LTW@ ���cO�@&���=@,:J���@1{�R�?@5"�=��@9����@=A��8�@@�%����@C0 V��@E�Fw�,�@H4� Xp@J����@M��B.�@PD8��#@Q�U��~@SJ�d�@T�����@Vb�&U@X+�@Y�V��6@[��8�m@]n�EX@_D�-`-@`�u+��@a�W��@b� �ُ.@cX�q�@d�JL�1U@e����Q�@f��:{:�@g���t��@h�g�<Ak@i�t��u@j��#J՛@l�s�Q�@m5��8X2@n^r�(�@o��80�@p]�t,@p��mon�@q��Ǆ@r1f�v��@r��3}e�@sr/1��|@t1���@t���I�@u`Tia��@vi��#@v�#
�98@w]|'�0D@x
oU�kz@x��@�{@yi�70@z�V/�n@z��}��/@{���M�q@|8� :��@|�>ǭ        ?�UZ�s�?��%��?�*�4�?�&b��@P����@��i��@�M��x@(�P�ݕ@�@�@�@��f�ǁ@!�]!{�@$`I���@'X����@*vN&V{@-����@0�l��x@2Q��Ȁ@4%��5	5@6	c��J�@7��Z��|@9�w��8�@<��@>0��b�@@/vg��@AMc}�Jy@Br���@C�V�#U�@D��@F9G�l@GE�ɫ�E@H�D�8�x@I��6�'@K%�tzr@L|�D���@M�`�Q�k@O;�.4�o@PQ��]�L@Q�X��@Q� ��)�@R~?o�g@S<���l@S��(⺬@T�����@U���rƂ@VPZp�]v@Wn�3c@W����@X��	��@Y����@Z_���]�@[6��Jc@\�J,�@\�W,�ŷ@]�
��s*@^����@_���u��@`7�5�j@`���X�[@a�W�"�@a�$Z���@b
[	�;@b�����C@b���f        ?��yL$�?�:b^�?��W�?��6p�8@m�~���@�/�޳J@s]�X@ZOM@!�{~@>�@%�\��V@)�^խ�@.8N;�m@1����[�@424�y@6�Ř�)d@9�֒Q��@<��[�*^@?�1q�[@A�����@CQ���%@ErС(@F�����+@H�0"L7@J��
Ĥ�@L홤�R@O
2|Ԫ@P�-�h�@Q��6�h7@R�*丷5@T
��=�@U>�]�s�@Vy�(�l@W�]�-@Y#1�@ZU|�R�@[����L@]	3���F@^m%5�e	@_׏�*�d@`�-�\TG@a_�T��\@b]�$�@b�y��@c��v���@dlgx��@e6�k\��@fn��@fԶ����@g�ȫ��8@h}��B{@iV�m�`@j1F��@k2��@k�j�9��@l�P9s!2@m��F"�@n���W4@o��؊z�@p;V\�c�@p�����@q+�+q�\@q��q���@r ��M8�        ?ť�"5�?�].��?�]���x�@ �	��@	3�*�y'@�LBK��@��D鶛@oc��0@"��>cX@'�;s�@+�j�,�@0&�!��@2�No�k@5qm�]v�@8TOE�,@;_��߷@>��+�@@�]T��@B�
�`==@D���1h@Fg���@H[�����@Ja��jK_@Lxf�d�@N���i^�@Pk岍�^@Q����@R���B��@S�s��E�@U*ǵ{�@Vm�����@W��s5φ@Y	�TEi�@Zb^w#��@[�L�6�@])B�� @^�&j	x$@`�>ڎ@`î���@a�����@bI�!g@c����*@c�n�8k@d�U\�{)@ezS(�a@fNZ���@g%`�4�)@g�X���b@h�7_jS@i����q�@j�vM���@k����-�@lk�'��@mVqE�[@nC����@o3���@p$�*@p����u@q	����@q��}��p@r����@r�r/\ @s3<�j        ?հ��a�?�
#��5�@�yh��@"�H�� @u��|@!,X/�/@&���/�@-<{?���@2#����-@5����%@:�8_A�@>���2�@A�۶D�=@DQg�o@F����	3@Iq�|3��@LL��.��@OE�7�G@Q.
j|�@R�l��@Tn��ٕ@V#��>�@W婼L4I@Y��`u%@[�zv[c@]x��  �@_l�6lIt@`���=�@a����~c@b�o��]@c�߬1P,@d��Oޠ�@fL)=�@g/-ߠo@hV%Ҍ��@i�`gM�(@j������@k�����'@m%'Qb�-@ne"�� �@o���f�@py��� �@q �
�%�@qɭE{]�@ru���@s"�-�C�@s�/{���@t��|b1@u7�Bg�J@u�墑o@v�n�TO@w_I<��j@x����@x��^!N9@y��Nz�A@zZ5��@{|�MӔ@{⺉��Y@|��䤠l@}r����3@~=7Ap�:@	�>�@נ�C*`        ?�2F��'?�oc��M�?�{p'+;?���5���@��4�!�@
w�M��@1����@���k/�@��!(I@� �1W�@"�O8@%��dr��@(݌60@,(G�Z�C@/��&��@1�ͮ
�@3s	1&�@5`�M�z�@7^�T�k@9m����z@;�Whu@=��L�8�@?��} <�@A"м��h@BP�V��@C����@D�, �X�@F��K��@GP`M�e@H�d�$ِ@I���<@KXA��[z@L�{�'W@N)�� @O���8k5@P�A#\@QH:���@R	����@RΒ�-&@S�%�u�@T`f=�(@U-|Qj+�@U�L��@V��m��~@W��9p2�@X|�_�K@YW�J�@Z4A�@[�
W5@[���*�@\��I��y@]�ǄS�@^� @_�����o@`A��)u@`��
��_@a2�7��@a�CJ���@b(���KK@b�u�b�@c"����@c� �@d �mf^        ?�ݥfo/j?����2�?��G4�?������@1��1b�@Q,wR@��ņ�@/	��?;@"-��w�@&�#T�@*egQR@/r���3@1�q��gX@4��{�F�@7`�̖�@:OlG[[�@=d@�м@@O5��@A�����@C�/2
@E�A+{+�@Gw��W�@Im�G���@Kt)�/@M�Q
�)@O����z@P�0���i@R�A5�@SDw���\@Tw��^_@U��Ȁ@V�@�b@X>��ZE�@Y�{�h@Z脮[3@\H&�k��@]������@_�L%�-@`H���[@a[&kz'@a�p���@b��,A|]@cS{ �A{@dW��1@d�]��/y@e�����@f���,�g@gi{3y�@hCK"%y@i �.gv"@j ��NB@j��c�@kɜ��>^@l�N���@m�ɽ��@n��a�@o|�Iƚ�@p8SFv��@p�~Ѳ�@q/��X�/@q��A�5@r,��@�@r�S�[c        ?�h�?v\?�7��)_?� ���?�Z����@��۴�@�k���-@,v�}�/@x�h�pm@!�� �g@%��eW�W@)����!@.=�:��@1��:3@4]�4�@6�լV�x@9���1��@<����u@?�	��%@A�)��)@C7��	�<@D�K=��g@F�O-��@H�~\&/�@J���Ȋ�@L�)T�?�@N�����@Ps�ٙa@Q�Yt�f�@R�x" �@SӾ�|��@U�'@@V7TY�eq@Wsp�z�2@X�Lj�Z�@Y��� �{@[O�8���@\�UY�;a@^*�}צ@_f?��.s@`g��.֊@a_�=��@a��~e�@b����l�@cW�";|�@d=Z��@d�R���@e�+K�V=@fu�v��@gC����@h�� �@h�ggs��@i�� (@j�"���@krGp0``@lO�-ܑ�@m/��M@n^�z��@n�)�>1@o�D���@pc����@p٤�Р\@qP��A��@qȖ7�A�        ?Վ0�M�?������@��(.��@�;��7>@4�&�7F@ �����@&����@,���D9@1�s��|@5��Q,�@9�M����@=��;���@A<�=@�@C�*#��@F('�o(�@HʨF�V@K�����@Nd����@P�1�W@R5DwIJk@S�,���@Uk���a.@WHg�6@X���m@Z�L�OH�@\i��@^E,�g�@`�4$�@a�z��@bV�×k@c�$��@dqd&-@e'���@f9����:@gQ���@hm7�z@i��@j��(�"�@kݍ���@m��@n>⒏{�@ov�u�@pX�ɠ��@p���G��@q�f&}�@r>Lϛ�@r�4��'.@s�1�@t5�|*_�@t��l[Q@u�8�"�@v>�R��@v�ۧ��/@w��tC2x@xW�V�>@y��x��@y�
@z�,_zo@{;�f,@{���I@|����i?@}v���L@~8$��        ?�&j�h�?گ��7׊?��ZGkV?�}�X��:@������@����k<@"x��	@m��,��@e�-@��}��@!����@$��7ِ<@'�Dz\�@*�#��@-��+m'�@0���@2thbB�5@4I-�5�@6-��j��@8!9�Ib@@:#���B.@<4����@>S���N�@@@eB��@A]����@B�R5J��@C�r���@D��́�@F-�3�@GNy�4�@H����B�@I�8Rh_�@K%dZjB@Lw����[@M��b���@O,ĐS�_@PGk����@P�񫪄,@Q����@RiP�/4w@S$.���@S�CwHr�@T���;gA@Ubn .��@V&TS�X@V�^ <f@W�~��_@X~��)C]@YJս5/�@Z� �@Z�,.��@[����g�@\��q4��@]dh��	@^;ݖ2��@_R��,@_�(YZ�@`fx�յ"@`ո.�(Y@aE�f@�}@a���f@b(w�;�@b�`[�        ?�E��C�?�lY��z�?�<.��2H?�#�ӄA@�K�H@��L5�@EX�n�B@�<�曉@!�w�}�@%���"��@)�ʣ�?@.|����@1�rp��2@4G\��q@7����i@9�	���D@<��<F/<@@JdÔ@A�>A��@C�t��?@ERg��X1@G3�+�e�@I&6_e�@K)s����@M=0YJX@Oa$�~�@Pʅ�B�@Q�P!լ@Sн� J@TF�J�@Us�{@V�U
��i@Xo�f�c@YT��x�@Z����@\����@]h�Hv�@^�vA�B�@`!T��`@`ܯ�/r@a�@�&W@b\�� �@c!�Nk@c�n@d��!���@e����@fSq���@g'/N�	�@g�ž6��@h�*~��r@i�SW;{�@j�5�"�@ks�CR�@lW��W(@m>�ey�@n(3*��@o �»�@pG� ��@py�I�֨@p�iT&'@qnK	>ȟ@q�]� �@rg�dc>�        ?�Sxg�?��=�'�?���SL%�?��r����@A���@c��K��@���H@$T>�@�@!����w�@%Zj3�{@)~�67�@-��<��@1^}��b@3�i�g4@6���T�p@9q��L9@<mJni�d@?��^m@Ah$�?�@C"��gH@D�6W?@F�$��@H�w�
�$@J�OXA�@L�����K@N�/%�:@Pgd��9�@Q�_��t)@R��Ks�@S˞L:�@T��[���@V2�JE-@Wp���u@X���Q4@Z�f�T�@[T~w$8�@\��V��z@^x���@_s�7��L@`p*$���@a)�V�@a�;���@b���"<*@ch���6�@d.e���@d�DV@e�����@f�`x�f�@gbց:��@h7"��V8@i;gG��@i�	�6�@jĴo��@k�4��S@l�w��@mj���s6@nQ����@o;����b@p-�@p����C�@qM��@q~?�zb@q�i]���        ?�o[Y︉?���=�@�̔E+�@Jա��@����@ ��o�@%`��ś�@+M�U D�@0雭��6@4t):�I@8B�� �E@<Q�� P*@@O@�e�@B�#��Fj@D�c��J�@Gn��c��@J�.�F�@L��N-�@O{���:�@Q-����@R���5�@T/{����@U��'�m @W]�j�@Yj��@Z��Ѐ	�@\nv2�b@^1�5:�@_�����@`�J`[�2@aٕ�e�@b���-@c�ˎ�T�@d���L�p@e�2oд�@fþ���'@g�3v@h� QӹW@i��vJ�@j� ��=@l�k;�@m%�1Ŭ@nB#G�1@oa�RT@pBV"΃'@p�V�~�?@qi�_��%@q��{�z@r�r#���@s0e+q @sʼ�!��@tfo_�X@utE���@u���z@vAXh��@v�+]��@w�5�P��@x'r�m�@x��w���@yqk�/�a@z�T�,@z��[��@{h�G$        ?���R��?�x�-��B?놲�f�n?�C7��
�@t3�)�@?y}M@�X��G@3�Sן@�#UBM�@�Q>vs�@!�_���@$Se�u�@'E�CCK@*] h"�O@-����)�@0zWU�P@28�j)�F@4�Y#�@5��B*E�@7�d!m��@9ϩ���@;�e��R�@=�C�Q@@��+�@A'
s��"@BG��0	@Cn�L�Ҧ@D�<���@E��_��@G	�ٷ�@HIF��j@@I���&~w@J�	�v;w@L*۞W5^@M�$����@N�ƩY@PҵR�@P���w��@Q�V����@R?P��Y�@R����@S�u*p(N@Tu�����@U6�� �{@U���pe}@V�zM���@W��{�|?@XR�a,u�@Y y�(�@Y���9@Z��[6@[���4I@\e7AX@];v+{�Q@^�~D)@^���`�@_��˂�j@`S��ˠ�@`Âr�5@@a4���@a�����@bگ��@b����H�        ?�7����E?�F����?�������@ "*�	��@ҽ��$@?�s��n@	!���@��Xn8@"p`yg@&q 'O<@*˺`��@/}��.T�@2B���γ@4��^bZ�@7�W6%�g@:�ܽh�@=����@@�� ��3@BT�T@a@D �5���@E�5�3|@G�	�P�@I��>b�2@L��Z�@N*�.��@P0o�%b@QS�o�/
@R���{C@S��2�V�@T�j�x�@V3r54�@W7�z�@XҺo,g@Z-�Xt�Y@[����f_@\��6J�P@^l
�T@_䲶��v@`�AR��@au��P�@b<���>@c�+r�@c��x�~�@d���=e�@ezPUwP@fRy��@g,�����@h�F @h�m���M@i��b�'@j�w�2,�@k�! �&l@l�׈E�9@m��t�z�@nuI/W��@ok�b%�@p2�@�@p��Y@q0���Kc@q��V2%�@r4<V�n�@r�+���@s=WF���        ?�O�6��?�+�J���?���Z�!?�0 ��o@~��@�{�$@à����@�hHk�K@ ��a�d�@$2(tP�@(Q�]r@,L���r@0e�ʬ�7@2�V���m@5P���Lp@7���˔@:ƫ��C@=����U@@`��Ű&@A�y��@C�ǵ�K�@EU�7d[@G�d��@H�����@J�",v�@L÷�!-%@N�{��0�@Ph�(3Q	@QvD��l@R�����M@S��6�!�@T��	k@U��jq�@W��@�@XQB��@Y�M���L@Z�i���@\Ts$3�@]\��(�@^�39��@`{�:\;@`���P�,@aa\?�r�@bŐl�@b��[EW@c�Y��S@d>p����@d���@e�	L��@f~xK��@gCH�y\�@h
p�.��@h��g��@i��m^|�@jm���3L@k=���}T@l|`�@l�B��!@m�"�LJ�@n�ɴ"�@on|��c�@p%�D>�@p��:e        ?��9����?�Dj�,�@z�ǣ�@�=��P@IQ?WY�@ S�0�d@%�h�3X@+��@i��@1+��X�}@4��gX@8�}�@<�s�m��@@���=��@B�I���@EU��k��@G�J�\�@J���ʴ@MJ�XT��@P��$@Q����l@S����(@T�+��(�@VH��O�@W�G��@Y���^^�@[g��Ə@]2���@_��:@`r����@ag5�D�@b`?þ}�@c^+�%��@d`��g=p@eg��9`@fs���
�@g��C��"@h���!�@i��]��/@j�H��p@k��g�@m���A�@n;���r@oh{x��@pL�:�
@p��N/@q���|�E@r ���+\@r�^���@sav�l�?@t��J�D@t�A����@uO���i@u��I�h@v�\��@wL!����@w���<;@x���ƺ@yV�'�@z�<���@z����P@{l��$U[@|!�L1�@@|����W�        ?����z2�?�1$�Ͼ?�S,nJ�?�$��x@fkRizo@8�����@�J�@A��x��@�D�#�@��鯨�@!��=='@$�EQ�n@'���̓@*�Á��@-�t�AJ$@0�U�Y@2��1	ʖ@4a}���o@6O��I�@8M,9!��@:[><���@<x��N(�@>���v�3@@p�j��A@A���v;@B�VX�[�@C��Q�3@E/��Շ�@Fp���
@G�F��@Im��@J[va9�@K�5��@Ms��p�@N~�d���@O�uR0�&@P���sG@Ql���#@R+���6v@R�&����@S�]�D�@Tz�F[�@UD�Bl1/@V�N	 "@V��e<d�@W������@X�z �@Y]�� ��@Z6�L#�s@[����@[�e rL�@\И����@]��12@^��]Y�V@_~���
@`3�wQ�@`���~�@a )� �{@a������@b�u.�@b�U���y@c�nk@c���p��        ?���Y9{?�!��T_�?�� �b�#?���u�=�@F�^e9�@c���7,@�6�/��@V�i0@!� #�S�@%N�Bk�@)n��BT�@-��H��o@1Q\s��;@3�P]�9�@6�h�>@9Z���g�@<R�����@?n���@AV89�&4@C|��)s@Dǁ�pC@F��i�s�@Hz|�y|X@Jkф�D@Ll�r��@N|�MOn@PM�Vƺ�@Qdu��@R�Q��@S�-O�<L@T��m��@VW�L�B@W>cnN2�@X}�~?@Y��g��@[�k@\b&p�?4@]�c2��@_�A4�3@`>3�htf@`����@a��O�-@bd�.��@c!��K@c�d��N�@d��GP| @ehK6%)�@f/�2��@f�%om��@g�.�zE�@h���F��@idC���@j79�'�@kl�T�@k���2P@l�kw�7~@m�)C�@nww6� @oV��YdP@p�Lb�@p��)|�2@q����@qu��u�2        ?�;����(?�PJ �?�����[@ A�,	�i@���!d�@k<[y3Y@D��*�1@��I/��@"�]M&R@&�yD�@+5T-�@/�Ka���@2lS
���@5-�T��@7��BC	>@:�p3"@>%e��9@@��zw��@Bv��<@DC�Kꔒ@F#�Kp2t@H��d�@J�n��@L/��8@NU����@PFkɶ��@Qji�hTb@R���yA�@S�㵃p�@U$�Fث@VKBAA�@W�!��k@X��PM@ZE�U���@[�MYw��@]<O��C@^�wj5T@_��'@�@`���� @a��<fg@bG��e;t@c'PrU�@c����3w@d��W�J�@e�6�Y�@f\���)@g7�B��@h�{�Ĩ@h�)�
�K@iۙK� �@j�$��cn@k��%�|@l�l>�9�@m�����@n�'q�S@ovQ)��@p7��{v~@p�sӈ�@q5�_�O=@q��&{�@r9�֜@r��\�c�@sA��æ}        ?պ��N�d?�]���@���2v�@1T&n�@��W��@!>��W�@&�f;�@-a#η�@2<Ij�y�@6�;��@:D���G�@>�ܬ$�_@A�5�"Pn@D=��{��@F� صI8@I�/Qߞ@L�1���:@O��U��q@QQ��� �@R��Č%@T�#��Y@VT��Ee�@Xc�D@Y�l���@[�]�HB�@]��4a_M@_�����@`�D�ђ@a�_S��@b���SB@d�%]��@e%�c�G@fE�#��@gj�N�:�@h�T���@@i�L?�9@j���)Z@l3�x���@mr��|��@n�K���@o����Z�@p����
@qNق���@q���J,@r�gi^'�@sV��DD�@t��&1�@t��4Q�u@urh+��@v*M2���@v�,|��@w��O�S�@x]��߆@yS�V�@y��vxc_@z���@{g&?�z@|. �� �@|���_��@}���U@~��|/e9@Z�0}�@�>�=        ?�8)~���?��b���?�8k4k�?��(�TI\@ظ��Ϫ@�M��@e ��C�@�	�l?@������@�� �!�@"����@%c���@(u��@6@+N�J��<@.�h�@1<�_
@2�h �-@4�m�锪@6��RG@8�m�' F@:ϲ�.��@<�a��]�@?",Օ�@@��DEy@A��D@C"�<��@D;QyƔO@EwbH\@�@F�4�$�p@H���?@IS��RF�@J���Y-M@L�u6:@Mi[s� _@N�Ϸ�r@P ]�ך�@PڑE F@Q�����@RWgAF�P@S��IU@S�5z@��@T�&����@Uq¨�E
@V?_�>@W����@W�aS��W@X�r�B_Y@Y����Z@Zh=D��@[D��@\$3�6@]�*�X@]���Xb7@^�@S3e�@_���#{@`R$�R�@`��hi@a@�/]45@a����y�@b3��s�@b��+(Zp@c*��A�@c�0�'�        ?ƕW(�=�?�{�d�y*?�S�'�@ }C�-K@		X��P@�K1f.@��p�@2M�;ƿ@"Π:�� @&�����@+L*�h��@0�1E�@2��A�@5IyV�@8'�?O@;.4���@>[�D�p@@ש�o�@B�[�V�@Dc�)��@FD��;��@H8I��
<@J=B��˵@LS�VPQ�@N{��8@PY����@Q~8l�@R��'Ś�@Sߒ'�o7@U1�yUQ@V`��Q�O@W��Ӗ�T@Y l&��@Z[�8�y@[��J�@]'ڮ�2�@^���"w>@`h�]@`��PJ*V@a�ۑV��@bQ6��ƕ@c�È�P@c��~2�A@d�T8l�@e��	(�@fb���Lf@g<�	��@h�u��@h�H�W�@iݪ�x�<@j�S��@k��xv�@l��竛�@m�Ď�@n{�'͎a@op�����@p4E#�JV@p����$@q0Z�UG@q�r �a/@r1�|"@r��WajX@s8�Z��        ?��6f�j?�ԍfevk?�p0�6�?�^Z�O��@�6��@FS��S@��s��@��K���@!hmBǆ�@%/�fQ9:@)J�#�D@-�F�B��@19¼?*�@3�ȊZ��@6i׎�(�@9:K���@<.�i�\p@?GI��	@AAg.�wH@B�^ -�[@D�4��7�@F���O�@HaA��@JQ�p��@LRD���@Nb�IxG@P@��O�@QW�ލ�@Rv)�	Ы@S�����@T����@U��
D�@W8�@Xz
�@Y��].�@[+�e@\h&�C3@]ęh_�@_'k�ڒi@`HB�|�@`��H�U1@a��?��@bxM�]��@c8�Μ.�@c��|���@d�Nk/F@e�mtq��@fX����@g'����.@g�8.o@h͞���@i��%}@j~iI$�;@kZ��$-@l9��p��@m�:�@m����I@n�d:q�>@o�;+��@p\����@pӌ�g@qK�F��@qĲ$�4        ?�Kօ��?�z[����@Z.�@~J,}[�@�&@!�gA�&@'Tw���6@-�)1WN @2��
*q@6h��i@@:�NI�o�@?�{�2@A�{�6|@Dx*�m�F@G��gT@I�rET�@L�����=@OΗ0��@Qw�-d�@S~bw+@T�3��^ @V}��L��@XEH�Dr@Z�ʏ�@[���$AV@]�\�/E@_�����@`�ѴbT@a�:�Z�R@c����X@d#��[4d@e>M�ʽ@f^�/79@g�k���u@h�����`@i�"l��"@k�YǪ@lP��NP@m�����@nխ|��O@pͭz�@p�8p�<A@qa�E��@rO�L��@r��-&�@sl���@t 5G��+@t�Ι��,@u����j�@vG�'(4[@w(� &@w³8�t @x�hQ�m@yFA�!k@z81�ɔ@z�D	A�@{�\k�͈@|fz"�Ф@}3����J@~��O8@~ӷ�k
@��b��@�=�u�&        ?�q~��?�7ʾw<�?�`�1?y�?�	ǂ'�%@]ö�F@	.��^�@���6F@Tg�z�@�8J��^@=�Kv@"p���@%m��'@(�姽]l@+��Y�z@/^�l�X@1~�Z��@3_�Dl6�@5Sd��@7W��@9l�%�J@;���ı�@=Ȯ�cL�@@*��@*@A1�*���@Bc� �ZH@C�?�4�@Dݚ�`~�@F%;�y�[@Gs�m��@H�3��N@J%J7C�@K��g��@L��12�i@N`SP��@O����W3@P��P�O�@QibDӆ�@R-�3��@R�Dj�@S�ד}�@T���~�@UW����@V)��@V�	�@F�@WӍ��!�@X����(B@Y�(!ֹ@Ze�F��@[F)�_��@\(ÃI�@]�$�4@]��F�@^�9H|Y(@_��y�9@`[�����@`Ӝ�J+@aL��ɮ�@a�oV{��@bAZtE�@b�B=��o@c:!�)�@c��aI�@d6� �        ?�ډ3ڹj?���3?��+�@ �D��@	q�r��@�_�eEh@�3�e�P@�f��m@#1ԩ0"@'_!�V�@+���d:@0h* ��@3��],k@5Ҕ�8@@8�(�R�@;�h�UU@?/��ĺb@AO��6"@C��F&K@D����e@F�r��e@H�wͳ�l@K�P���@M1��dB@Om�2+[@P���(�@R�ގ��@SC4X�N�@T���RT�@U���9/�@W~�d@Xr�Nȣ9@Y���Y+(@[:PC[�u@\�c�b:C@^�j��A@_�˶���@`�t}Г8@aW�:Y'@b!7�H1�@b�S�(ã@c��lf�G@d�����.@ei�zJD@fD_Dұ�@g"�ny�@h�R��@h����6&@i���<@j��J}�@k�ى!2�@l�֗��@m����r
@n}��}�@ov$4�\�@p8Ǘ�z�@p��Z���@q8Q��7o@q� �kd@r=9�+ߕ@r���w�d@sG^Yl��@s�_��,        ?��HK�f�?�0��X?�U���U?��r*t�@5�@T�@,E
�@�6�4��@B����@":�p��@&.�<$�@*x�w�*�@/-���@2!M�.@4�r�#�D@7o��x@:^�6�@=r�{���@@U���@Bk���@CĀP�  @E���S@Gwٛg �@IjeǸH�@Km��k9@M}�#��@O�a3�*�@P�7�2!@R	/��@S0u���@T^�.�1?@U�byr �@V���1j�@X����@Y]�8��@Z�S��0�@\D8ݸ�@]b���@^� �q�@`�Q-X@`����K%@a��^Q�@bHo�&��@c	F7�@c̓,���@d��X��>@e[���@f'����@f��!�]@g�ϼ6@h�MJ�x�@ipMB��b@jH�4��@k#�Q�y�@l ��@l��(M��@m�y0�(@n��7��@o����f@p:� D@p�>�Ĝ}@q&�v2��@q�%2�L<@r�#�u�        ?ֆj�%	�?���D�@��n��@����#N@Z�˴�@!��A!@'�["��@.:�B�@2�禔��@6��f{�(@:뙣(�@?s2-z��@B �(�x�@D���}��@GSO�@J�Qk�@Mli�.�@P(%*��@Q���i��@S3��@T߮�e�@V��IN�k@X^�*�ң@Z1rR��@\	�C�H@]�n�ۄ�@_�S��!�@`��ʖ�v@a��g�+�@c
2��o�@d����@e0�NO!�@fK���iL@gk����-@h�E�<�@i���>�@j��Ӷ��@ld;�A%@mQ`���z@n��>|�@o�!�yg�@p�ڇ1t.@q+����@q�m{r��@ry$�>�@s"��&��@s�@���@t{�2-@u*�ܲ��@u�{���*@v�J�~@wB2 b��@w���P��@x�X���@yh;,�0@z"��J;�@z�o��@{��ml�@|Z[h��@}e�/�E@}��w�8@~���/��@b��U�B        ?�%��VW�?ڻ�%צ+?�ۂ8�G?�����@� �)��@��f�[v@@,���@��2��?@W�&- @sށ��n@!�Q�X��@$�Վ��@'�Ă7(@+��l�@.qXj�h�@0��o�+�@2�\'�O@4��� @6�`x&��@8��]� �@:�_E�h@<�ýt��@>�>~�H5@@���*@A�,��R	@B�3���@D
�M��@ET�c1I@F���y�k@G���j�a@I'i[��@Jy�I�\�@K�ex��d@M0�o���@N�P?g��@O����+@P�6=��@Qp�Qe@R,��b�a@R뉨亅@S� n�v@Tp�Q��@U7W�@U����J@V�n"Č�@W�x��@Xf��y�x@Y8//`Y}@Z�1�5@Z����@[��ig @\��,�`@]o�2(�C@^M�َ�+@_-��{�\@`�
n�@`z��O@`�,l:q@aa����@a��l(@bK�h}�g@b¬�И�@c:o�Vr�        ?Ǝf#g�?�t�=�C?�M�:�1�@ zd5צ@	�75�R@�y\W)�@�\�@A3���t@"�^��D @&�+fkA@+hw����@0��QF�@2�N�kY�@5j45���@8P�2y
�@;`"�8�@>���H�@@�{��@B��p�P�@D�K��<p@F{}@�7@Hv I�h@J��e4[�@L���u�n@N�q����@P��aGu?@Q��� qi@R�����@T3�\@U]�%��J@V�<D�ؿ@W���}@YQ����@Z�][{�@\���yu@]����C@_ Ι�>�@`?Z�Թ�@a�3�|@a����}3@b�*��R@c]��=��@d.�5�}@e�����@e�9����@f�%���$@g�=J�G�@hot���@iR��&�-@j9��@k"e5� �@l�����@l�Ӊ3L�@m��D��z@n��?@o�Y�뢂@pk^�]�@p��H�@qi�o)hd@q���1O@rm�Zb�t@r�j��2�@sv��n�        ?�*����?���*�?�����@?��8d�'�@V�%vE@r^�p��@�(zkt�@<q�3@!��Z�}@%k&����@)��E#,@.udH`@1j�Yr�@3��n���@6�
�s��@9��4k˻@<}Y�lЦ@?���@Ap�s�p@C#V�|@D��	��4@F���X@H�^��[�@J�}�xӌ@L�'�%��@N����@Pe�o���@Q~7_�c�@R���=W@S�*�)@T�T�e�@V%�&��~@W`�����@X���@Y��P�v�@[80:�*J@\����r@]�!ʯ7L@_G���q@`Wq��Y@a:k�@a�C��D@b�$��h@c@�#8F@d@R���@d�g��_�@e�<�Ԟ@fV�n�ƒ@g"�s=��@g�i�8r@h?���@i�7���&@jlPI9�@kD��q{@l��Q@l��G��@m܂�'�A@n�[��W@o�w�q]=@pDf��=�@p��JH{�@q.�g�@q�pk�        ?�� k�U?�۷+�Pg@��/%@�m8�;@*}�@ �ѷ�@&�Ê�e�@,�P�A�|@1�L�?�h@5�A�s��@9�̀��@=�5����@A@��f��@C��-�L@F/Y�I|n@H�S���@K��}A�y@No���`�@P����@R;?v^�@S���YR@Uq�K&@W	S*@X֧jv�@Z��8k\�@\i��n��@^C���b�@` ���@a]*���@b�u�[@c	���^@d)�K��@e��߯7@f)K�0�h@g=�(iG@hUB 8��@iq���N�@j�)I��@k��;	Hf@l�-�Ej�@n�#i�@o;�����@p7�zq��@p�^<��@qp�b��@r֕.@r����>y@sS�-s@s�|z��@t��j�o@uEõvP�@u��~+�@v��ڥ@wF�R�*/@w���R@x�q�ȾJ@yU�h+�r@z���z�@z��K�@{r��+A�@|*3�(@|��~`!@}��Z�        ?���IȦ?�p�N�qo?�P�7�=?�J�r��@}�+�J@R�b.�a@��{x@M5c�@�$�`O�@�݂z2d@!�� u@$|F��u@'wG%�T@*���.hT@-�S�J��@0���[�@2a�Q�is@44�/���@6�n9x@8`���@:���~@<��k��@>.V��@@+uQ%3@AEa��@Be�@��@C��3ȅ@D�G�V@@E��� �@G$
�<.�@Ha�Yw��@I�Z��!@J�1��L�@L<Yۏ	@M�� ���@N�.&ފ@P"���@P��yst@Q�f�0~@R=.8��@R�; ���@S���p�p@Tl���	@U*�{*	�@U�|��A@V�ef���@Wsa��%@X:j��@Yt�[�M@Y�x��t�@Z�n�T�@[jO\�rR@\;o[��@]���;�@]�(q��2@^�j~Jd�@_�rb���@`5���@`��XBb�@av���@a��O�C�@a�,�9n�@bbF,P�        ?�E�d��L?�<��j�?�#��@ Kg~ǒs@�4@�@p����;@L�9M��@���n�@"���f@&���t��@+����@/���Dvn@2|P���@52�P#��@8l�L��@;^@I�@>K�}5yX@@��2+�@B�UY�m@Dc�#O��@FH��M��@H@�KC��@JJd�}�d@LfKA�@N�/���@Ph�v3I@Q���U2m@R����wZ@S�0��-@U9�n[��@V�v�@W��ۘ7@Y+���8@Z���GJ@[�{4<�@]b�%�NU@^���?O8@`+�ԡ�@`�f(�@a���2t�@b~���V@cK�i7�;@d�z�A@d�h=�@e���[�@f��B,�@g��%Ф�@ha���@iF>-�@j-�1;�@k[��2j@l5|��@l�,ВK@m�<��@n�_R���@o܏��*g@pl��\@p�����@qn��oy�@q�^Y�(@rv,�4�'@r�&"m\@s���2�:        ?Đ��w|?�c*��N?�T^��j�?�b�e���@�?���@���c�@}@��T @�^�ͮI@"P5 @%�.��<@*.sM-��@.ķ��R@1� ے7�@4tB�W��@79LY�e@:%U_��@=7�1Y��@@7���\@A���@C���֝�@Ex�6���@G\S��1@IP�?�s@KVM���n@Ml���y@O��µYb@P��
��@RG�ޕ@S0m3~��@Tb	�'��@U��js�@V�%���_@X"g�¢�@Yp���.�@ZŻ{(ۏ@\!���@]�H)�@@^�$��?-@`.V�P�@`�J*�{@a�`|�Ta@bh���}@c,�F=�@c��b}��@d�'�9ކ@e�=�=�h@f[2�Z#@g-��vu@h��;�5@h�����7@i��kk�@j�«�(�@ku6�Vү@lXQ��8L@m>�N�5@n&]�9�\@oA��c@o��H�r@pwT8�6@p��@qk�@��@q��=���@rc���b        ?���K���?�n�Q�B@A�0H	�@�Ca�@�X<@ {���p @%�t!�Ы@+�i �9@1FJ����@4��YN@8�����@<ҥ�B�@@��Ax5S@B��R.�@E@���`�@G�G�&�@JW���9�@M��%L�@O��O��7@QY"�QG@RԔ#'O@TZ�.�-�@U��$�fP@W�8`�p�@Y,��{t@Z۽�v��@\�%ŏf@^V��ئj@`�c},�@`�&��B�@a����@bܫ���F@c�ۘ4��@d�:�:@eδ��|�@f�6Jf�S@g٥�I��@h��V/E@i��eWQ�@k�pTǑ@l-�/B@m7H�R�@nTP�@oug]�g�@pL܋��.@p��L�@qv6|)��@rY���@r��i�2@s@gbk�@s�C�/�@ty��}߯@u�
D9@u��G	�h@vZ���ll@v��*�:�@w��םuD@xH�mbU@x��c��@y��~3@zC���o@z�9�@{�r�*�