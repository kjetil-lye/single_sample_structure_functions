CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T115227        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?_�BwI�v?�Lo1��;?�XA����?��
��?���;�nk?���I��?�'�!U��?��ڷ�;?�}N����?�eB���;?��E@�?�\-M|�?��oe]�?�E�DXm�@4�g!
�@�S)6�@h�p@
XG�I@@�ɵl@ժ���@�2c81n@� L��@I��׹�@�z�@@_�g��@�u�0Z@ ��}|��@"[�K��-@#��Ƃ@%��DDF@'9���;@(��і�@*�	�-��@,�/E��@.�u��
@0f}ǖ��@1xo*�@2��GK@3����r�@4���8@6"#����@7eO�_�@8�{xˊ@:	���J`@;kq�i�@<֚��@>LHe�@?��?9@@���y�@Av��߈�@BF���@CW@C����@D�f+��@E�e�e��@F���H@G���5t�@H�癌&�@I�)�*@J�eA�*@K��u8��@L��z��@M�i���        ?Q!��](3?~�r��?��Y�ή}?��O���?�@1���?�֖Έ{?תL�m*?�8�KD�5?���nS?����c��?��� ��@�X�T�@2��|@F����3@�ˑ1�@�фɹ/@�TY�R�@��]��Y@# ��:3@&a5���@* ~�F@.Ao�D�l@1c���4@3�b�{1�@6�\�� N@9h����@<��-��@?���d@A�T�7	@C�E6v"@E��+��c@G�ڔ،�@I�'��^d@LH�M�p@N�D���@P�O�hW�@R	���@St����o@T��zt�@V{%|�@Xaų�@Y����*H@[}+�7��@]H��~O\@_$�j�Bh@`��M���@a�u+�@b��/�_0@c����2�@d�@�z�J@e�WM7�@f�_I�1@h-.e��!@if�n�	@j��?s.@k�H�7N�@mF�fy|@n�"���@pT麏@p� �xr@@qv�WlD@r6�5�@r�b�ʻ        ?P�Z�y*?k_<b��?�٪��K?�v�E���?��k�;�?�P|*��?�˔�?�s#�w?�9�P��?�2����?������@mt�%@3@
��:��-@i�g�@�G��@����@ BQ*JO@#��s�@'eq��@+�h��{q@0*�5h��@2ëAX��@5�1�*�V@8���GI�@<���a@?����@A�Ϗq9g@C�x�!O@F7��d�@H�[1#=@K0�s��@M�m6 ��@Pc�!2@Q��q1@S��0z��@U0+��v@V�k����@XΞ�
�U@Z��?܋@\�B<�}�@^�c��(@`����5@a�}�`f"@b���|�@d$�=�^�@eo�{�\@f�bfFc�@h+��y�@i��h��	@k�<m�@l��P��f@n>%�nQ�@o�	`���@p��@q�k�W�@r�
��{@s��ad@tx�e�P@uu�r�:i@vy�h���@w�xm	�@x��ְ�@y���        ?�b�߻;?ׯ%rѽ?�@h=��l@�6a¾"@�>hЕ�@� ���@%5��@-���5�@3�V̏8�@9�6jުg@@��XG@C֓fnyH@H^Q�S@L�o�M��@P����QU@S�ɽ�N@V�B��@ZI���@]�|�w��@`�ڿSV=@cA�?*@e@A�=,@g���wX~@j)pe��@l��Θ�@o�u�i@qS�+��-@r�4
'@t��o�o�@vD�>q�@x@:!4l@y���4H�@{���;Q@}�6{7@�c�pZ9@�+l;f�@�R0`R��@�������@��Q��F@�:�6x@�X�u��@������-@�*��@������@���LXM@���K��@�	�8�@��#��_^@���G���@��-z�@�qϝ��@�W7�9\�@�BB���@�2�ô�7@�)|��;@�%�#�8@�(	D��@�0<a*�t@�>x��y�@�R���>@�mF��@���i��@��ٽ���        ?SU�dKsE?�kRW0��?��M�H�'?��{�
�?�D��x?�:�Է<?���"��?��~�eX?���rY3�?�활��h?��o��?�������?������J?��xM�?��9� &?�wm��pN?������\@!t�N(,@�?v_-`@=��_U;@
��P��@�(Î@'BTil@ێ�m�S@�@��)�@���;@�TQ�&(@�x����@�®��@7����@ S�T}@!�0h�Jg@"���t@$MK����@%����)�@'<�VKk@(ʡ�I��@*g�s
�@,�QX��@-�m^P@/�n2j�@0�~�c��@1��t���@2��e?ۼ@3�v�J�@4�Mp��	@5� �F��@6���>�@8�6)��@9A�tו�@:v��T�@;��̮��@<�'�.D@>Fs-��'@?���o@@|��� @A/-�u�@A�a��2u@B�W!�$@C`b�2�@D#�:�f@D�˜���@E�1��W�        ?Kp���?x`Q%[F?�����l`?���	U��?�5� ի?���֎�^?ֹ�o"?��2Ur�?귆���?��,�a?�k�m��@��7%:@6��n.@���˚*@�Z�D�H@*���I@D:lO!P@!�w�)�@$FȻ�BT@'���:r�@+��w�@0*�����@2��HU�W@55�:C#a@8�S��@;!h�h��@>nn�3��@@���:ۏ@Bދ�g��@D�y����@G��l@ICnQʛ�@K�gJ���@N(I�_�D@Pf>�U�@Q�0xR�@@S=&��m&@T�J�R��@VX��F�M@X �����@Y�8�J^w@[�vgL%@]b�垅B@_Q��,C@`�ICt@a�ޥ`�@bŐ�^o�@c�i�Ԍy@et�<�#@f4�3dS�@glI��3@h�'��-@i�`]�u@kJ�$B�@l�j�@n�]fB]@o~�`E�N@p| ��5�@q=�w;
@r3_���@rς}�B�@s������@tt�
�M/        ?H] |/nU?v�﷕�?��]�	F�?��ۂ��?�\���?�/�ňp?�	�P��?�Pd���*?��>pzS?�j$�ð?�e;�u�@����@<���a�@v����V@�@NQd�@�^$��@��,�#�@ >�7���@#X
����@&�2��@*����r�@.�p��U�@1�}N�4�@4>��`4�@6��ɑ@9�{���@=����@@8d��HW@B,vo@C�BU@E�)�vS�@H#R�a�@Jj�cZ�@L�;�<�]@OWۋBe�@P�iU˵�@RcD���e@Sױt�MQ@U\�|��@V� ;�{N@X�=��^@ZRÐ��@\���@]�O�H��@_�?�
p@`�w>g��@a�&�>g�@c�'�%m@d(��	g@eL]-�`@fz =E"�@g�d����@h�C$��O@j<�{r:�@k�4���@l�z��"@nW�?�ha@o���G�@p�W>���@qfĆ��@r/c�.��@r�A3��P@s�j$0�        ?���S�d?�p#�h� ?�D�1jl?��>�/@ʟ=t(t@��/��@����	�@!glK��@'X�c5�@.K����@3%loU�@7��j@<�X#��?@A<�̘�{@Da;[n@G�c��@K�� +�@O���k��@R�-El@Tp�p��@V�8���@Y��Q���@\��I��@_��@l�.@a�\I'F@c<�C$7�@e8����@f�1;�@i �*b�@k�zeӗ@mU�)%C@o���/",@q��U@rKG�(@s��;L�@t�]��*@vc5IJ��@w�Ö�Q�@yb(�BV�@z�����s@|��g�>@~I�E%�@�0�Dd�@���t�}@�إ:b`^@�ͼ�6�@��=��@���+���@�ع�p;�@������t@��9��@�%i���@�M�@�Q@�}'Jq�@����\g�@���c��F@�7��A<@�Aћ��@���P@��M3�.q@�Jp$�@��U�i{@����t�        ?V,�o�M_?�MG.,��?�w�E��'?�z.��?��|&�rY?����?�;��;�?ӡ	�kq�?�E��y�?�1 @�?�}� �n?�/���;?�$�0>�?�T�p�f�?����_�?��x>�?����z�@�)V+i/@Mhq܃�@���n�z@	�D�"�@ �[QY[@(]�A@�5�^@ʠ�ɶ8@ų��Ye@�J��p�@�H�iv@c���~�@��ϫ�@ �@�Pf@""0i��@#kW$�T@$��:�@&dm����@'���0C@)����@+Qbל6 @-7�.��@.�|Bz�@0h�
�v{@1d��KJ@2g�)-�@3s�"�2@4���Xb�@5���zY@6��yE�@7�V�r�@9-F�%9�@:k�E81/@;��Ӑ�@=�
CF@>Y���^�@?�uLg�@@�͉"�Q@AJ�qFCN@B�5RH�@BɌc�7�@C��',y�@DY�m��t@E(���/@E����>@F���p�        ?]��'G"?��gR�s?��U���?�u��_�?łv��$�?�-Sn�v?�{�ԟ��?�K����-?�ݹfM�>?�F�f�_�@Q�nw�@�O6�h@x�;@<�pO.]@)�M���@����@"=*;MV@%��$u@*;ol�a�@.�"
Q5Y@2#CA@5[��6�@8H?A.�@;ͫx�V�@?�73���@A媴
�3@D$,0]@F�:l���@I$�w�@K�%� @N��:(�R@P�,�LH�@R��� �t@Tj���0@VE�U�6�@X:�V�(@ZI5{#J�@\rG8�A�@^�&$V�=@`��A���@a����2@cP۰��@dl�$��@e���Wp@gKs6��6@h��N8�K@jeD�6j@l�޿�@m���V@o~�s��@p�vmgI@q��^�C@r���[�@s�O��(D@t��6@u��R@v�=w:��@w�;@R@yF3��@zL���@{��sn��@|͍�>@~H�q�Z        ?PG+�6�?|�/�s�?����?��ђ�gR?����WV?�ƥ�J�n?��:8��?��$�X?�l�x�?�#6�n?������@ n`Nu9C@R�b�|f@ �<k�@����OM@�)U`�@^�	�@p�K�@"����@%;�dA��@(�B�7Lu@,�z���R@0a��\g�@2�H��|8@5���4�@7��E�j@:�YFghR@=�)�@@k���@B!+�C�@C����@#@E�X����@Gڸ?D@I�A4m��@L.0�h�@NĈ܍@Pv^Q��@Q��7��@SZ��-:@Tj�T"��@U׹����@WR���+�@X��|�6�@Zs'A
#@\���	@]����R@_�͛�ε@`��Vrc@a�Q�L?@b�\=e��@c��4"��@d�|�"�@e�S����@f�^G��:@gϞ�YG�@h�gY�@jʤ��(@kI����'@l��S4@m�X�z
�@o	X�v@p(��g�@p���S.        ?��n�\�?�س֖�?�4���w�?�{�!�|�@b�D��4@��a�@ 2�$G��@&���Ch�@.\董��@3��'k�@8��U=S\@>��AL�@B�~��6k@F�=���@J�H�!Q�@OC�si @R$�y�@T�jU,-�@W��P�"�@[Y)�_@^�Yd��@a ў��	@c�gwN@e<fj��n@g}t%���@i�t���G@lh�e�M�@ok̐W-@p�.5R��@rl�S��L@s���ד�@u���ѱ@wL���V�@y%Q?�I@z�%a��@|������@~��>d��@�y�T�x@��gXj�@����2kF@��36�S@��N��@�M[���@��T��`@����&KR@�Ka6D@�����h@�*����Y@����Q�?@�ĩsM�@���M@��LE� @��h��r�@�h����@�Iw�3rG@�0xG̕	@�(z���@��>~Nm@����@��I=��@�	E���@�����]@�!�nL3        ?P��!(�?y�t�v�|?��%�0��?�+݋�?�2�c��?�j~(��?Ș�+�6?�b6��M�?ׅ��t��?��fZu8?�[�J�?�r^�]?���4j�?�U��?���R?�N!�@?�~EJ4��@	4��s @���'�@8�B��@	 �����@@8ؗ|@��,��@�::��@y��7@|�G��{@�6����@��) �@8��?�@��� ��@ ��R�@"��m�@#m��+a�@$�L�e)C@&q�KD@(
<μ�@)���d)�@+g���5�@-,�����@.�� �(@0p��g)�@1h����X@2gs�P]�@3m@!��@4y�m���@5�V�q�M@6��7��@7�\�)��@8���7@:�[�Q@;R���o@<���`@=ςa�0@?�$ov@@3-���?@@ݻ��@A��N��%@B<{��Q@B𨔖��@C��FX@Db��u.@E ?H ��@E���)g        ?G(�ugT?u)��7t�?���DD�?��Ė��?�����	�?�����?��;��?�g�#�x�?�#˅�%b?�ʗ���?�g��@���@kI���@�BoI�8@�-2L�@;��W@p�����@!/��t��@$�E.�A!@(Jhc�@@,w٧���@0�|l�@3��S�p@5�fd���@8���bW@<&<Qv@?�ؐD�@A���2�@C�#e�Q�@E���y�@H@�O�r@J��f�4@MO�r�)@P L��}@Q{�J(	@Sü�u@T���S.t@VM�X�+@X�{Ǟ�@Y�#�L @[�m��@]����@_�hD��@a�F;��@b0\�8�@c\��aE�@d�g�yg@e֐�NO*@g$%�!��@h|��[:�@i�����@kP[1's�@l���R@nQP��>@o�n@p�"LÀp@q��Ukʋ@rn�Z�;�@sN��7n�@t4��2KZ@u ���2@v���F@w
j�_��        ?GHe|�t?v��W#[�?�����ת?��{���?����r%�?ʹ�m湰?ֵ�L/#?�"fc��?���@%Q?�{@����?������@Cs}7H@ }F&w@�r�@��C�#�@QW����@�3޶��@"$Y�0@%��"2+�@)��[[@-�N�v�>@1g'y@4�	[� @7b��;$@:1���z�@=�p�o��@@�Do�t@B�~Q�.@D�5�zs�@G/��Y;@I�'S��x@L$ͬ({�@N�̆�@P�cn�b@Rk�1x n@T�\��@U�X�L @W~N
OR@YY��-JK@[J�V?@]Rs׌J@_o�u�["@`�����?@a�%Ӫ�(@c(�Q�@dd�.��+@e��J�O�@g� ;@ha5{�PU@i�kV'e@kEͼd�*@l�u|���@n[z�ߒ@o��U1@p�}�z=�@q�ҙ�3@r��I���@sv� ��@te+sx�r@uZ7�	�@vUβ�,�@wW�O`j@x`�ٻQ�        ?�D�CM"�?ć���?�B���De?�L+[D�@ ���˻@��K��@�"[m�@f�G+�@$sh�KN+@*�>��C/@1C��\z@5�S�@:�o|��	@@$v���!@CM ܽ@F�(�qAg@J�X�7�@N�f-��@Q�u���X@TI���@V��x�@Y�~�r@]	����@`/�4���@a��I��@c�N"0��@e�T��f@g� �$-�@j*e��t#@l~AZ��Z@n�w�@p����݇@rI��@st��E�9@t����@vcL7>�@w�%P5y@y�s���@{/�>�@|��f��@~�M�)�\@�8M�s�C@�%7du5R@�I�Ƌ�@�j�"b�@��D��@�p��7H@� %��@�0���Q�@�F��
�@�b*��@��7�@�����_Y@��t�gn @���[@�=GIQ@�<�U"��@��1�E��@��q���@�&T�06@���C)��@�z=�@�'�l:0*        ?m74V�h�?� s�
�?��k��E?�?�e��W?��.��S?�����c�?ܜSD�ؐ?�tˮu�<?�t;. ,?�(5Ac?��,?�I?�W{��\?��'�yL@,M2pu@�n<�@���o6@
q\"�Z=@�+���@럠���@���=@!#8J�@j)f@֟k��@d�<�F5@�qy�K@ �o>EM6@"o�Qx�U@#��&E��@%��� �@'M	܈@)��1k@*�����@,�R���"@.�v��)�@0o�p�TI@1��/��x@2�'O�ú@3�w�$!@4��;�3=@6/k�^�@7t+o�:@8��/#�@:�!gN@;E��@<��h�D8@>d����#@?���S@@���u.�@A�<�z�@BV˿33@C,R=mFM@D薽T�@D��S)��@E�SB�[@F�8�U�@G���q�@H�����@I�/�HU@J�f@��@K�C���y@L��2��+@M����9{@N��*�c        ?[�c6��?��7K��?����F}?�& ����?�jfV�?ҖT��Y�?�H��0cM?�5����?��o%�0�?����q�@ Eq9�JU@�q�$�h@��B9@��2�C�@Znp=uS@�����l@ �Ls�E�@$(fVun�@'��p�,K@,>\zغ�@0}`v�M@3���6@5�7��S.@9E&�{�@<|&�>3@@��w��@BkT@D-W�N�R@Fr�BR��@H��1F�@Kr��i��@N/M��b�@P�z�e� @RM���]@S�|NVA@Uba����@W+Y��@Y
�/�n@[ �5�L@]#[��@_2�!L�@`���F0k@a�����L@cm�Z�x@d[D��>Z@e��֣�N@g���^@hoC��@i�����@kgp�Z�@l�(���@n�"~�f@p?~�\�@p�0Ɯ�@q���N1D@rǜy@s�95��a@t��O��@u���=�@v�v��^�@w��=x�@x��'��@y�S&��        ?[���?�.�^�҉?�ݱ�BMf?��o�b��?�ᅐ�)6?�L	�!�m?�:�L?�J=a�8?�0��5�?�m�/�?�g]�Iv@]1�'O�@Z�uK�@@&���@����@���|N�@	�6�I@$�K��@"m�����@%�9���L@)��m�t@,�#R��@0���.@2����@5_f	�<�@8�3ٻ8@:�y~���@=�� w$@@��3#a�@B`f���H@D:+� |�@F/ˁ~��@HA��	�@Jpq�'�&@L�V��Bi@O%ӎ�g@P֥?	|$@R)��
�@S�͙,]@T����
�@V be�@XA��V^@Y�v���@[b¿Y��@]$G>@^�$��a�@`l=�3r@ae�Ώr@bg��=8@cq��է�@d����y�@e����$>@fò	v}@g�B�x��@i%�	��@jc�/���@k���x@l�v?S��@nSH��̯@o�l���@p� �97@qI����m@r���-�        ?��t�b�?�;�B�Z@ {�
�^@�� >�@9R玫�@&����i@0= �{r@6&���'�@=���1V@BB
Ć�@F��վ'@L��7@P�_��j@S܉��.�@W6�|�@Z۠l��@^̉���@a��<d�A@c�W���@f;}rZ�j@hӸϬ/E@k����7�@n�g�#��@p�%�Y>Y@ro9��m@t'S�y�u@u�<J�B@w� ��ށ@y�U�i�@{�/��N@~
��Y@�0��g�@�_��@�@����sM�@�❱lx�@�7x3;�a@��-��m�@��Z�@��r`m��@�O�v*@���D��@�D�����@������@���x]��@��++sY@�� 'L+@�����U@���Ο@��e^@���̒|�@��Ţu�@������@��`�rP�@� �7�@�+�u^��@�^
|��@����2�x@���_g�@����a�@�9C}�e�@��h��x�@��jF���@�IIo�        ?QX;j���?z�Lb@�?��C׶?�yi��?����	<J?��j�$V�?ʌ�ҪW�?���q�+�?�}�7���?��G�`+?�H/�CI ?ꊣzy#H?�@�����?����?�XBd�?-?�|��@ ��<@��l{"@A-`6~@7BCρP@k,8��@����@J��p�@F`�I@eW7�@��YE�@�(ւ�@����^p@L�|�̦@!�~��@"�ľ��w@$&ٜ�@%�C�Ú�@'�I�C�@)^.�3�Y@+E3��@-A��g~@/S�/p�H@0���[�J@1ܱ�\@3��o@4<'��@5|Ǎ3 �@6Ⱥ�(�@8 
����@9��a6@:��|"�@<j�ٝ�Q@=�}��@?�]�A��@@�Y�a�@AbY���@B<4N��3@C���@D��c�@D�m�?@Eތ���@F������@G�c�͘@H���+��@I�?"WM@J�6p�@L=�n��        ?FX��V�b?s�6��A?�E�~Y?��t�ySw?��j�*u?�-��v?ԧڽh�9?�rF^�?��;ī�P?���p���?��,#@ ۽��%Z@;�Ѭ�]@�B!��U@.�>�L�@�}8��@�o��I@ �&'�2@$E)߮�c@(�az��@,QZ�9��@0�h~�@3 �p���@5��X@9"{�)�@<��
��@@!�$�@B"F$.�b@DK>0�fJ@F�H�퇚@I�.p�8@K��̎;\@N�6��tN@P�f��K@Re<����@T,����@U���!i`@W���@Y��
\E@[Ռ�^��@^�cA� @`)�Eٻ�@a]}"|@b�`�6��@c�mmF�@eMһW@f���D�$@h6Y�7@i��g_?�@kZA����@m�xG.[@n���D��@p@�8Bi@q,\Z��i@r�Ҿ�@s�s�?@t�����@u(����@v;�����@wV�~ķ]@xy���w@y����@zؒ�LP3        ?L��p|?y��>O�N?���mO�.?�l�1Q��?�Jm�HC�?ʑ̷(�?���)�-?� n��f�?�J� 7Ti?��bc�?���h�J�@ m���r6@mD$v��@d���v�@5H�=�@K'F}��@����@[�nW�/@"�G���)@&�L|�@)���p�u@.D�25Q@1_���P@3���@6�"�M�@9��r@<�b �i@@<F���@B�緎#@D%��!8�@FO��J�@H�d�d_@KP��@M��w@P4؜Q@Q�8�l�>@S.;���@T�g�܁�@Vy p'�@X=P-P�;@Z��R�p@\��M�@^��;F@`H��&@a(����(@bK&a�Y�@cx��V�@d�wP��&@e�e�qd@gD��#@h�(A}��@j���5@kv���>@l��H�@n|
���@p20ث@p�(Ǝa@q��~S�+@r�n���_@sj�)v�@tRs�;��@u?����u@v3@F��        ?�7��s?ȬrB�wC?�{s�BB�?��F���@SP�׾w@�կ���@1]xju8@!�xÏ�7@(h(�@0�8��@4��Ƒ��@9� !�;�@?�i�{�@C+���z�@F�oFK�@K��)P�@O�sK�@Rb4��¸@U(}	���@X-�<1��@[t��T��@^���Y�@af��(�?@cr,�j�'@e��莕�@g��Ʌ@jr���rM@m=��@o��}G��@qi����@r�8oN�@t��n�Ϳ@vT��l�@x#�U�M�@zǛ�@|\;@~S�@��7��@�?����J@�kI{oҭ@���^�݇@��_C+�@�5�N��&@���]P��@��EN�Q@�mE><�@��V��@�z?��C@�c�?��@�\�<��1@�5��.��@�=e�,U@��.�!ؚ@��@�@��t�� @��ݟ�V�@���)8��@��kF�ʈ@��h���@����N�@�#n���@�7|$ϟ�@�_��6        ?^�fUR��?��a�K�?��t4�vQ?�=E�R�?�� %�b?���LL��?���mm?�T����?��W�i?��@HY?�F�iLׁ?�*'{Y�H?�⹔���?�����b?��Us��U?�_b�}@�E��8@���<E|@�J���@
���z�z@��[H�@����}@��
�8�@�!�ˇ�@�l2@*@!�o�I�@�;��@��+~�@ cܼ lv@!���:
|@#G��0��@$���)�@&t����C@(&��e�	@)�4�5��@+ķ���$@-����U�@/�w{���@0���Ry@1��T�'@3�s?�+@4<j�N	@5n�k8�@6�X���@7���U@9DE�i�@:�t}JpE@<-�@@=x}�؟@>�tJF�@@=�1q�@AI_�!!@A�m�
@B����S@C��}�@D_���ZM@EC��L�@F-/}�x@G@@ G@H��R]�@I
���_/@J
��
�.@K��ٷ;        ?P&T�4�+?|���_)?��B�Q?����
?�h���?͏��lʏ?�YY�<Ͻ?���Ɏ�?�,h�?�c�#�>x?�n�3���@�A���@��.D8A@�S�?R�@��z��@4�|�Y�@��y�c�@ -4��@#3Ŷk%�@&��a�@*Nz3a_=@.i�i9��@1s���@3�2,�o�@6���7�@9e�d�� @<w���@?���e��@A�U��o�@C}s祲�@Ew����@G�6��!�@IĢQ�ޫ@L:���	@N�V��@P���I٩@Q�A�<�@SMtTV?�@T�O�7'@VLĤ�!+@W䝇���@Y��fR�%@[E{d��@]��0��@^���6g@`jf#��@ahU��7F@bo>ԫ��@c~�>@d���n�@e���җ@f�����@h�)�e@iT���*@j�T���@k�^��d@mE&?r@n�ZP]��@p
�ֿ@p�Im��S@q��4	:�@rLne��@s%3�        ?F�631�?u�;���?�6�9��?�v����?�A�=@�?�e�Ώ�4?�p����?�ǉ�Γ�?��V�Z�?�,v���?��
���@��,��@�>1	�4@E�I��@��E7@��,\M@���@!��t�L�@%	p�hA1@(��B���@-7���Q@0�OY�D�@3�˻x�@6��ܝn@9��^�D@=f��:@@^�S�>@BZ��_�@D|%,���@Få�b��@I27e�	�@Kȭ���@N��M��@P�.��]�@RA��"nx@S�A,c�@U�����@W_8�7�r@Y@w�
�@[7�-�''@]F4+�r�@_l�M�@`���y�@a����zT@c6����@dy��I@eɆX�3�@g%�Vi�@h�$O�b@jR�=@k���%
�@m.-���@n�$�،@p1S|Y�@q��h��@q�l�-�@r��p�,@s�m��]�@t�_=i7@u��@�?�@v��Qw:@w�=4h�@x��)]O�        ?����<��?Ҵ޵2L/?�-��pu?���R�8!@���:MZ@�����W@ ����J@'�o�౼@/���=��@4�0ɂ1�@:��'$
�@@����Ay@DL�n�l�@Hz�/M�@M$?@޹@Q'~c1@T 	1�>�@WA[z�!@Z��	'a=@^5@�Q.@aN\�>Y@c?l�H@e�]�S@h<h5�@j��Z���@mw5�-�v@p8�O�@q���k^y@sx��+@u:��K@w)�9�@y$ �i@{��h�@}8i0�rp@v����L@���P܆@� 工�G@�g�R�5v@���-���@��U}r@���ɤL�@�Ч���@����I�@�2�k�h�@�ۋ�@��4<U��@���p���@��z3 V�@���û	�@��r���@���s؁�@�����@��":2��@����>@���~�s�@��c�D@�2�ڲ�K@�l6T�@����i�@��l�d��@�$��@]�@����O\@��i\8�w        ?X��|0в?��7�d�?��ink?�y��?���pÂ?̩*�}<{?�EB��"�?��@��R?����x_?�ό_��M?�F��s�?���B�}?�^�P�?�?�!Ҧ�4@1��.��@ �~�@=�'jo|@
�vy��_@fz�ӸU@5=-�Ղ@]���/K@�ҕj!�@#����)@���d'�@��a��@ >7��@!˂O^�@#m��~�@%%���@&�M�@(�wL��@*�>��c@,ܿ�e��@/��;��@0�}Ӗh@1�{�O%@2�����`@4;��)�@5���R=y@6�:i�P�@8B��%@9��K�@;-N�䨙@<��,oC�@>Hc��Z�@?�Jb�K�@@�G FLU@A��ݖ@B�L��h:@CrM'T̥@Da��M��@EW�ҽ,@FS��X@@GV��0@H_��\�@Io]nn�@J�x���@K�56�@L�����@M�Y/��@O{��j@P*%�uR�@P�r/��        ?S�K�T{�?����}�?�>T9/*�?��'��|,?�i�ٲ�,?�r��ϩ?�p)�u4K?�̣<>(�?�����?���{Z��?�X�eD@��|�v�@�n�.�@|��N@���@H
M�/�@2���@ ��x��@#�}T@^�@'xb��|w@+OYK5@/��<��@2H�ec�@4�h�-�@7K�P�@:9�~��@=^�*��@@]��_��@B)�p�7�@D��=�@FeO;�G@H>�y�@J�uk檥@L�W��@Oh)2�~�@Qd�I�@Rf�R��o@S���f@U[I��1@V�;A�O@X���) @ZH#i9c@\�����@]���Ɉ�@_Ј7�R@`�	�Z,�@a���o
�@b��t��@d��Ѷ@e7����@fcDo���@g�"��@h�ts��k@jM��@ko���2�@l�܀p�D@n/��R�K@o�c,Rd;@p�w��@qL���1@r��[��@r�F���>@s���ނ�        ?Jř{D]*?y�<�.?�"�T�t�?���xy6?��,#�?�^(Nu�?��oGF ?���Zg�?�֢]���?��B�`�?�u��B�@l�Z�@�-�{2@��6|@z�#�R�@$`A�@��c�@!�9K�f�@%;��Yn�@)�Y�@-X[̭�@1֘�@3�֮��@6mXũ@9||+�.@<ʯ���@@-.��=7@BL� V@D!c�X˝@FO#�ಢ@H�1 >��@K+��f�@M����^�@P6���{&@Q���N|�@S.��@TƟV4x�@Vr�o� 7@X2놿�j@Z_+G@[5,�@]���Dv@_�c���@a�����@b0�;�j�@cY4c��@d��C�xZ@e���@g��+�@hi;�g
@i�2���@k4�?�@l���q�6@n._�r@o���ܾ@p��-��:@q=�[�@rX��k�S@s8����Q@t���@uK&�¤@u�G����@v�ͥ�         ?���	��|?� l{;?��乡6@1)�w�@*IVT�g@ 1!ܔ�@'�А��@0�w�i}@6@����A@<�R�q�@B�T��@F6t���C@J�$���@P �ԑ�@R���gS)@U�4�sMw@YN��!(@\�j����@`s�V?�@b�}��:@d�n��j;@gC�GObB@i�e�6��@l����1@oyQZ�@qDe3��@r��~*Q;@t�q ��k@vY�$� @x7P�<Y@z*��p�>@|5�e��@~VT�p@�G�L@�n��0
@�����n@����Y@�/4ӓS�@��"��D�@���(���@�`9{�x�@�ߥػea@�l&��)@����XC@�������@���|�O�@���'Hf�@�y_rp�@�h�I\�@�]�h��@�Z#��u<@�]�W7�@�hTic:@�zD͠@���	wU@����*�@������@��IfY�@�=>�	@�@�y�	���@�^���W�@�f��@���{�
        ?Vb�8?���$g�?��u��#�?�=v�*?�o����?�:8�I1-?�t����y?���@�q_?�u��)?��#׳_?��iJ�?��R^e�?�
YXM��?���!�?�?�y8���s?��Hb@$@6�Գ�#@� �>�L@}��h��@	p��'@�� ǧ�@�N�a�4@�=��S@�( ~�@�\���@�N���U@$l["�@��n��@��E2@ �b��9�@"33�J�@#� �U!@%"��t�?@&�(�b&�@(S�M���@*��k�@+Ɩ��@-��^x��@/{��J��@0���L$@1�@4Ώ@2ĭ���~@3ת�TD@4��2<�@6�pp��@7B��@F@8w��K�]@9�x���M@:��	QiU@<Gw�&}@=�|K!H�@>���R�@@17�6�@@�sy�w@A�;�5��@Bc�]�n@C'����@Cﱟ�-�@D���y�<@E��Cf�@F`k�&��@G8�. =@H����Y        ?Fi��'�?tbT�M�?���u�89?��w��L�?�T��dD�?ǂ�@ �?��/�1��?�r���r�?璌�0?���G?��)j���?��>{�#�@܈���@@
�|O��@���xu7@(�o&��@���-��@u�9%Q=@"�@"v�@&X�55�@*A�_e^�@.�h�P@1�v�r��@4P��@7-7�^�@:I�
q5@=��)��|@@����0g@B���Mm~@D�K�,@F�SW6@IH��%v@K����@NyZz2*�@P��KoJ�@R"���@S��7 0g@UX��l��@W(�0�@X�R�H�@Z�Sh��@\�YQb�@^ȍb�3@`u�N�@a��Bd6@b�Z�MH�@c���@e&��i}\@fnF+v�@g���ؠ�@i�3��u@j��5s�i@k�.�P�@m{��@o9�<@pNץTB@q�\�6�@q��L�7e@r��I�l4@s��[!8�@t�d��v�@u�.�c�@v�	�)p�        ?C��5�;?sk@��z�?��POV?��m��:�?�GE��5}?Ǥ�,
j�?�!|�2�?��L�^��?�#'6%�?�Q��L�?�����P@ Cs�8e�@kY���S@�[��@w�Y� �@�=[���@��f��J@ (���\L@#Y�i��q@&�1hF@*�Hj��@/]8b�6@2þ�M@4�Z��;@7�5��k�@:��m;@>C�h7��@@��T�@B�\��@Ei���k@GC���C�@I�=�	q@L&����l@N�e�3'�@P�]��W|@RF��\T@S�K�?�@UoW����@W E�Y(@X�.��*~@Z�+�o��@\�R"�@^����I	@`Y��j�N@ak���3~@b��W�(�@c��y�@d�d�u��@f����@gX��-α@h����xi@i�n�i;�@k]G\C �@l���E@n<�{��Z@o���3��@p�wvl��@ql�sb@r:�>O`@sk�4�@s�D|��@t�>�.w�@u�^�Π�        ?�+0� ]?��7T$z?�!�aQ?�Ҹ\4x@�s���@��_qU@?m�r�h@"zy��h(@(�u�3�}@0=��Ȗ�@4�z��z@9�\�
��@?N>B��u@BՄ@> @F`7��@JJ���+X@N����Y@Q��؈��@T69�	xT@V���<E�@Y��a�7�@].�&��-@`OR?I@b$��h@dT=Zn�@f*b���@h[kJW6@j�֩*9@mC�e�@o�J�B�@q.~�J@r�3-G @ti��+�@u�Cd·g@w4�����@x�K�V�@z���@]�@|i�urh�@~HS�1�@����@���;@�$��N�@�6#���@�O��,6�@�r>�̥�@��	r�L@��LG��@�:��i@�P!��G@����y�Y@����z@�N�!&U	@��`J��@��"j*�z@�L:�O��@�vx��"@���J��@��R�F@�a��l�@@�1�ݲQ@���k\�@�ݝI��@���/���        ?S��"X?~
"���?�#��U�?��b!�
?�M"O�̢?�����>?�:c+�?ӷ��6�T?ڀ�X�y�?�7mw(a�?�������?��ԒGkx?�^��E2�?�E�?�I?�*bsz��?�)�@�^?�\lY��d@m%���@������@;�uS^�@
$�$�@�@B���W9@J�6C@�'@�ܝIY�@�*��f@N��N�@6l)�5@�N_[�@�A�� �@ �c�=@"o��T�@#t/�Ҩ�@$�]���@&c&��@'�,bs�v@)���+,@+6G����@,�U���b@.���uw@0FԴ��@19�((p�@23��1J@352�8_�@4>F�"�s@5N�-�,S@6g8?(�@7��:B�@8��9@9��J*&n@;`5n�q@<Qq�O�&@=�Ľ%�@>�Tv���@@��3�@@ʷo��5@A|��̓H@B2Ne� @B�j-�@C���^@Di���pe@E.O��5@E��\�g        ?Sva���p?�)y��?�	ьA?���DS?��wP��?�)�C�=�?��E *�?�$���_3?�/L��?������?�#�h}@a\F2�@z����q@��
��@��L$c@$�#�@.<D��@ �Hs8�@$,���@'��~6@G@+Ƣ�6�I@0���v@2�o��1@5'b��|�@8��w��@;�#K@>v��@AsN�Z�@B�tY��@D�~7@G)�d�@Ix"<e�@K藕�P@N{��@P��4|sT@RG��F�@S��`=R@U��� �@V�1���@Xj�S�@Z1Z��_@\
^s/ٍ@]��.�@_�#�<L@a�O�<k@bb��(@c.[W�@dR�n@eRy��@f�����@g��Ͳn@i>�'�n@j�n��9�@k�<��R�@mR[b�z�@n���0mg@pI�U!�@p�ٟ��~@q��&�m@rl�b�@s:�*�(@t�n�x@t�h|��        ?L0٠:O
?x����X?�����?���pNK?���:B��?����.�?ե���W�?��9k�t?� @��X�?�ǑL@�:?�u�����@ \��YO@a
}W.e@_��j�@6��#]�@P�:kY�@i��@f��c6�@"��9{�@&fIH�@)�+p��@.�ތIN@1PJ�
��@3��ŵ�@6�K(�@9s��xr@<��$&��@?�:B��@A�F����@C�l����@E�TJV�@G��B6��@JCs�Դ@L�*8�JE@O;���fk@P�dJ�:@R[d��,@S��+�U@U[+-6�@V�*!�@X�0�s4@ZXݜRZ�@\$��X2l@^�nF�_@_��|��N@`����h�@b .�.�@cP����@d+0��T&@eMּ
mw@fyK��c�@g��@"�@h��n��@j0�� ��@k�~-��@l�Gn1'T@n9�IX�@o�g�@p�쪕�)@qJuפ@r��2j@rգOw۶@s�We��        ?��թ!{�?Ј�,�c$?�p�`>0�?���@	��:��@����o�@����@%�^qU�b@-���;@2�=�
��@7��Œ}@=�ML� @A�'���@E�YƋ�?@I} ���@M��,k�@QE����V@Sإ0�i
@V�{�*@Y��=�um@\ޚ�]�@`*&��Ѻ@b�2L�K@c�-
��@f`״b�@hE�~�f@j�W�/ 6@m̬fF@o��&��@q.��ލ�@r�<dG�@tzH�.G@u�_ +-@w@�Q���@x�e6^�B@z��NM1Z@|~į���@~_˵At@�(��Ix@�*EUq�F@�4K�
@�FZ� j�@�a ���@������@������@��^cu"�@��pa-@�dco��@�����S�@�;� �h@�eb x�J@��#Hh@���j v@�Y_O%6�@�a�!UC@�ݔ�ѩ�@����?@�rc�[�~@�B�ֲ��@�r0�9@����+�@��o�F(�@��޴�2�        ?d�5���|?�3F�$G?�ɢ����?�@=/�9�?�I=]4�@?ыg�h8?ٓ)�"�i?�x�4?�[i��A?��Z�3]?�u���?����An�?��a�_�@ t1��@RF{��@t[���@	�M��!�@�ۡ��@�PH1H@�
���@+۔�a>@�t�!_@0���gt@��]��n@�m,n�@!s�1�T@#��-�@$����&$@&� 8��@(m*c�l@*b���w@,n����b@.��l1|@0e�E�F@1�X?�m@2��2�2�@4P�x�@5OqS�s@6�̦��Q@8&�S@9|m���@:��B��[@<������@>K�O[�@?��[��t@@������@A�z#[-p@BmQ= �@CUM#M�@DC{�x�@E7���3@F2�Y�ũ@G3ZBZ,@H:Vp���@IGq��H�@JZ��zJO@Ks�TZ
@L�QC�@M�ʥgV�@N�_\�i@Po.�1@P��s9��@QE�\�<!        ?[x�S�M?�T�C �S?�TGZ�r?��Y|�B?�Cb�F�.?Ҏ	�z?��f��ʂ?�?�Cc�?�\?�F]�?���q-F�?��9'?��@O.mNO@
-0�1{�@�#�Y�@���:7v@:Z]��@�)؄,@"=��G
�@%�H�X�@)I��y��@-`�����@0��N@3`Ʌ~�e@6�2�w�@8�|�5 �@;��S��@?OmD�|.@Am����@CQj���u@ES��wn@Gu�cWH�@I�_t0�@Lk�6�@N�t	P@P���$��@R�ЭX@Sx�)R��@T���11@V�R$�Z@XA�wбL@Y��T�T|@[Ό�e�@]�G��y�@_�D1��L@`�a��@a� �A�@b���8,@d"W�=��@eOM:#�W@f���ÆN@g�b��щ@i��%BD@jkԁ昫@kͽ�B{@m:�^p�k@n��?��H@p��M�@p��i�K@q��_��@r��� [X@sZ]: �@t8�ǳ�@uaK�hA        ?]\�r�?�p*�(S?��¼h?�Q����?��r�U}�?��,��@?�|�3���?��X��?�<��;�?�Kf�1?�?��{I�@����sg@
�JYE�@�4��	@cl��@��$� �@; )��@"�~[�2�@&�����@)�F��7�@-���A�@1F_�F�@3���H�@6o�V�@9UV�$�@<qߌ�z�@?Ɩ%���@A�7䑐�@C�(�1��@E����t�@G���ң�@I��b?�@LH���^@N��`��@P�x��R�@RO��Z@Sxy�@T���U�@V�(��k@X��$@Y͸2]f�@[�b�T�$@][ύ0@_<�">H@`��I_@a�����@b��k�]@c�O�:��@dϛ��A�@e�Ӫ3@g �b�@hV���@i���Ɣ@j���	�@l/!���@m��Q�7*@n����@p-mT��@p��'��@q��hC@rm�`��@s7��TM@t���š        ?�����"?�B�l\ m?�
��K�J@���?}�@^U@&X� H@0bm�-F@6�P��@=)|;V�@B��9O�@G]����@L�UXeM@QA�����@T��!E�2@Xk&���@[����i�@` W�-cv@bm���@d�p(���@g��+@jn�I>�@my�Sel@p[n�#@r6x�?
@s���r@u�5��g�@w���t@y��U�K@|2X,W�+@~�O%Cm�@�~ ���@��n>�q�@�,�hc
@�}���@��V5@�t�h?J�@��MO��@���kt��@�X�XC��@�T�v:a@��R��H�@��P�we�@�ۍJ��@��P0˹�@����TP@��V[�a�@����'�@� xiV@�D�EUr@�q R�,F@���s!@��.H:Vh@�#IZ-9�@�nȓ��@��{N*O@��F�ܦ%@�>"�|�@��ѩ�k�@��WH�ҥ@�g��z��@�'�FX�@��p~<@�����        ?Q�YJ
�?}W��[`?���fkMY?�<�xi?�$q��pA?��u�A@(?� �=�,�?��
�3I?��j����?�s��9E�?�%P��G�?�|j�}�?�CDԿ0?�|:3ې?��i��z?��j�kE�@ &�-��1@��p=�h@*�jz@��Ƨ&p@
��"�@+,g#HC@��Fz�T@�ߘ���@��m��@���U@�ȹ��d@�D4�˲@:�n@� ��+X@!�h���@"p�Q�@#�Ɖ'�I@%B2D_C@&�;��|�@(I�t9ǲ@)�[��@+��pn�r@-<ɽ_̩@.��֞@0g��0�9@1W�}`b@2M�R�4@3K�#s��@4P���s@5]���F@6r>f�H@7�����d@8�dӵߠ@9ܕ7���@;��uSp@<JWj�
@=��\<@>�׌�b@@]=��@@����(;@At���L-@B*�Kx@B���a@C� *��@De����q@E,�62�@E�.ڶ�t        ?J��0z��?w�V.�:'?�E���?�]�5���?��.��*�?ʼճc4?֗�pIE�?��n�?���A?�&�nD��?����g�P@��Fun�@~�W-�@9��q��@���zh@����de@�w��@!���
@%�,H @(�/��@->Ib�?c@1�
�F�@3��#�		@6�`�8G@9����@=C
@@W�~��@BN
0��@DhèS��@F���mj@IU�׾@K��s��0@NE�4��s@P��b\�@R�,o@S�Nh2�@UE�T1�@W YF�@X���*�@Z��n)o@\�6T��@^�9���@`j�|Y/.@a���0��@b��*3m@@c�;�NI@e-�Q��@fX��У�@g�r-�
@i �hW:�@jd���_>@k��Q�J@mK�izm�@n��_l��@p.:�S<�@p�I��D�@qˑ�
��@r�V�g�@s}���@t^��I��@uD�[���@v01��.i@w �1�A�        ?F��y���?u��fK�?��vHQ0�?���ܑ?�8}����?�$9[���?�I�����?����?��3�?���0��?�n 6:�?�pr�b�R@�����@
f�~�o@��z֡@�Y
�k@.�
r�@dE�M��@""b	�(�@%lU�>��@)�ץ~�@-'I���@0ūj�v@30��@5�뀌&@8�VU"�@;����gm@?��t�@AD��L��@C%pY��@E$@	��@GA��@I~�l�Ӊ@K�#�ZS@NWC�ݙ<@Py��k��@Q�F��S�@SG�Hʞ@T�F�ʥ@VV	(�Դ@W�j0ݗ�@Y�{��D�@[iNK�$Z@];�&�4�@_i��t@`���f��@a��wws@b��;��"@c�;8xzW@d�O�7@e��_J�@g��/0%@hN�3�@i�����@j�Wx\�@l"�%�p�@mzB%�fc@nڊ��s�@p!�0�@p�i2�;e@q�l�$�@rX��VQT@seY�O        ?�Ҩc&�G?�/����?��ǵxr�?��U�#@����6^@,q���@�Ӎ�0O@$T&�h`�@+��ܑ$�@1���@6���	�@<�'D��Z@Ax�����@E� �k�@I6��@Mx�x	�Q@Q*^��h6@S�ϩ�,/@V�v(�ѡ@Y���`�@]<�
k#@`o���N@bbkq��@dv%��<�@f�:���!@i���@k��z@n=+��Y@pn�fH�p@q�@���@sb�����@t��B�@v��J�&@xRL���&@z��'u�@{�8R���@}�����@���K@���a���@� ߞ�@�Ԑ��4@�9�����@�c�G!"�@���_�@�ӥ��P�@��,��@�i4P��^@��j�^�@�%f���@��G,�@���w$`@�����@���w�(@�U�V��@�%�Ir��@��W��In@��>�|�@�����/2@��o|/G�@�����@�x�3��@�ok>��I@�k��!X        ?_��lu�<?��-ᷯ?��vh�?�%����?�:��?9�?���֌�?����"?�u>�(>�?�X`7f�?��q��g]?�,[��?�G�;^?�L�~��?�b#v��?����wp@bO�iK-@
�-���@鿕e@	�꫾}8@N^Z�@jb3���@Ja���@GUW��@a��e�3@�b�һ@�9~��@cd�#@��/�>@!Se0�i�@"������@$3�Go�@%�^5���@'S"8:�R@(��7�˿@*���c4b@,{@���!@.S�y�@0�
˝�@1q:,F@2 ��5��@3.����-@4E
0@5d7g
L@6� 
]�4@7���	Xr@8��nJmM@:9C(q�l@;����@<�'��O�@>8�Q3ֶ@?��E()@@@����@AF����@B	��K�@B�Kz1�@C�u
+�@Dm����5@EC�����@F�)�uv@F��8W��@G��1d@H�oz�@I�Ǘ�i        ?M����\s?yęG� �?�Z�?���|~?�W��?����(?؄2� e�?�S/a��?���?��B#'?������@'�i@	e|�@/۟9r@+u'�f @�H뱎,@dG���@"H�B�@%��OC9�@)�.4�~�@-��FD��@1?��m\@3�?���@6�i����@9�Y�� �@<�ٛK5@@Jn���@A⌍Z[@C��Ù/�@Eލ���@H��8k�@JPzջJ@L����X;@O76�1�@P�u����@RI��Y�W@S�'B��g@U2�؎�@V�]zH:@XVb�%@Y����O@[�>F�|�@]y���z@_L�#�@`�r}�Q-@a����#�@b��3{{@c�Mܲs�@d�8��$@e��ѽ��@f���q�@h ��f�9@i.
�ѱ�@jcO\��@k�l?���@l�s�c��@n2x���@o��H69@prc�~"@q%�W۹@q�]7�R@r����5@sVw�1)�        ?Qgn�{l?}JI�e;?�H�f��a?�cG�_�\?��LՈw?�	��Q?�#j�wG�?��K��b?� �i݈?����?����@���q@XI�.@�d��@��C��@��_��@����݃@ �g�W��@#�w�1�S@'^ī�-_@+6?UI�@/k�p�$w@2 ��&�d@4})<G��@7+3�K�k@:�Fg��@=+Qb��@@3�W�f@A�JutG�@Cǔ@��@E���ô#@GĠ�\�@I�դ?�@L*�wպ@N���p9�@P}}��CT@Q�mG��@S�Pv=@T}H�x0@U�D��F�@Wj����O@X��Hml)@Z�׶ɜ�@\3���@]�@/�@_�!G؃�@`�fx^_@a����$*@b��ZmY	@c����δ@d�}E�@e�U��@f�*�F��@g�֔Z@h����t@j�r�0@kA�Q��y@lv3���@m�����7@n�8(���@p
��(*@pǝ���@qsۢu��        ?�R���~�?�|�A��?�j	L�G?��D�	Z�@f8-/@�)C���@ U��Ĕ@&]�e��@-�
����@3Dcw ��@8>�|�^@=�LnPߘ@BĂZ]�@E�B�P@Im��֗@M��� @Q��Q&@S��$�@VJs��l�@Y-L��hz@\D�Qv�)@_�'%�N]@a��9 �@cfʿV��@e_uٹ#@gtG�.��@i��m�ڠ@k�	��.@n^���,B@ps��@qƼC�@s(��0��@t���&�@vI -�@w��˰�@yH�b��@z�=ٞ�@|�&�U�@~���n �@�/�9�'@�&p®�w@�$�H��/@�+b�'��@�9��>�O@�P�J[1i@�o��5W@��p���@����͋I@��U��#8@�@c��K�@��6���@��ꇖg�@�8�0���@�N���Ŝ@���K�)@��!n�b�@��I��]K@�Fy��h@��B���@���F��@���*�V�@����۝@�e�$X        ?Læ�&�?v�E`?��B|*?�!w'��?��u9���?�UVǊ�?���ƹ��?�����?մP�;M�?�QĊ��?��oE9�?�T�9H�?�;w��p?�Z4Y3��?�b�zWK?���e|W�?�_�W�?�W�Y��@Q�Gs�@��0��@��(�@ɉ�m�8@����%4@�x%]�@����@�U�6z�@kHt��@N�'2�&@Kg��@a����@���@ز �U�@ ��dc~�@!���r �@#''��@$��m<@%�又|)@'Y�i�b@(�5b\;�@*j���t@,��� @-��X!�@/o\��4}@0�E���(@1�2��E�@2{��h�T@3v8��/@4xb<�@5���	�@6�#�;@7�ʢ	f@8���h�c@9���h��@;#;�1�g@<ZV����@=�(W��@>߼!�X�@@���l@@�+���@Aq:��m@B$@h�@B�Cq��&@C�Klz�I        ?DX���?q�"h?���2��P?��e^�o�?�����7�?�=>;�0�?�����?�Y�n�e�?�灙��+?����xn?��T�\?�7q+Q�@�]���B@
�Q�ai�@ݍ����@�碅�@���i�@b(�
�M@"ӧ��,+@&[��v�@*L��n�@.�T�O�@1����6+@4gadLg@7L'���@:qB�X��@=ؙ�D#C@@��p �i@B���O�@D֤��[�@G#���B@I|���H@L���pD@N�Y��x�@P���@RH��f�@S�u���@U�m�!<�@W@��S�@Y�(���@Z����c@\�(�.@_�z���@`�0@a�Қ��G@b�aj�]B@d��O#@eL�?#��@f�� {�@g�3h$�@iLP&��@j�`��@l0*���@m�U:�&n@oBi�K@pn�_�D�@qB<�q@r�;�n�@r� w���@s���!�-@t̛ì;@u���"ǻ@v��ȣ>`        ?D�q�va�?s����?�e�Fc,�?�y�h+�?���N�l�?���{�	)?Ғ�_�c�?�Mw�u��?���fQ?�t[_x9G?��ź��?�X�T�@Gb��a@�>����@QW���@u�u�.@֏�� �@�A��@!<皫�@$ftR�@'�����@+��b��%@0	;�27@2]�ѐ/O@4��n��j@7��@#G�@:��8�� @=���y֋@@��yZ�m@B]�284�@DG��:�0@FNrwD�@Hr��~9�@J��F�W@Mu��]@O���ܐc@Q���S�@Ru��?@S�,=3�&@U^�iM��@V�(����@X�Oޣ_@Z3c _�T@[�,7g@]��/��@_�By��@`  (�@a�;&�@b�/��*�@c�|/G�9@d�.l�^@fS{���@g7����@hi2׉	@i��Ç�@j��ZWq@l0�F���@m��Sp%�@n��s@p#��o?@p�v�W@q���4R�@rW#A��v        ?�h�ocj"?�ϝ߻?�_�l�|?��cUl?���FF�@���RV�@��m���@vRӦٙ@",��7@'���@.E��L��@2�3f�3@7A���@<�A6�r@@ǯk?P@C�)G?�@G��kZ@J���q�@N�*�q)�@Q���\@S�nkKFz@VL0C�\�@X�>�;^@[�~Jr��@^��w�%@a~�O�0@b�dWe��@d��!��@flf��@hk� ,v@j�>y��T@l��>�@o �X=`@p�z3l>�@q��c@sA;Ԙ�m@t�Ayy�@v�� pq@w{V��Y7@x����@z�!iB��@|2�U�W>@}�Z?��@��W	&}@��h�/a@���Fhq�@��0�k@��#�9g�@����)D�@��g�u͠@��Қ�$7@���F��w@��~���@��5h"�@�J �`� @���̚w�@�����7@�����x@�.���2@��:�M@�����u@�@���Q@������        ?b�.>��?��ƥ�7?��X��G?�d�}<v�?²��dM�?�Os�[�G?�T���Sg?�l���C�?�}�w~�?�8��i?�R ���?�4`m��.?�'K��?������@ &+W�c@��:�T7@�=y*Hh@�z�,$�@��RNq�@sM*H@�����@�e8)�Q@�?���@��`,@Z���B0@� �3 @|+_�@!+8�w@"��S�@$���@%��?�@'K�����@)��V�@*�(*/y@,�wΌ@.���$@0Dty'j_@1K:/�%@2[xu�q@3tg�PЖ@4�S��]@5�D_o�%@6�>j��>@82Gr�3@9xdH�]@:ǜg4\@<����@=�|O�2@>�/f�"@@0�w<�@@�R�&�@A��~g��@By[j�z'@CE���h�@DlTޕ@D�ͫ�Z�@E��Z/�\@F�EP�k;@G�]ƮM@HoD5�c@I[O����@JL,xe�@KA�s��        ?G�� L��?u{#r���?�;��Yp?���_i�?�����*?�vͱh63?Ӥ�ʽ?޽��?��U�B�?�DI@;B�?�h��7�?���U*@�Z���@	%r��A�@�{�� �@��I�@�T�q�]@�,h!#@!Es�/m@$j�UT�+@'�ZE�
@+�Mz?+�@0$[�]@2XY��K8@4߻��b@7��.�n@:�,�>q�@=�z�-5m@@��y��@B^�-'�w@DJh��r�@FS˺y�@Hz�2k�@J�(�� @M#��SvI@O�����@Q#"�$@R��6\��@S�'�r�@Up�Q9��@V�o��@X��blə@ZKRj��@\����R@]���v�@_�읝7�@`��6��J@a�����i@b���@c�� �|@d���A�=@fL���@g:�"��#@hh"�bi@i�Z�e��@j�s���@lo�:�_@mlR���)@n����@p쨅h@p�B�(�@qw�|;�@r1�TN�<        ?]9_�r?�����u?��"�~q?�������?�}2K/��?�|���?�^����?�n���C?�/�hf??����\��@,z\B�@����F3@��G߿)@��\�@}1bC�U@_�0�|@"?��@%࣫�S�@)�Y[�@.�9B# �@1�
���;@4���c?�@7��!�`@:��&�_@>�Em��C@AG�H8:@Cf[�J�(@E�v25T�@H֣�B_@J�d��$�@M}�Jc�3@P7�4��3@Q��j@Sl�J���@U)��4��@V�L����@X�ư���@Z�ۄ��@]�2��@_CU Կl@`Ɉ]G�9@a�<��.@c?��X~�@d�ȽCx�@e��$��@gT�-��@h˺�^6M@jP��
�u@k�e�l}@m� �M<@o2��ek@pw���69@q]�P���@rJy@�@s>�V�@t9�#ߏ�@u<�P{�d@vF�"�-&@wX2�)@xq �c��@y��h�{�@z�{E�!�@{���e�        ?����I�?ܱ{��(?�,�~Ց�@�\q�H�@�>ڼ�@�s�X�@'l��v^Y@0O�e+`@5���NX�@<3�/�Ӱ@A�Y�V�@E�2����@J������@O�0��@�@RԷO>\X@Vj�@Yxp��d@]<�6�F@`�A`~�@bژ����@e6]���3@g�fu{�C@jmw�N��@mJG� A"@p)���֟@q������@sv���@u?����9@w�I?�;@y�si��@{'/�O��@}N�^h1@��_~�@��z��r�@�,=�O&@�p� Y8h@��q��@� |N��W@��%bF0O@�z.%"@���!�L@�aI5�@���_�b@�_�Z��I@���W�8�@�m���N@�V���r@�F�.��@�<۩�}@�8��*��@�<!Vx�@�F��7@�Vì'J�@�n1þ�4@��aM D�@��X�y@^@��R�3�@����i@�I4��Or@�D��:G@��m�A�.@���౲`@�:)�-��        ?]Q��w�!?�E8�?���ß�$?�0�P]I�?�g��)A?�G�Sa�?�j<�޿�?�EC�c)?�"�0X0?�X��&�p?�\Z���?�Dp�2(?����
�p?������?���͠�@�c�TF)@��'X��@t{�?p@
��#�_H@�:�p�@��R�st@�`�o%�@�b!�I�@�`-�dV@N�5W�@���.@P��@ �L��X�@!�O*�z@#f!:�*f@$��6e�@&�X��>@(;�Ҏ� @)�TM/"-@+��3�n@-���_e@/�.&��+@0�}0���@1�*� �Q@2�u{�@4
��%�@500�@6]��\@7���[@8�+rv*@:��Q�@;mĖd*�@<��],�#@>*�߭2�@?�}?���@@��V{��@AD^���@B��V@B�i�d��@C��A�@Dl����&@EAߒ�_�@F�gI�9@F�J��J@G�[j�?@H� P��@I�<HeX�@J�amH        ?T�^$`�?���j�?�^��H?��n�wl�?°�&PN)?С�����?�) ._�?������8?�b�����?�TŔ5��?�����?@5%A؊�@݄! ̮@�QG'��@�d�A�A@9���i�@e� ��S@!��l�$�@$��G��@(�h�3��@,��1�@0�C��[@3���z�@5�	�zk@8�l�^�5@;�G��]#@?�l�@AW���!'@CE�����@ET(��@G���[��@I�Î��G@LH.w�7@N�V�̻@P�� �>�@R:mR��n@S����i@UN��@V�'��@X��?���@Zv����;@\T���?@^F$mN�@`%ek�A@a1ur3W0@bGS���`@cg���@d��ْ�@e�Zn�R�@g�+x]@hIΘ��>@i���$�/@j���A�@l^S��;@m��Qcy@oJI����@pg�7�8;@q0lY��@q�r{��@r�)�}�0@s�=0g�$@t��;C��@uh��w6        ?Y�2ô�?�c$�+�?��Z���?�xc �z?�3�/hؙ?Ҁݞ��D?ݨ����?�U<���p?�
�OX?�1C�/�:?���ۄ_@�܃�@��]2-�@o�����@w`'J�@�[%�@�w72�@!��M-�@$5�H��,@'���0I�@+y/�N�@/�UI�G�@2�n6�@4���1�{@7R�x�4�@:>fS���@=bw�E�@@`J|�zu@B-���L@D!KgF�@F"%-n�2@HK��ܾI@J�?:#hF@L�kԻ��@O���@Q͵s�@R�N� ,@S�s�\@U�n�P��@W"�D��@XЗR:=v@Z��^ �A@\c���U@^H�1{p�@` �}���@a& ���@b5\=$�@cNRcA�@@dqo��Y@e��(��@fԎ�$�@hf�t�@i`sc�\.@j������@l��9X`@m�Zrp@n����4�@p:
MK��@p�1-K9@q���D��@r��� Q@so�4�IY@tJ�d6�        ?�낡�Go?ظݎx.�?�8�F@
FT�x�@#,M�7�@���I�@&��"���@0.�d�@5v���Z�@;�m#T.@A�@$e�@E��֯v@J>O�A9@OXJt?4$@R{>�3��@U�2O(M@X�^U���@\��%��@`6�:"��@bO8�|a�@d��=/@f�_R�l@i~J���@l1���_L@o����@q	����@r�����@tL�,�l@v&=�vG@w�?:�@y�[뗆D@{ф��I@}�,��c!@�
:@�"�@�+@21��@�W<�L@��@�W"�@��]�q�g@��<�PW@�v_�z-@�ٱ�`'@�H��0i@�¬�)�\@�H3FP�@���M!Ǟ@�:o�v�@�/;�,i@��TϠ@���'[�@���U��@����*�@��qY+�@@�~f��[@�z~ז�@�|��T@��R-*@���+
qD@��.��@�°���@��Gx��@�	�k�(@�`I�N@���8�;�        ?g&�yɢ?����[ @?�t�9���?�D���?�g��*?��OB��?��21��4?��S��?�nD4�d?��J���?�>�n2R&?���%�?�nC�؜@�%����@�^�l�@	��:E[@]��7�F@�%UL.�@5�2��@l���tl@�~Ao�@�)E�u�@�}�xV@ ^!-5�T@!����	@#�9tZ�@%�<�,�)@'p�s�{@)p�{�@+�w�`�@-��p�\@0�%3�@14�`@2r�Ͻ�w@3����x@5���NJ@6}��lH�@7�"P���@9q��G�@; 8�K�{@<���9�.@>EH0�0@?�#YI�}@@�G�J�a@A�E�W>�@B�
Th@C��8�,@D��9W��@E��jR�@F��0XF�@G�E�'_@H�T���-@JJ�Z-�@K*9��@LV|R�d3@M����A�@N��I�|�@Pbx:n*@P�E�T��@QM��G��@Q�Z/6�2@R��p�f@SX=s�J        ?R����^?�4�õ?��Ʉ�?����@�^?����~?��H�u�?֠ ,04?�N4��/�?�Dp$!�?�������?�<_�[��@ ��$L@�P՘�@@
�xw֏@��A@�C�w4�@B6�8@t��{T@"+j��>@%y6�D�@)(ʝ7d�@->�|�ƪ@0����@3X��9F@6
�աA@8�0����@<%[L��G@?�Dw^@A�Z�*26@C���܋9@E�u��ڽ@G�o��
@JR[g�6�@L����n@O��`�@Q+R���@R��؊;�@T7B7�'@U����Pt@W�xD��;@Y^j�.Z@[>�b��\@]4:�
@_>(�6��@`���9�@a����_K@b���H�@dJ���@eW�ٟH�@f��s�×@g���9?@iG��սA@j�۫��@l�/}��@m��/�@o!i��n@pY�9FK�@q(	j�  @q��]9�P@r�\l��Q@s�C�WT�@t����x@u��5Mo�        ?Q:�(?}����?�%#p?��$ɒF�?�ž��?����t�?�����u�?�>�te?�؛��Y	?�?=o��?��(�� �@ �����@�τ��@�-\�@E9����@S��q%A@�3P���@H��ԯ�@"���pW�@%�LğSW@)��k���@-Ϸ��7m@1*`>:�@3��,�0�@6Sx6��(@9=�@�kp@<c\�K�R@?��b�0@A���o�@C�x��	\@E����?@G��F�k@J>	�m�=@L���\�@OP��@Q�-�W@Ry�3Ҥ�@S���3L�@U�_�Ǝ@W>�課@X�Ƿ/�l@Z�ٽG�@\�l;�q@^��w���@`XbD�#�@ag���@b��˨RT@c�J��@d�:����@fjY1@@gM�^I�@h���t^�@i��b�k\@kS�M2�@l���-�@n6Z�>�@o���@p�@*�<@qlC��?@r<�m�#�@s$�w�@s�����@t�<H�׵        ?�0	# e
?߃��?�����Cq@	X�=�@w�{U�)@!�i�{�@)�7���@1�ӡ���@7��Ѡ�@>]"Ċĸ@CĤ��p@GP����@L����S@P��"�e�@S�KM���@V�)h
�@ZI㎁�@^dU�@aN��%@c.|�E*�@e|O��x@g�S�br�@j��l@mM-���@p��Ӟ/@q��\g@sCCte@t��.]@v�4�%9�@x�նU�.@z�#P�%�@|�T%�3@~��o[�@�v���S@����SE�@���10\@�
��g�@�R��� @��0uj�@�<��L@�oӧ�.�@���@|�(@�g���α@���BF4@���S�@��Bզ��@�qPЂPZ@�O&�n��@�2����@�:���@�<����@� d09�@����`@��!�/�@�']�K�@����@��Q��@�6)���A@�Sx��@�v����
@����08@�g[��:@�ڐ�        ?M����*?yP(����?�G��� _?���?�B?�b��C?�3�%"°?��>S6f�?�&)��D?�tN��L?��Y*5�?�)q���?��9��_\?�d���y�?�5v��?������?�-aL]S?�&�x��@ �)�Aȶ@����@��@�@<pz�)@8�C@"�r��@�Q:��d@c{�.#�@1&V�c	@���"�@yy�Tf@0���&@dL�b�G@��+Y(@ �9����@!��X��@#9��8@${Oj Jl@%�Nf5@'_YU���@(�xCz@*|.!�'@, KLdg�@-�fLH@/�����@0��'�y|@1�s`�C@2��ʮ6%@3���)��@4�ZHJug@5��1-��@6�]Nu\�@7���&X@9��@:3��Z�@;g�_��@<�hjI�@=��@l�@?5sFZ'�@@D�����@@�?�bd�@A���tY8@B[�AK7^@C\��@C���޲@D�l�6o�        ?N�oǻ ?{�B��?�?�t��O=?��G��?��ߦ�?�ǡ\kZ�?��I93��?○j�s?�~�uq?�q�I�?��ݵ��@�����2@j��A�@�D3��7@�5Z�d5@O&'���@t �@!'�K�8@$s�v(@($F��S�@,=�U�7@0`�#v�T@2�1�/��@5������@8}nUS�@;�R��*@?ȶ���@A[�TH��@COuV�9r@EcN��:v@G����@I��L�@Lel�ل�@N���1G�@P�n����@RL�XkN�@S̈́���@U_�wW�b@W9[3�@X�l6�@Z��XF�D@\]4ؼ{@^JP�W@`$�A;�@a-�R���@b?����@c[ÉS�@d��3.@e��w��@f�P�ؘ�@h*���@�@iv~��x@@j�bR$c@l,C�
{�@m�=�I@o
h���@pDp�a��@q�>F��@qҖ����@r��ݎ�R@sv Q��@tO����i@u/�_*�        ?C��v��?r�]��Ϣ?�eϰ���?��Y/ٰ�?�����.?�J@-�q?�����q�?��v)�hc?�A_�X}?���7�g?�3��YN?����@|o��0@	 �#i�@�kF�T�@�P=��z@�Q���n@�׈�@!H��k�@$n�2s�@'�f\�b@+����&@0��&�@2S�$@b�@4׶���@7�V��%@:.7wa@=���<E@@�kO��@BO�N��@D9t�,C�@FBH/�@Hi�(��r@J�X�؇}@M�ȗ�@O�O���@Q#:�/�_@R����@S��,�x@U��q2?�@W�Еu"@X���|�@Z��Zڲ@\P�\Y�@^0�m�t�@`�H��@a%M08@b ,E�J@c5�vp=@dT��@e}�t~�_@f��T��@g��+��@i3����@j�P5��@k��QF@mD��!@n�BK�,J@pj����@p�g����@q��P�5@rl��@s=�K4V�        ?�_�L�6�?ɲD���?䕤�tL�?�+Ƃ�?Y@\�C�x@_7�Hy@��X6�@"C��h_@(�w����@/����@47�L/by@9ּ��@>mav�#@B7ex֮@E�Y\t\E@I)U�$�6@M��G4w@P�_R�@S:�ߖ�@U��䑐�@X.�:�@[C_��@^��z�s@`�xp�@bV�JD�@d#i�<��@f	;zm�@h8
�6�@j!?�Ә�@lT|k}�m@n�9o���@p�]�{]@q�!.�%@s�d�ӆ@ts����v@uޞ��@wW��@xގ��eA@zsµ{@|HＢw@}�@S�U�@��ŧ@@��uͽ2a@��g`�@���p��@���:,V&@����_��@����ɛ�@���Ğ> @�љs��d@��	w4��@� "<t��@�R�²r�@��}
�@�����}@��x8�@�6Oʣ�@������.@���0��&@�H����>@��O>�R@��k�/�q@�5��?        ?d�nP�!Z?��oS�?�T8�b�?�ù�A�?�1�6|�?�⪘�>�?�E>X�?���b�"?�Bs:�?�@�x
v?�S�a��?�؄�u�}?��*�?��8K�t�@o�B3��@7SnɃ@9r���@
vɬIz0@�4�5@�H���n@�fo�A�@������@ w��@z��,$@�����@��@�^c@ ���T@"a�n�j@#�rE��{@%/E��@&�<�j|O@(�+Q��@*S�j� @,.|��@.\�)@0�86^@1	�s�@2&n*��@3@����@4d�u�I@5�c2ߡ�@6ǂr#�@8��!j@9P XW�@:��6��C@;���0@=d�H~%�@>Խen��@@'@�]��@@�1G,)@A����.�@B{���b�@CL����`@D# _�fH@D�:;���@Eޚ�l�@F�'.ܵz@G��)�.=@H�����d@I��W�v@J�~��_ @K�?�I#@L�SI�e        ?T؋���?��y ?��>zˊ?�.g.���?�3�-!s�?� �LR�?�AʏN>?�b%c?�>¢J�?�~�CN��?������0@e�����@�1?�' @&T��6/@�3�H,@��D��@�m-�]:@ ��[?��@#�)o
�@'KP����@+�Sщ@/M+oa��@1�9���W@4oR ���@7";/Tj@:6l�@=+h..�y@@A�iE҃@B
ÜҜL@C�︘f@E��%�@@H�5�B*@JT#j��@L���/M�@O-�s�*@P�f�+��@RAr�7@S�!+>�@U*���@V���e��@XR�o�V@Y�⠞Q5@[���JA@]��.��@_b�Y�|r@`�~gw��@a��[t�@b��#�"n@c���/
d@d�����\@e� O"@gVvAwq@hB��O�@ix�}�O3@j�/�z��@k����@mL�l�w@n��R�9@p ���d@p������@qkozG�@r&��w�{@r�Vҿ�        ?RK��\[�?~&���l?�ǘ�I��?�̲R��?�8���?�E9����?�9��,��?��dM�$?��"[Tm�?��MБZ?��K&��@���@�l�0��@=�ڹ��@ol�	4@�>� �@�P�^�@!Z0�)�%@$�_��;l@({#|��@,���RC@0���og@38�`�Z@6�*��@9�q��@<a�k��2@?�:G�z@A��ש�@C�+�@F2��1@H�P��ٻ@K�E�u@M�V���R@PNmb,��@Q�D9}`}@Se�('M:@U�����@V�[�s
�@X����W@Z��ˡB�@\�uni�@^���l@`~A!�}�@a�O<
�@b��g}�[@d�3�}@ei�_F@fĥ�`�@h,�	bD�@i��Eur�@k$�Q4�@l�O�l�~@nS�Y�N@p ��,d@p�a?�X@q��Nl��@r��@��@s��M- +@t������@u�ɟ	@v�@��Y@w�ܦrB�@xӋ*���        ?�jD�W��?ܟ	�T�R?�"��sX�@��HN�P@�^}d�"@��а�@'S݌�b@/���Q��@5��W:+@:���@@�7�L@D��^'S�@H΄1�@Mm�7R�n@Q>y #��@S��}/@V�<sI'�@Z.j؍լ@]�U�^	@`�i(c�@b�әY��@d�H�-��@f�"z�U+@i7��̨�@k�c�1_u@n?q�ަ@pzt�_@q���$��@s`a��2@t섏�`G@v�qB�"�@x7<D� �@y��H�P�@{Ų���G@}�~I�@�j	t
�@���p2@���έ�@�����T�@�A?f�@�*y����@�Wu�� @��F����@���%�ѿ@���K@�dw�:f�@��]�Is@�!u=:�@��͚Q$ @�������@�A9�N��@�lc��@��Xk�M�@���p�@�nt�~��@�E���6b@�!��ʽ@����hu@��sVVyC@�� �х7@�·���>@��;�@���=��        ?T&���$C?�WYze?��l+�?�@�����?��]��2?�.�Z�K�?�+����?�+��i�?�{�g0x?�9~rى?�p�媗?��D�v?񣘹£<?�)���/?����a�?�)�R)�~@ �<F泉@]a��7�@���'@���?@>8@^dݨB�@s�Hp"�@T�'PCO@R�zZ8@m̭MI@�suS7�@���j@q�?�T@ ��$騻@!����w�@#Dͥ��@$�\J�/@&E���0@'��A@)�|`|��@+?E�1�@-�~�VG@.�Ё*�@0e�@1a��r��@2g���c@3tIWܺf@4����A@5�d�x]@6�?�M]@7�KO�~@91����@:o�n��@;��bU�@=U���x@>\Oq��[@?�}��8�@@�r]T�G@AIC�2��@B5�ش�@B�JZ��@C��'Z7�@DQ�V���@Ez��K�@E�=�;�@F�8^�@G�q�  �        ?Q���ީ?�lɣZ�?��b�]��?�7-I��?����<?ψx�{�O?�� �D�]?��E#d�S?�?�#�]�?��gʂe?���E%A@�Q�$�@)?��y\@��V�N	@4mQ�_]@�����@���m��@!B��Qr@$��Ou��@("�wqr@,(೪V8@0Ll��M@2�6�y �@5b����@8D�;o��@;b�H+��@>�.�i�x@A,u��Q	@C�$�@E(��ӟ�@GXmW���@I�T�狰@L���@N�#??Tp@P�|$t��@R'��D@S�S�1�5@U='���?@V��F=@X���'V�@Zh���d@\Gy��gl@^9��V_�@`� e @a,
P�@bBS����@cb{�.w�@d�����@e�����@f��B}G@hF�@��@i�?w�l|@j��L/$�@l\t�+o@m�l�#1N@oH�C<�W@pg"��4@q/�r�@q�D��g-@rΣŻdW@s�:�=J@t�[}W�@ue���        ?H?7P/�9?v3����?��z7@f�?�SF
�h?��=(�y?�x����?ԗ`�6�0?�1ݛH߳?�+� t"?�L\�^]?��tt�@ ���!@F^��@
���K@@�gz�@$�S�4#@�Xd��@;��Hd@"�2ş�@&�d���@)�'j��@-��X�I@1I*lN��@3ɗ<8"@6�и.�;@9sa�XF�@<��(hd@@#m��g@A�"H5@C�w�X��@E۸yD�@Hp
ҐN@Jb"Ҟ�"@L�Nl���@Onj`�i�@Q�]��a@R�S�L�@T�d���@U�o�BV�@W6�n��]@X�:*�0@Z����n@\�V.~��@^|���>V@`>Cg��@aG��y@bZ�YmV�@cwA�\�@d�t�%�W@e�Xl&�~@g�Ď�I@hJa^�y1@i��±r@j�{��@lO�c0qJ@m�����@o/�G��J@pWB��E@q���%@q�MV��	@r���X'�@s��^�*7@t`b��_m        ?���A�:?Δ��O�?��*�'?�ݡ-��@�!)	+@]V�@
����@%3DW��@,��쿌@2�DB�i@7����.@=�V�,@B��@E�Zs��i@I�WRI"@NEƃ�9�@Q�����@TI�EV�@W5`�c�&@Z^�;E@@]�b1|�@`�j���@b����C@d����s@f��%��@iQ��N�@@k��j#%�@nm2 U@p��Y��@r-�=�@s�S��Y\@u'����@v�b�T�@x�wN�G�@z\;܎@|=E^-\@~16S�@���K @�(�5+��@�?@@��@�_8��#@���sq�(@��!���@��0���@�@�	�3@�������@�����@�P>LJ@������v@�7�˼1@�]e\�и@�#�b[� @��hQ!y@���p9@��͹B�Z@�r.��o�@�R��bS@�8�-e^@�$�W@@��V�<�@�
��v�@�[砒�@�U�i�_        ?gXv�v�?�ú��U/?��h���?�AOѫ�u?�T7v�S#?�{�~�?��l�=�?��bǣ��?��%ݘ5?���,F?��~���?��v�㄀?�ƍV^�>@�����@�-WD5@-K�k@�?e��@�-�2�@�됧�@N�)G��@��}�H�@T�aP�u@�)�t@�q�uQ�@!�
f"@"�Č��@$Q ^ѝ�@&�h�*@'��h��?@)ހ5:)@+�Po��@-�s�*�R@04�@17BQw��@2dm��q@3���]�@4��7@6.���Ku@7����@8����@:^�ۧ�@;�;aԋ.@=cK1��`@>� ����@@Kl�L��@A!H�̱@A�4*G�@B�<"�ܳ@C�na;��@D��m�ط@E�� �Bo@F�����o@G���9=@H���c$@I�֌x@J�̗��@K�����@M�,��@N7"�T@Oe�8�W@PM�!!�@P�wת�b@Q��5��j        ?R;���#?~���?�c��'z@?�r\���?�A���l?���[�\?�_���?� 8ϟ�?�PɂHw=?�/�P��?��L�V�~@4i8�J�@���@��R@���3+@�_�n@ g1�Ӝ_@#��so�@'S����@+dU��@/��z�?@2i{���N@56���`@8��έ�@;9Gyc�@>�%�^@A+d샷�@C$�G�cG@E@įzh/@G��B�@I�}d��@Li��)�@O�W��@P��il@Ro.\0�{@S�$z��@U�,�^Z@WU�F���@Y.R��@Z�J��7@\�J�ݺ�@^�GG��}@`���oI@a�ARc�@b��^M�@c�iz7�@e�\zn�@f[�����@g��K���@h�<-g��@jU�Z}��@k��`&@m.�8 ��@n�	�/˦@p���ȼ@p�[��C@q��_Z�@r}^�Q]�@sS�Szn&@t.�*2'�@u��0C@u��x�~@v�:�y�        ?W�DCK�?���8J�+?��zVS<�?�*��Q?�S���?��ҳ��?ݫ �?�͍ڻ�8?�i�P�?����:-�@ ��@I���7t@��,R @��@�@ ���@U���f@ |Ƕj��@#�Z���)@'�!��<d@+��@�i�@02���W@2�l\���@5��
��@8�x���@;������@?��A�{�@A��� �@C�3�.bU@F�#�i�@H}�qz�@KBŨ@M�CY�@PPk��>@QԞ�Y�G@Sni�� @Uʕ-�@V�ʴ@@X����X&@Z���V!@\�;�S��@^�z$~�@`��+�y@a�d
�~d@b��Y�@d!�`�@emh֤#�@f�*��:�@h)U��W�@i�-��6@k^����@l�u.�t@n8c�'�@o�Bl�jD@pƓLf�@q��~��C@r�(�B��@sw_��M@tj>�.�,@uc���_@vd��b�@wk,[�D@xyٛȔ@y��9�[         ?�.��eh?�v�����?��$���@X(1Z�@���<�@xt���@&k�{@/*Gnxϭ@4â؜�@:ǹ�u��@@�����@D�����@I(�>�L@M�jo$�@Q��M@TuR"!@W��V�
@Z��2I�@^�g�zi�@aHU*�@c`!=�q�@e�cY%@g�S��t�@jw�A�J@m�In\@o�����@qd�[+��@r�o����@t�	l�P�@v.�9�"~@w�zCQL@y����	@{��C�C@}���z�@�G���i@�ױ5T�@�����Re@�6�@�6����@�h�2F�@����Ek�@���ܱ+�@�:��{�~@������@���Q��@�f���P2@��&�%8�@�1 �s<@���gE=@�ã���z@����=@�k���ƥ@�G��\�=@�(�u�%@��7�e@����8�@��ބi��@���r��@������@��p��@��Ъ_!�@��͜�&@���ʐD        ?k;��3�?���4I�?�N�p�׿?���Ū�?ɶ�/�A
?�\'�Cg?���_�?�0�覫?랦�Ɇ[?�ӯ��-?�pɥ�,?��`�%�@ �$�5�K@��\�@�s�F��@�7$<@�����r@K��X�3@� @��
��E@z�h!@���T�@ wmQ���@"<�.�
t@$@"��@&��� s@(2{���@*h�@,�	���\@/+��x�@0�Y���~@24,�t�@3���j�@5�3t�^@6���xl�@8-J(� �@9�	�_�@;�]�0�@=S{Ex��@?,�"*@@�w��	�@A�Z�
Z)@B���
@C���#D�@D�Gċ>`@E���K��@G���NZ@H8�0���@Iu�ͭ�@J�k���	@L8(g�C@Me`~���@N��WC��@P�ϧ�B@PԱo}j�@Q�/c�g�@RXt�Ì?@S!��E�
@S�g��r|@T��eǿ@U��lqm@Vv%7U�n@WW���+        ?J�d�V��?w�	��?�#���?�D�)��?�!�2�{h?��-q�K�?��F����?����U?�0*�D�?�l�ɯ��?���07�?�O}���@�L�X�@	e��l�c@��1��@�oN�KZ@3 �g��@6%�Hm�@!pV��	@$�����@()�ݠR@,�*��@04d�ގm@2�,a��@5)W]�@7��s��@;���4S@>L!�11k@@�i�f�@B��Cv�@D�Q]j�q@F��9WX	@IE��>Ӂ@K��X�@NF�Ob�W@P�$P��@Q����Rx@Sq��f�@U~�2kS@V�x���@XsC�m@ZG�n��@\1��ݕ@^1�uq@`#���@a:?P^(�@b[�Ӽ%�@c�I�ڕE@d�_��d|@fdR��%@gX����@h��0�M�@j���,@k���(:R@m} Q�@n��Y�<�@p"���,�@p�
�8�M@q�İߦ@r�:��H@s�/ �@t���֋-@u����q"        ?]���׳�?����0��?�3�>_R?�j�ǯp2?��9�s?�X\m���?݉���n!?�e��^L�?�5��"o�?��Fg�]?����o@)���B)@
 �b�@uN����@|ү"AU@"	l���@n����@"6`Z��@%�8�N_@)O 3{"�@-q�$p9@0��Ѻc�@3yH�a3�@6,�Ğc>@9e�;$=@<AKn�&}@?�ق�@A�M?ļ@C��N-^�@E�j��d�@Gگ<?�@J0I*mt@L�y]��1@OD����@Q�W@��@Rua�W��@S�9T�@U�j��	�@WAT=��7@YT!¤@Z����d@\�Ș��@^�prAt�@`k,��N@a��>	��@b��O�y@c̶�'Ʀ@e�D^@fF}ϧ��@g���@h����c@jU=��q@kǂ��@mE�qʤ�@n�Ʌq��@p4t?ء@q�.�>@q����|@r���Q&�@s��x�P@t���}@u.@vw��E'}        ?��\��ܧ?�T�6]�M?����e@JE��@E�T��@#=�����@,:7d!��@3����@:Y��-�@@�>&|!@E-�eY�@J���32@O�hI�,�@R�=\��@VQg����@Z�&=j@^)Ђ��@aOF�ILR@c��0Y��@fS:۴�@iw��O�@l�,N�@oR�ο�@q^]���i@s.�E\�	@u�Wz�@w#��ƥ@yI�+@T�@{�"���@}�J�@�7ct~�@���/?,�@��PF�|@�U��@��5����@�e6��&L@��#�6@��x���@�z4 ͽ%@�NU{�1r@����@�⌦�Z@��4��g@�(�r��@�@+(M�@�`�'���@��yR�@���M�w�@���>~@�C1���a@�����h@��ߔP��@�S��7�8@��v�fgs@���Z��@�_H��b@�%��v�@����0��@��܇�P�@�����@�t��:��@�U5����@�;(y�#w        ?M��Kx?zG�Q��?����|\�?�|�
�=�?�����19?�v�ZX�?�$[�H�?�Nj�H��?؟aM�<?�/��Q?�A1���"?�·��q?�6�Z#�?�E���Z?��Nn�?�G��F?�H�n���@ НHI$�@)y�{�;@��S{�@d��\@H�}uD�@\�U�8@���@���硌@a���6�@P{�2�M@Y:�ڼ�@|,��z�@�}:��	@L.T��@ ����;@"d.÷3@#\Mf��@$���h�@&,Y8cOf@'��ӟc�@)2H�!x@*ɔ)��@,n���D@.!��B@/�p�4�Y@0��BJ+�@1Ż�c6@2��B��@3�N%N�@4���#��@5�=x=�L@6�`
�@�@7�<��5�@9�2ԛ�@:+	a�"@;U�ǉi@<���zcs@=��p�G�@>�ꭸ�@@"`0Y�a@@ȵ��?�@Ar|��P@B�R@�@B�y|��:@C���Z @D<|Z8�$        ?R�@��H�?�cj��0?���}��?��0
;W�?��8��ہ?�7��	C?������?⼬m7�?�P��q�?�(����!?����@=?�@�@Q8]��@V��XD/@�r�i��@��ǘ*@p`� Y)@��(��@"�k��*d@&0c��~@)��z{<~@-�J>��@1=U���@3���e�@6^"���@9C��(��@<d
�Y�@?�Y���@A���Z�@C��WU?�@E�\% 4@G���^�@J.�81o@L��cb�@O>ON��@P�B��D�@Ro�$�@S�r�ă@U�!�:��@W7BY���@X�Ѯ��@Z��`D@\��Ob;�@^����UZ@`]���@ap{�s�@b���(@c����@d�@&��(@f%�Z��@gntA�P@h�)��ǿ@j!Ɵ��@k�C��@m �"�@n����c@p=΍F�@p�]E�m@q�Z�m�7@r}B}�@j@s[��fV@t>��{��@u(�R�3f        ?@��V�?p�}�9aP?�>��g?�fB�0==?�<0���?��Q�H!�?Ҟa�$�f?ݦ>jW)?�S�r�]v?����b�?�V�σ�?��m5�)@�t���@	^�l�v@�j�u��@�o@��x@+�;@D|���@!V��Wk�@$n՝�{�@'���[A@+�����@/��j�&"@2�%�K@4�8)�_@7!);���@9��ri�{@<�a�$U@@�U��F@AƦ���@C�m�w�@E���Ix�@G�(&�7�@I�x�@K��M�@NLb��<�@PdNzT��@Q��Ϙo@S]oH�@Tz�XE@U��ų_�@W�>gX�@Y���D�@Z�����@\��4�k@^Oa� ��@`ǵ�x�@a���@b
�`�_m@c���c@d �����@e8� ��T@fX�1	@g����ذ@h�+Cgi@i�C��N�@k0u�S7@l{�n���@m�Q����@o-�z�@pJ3����@q\�Y@q�Su        ?�/1h��&?��_0�"?�.(��?�ZP3X�@�����@L9`�A�@����+�@#� ;-��@*�-��9�@1J�,<B@5��8���@:�si�0@@K,,.�@@Cuݵ��@F��xi@JƒXG%�@N�@�k�@Q��1@T&�?��[@V�2m}5`@Y��8��*@\��V|�@_�L_|�@a�R��D�@cH�!�n@e'��q�@g�SA9@i/��q�@kZ�v���@m��8��@o���V@q<D�>z@r�RƮP�@s��*�4�@uB��ե@@v�U��@x5��'�@y���m�W@{_و �w@}	�ƚ�j@~�.m,�@�DLqՆ@�.���@� g/kL@�����@�Y3n�@�$AN��@�-s�Մ@�A�p���@�]�����@���Y�@����s�@��]x�}�@�& _`�@�Q�uy�@�����z@�rM��w�@�L1%�A@���ձ�@�{2ZƝ@�/�@q&�@��p��o@����h�        ?K��}�u�?w%���?�>h�y?�W5F�sf?��k��	D?�;	 �q�?ƈf��,�?Ϣ� "5?�<��1P?ی¹��?�c�G �\?�z@��N?�0���?���/at?�Z�K���?�i7��.
?���Y8�A?�V{�yp@ H���@2�e9�@mc��a�@ΡV�%�@	VBP�6[@�AKz�@�ה��8@�CM�T@|��ʱG@"U�� !@ۋ3�r@������@�����@~�,�A@�	�U��@���=�@ ��Y
˪@"{�@#=u�r�3@$v���@%�:Xgg@')X�|�@(_ݶ&�0@)�ar��@+1�A�L@,�|��@@./@f�g�@/��Z�@0�d-�8@1�[8n@2W5'� k@34�,�w@4 ��5�@5 �*z�@5�N!@6�2q5|�@7�.┼@8٤=��@9ݛ(uk@:��e8�@;�,�HS@=
�7�"�@>%(�N�@?E%[���@@5i��>�        ?GP\#��?t�caz%�?���u��?��	i��)?��1���?� �V�F?�b>$�ĺ?ދ��i�"?�خ8|B�?�d���?��jֺC?�����i@#�����@	���L@eᰤɈ@g�mLN@��* >@Q;F 9@"&�z�C@%�ㅕ@)B;j�@-g�:��b@0��/�V�@3{�Ϝ�@62�	���@9$��f�y@<R }�ɢ@?�V�[!�@A�@F@C��~|P@E�[��F@G�C���@JA�7Q�$@L���K>@ON�����@Q�[P2X@Rp��J�@S�&$�@U~s�t@W��r@X�|���@Z�U��E	@\gl}H�
@^L���o;@`!�A1��@a%��w�%@b2@��u�@cGw�w��@deL$Ҫ0@e��ep�@f�����@g�S��I@i2u"�ϔ@j{���K@k�DG���@m%�p���@n��tҡ�@o�yz��	@p��K/p(@qpP� �@r2��@r�z�:R@s�-�X        ?VbJ�Mi?�w��G�?��1����?���7�7?�9��?��k���?ޅ�
r�?�F�vXCG?���^�?���0y?���ә@
���us@"�G�x�@*����@^�a-�@7��#�o@�)����@#v֔}6@&�o�aj8@*{=�b�H@.��%��o@1԰��f@4x�Tm�@7ZumXw@:|g�4�w@=��n�o�@@�m�s(@B�����@D���~��@G>b%�@I}s���;@L
�=�E@N�X��QI@P�pA��@RR�^�'@S�����@U�d���@W^a@Y9xB��@[+�Z/H@]5��J�t@_W�n{Zx@`���.�@a�n6@c(ۼ��@dk����@e�Ƃ"@g��
|�@h���{.@i�L��rb@k��7��Z@m�_�r@n��k�0V@p6кC�@q��G@q�ñp�l@r�q�0^@s�	໚�@t��՚%�@u�q�_k@v�՛��@xȜO�@y.�_ٌ<        ?�X>���?�R�զUC?��aeI/?�o[��k@����@D���'s@��	W�O@$�Xx�@+���#�@2�n��j@7��Y�e@<�R�~"�@A�\mtX�@E`M�@Ik���@Md!���@Q�CǦ�@S����@V�V"��@Y��D��+@\�%�,�@`8U���@b�i�OW@d!���X�@fF���q@h��� �I@j��Q���@m~�C�n@pu��D�@q}!�{��@r��=#��@t�	I`��@v��n2'@w�"K��@y�W�f9@{i�}!°@}S�Ю6@Q1�!U@��j���(@��`S��I@��/ӈ@�	/� |�@�;E��@�w���@��g��6@��<�@�n�C"d@��=�8�@�J��,�@��g�MO@�)��PM{@��o ��s@�����f@�����'@�w�|�@�X�|�h�@�@��� �@�.&�|�@�!�k�:@�q}ޅ@���#��@� d�U�@�+���
�        ?J惞K?u�!9<�?���߮��?�w��c�?�6c_矰?������?����P:?���?�C���?�AB��!?�>��j?��d�#��?�8����?�>Q�rV?�ֵ�A�?�sK!~?�h��r�@ ]xeQ�$@���h��@A`��Z@�'����@
�]����@\<u�@�:*͹@��p�We@p{	�cH@v\8j�@���t@�A��M@=8��>�@�t��Є@!.��-��@"����	@#�� "j@%����7@'�J�wg@(�#^4�@@*fID��W@,*�p���@. ^�2��@/���~h@0�]��@1����@3d}C�W@4�l
E@5<�s�o@6g@�9Vx@7�򜇜�@8�-�p��@:*��@;o�����@<���a@>-�XYoq@?���j²@@������@AJf���@B��-;�@B���Yߪ@C�� �9�@D|�Ё�@EUt�P��@F2�>��@G�^�.�        ?GLn%|�&?t���ǬD?�����(?�qZj��/?���_?��;�nG�?�=�~�2?��6��8?���X֩?�o`���?�����*p?��g0�@�!we�@
��K�+@��@@ �d1h@�aM!�@tlN5?@"�����@%�UW��@)�<�2�@-�c���@1?'��&c@3�Y��~i@6~�z�;`@9u� ��9@<�Bp@@r�Le�@A�� �@C�9G\w@E���q@H5��/��@J��V#��@M'�^hD@O�M�լ!@QD�DM@R���A��@TFԛW�@U��,�w(@W���;@Y\�0-@[5��ؤ@]#ܒ���@_&�x��@`�`�[�Z@a�m�!�@bד�ڮ�@d��e�@e;����@f~��+@g�ћ�Q=@i&�,b�i@j�
^���@k�C�3�d@mzh�Ä�@o�N�� @pL~�!e/@qX.
��@q�kS�i�@r�����@s��	�>@t������@u�D�
��        ?M{'��ny?y�����?���P�l'?�3��㮆?���.��?���+�?Ռ��s��?�L�H{?�L��?�O��:��?��O��8?��:J�/v@��M��r@
)�`��
@f��u�+@@�#{ח@���k�@�Qd��x@!�٨��@$۫�_a@(a�(�@,D����@0D�J9U�@2�E�͟�@5!}F@7��S=�@:��CF:I@=��69@@�;.�"�@B�;.0�f@Dp'�)��@F|����@H�/���@J�t�k��@M^�xf��@O�H�s�y@QLt�[dy@R�/��7@T-��X�@U�`�5��@WSN�gĊ@YU�J@Z��}�bX@\��i(@^w��K�@`7m�i�@a<t��V@bJ����^@cc��$w@d��K�N�@e�t���@f��v�8@h%'�5F�@inv]zj`@j���B��@lb����@m�(��O@n�=�a>@p:٬�j�@p�N����@q�h��@r��\��@shd"��        ?�F��0��?�ds)W�?�Y��K$?����3�@Q����@�d�*c�@�)�-@!	W���0@'ц=[{@.8��>�@3:� ��7@7��}���@==yk�@A�yꯋ�@D�}�RM@H���d��@L|w��h�@Ph�[/U*@R�x�Þ@UL9`���@XH����@Z��M`@^���@`���s4 @bz�W��@d[[A+�G@fWFz�@hn��o�@j��C�`0@l��@EK@o_�V��@p���V��@rG��k0@s�����@uE(<`/@v��*�ǣ@x'��@y��v:@{q.�Q��@},�&�8*@~��/��{@�i0V���@�^_���o@�[�|���@�`���z@�m�4�Ϭ@��i��?y@��"y��@��3�D�@����@�"@�,���ȟ@�lIN��@���"G�@��톸s@�]��B'@�_���^�@���/^�@��@@��=0}K2@�L�=�@��S�7@���c@��YB���        ?MF%J/�:?wm��fF�?���)%�?��K'0~�?�_�o��H?��Uaqe�?���� �c?��]0k�?��B M�P?��yn?�.#t��?��C�=x1?�<�Ȳ�?��<�xt?���M?����K��?�����r-@ �����@�Y��R@w}z��@@��6�@?2���c@t��%��@��n�@�V���D@��2�
�@µ?"��@�ymJ@8�z��N@��^��@ 眇�@!h�*�@"�B@:C@$?�@�o@%��Y79�@'XW���@(�΢ra�@*�)q-n@,x<?c��@.O!k�|�@0xN���@1�W�@2�{�@3*vUB[�@4@���c@5_��\��@6��ev{@7��J�@8�%���s@:6fՒ9%@;���G@<ؤ;@>7���=n@?� }�Z{@@�''@AFte�"^@B�����@B�a����@C��m�A�@Dj�C6�?@E?"F�2�@F ���@F�����        ?E�> V�w?sļѓt�?��[??�_&�sx�?����]@�?��se��?�X����?�~y@��?��Y<pY�?�P
����?��	e ?�Qj,�^X@�Ys ��@	��yFj�@�j��@��E��@i8�`��@|j��[@!���s�@$�c�u�v@(c;+�`@,U t�@0U+��@2�B�e�@5FZ��}@8�vd�@;T Eu}@>KۃX-a@@�Y(W1@B�y�b�u@D��0:��@F����@H�S�%@KK�wuS@M�����m@P)����@Q�d�)�$@R�k)wta@Tk0jw�o@U�㚴��@W���a��@YD�G�@[h���@\׫�+@^�ʧ�Wr@`X���*@a]*т^�@bj��k�@c�;J���@d�F����@e�ſ���@f���!�@h:pb
��@i��?�K�@j��e_�u@l*��싋@m��G�@n�V�/�'@p:k��U@p�����@q�YW�@r�jG�@s\Y�G�        ?C¸h#_?r��@O?��o��]�?�Ι��I�?���"N�?�H�y^�?��9��o�?�V����?�00�D�?�^��Ux?���p��?�E�vH�1@�,@e�@�P$��F@	��=@���n~@���lY�@�9��ԥ@ t!i
B@#s��SJn@&�L5 �@*xY��O@.�,̄v@1w����@3�4� {@6yAba@9Gc�|q@<J��z�P@?�Ř1Nk@A{'�r$�@CPB�";�@EB7���2@GQ�>��F@I~���l@K�%NT@N4Lr�Ť@P^�8���@Q�f�˻�@S����@T�ӵ=D�@V �d@W�J�U@YN���@[�
�e�@\��H.t@^�H��$�@`K/S�ʵ@aJ:f_�@bR�w�@cc:ɖ@d}=��&@e��&|�@f͆gy��@hϲl��@iC�OU�@j�$`�ƭ@k�_���@m=p��4@n�o�壺@p
��1`p@p�L��� @q����h;@rR�(W�5        ?���g_?�6��R)c?�!�NO?�>���Il@ ��݂&l@���O�@k�v_�@ٛ;��@$F����@*����@0���)��@53�/h@9�(��K)@?Xn�I@B��_o�@E���7z@I�Kn�@M�[�6@P�X��=@SC�ӈ�>@U�N�~@X|��"@[bC��J$@^y��d�V@`�F5O,@b�O��@dz1�5�@fm�Fys@h|>�&@j���r߃@lꢒVp@oK/���@p��ɣ`�@r0*��k@s����#@t���i�@vj̜g(�@w��~���@y��ȣ�@{'ܫ� v@|ّ���w@~����@�4��EI@�#܀��@@��#���@������@���t��@�,.&��@�Ak��)�@�^n`���@��Cz1��@����kT@��e�O@�!x�L!@�e���@��f�@�@�J3�"�@���Qc�\@�c��6��@��kDj�@��� �h@���h��@�TG1��        ?W_�Qd�C?�#so.�9?��L�<!j?���(d`�?��.ǤJ??�A�aN�(?�|HY���?�(!bN?��M�N��?����y,?�+��u3?��A�g�?������6?�z����?��5����?��PqÐ@���T�|@x�_�@H�Km�@
O���@�쮧�@���P	�@]r�^WG@UB��@k��ۣ@���@���
�)@i8 �)4@�v���@!Zw��f�@"Ɩs;��@$C۴�#@%Ҕ}H��@'smT�@)%�QT�c@*��d��U@,°�й@.��1R��@0U����8@1^�D�/9@2q�mV�7@3��OX��@4���	b�@5���@�@7"_�b�C@8h/8E4�@9�k�?�	@;*�dc@<x��,v�@=���>@?c`%-@@t��!d�@A<�x,:@B
�g<�@B���P_@C��ŕ�@D��X��s@Eyц�BB@Fc��\��@GS$I�p@HHJ�}��@ICl�ʽ@JC�}M��        ?K����X�?xL+���?�Fݐ��\?���ͥ�?�C�3�?Ȩ���?�j<�&v)?ߪ�5H-?�ZR�&V?��1��?����U?�@�7�@�h�g�8@	+��}�@���,@���,��@�6���@�lK�T�@!�`�@$$f���@'�@�n��@+Q (  Z@/s@~�+@1�_��U�@4o��&�m@7� (=�@9�ߗ���@=Κ��3@@*Z�Ql*@A��E(�@C��9�?@E�mqAkD@G戵P(@J!�z� �@L|I�=�@N�s�YI@P�*ON0�@R'_SC�@S�`���@Ump^J@V���uw@XJ�����@Y�J�=V�@[�����?@]��b��@_�mo?@`�Y�$.;@a�W8@b�O��7�@c�d��@e!a�!�@fQgfΙ�@g���#@h���TF@j��s�k@kxb����@l�x�06@nKVC�*@o�VY@p����:@ql�~2��@r:k"��@s�Ӣ�+        ?MCɞY?yr��p��?�]$����?��ϱ٥?�ߖrZ�m?�0"����?պyH�Cv?��ajZh?��0�x?��m�{�?�9)b���@ '�!΀�@�ցr@
��y�X�@ܙ2E@��Vh�@c�CDV@�ζ�Ub@"5o14�2@%z��&Ǽ@)��_@-!��]K@0�[��@3.���x@5��'���@8�N9(l@;���o�@?*�4�@AJ �Ӭ@C/}K#:5@E5W0k1�@G\W
�W@I�AAz�@L���E@N��9�@P�s�;��@Rd��@S�~��@U%�]D�@V���@X���{5�@ZPJ�L�(@\1;v <i@^&��uՄ@`~�&�5@a(.U��@bB�]T��@cg���d(@d�� A��@e��W�@gf���s@hkK��@i�GELW@@k1��@l�w��t@n%�!o�@o��xf@p�����@qwR0�d1@rO�˧��@s.7�O�g@t nu|@t��1�T        ?��*�f�?Ј̏m|?��A�Cz?�Z@�um@	�"� I@п}P�u@�ҩ�>@%����υ@-!�@2�IC�~k@7��<�/p@=v���@A�~za@Eje{���@IN���;y@M�۩��@Q N�"�@S�����@Vj�?�
f@Ya˦sf�@\������@_���)�7@aЃ��@c�r`�~�@e�8
8�@h _2/�W@jOy]U�y@l�!���@oO��%ɔ@qI���i@rk�,9@s�I��@uuV�T�@w�)-�@x�!ǁl~@z��<j�@|c�)�+@~N�6Nz@�&ll!�@�/b��C@�B;��V@�_	�=Xw@��ߔE�@�����0@����#�@�7-�t�@���1!�@��@[	@�D�N<��@��˝�@�-8�:�@�X�`���@�  �*@��?�á@��__�.p@��:v5��@�t�ʤ1�@�W�uu�@@�@��ס@�.$;�Wv@�!�Z�3@�F��@��U�fU        ?`c~�g�?��K6�"?�!np��?���B.7�?�����?�w����?�6<�8[�?��\�C�n?��A��?�X�[�??�/��V�?�r@jzz�?��%��[
?�X��@:��=u�@K�Ut@b^�B@
F�k}J�@� �7�@���o�Y@���'�Y@�'��0@�`\�@p�j�_@�YE�@��O�Z@ ���P�u@"qޘ��@#�cq�5V@%4�E,4v@&�GnƇ!@(�sӉU@*`��k��@,=�p�[�@.,ܟ���@0�`�'@1 ��T~g@23�՚�@3P Z��t@4u�6Z��@5���ı�@6��VP3�@8m���n@9i�C'@:��Q
@< �3�@=���G7�@>��
��@@7q�	��@@�X*I�@A��o���@B�U�u��@C[s����@D0W�,}�@E
����@E艳�)�@F��R*Y@G��$)@H�3S|�w@I�.�/{�@J��=7@K��l��q@L�mz�*        ?T��:@�?����	؅?�M�@�H�?�V^��y?�*or/�?�톆�%?�9�̾~?�Y$����?�E�ڴ�?�Ɍ3ˇS?��K�{�@h��+��@
XpO���@�`.H�R@�ɧ��:@l�ϫI.@���1�@"^��W�@%��ݍ��@)n
K��@-�V�@0��&�M+@3pk�u|�@6�-��@8�Pq���@<�/�{@?KO��j@Af��Y�[@CDg����@E?/�hW�@GWQ���}@I��_�@K৯Ah�@NRI$�&�@PqS�F@Q�$��ի@S.p���@T��b[AW@V(�t﫪@W��F^��@Y`U��a@[6���@\��Y��@^�y�=� @`C�uN��@a;�)zv�@b;P㪌�@cB����9@dQ�8Q@�@eh���@f�b��o@g���l�@h�;�n��@j��q�@kP���M@l�/<��@m�֣nX@o<wKR?@pM�8n�@q���a
@q���V��@rvhp�@s6ɀ�Q�        ?ZzHKz
�?�	�rs?��Y�Ț?����#?�Tܚ$�p?Ӓ]+�q0?���~��?��ۧsD?�+ڂX�?���=���@ �� ��@̓16@=�ʸ�@x�#.@*Œ7,�@��O��g@9ͥ/�L@"���f�@%�O0���@)� ��@-۽�@10"�Dk@3���>i�@6R��A��@95U>���@<P/;�w@?�-n���@A�)T��@C}��{`@E�Y��@G�H/�:@I��?*�@L?�S�; @N���v0�@P���ɬ@R��R��@S{�զ0^@T�J�oKl@V�5~ͮ|@X+����~@Y��$W�@[�V���@]r�J���@_W1�h�@`���ԝZ@a�<QG�C@b���/�@c�+3I�@d�+�@f��!&#@gB�:�@h|H 1@i�IJ[��@k��-��@la]q��'@m����:C@o)WH� �@pM��?ˮ@q�c f�@q�΢�ݠ@r��dWh@sco�X��@t5:6vF�        ?����aA?�~H����?�6�E��@���П=@Q>��@!�w�p�@*��}u��@2�"��݂@8�#-�@?�6��@D	�ԉ2@H�8;��V@M��Thy@Q��y|��@T�{��M�@X)��[�@[�W.���@_�cgD�@a��]��@d6<��~@f��!�@i$��n�7@kՎY��@n���)7@pջ�	�@rhٜ-�Y@t��J�Y@u�Z�E�h@w�٧@y@�}�@{x�� !@}�o�Jrk@���6%@��E)e�o@�.����@�E�w��o@��}&{5�@����g�c@����@�p�|kr@��_�H\@�Fڰ+�@����<@�H�N@����7�@��;w5�~@��g���@�e�q�@�C�� �-@�&�xc�l@�2[z�@���x�@��X���@��ߛfd@�����@��u�&�@��'\]0@���)�X�@��'�n�@�%,N�@�AN��@�1Tђ�@�Ď@xn�        ?SGkEs�x?~����o?��{���H?�:����?����^?�:���}�?̜x��?�q�q�?���oZ�?��\?�-�Roj?�t�O�We?�^AƇ?���_Ps�?��/��:?��l��)@ �#]R@k�{ �'@�>� �@з�8��@
�f�ӷ@O���@�{
��@���.@��YO��@�(��r@՟e)6@'r��?@�6�V�@ ��0�@!o}���a@"�%LJ"�@$V��m!@%�����@'�R���|@)5Y�
y;@*�"0��@,���o�@.�b�}�@0^@�l"�@1g�1׏�@2{u����@3�A��e�@4�@@5�{/ƞu@7/�GC�<@8v�B��=@9�	ɉ��@;#�*�Y@<����B@=��|��@?vQY���@@~NF��@AFڋм@B�F2�S@B�4Zg
:@C���tU@D�B (39@E��є�@FlHTyY@GZ�TA|@HNx�@IGԟ��X        ?K��Kle>?y�#�ƻ�?��� .i�?���J
y8?��B�,
�?������l?�87�D�?�7\J�B[?�[N���0?��+�֡�?��kF2@ X>����@C�P+�2@y�w2@�W^<��@�S�(-@��u�]Y@�p��@"G�Ln,�@%�<�o@)*]�b�@-)+�[	@0�w|/�@3)��SK2@5��|�(�@8�j���@;��u@>�L#=$@A+�N�X�@C�A��@Ek���@G`�,�@IY�nw�@K���X�@N40r��@Pj^ǜ�@Q�2�iDV@S?�Z}�p@T��O��@V^Ks��@X	��Z�6@Y���n@[�	�s�@]��Y@_y�T��@`�����@aՆ�|�@b�ߤ}�@dy2���@eJ8U.�R@f�	C%>@g�a��@i"�7�!@j�w� ��@k�IO�s@mb�����@n�@�93@p9��j�Y@qD�X�~@q���B�,@r�ж=�`@s��\f�@t{�Fo��        ?CO����?rd#1�5z?�ғU?��JG�.?��.^U��?��S{���?њ�O��A?۝C葷S?�е�a�?�Quѝ��?�6ni	?��<���@�	)ޭ�@��Dj�@�]��^@��"�m@�-���@�����@���V@"H��rY�@%a]XW�n@(� �~�@,�Z���@0M��:�@2�ҍ%��@4���B;@7x4��H2@:8�0'�@=(�$��@@$���� @A�
v���@C�T��i�@Ela(�@Ga�7T�J@IqM��@K�x���[@M�w�5��@P PO��@Q^%Gϋ@R��ys@To�@Uk��:��@V��:@Xg�Ċ��@Y�ڼSn�@[�?�V�@]Qi�5��@_LK沕@`rqB��@ac466�D@b\�EmA@c]�m��@df}��C@exQM�j�@f���7ˎ@g��ǈ��@h�=Ħ�@jg���@kT2���@l� �+lO@m�N%�2@oD�g�
~@pS��C�        ?�s��uS�?�B���p�?��8����?�I�����@v�߬c@m7GU�@@B*��@"�l��$�@)V�I\�@0b�}��`@4��ד z@9ꯟyn�@?�p�Y6@C	�j@F�T�΋�@J��o�V(@N♼Psa@Q�R��9�@T`WԒ@W(9�d�j@Z(?m:@]a����@`j�uwd�@bB��ǹ@d9�2��@fP	��lX@h�A�Tb�@j�%{W}%@mU_Qy�@o�E��V@qVFmig@r�t?�Ǚ@tH��}@u�x�X6@w��n��@y?��+@{Pu �6@|�:��3@~�}���@�x�}/`@������@����6�O@�ǳ�Μ�@���m�'�@�0�O�r@�ub�#�:@�į�L��@����Z@���L4h@�����@�oY�e�@��Φy�j@�ý���G@��1���j@�fD/H�:@�?��C�@�<Iی�@�(i�C@��@�ޘð�@��+7��p@��D���@����v��        ?S��\��?Bu��B?���yK�?�h��?�8�G5Gx?Ĉ��6@�?��x���?ոi��?�W��?�'�����?�Y`$���?�JF6Xl|?�͌S?�Hd��'$?�|K���I?�!�v0��@�����@�%�%6�@��\�&=@3�T|d�@���:�@A~V@Gb��j�@o�L�<@��G'��@)�RZ�p@������@t]�q@!(�VB�l@"�=��H�@$>��h�l@%��A�*�@'�Y��T@)q�`��@+Tt�� S@-KR��_�@/V>e�i@0���� Y@1�lW�վ@2�k�`g@4&���x@5_{��E�@6�����@7�iu�R�@9H�@��e@:��u���@<�3i�@=�/{D�Z@?�f��@@R,֐9�@A��n��@A�Jj�w�@B����{@C�z
�>�@D�[	p�U@EqðH��@F_�i.CG@GS,�-_z@HL+t��V@IJ��M�n@JN���1@KX7�E@Lg3z9a�        ?Tk��Z�?�U�@kju?�`�E}F?��?��?Ô�Z��?�Æ��kP?�~�ł�?���?J�I?��I>2�?� �M�H�@ u)h�HC@�Yo�*@�]%@8�r�@���f��@&�Q�o@!E��@$�m1��@(k���}�@,��y �@0��Z�E4@3T�B�}-@6+��T@9AQ�@<��X�@@����>@B>�ڌ�@D@M��@F<m0�7�@H��*Q�@J�� �>@M��6�(@P&��d�e@Q������@S LM�@T�XVQ��@VH�Sln�@W�8��z@Y�ϐ��@[��~ٵR@]���q�@_���R�@`�$^|��@a��b"�s@b���@d$$�"�*@eS���J4@f��7M��@g�z8�f'@i[	h�@jwvYgH@k����͊@mF˻��z@n�=8��@p +݋��@p��&jY@q�x�O�W@r����\m@sZ���@t7$Z1�u@u3�e@v ���r�@v�P�3d�        ?N^z'��?|��;M�?�:t�+-?���^h?�ݏ�t�?Ѐ(1�^�?���v'o?��O:�.�?�C)PW�!?�;ɒ�@ b��>q@}��d��@&U���@��Ë�@�[�q�H@d�X+�@!�sg�.@$��t�k@(���P_�@,� ���@0�cG�@3��І��@6�pk$ @9�ڶ�kL@=?��s�W@@~�E�M@B��O��@D�TM�@F�)�l'@Ic��ҥ
@K��j=��@N�����@P����)@RPKo��2@S�7�-�_@U��i��@WSKfJFx@Y&��N@[yoYo�@]
��}�@_-�Y�@`�J�n?@a�{mz��@b�G�Y��@dΡ�m@eU1����@f��B�@g���O�@iO��>(�@j�B�K�[@l0-�q3@m��oޛ>@o?�͈��@pl�ǣ�s@q?�~��@r��`@r�H� w@s���I@t�a��_'@u�'�@v���SI@w�|��,�@x�0p.�        ?�Nj"�?Φ��ZN?�Peԅ�?�e�k�@	`�/�r@�)�g�@FU���@&,;�o$�@.�{�N$@3�$ߝ�@9"VS�'B@?^���@C9�f$�@G6�|�e@K�´2�@PL"�F@Se�c��@U��N��G@Y3"a��@\�����W@`9��d��@b>)��h@dfRb9A@f��y�@i$��Y!�@k�����	@nyAz���@p��SOa@r3�B��O@s�	���@uz�l��@w;L'�5@yh�(�@z��֔@|�`M�@X�_�M@���֫@���	��@��<���?@�,����@�T�m�@���Ezڢ@���//@�SE�&�@���a/�M@�6?��E@��(=9�C@�G�1++@@�q6j���@�D~����@�̀�6�@��#o�k�@�ℴ�E@�����@��dJ���@�������@��ai^L�@�����X�@��o3�G@���1=f�@��=��@��F�@�#�/��        ?U�8X?�^�5mL?�A  �?�Y���?�i#C�?�G���[?���{#u?�ߪ)���?����T�?���CHd?���Z�u�?�-Yh_?�'h�.�?�t��tuE?�(�e^�?�8���=Q@ Suzyb@����@Sp9I<�@S���@z�@O�iP@ۄ
�.@��`:�B@�*~��@@��jzئ@!�[E@�1���@d�Vj@�l+��@!@R��}~@"�t�|"@$?(���@%�жLҾ@'F��L@(���٘�@*bI�ь�@, &V��@-�����@/�g@�h@0ݕ� �K@1�2Av#�@2����@3�4��U@5��\@6.jE��^@7W�30�@8��-;&'@9º��]�@;ٽ�UJ@<OO�Ⱥ�@=�V��
@>�6�w�@@0P!;4�@@�(2��@A� �ke@B^6�;S�@C h�&T�@C洜N}�@D��֔|@E�d�S�@FR.Ս�8@G(�q1ԧ        ?O�Fxc�?z��Fe`#?�=�����?�\�+�C?���Q�?�&���3?ת���T?♨z&�&?�q�up<?���n��?�j�R7hY@e��uC�@Kx/�@�XP�@k�)+Z�@
c�@Uv� _�@!�H�� �@%T�� �@(�����@,���J��@0��oyp@3Ld˲H@6	V���@9�fͩP@<7H6��@?�D�� �@A�	��
S@C��7D��@E��V�@H	eHc~@JmRe�ʖ@L��[�P @O�5O���@Q;[pM�@R�v��-V@TII��]�@U�.#���@W�{��'C@Yu��]N@[X���i�@]Q"n@__L�MK�@`���Qjs@a��1�1�@c`�߫�@d;>$�X@ez���w@fŵ~M|@h��e��@iW�K�5@j�)�}`@li&ݖ]�@m�n�\@o�h�S@p�+ @qh��9�@rEj���@s(��Oo�@tj����@u�!��b@u����@v�=P�1        ?F��ĳ`?u�K
ߪ?��];c�?�9����?�J���ŭ?�151c>�?�UX)�Xn?���60��?��|˱?�	����?�����H�?��;I�?@�	�n<@
�/�PM@���ȶT@��8�|@W�E��b@�h�)��@"<Y��@%��[�f;@)/���A@-8۹��@0���^#@3;N�@5��r�G@8�o)��@;�heO��@>�Vϱ�>@A>��v�@C���1@E��*)@G2�Q�@Ik۬?�^@Kŝ+q�@N?�� 	@Pmu�Q�@Q˹��@S:�j*i�@T�K0pB@VMR�]N@W�s@��r@Y������@[mǦ'@]F����@_2���ѭ@`���Y�v@a��>�k�@b�iJ|��@cм.4`7@d��N�O@f'D��@gaR�\I@h��_�H�@i��>���@kM�pٍ*@l��/�L@n W�P��@o���IZ@p�A@G@qV�{c�x@r$3����@r�<^���@s�����        ?�C\���?�~7���B?�] ��\?�M�Gm@<@<�s9@R�U�P@Q��1��@!�~�@'�ќ�@.���H@3� J��@7Ê$�s@=w`�@Aq���v|@D��3�{@HK�*��@L9�ɵ|@P@���,'@R����Ʋ@U�����@WĜ�ƷF@Z��@��m@]��Ac�G@`�<��@bA!���$@d).*�H@f���&�@h"����@jQ�Mw`x@l�ز�{m@o�}�&@p����@@r���@s}���)�@t�ž
v�@vq���@x�^�9�@y�?O0��@{Ut��@}�ӊ�@~����.@�d���@�]�=�(@�^|��@�g�̼e�@�xブ\G@��c�@��!��v�@��$�� @�v�zT@�K ���W@��,&1�@�٢.õ,@�-�>�u@�����H@�wd��A�@�.���#@��}I��@��L�Ҁ�@�k�y4�j@�3�0�x�@���#$�*@�Є�e��        ?T{���?~��z-?�H�T�?�|� ��?�!b�NT?¥\��sE?˼�~��?�y���?�1�k=Ed?�	�Վ>�?�%'z�)?��D�8O�?�M ��?��+ ?�*kTP�?�" ��w?�x!�\��@��/.�@����|@db�1^@
Wa��@bS_@n����@8���0�@䬽#\@!/�W2�@@��4b@{�'�2@����@K�p�@@ �H��,�@"I���@#�SM��p@%*8n K�@&�s2޶@(H��@)��|��@+���t��@-hp���[@/<�H޼�@0�^xc��@1�fڵ�@2�t�^��@3��Dڸ@4�X��@5�ζ�>@6���Ϗ@8��B@955��rF@:l^��x�@;�6�_SI@<��y�@>?�N�@?�Ǯ�Ԝ@@y��}S@A,.�K@A�~G@B���K�@CZ��-�m@D%~=�u@D��H>@E���H@@Fwd��@�        ?R�9k7��?��6��4?�?�oN?��p�??���N\?�e�d8��?�L;gP�?�L�1��?�P�?��@��f�?�X.\S@�}L$e�@d�f�
�@�<ݼ�@9����@�:pd}:@ �G�O8�@$���4�@(��r�8@-"��l�<@11&��@3��s��@7ƍ���@:���q0(@>?��?w@A)F'3@C]� ��@E�����@HMc{`�g@K
�4��M@M�J�}@P�I���:@R3Y=ń�@S��c�K9@U���_t�@W�ba�4c@Y�W�b?o@\ 9o�@^F^(@_�@`T��>Y@a�����@b��|�P:@d:���^@e��DV�@g����@h�PQ��@j8��(E�@k�9g���@m���S�@oSBH3DD@p����,R@q�3���@r{�꒵�@s{�b��@t��4�@u��MY�@v���l4�@w�����@x�0/��-@z$��l��@{]cR�}@|��nѴ�@}���s        ?B��|��	?rF����?���P0�?�MP�#�u?���7nhn?�a/�Ke?��ʤ?�`G?�i?����!y�?���{w�?������?�	��j�@rf�Y�@
\��3�@�	� ů@�+�G�H@x��D��@�]�}�@"wc�2ʐ@%�8j�@)��
$>@-�4��0@1B3����@3�)47|�@6�i4>�@9����?�@<��A�r�@@�>N�@A�R&��@Cﮯd�[@F
�/D�@HFU��]�@J��]��@M"��]�@O�ӟg�]@QC� �\g@R�6����@T<=�v�K@U�<T�B@W{�c-�@Y6��=�@[����@\�/���@^� Ы�/@`l�6hOM@ax�}o|@b��baN�@c�E��@d҃Qi�@fn��@g=ɜ�t�@h���oL}@i��Y:�P@k%�	:0@l�Jtgx�@m�b�y�@od&���V@pp����@q4v�:@q�� m&@rʊ: ��@s�
�TH�@tt�;        ?����U�?ȴ3q��?�]Aޯ?�&8O�.Y@W��׋�@b0>k�8@xn�'�@ �v�
"2@&`+X��@-;���s,@2��3/�%@7#�B�f@<HI�ϝz@A�Qx=W@D8��8�@G��V��@K��A�W�@Oՙ-^D@R3�q�>�@T������@WP�P�EA@Z'D?n�@].�8���@`4(.�L{@a�X~ux@c�a*�\@e��}a�1@g��C�|1@i�u�F�>@l�B+Y@n[�B��@pg+�݆B@q�����@sT�`(�@thIOcg@uژ�Y��@w[S|),1@x��Q��@z�G?��P@|4�3�lT@}�)�O@�C/k�2@���#{vx@��h���@��b b�@���ࠁ�@�ÜO��@���Ȕ	j@���:e�1@���,a@�5�q�@�e6iJ�@���R�@�ڌ�Ũ@� �v'E�@�m�&��@�as8p6@����/`@�����Fg@�w8���@�0�;�W�@��d%P@��Wr��