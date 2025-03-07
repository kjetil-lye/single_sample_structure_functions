CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T102516        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?����b�?��)���?�7"��E?��7�`�?� �J��?�P�E�?�+��p�?�R�|�4?�\�n�<s@ ����oz@m�?�g>@����`a@G6��4�@&7�C�@�V(�IL@­��@���|@&�4g��@ Q��@"(#�o�@$$5h�v@&k�~R�@(=��ak@*un�d�^@,������@/,f�ƾ@0���H�@2!:=@3xkK�_@4�P��[)@6I�Y�0@7���gu�@9I��DH@:ں7���@<w<xJ�A@>�G��@?�Bz��@@�V�G�v@A�'e'��@B��@L'$@C��� ��@D}E�@Ex%�*�@Fx�r�SC@G~��:j@H��a��@I���@J��76T@K�ױѡ�@L� _�@N�s^D@OD�|x��@P;r©M@P�O}�sJ@Qu�tgN@R90Rz}@R�B�?M�@Sb����@Tw��˦@T�� ��b@Uf{�63@V
����@V�M;O�        ?|�-뾤?�p-R��?��N��k?�d��~?�g�:�wt?���П�?��y%�m?�Z���J�?�6�]�Ǩ?�(:�<$@��I�t�@d���+@Y��' O@�*�n�@�
5�D@/�j@RB@���su@�����7@!K�[�?�@#v�ֻ�8@%�����@(3�<AF@*���m@-zO��c@0(�/�x�@1��i�@32ǐ5A@4ї��"b@6����S�@8B�#B�@:���Yd@;�F�g�@=�g����@?��i�@AF3�@B%���@C4��ZFn@DY��z9�@E�7��@F���"�@G��4E<7@IB��uI@J�Z��T�@K�t��x]@MK;��A@N�$�/�@P��[�@P�؆#��@Q�-�y@RVrQ��`@S 6�@S��J�@T���g�@U���$�@Vo�x�du@WM���z�@X/��6�b@Y \�@Z Ui1g
@Z��F^@[��W�h@\�-�)@]�Lծ�        ?;d@L?�7Gu�]?� �ܹ�?��g��?���ߵ��?���ZC��?����U?�]�D
��?��b���k@ ̄�Q@3�6'��@
/�Ъ�@��@�e@�s�a@Z�}j��@�)�MG@z���@!.���@#~�]�Ҩ@%��'�@(��mo-@+`�1�f@.R.���@0�
�)z'@2W[�e�e@4��N�@5����@7�%�ݍ@9��'��A@;�^ɶ�@=�LF1<=@?�bAYcS@A��̥r@BIn�9h@CT�׍@D����%u@F\�VkW@G[�8�$@H�}QҀ@J �hym�@K�Oh8��@M����@N��2��9@P�!���@P�6O���@Q�����@R���
V�@S_щf�@T?���4�@U$�a��M@V���z5@V�7�t;�@W��xґ|@X�d��_�@Y���_��@Z�U|΃�@[���"lO@\�'���@^��j@_$��{�@` 2~/L�@`�m�ӑ@aC,P�W        ?�/��E��?�\�#p�?�B4�j?�î-OA@e�@Dnb@v�Ҙ��@�]�}�@/���k�@"N�S�_�@']�T�>@,n��(�@1+ݨ��@4h.��@7�M�~�@;��׍@?��O~F�@B�%�*�@D_����@Fѝ��_@If(���@L,�+�@N���qnR@P�2�@R��ϡ&N@T'���`l@U�d����@W��.;�A@YlbT=@[O�G�B@]CD�T�B@_G�J��e@`�?d�cH@a���k�@b�Ʃ2��@c��RϏ@e* ͮ;	@f]S�y@g��tX(�@h�J��\@j'�ߤ�n@k{�J'��@l�V�j@n;%{��@o�<���@p�vy��>@qKr��9@ru����@r�2��J@s���0:)@tk����Z@u=�R^�@v�.���@v��9�"�@w�Id`@x� Q>-@y�-���@z~2(Sv@{l*����@|^tB��@}S�u|h@~M�&g��@K{r0��@�&�����        ?w&H!�?��梉_4?�o��[�?��X�U3?�)݄Y�?�qS� &�?��н|6?���
��?�C3�?�������?������@ LH��@o�>y8/@�^���G@
�Ɔ�W@z���y�@X��g@�yn�)@�<u@s[ӣ:@G��@�1mO@ Z����@!���L�@#kf���@%�"�@&�;_���@(zv�D�G@*I|�1@,'�F�U@.\��k3@0hs��@12�p��@2��!�@30TO��L@4L���@5pH��x@6�Y���@7��T�-�@9p;,�<@:HZ��l@;�m�E�@<ߕ�o�@>5�L��@?����fs@@{]kEA�@A0�"�J@A�\����@B�S�T+.@Cd�E��,@D'�D5�@D�V�Xh@E�}iO�@F�w�0�Y@GP��w��@H"���^@H����@I�jT��@J������@K�-(�N@Lk�L}�b@MO�iyrC@N7vy�        ?vk.����?��̾��?��2gV�?� ,�?���2>�?� )'fO?�e�*�%?���ĸp?�;@�5o?��jӫH@�����@�|��@
�J}�l@��@��rً@�g��i@bY���@{�$C�@ ��I�d�@"�� MH�@$�P�@'\x1OI�@)�i�e�@,����@/s��kj@17��6�@2Ǎ��.O@4i��� @6�j��g@7���<�@9�~���y@;���@=� $E6@?�$@sJ�@@�V�eE@B
\��1�@C.���<C@D\0����@E���C�@F����@HN��#�@In�k��Z@Jʀ;�@L/a�D2�@M�m�:}�@O��*zC@PJvi9Ѓ@Q(��pc@Q�a^�\�@R��3@SxS~[�@TO8�]@U*"~w3�@V	�d �@V��*�@W��%�Q=@X��@Y��v"8@Z��[`�@[�y���I@\�M���!@]�\[���@^���~�        ?s_�}�?�����?�vo�r��?>qϣ�?ПX(�?��ev��?��v�{_�?�7�!�b�?�/��]�?��I�IM?�����G�@�3��c@��h�@�A���Z@Vؤ�@��)@4w��@���'��@Q�FnC�@!"���@#<���I@%x�[�<v@'�xr�t�@*U��@,��ʕ.@/���G2�@1O)��%@2�\]��@4frO� @6g��Cv@7�7��I�@9����&�@;_N��k@=G�]�=@?@��&@@���M@A�N�x{9@B��E@�@C�k>�q@E�@۶�@F:s��t@GqB��9�@H�Z��R\@I����@KGV @L�2Q��@M�I	���@Og��?�@Pllg �@Q(e�2�@Q�֛O�P@R�]"P+k@Su�3e~�@TB�|�^~@Uf��Đ@U�7EYa�@V��}$@W��bh@X~��0�@Yc���@ZL��bg�@[9�� ܮ@\*���}l        ?����ji�?7ݸB<?�M�+�?��9`?��r��@ Dh���@��-u)�@�v�_n@"�
z@ c���m@!l
x�U�@%#�-���@)5�.�	�@-�/2z�1@13�;@3�7��)y@6|f�` �@9a��@<r+-�@?�΂RW�@A��X�%�@CP1�:�+@E,C�a!@G�*.G|@I!���|@K:��k��@Mg�;�U@O��F%c@P����6�@R2�T�Ħ@Sp.��D@T�uB藝@VM����@Wb�B�@X�z���@Z3����@[�<��X@]*�?Q@^��^��@`"��Op@`�.���@a�=��Z@b��W� �@cs��S.`@dR�� @e6&j�@f��͸@g	L?c0�@g�<�N�@h�͕�LZ@i����@j�,�J@kߴtD@l� ��.@m�I�A^�@n�G�C�@p8�Ȟ@p�BC�+6@qZL�Q@q�G�֬@r2p_)�@rRR��@sT� �$        ?�����?�h�c|x?�М�w�?���Y:�?�s�dT?���t�@L?�;O*�y�?�t����?�}�J�*?�6R��@ �s�	�@[B��z@=��	�@v�ګ��@���Z�@�չT�@�kR�@�@V��!�@EFI�Α@]���W@ �V�k�@"�.$�^@$M/0���@&*;Q�8n@(65F@* �cAr@,8���I�@.d��^i@0R#�|ۈ@1{�GxJ@2�����@3�7��=@50�~l�M@6���@7�7/�u@99��.�@:����>@<3K�(G@=�N���@?(�={Z@@R��t�N@A�τ#�@A�(���#@B���ΤK@C�])���@Dt8��@ET5�xft@F8L�l,?@G t�`�@H�-־_@H��aBƜ@I�?{��@J����@K�%.T{�@L�+ƅ�@M��J�3@N�����@O�����@P��*T@Q8�w�@Q��?���@R(�TA@R�>!�^�        ?zp=��?��=��XW?��u��Ơ?ǲ�J�?���֟��?�}I6�;�?�A�
a�F?���M�?��S���?�Fh&a9�@u���<T@Ƞ���@�gt�Ԡ@z�!KK�@i���m�@�Sޭ�6@|`*k@�k2��@ �1`��@#����@%F�A�ZP@'�����p@*3,����@,��p�@/�T�@1L��3W@2ԮDݬ�@4n�����@6��k��@7��]\C@9����@;�]�7^D@=rU�)�@?s{o/�o@@����|�@Aԝ@�V�@B��M�9�@D�S�J@E=��&>@Fp�m$��@G�C��@H�ͩ��@J>��M3@K�X]�I@L��./M@NXӗs�@O�Y 3�@P�_�V��@Q]�e���@R �@��@R�<�d.�@S�����n@T��t�|"@UU���"�@V-9|6@W
,0�@W��	��@X�q��7@Y��ǫ�H@Z���"�@[���;!y@\y�mք@]n�Ia�         ?|���p�?����5�?�r��h�J?�of���?�v�S3K�?���$U5�?�S#5T%?�c�MU��?���\#v?���MR�@.�oc�}@�\��@C�eγ@+�5�@Q��n-@�yGU�@���!L�@ f�_ȖC@"�G$v@$�Q��]@'~wW	=@*)��h
�@,�0Q�@/��E�@1����L�@30B�T�@4�^:�z@6��}� �@8�1���/@:�Y�5@<�hGfK�@>�T�Z��@@n�X�|@A�I��+�@B���m.@C�Yk��@E0�ٻ�@Fy�{R�1@G̒�$�X@I)8+R@J�����@K��T5X@My�~��@N�*�'�P@PE2x��	@Q�75)�@Q����/@R��W��H@S��F�P@Tnu�$Y@UQ�_��6@V:�ԭ@W&�T�A�@X�]j�@Y����@Z	����@[	X��/;@\���	>@]b/�@^#�)~$b@_5�o���@`&��Ά@`��p$�        ?�X�5sE?�f��j.�?���%O�?���Ճ@  �DV�@�!ף¥@��p�Q@	Z�i"@c��J@#�?1���@(�iu%��@-���ݏ�@1�k버�@4̯�q�@8!��6�X@;���/��@?�L�&G@A�CP���@C�2Q�	[@F1��/g@H�����H@K�E%�@M��)�G\@P1��;M@Q�/�=W@S9
�P@T�	��T@V1�+�V@W�#�rK�@Y���@[Ca���@]F���[@^�xx(Y@`ghƘ�L@aa���@ba@�^	@cg�N��@dt��M��@e��]۳@f�D���@g���*V@h�~u�^@j7���@kC�bb6�@l{�=W�	@m�Dy��@n���p>�@p#I�l@pʑP��@qt�-�N�@r"(�w�@r�&�H�@s�� _oz@t:b:�}@t��Y.@u�u��@vk�b7j@w+9�e'@w��R@x��3�4@y{�R_�U@zFG���@{��.A�        ?v_�>V?���6r	�?���v�;�?�x���1?�r�q��T?ـ{����?�_����?�	;M��?�s�|a��?���֗�?�����?�i�CLM@����J�@o#��@	��r �@`k8ĉ`@�@Q
�@��� �@)�_;��@�V�){k@�JV�@£���@��oҺ@!7�}��{@"�$����@$K�/N]@%�gC�F@'�M!t@)Z��{�@+(��4�@-Y�i@.�/]Q@0s�e�+�@1wcr�V@2���R�@3��N�@�@4���As�@5�6�	3@6��(@8 	��@9T}��@:�Х>��@;�"�n�@=��v[@>f7��P�@?�·[��@@���қ2@A;P8��G@A�ו?{�@B�]��@C^�&Z�@D9"�N@D�|�D�@E������@Fa��:�@G)6?��@G�^E�@H��.�t@I���X9�@Jcw6�@K8',�@�@Lʘ��@L��v��        ?uAVWf�?��Gl{�?��纅^�?��j�-��?������?܈���v?�As�PO?��4�<��?�8��h��?�f&�k@ �P���@@�A���@	b]O]�@s�h�Ҝ@�Vf	@L�,x�@c}�U�;@�տs$�@��	,��@!��R7�@$+:��Qi@&�Z4��@(�pF/��@+��e��@.QŦ��@0��l���@2�MQG�@3�k�+=�@5T��3#�@70X��U@8�(H޺@:�o�9�i@<������@>���<0�@@O��
�C@A^��Ő@Bv!�!`b@C�����@D�U����@E�Ш;�@G( S(@Hix���@I�&a�@KZ�@L_L����@M��(!��@O,[���@PO��i%@Q��f�@QΜV��@R�4U�w~@S]��_E�@T+y��OG@T��_��@UҼ�L�@V�R��@W�٫�U�@XkO��M�@YP�]�+�@Z9��K��@['%�I�[@\4�~e�@]"�J��        ?s�����?���*�>V?���2??�9���?�����?�R`O���?�Vyv7fN?��6 q�?�O
F�?�,��R{?��_����@��Ǖ�a@+�2��@�m߁"@Ƚr�@�B]~1@p��t7@Z[d�^�@�iL.K@ �ɑ��@"�b]sV@%
m��@@'M�<�N�@)�y|��@,/=�P~@.��?D��@0�L&P4 @20�Ը@3�b���@56�n�@6�I_v��@8v�ʭ�j@:,T|�8@;�m�~|@=��$yh[@?�E9D;�@@�窚%T@A�$���@B�L���@C�P��qa@D�%�,�@F�/S��@G%�I�@HL��:@Iy�� @J���r�@K�uС@M)�Ը�@Nq��+��@O��G/�@P����@Q7~d%4�@Q��K	 @R��m�̄@SR\�/��@T�l�Y@T����ѭ@U�����@VKb6�@W`��@Wٟ�U��@X��W��@Ysh:C�        ?���e�	?��Y.1�?�v�(~��?�ڔ{F	?�jo��H@ �V`O��@�M��|m@S,��K @gh�lR�@/���/2@ �-p��y@$j�Q^�f@(W*���,@,���_Sj@0�H��q@3n���B@5���͜t@8y?�%��@;k�A�&a@>�+"�+o@@�S�2{@B��o"�z@Ddd$R3@FA\选�@H1�r؀@J5`J0�@LL���s@Nu�Z�,5@PYyJ9�@Q��db��@R�FL�;@S�P��@U-��@Vy�U��Y@W�Q�6n0@Y+���Ӏ@Z��1��+@\ w�7t@]w���TX@^�P	M/4@`?��\��@a���+@a�����@b�-���@cxV&�Y@dPb���A@e,B���@f�O)@f�?���Q@g�?w!y�@h��%���@i����@j��S�j@k���X�I@l�B �S@m�&,h>�@n�^ o@o�ށL�N@pH�{�s@p�E�v�@qSP�<~w@q��E9�5@rd	vJ�8        ?���' a�?�����ɇ?�i��X8�?�@&���?ٙ��F��?��Ƣ��?��_�RGT?��B�)?�t��yR?��Td=��@ �l5��@�J�RN@Cm�9�@�v@��b@�+0ld@4����@!���'@)�K,��@iѵ�z@ �;�:M@"�-,SB@$�ܻ�̋@&���`p8@(�ZJ���@*��
�E�@-	z���L@/[�C[��@0�)��{@2!2�F�%@3k�b��@4����5@6'O��@7�T �Wk@8�?R�B�@:}�v��@<N�!�@=�l��b@?=8$��@@s���*?@AN>b��@B-�+0�5@C���o�@C�uʈ?y@D�K
�S�@E�lw�@F׸6h�
@G�1\k��@H�m/c��@I�\[��@J����=�@K��d�@M�
G>@N'��%N�@OE�`���@P3��Q�h@P�	���@Q\p5�@Q��eQ@R����K@S)�?CA8@SǑ�V�@Tg��&�@U	�q$         ?d�q?��{fK�r?�R$�pY�?�F��6�?��%6��?�;u~z�?��UU ?�+"��?��S��d6@y5AV��@Y����@:���
�@���O�%@�8u]�@BwNh �@R	�@K�&�@!�#ZR@$R� @�L@&�I��',@)��2+m@,��6\�5@/���Tt�@1x8Gp^@3.��� @4��%�6p@6�f� L]@8�X$��E@:ߚI@=�b&�@?7�e�`u@@����6@A�l���@C,�e��.@Dr(��Ow@E�Ʈ`@G�7ߝ�@H� Q&j�@I�o\~@KgW+�Y}@L�]���8@Nw��8r�@P�{<3*@P�KMO-@Q�&���z@R�^��@Si�*�@TM���?@U7�SU�@V&���o@W�"�>�@X���y@Y����@ZIX=�@[�KL~c@\(�aJC�@]9�����@^PPc�C�@_k���T@`E����T@`�A3(�&@am!_�(�@bj#���        ?z�M�[�?���,�?�?����u?����?�G� �N�?��S���?����g(?���i?��`Sm?���R6:Z@S.S��@�V��@Ɇ�@l7�;�]@�
*o@�@�"��F@͔�h@����B@"k��@$rǷ C@&��x�j�@)�D���@,`4{��@/S����2@17T�P`@2ؘ���I@4����ۍ@6VWg50@82»V��@:"Ԋ���@<&�}��@>=�.$�D@@4B2��@AS_���9@B|2?Y`,@C���x�@D��#i��@F0�o<�z@G��E@H��5%~@J;C�T�t@K�"_��E@Mmq�Ę@N��Zg@P���=@P�.���u@Q�l�NTj@Ry?٘�T@SO�jqQ@T*�)O@U	�!� n@U������@V�1S�@W����lm@X�9n�[x@Y����@Z��1�߬@[�M��^e@\�˰,@@]�-��x@^���K>@_�[w��@`m��,�        ?�"�-r)�?�<\�P�?�#Kgw�?��:u�0@E;-�t@���"@���α@���t�=@!�j��}�@&1��A@+[�Nꓗ@0��r�@3���4��@7	��>a�@:�y-��@>��O�@AdP��/�@C����@E�.<�t�@Hp�dw�7@K��
�D@M�G�>�@PS����@Q�љ7��@S`��L�@T�w��c@V�%e ��@Xl�;v��@Z:�/�+(@\n�֥.@^�*�U@`&o��@a(!�)@b��c�D@c* �h�@dGn��@ek��}I@f��@�@g��z�+@i�'|@jHLn�@k�h�VP�@l����i@n9=m�C^@o���N�@p~OH���@q43����@q�e��I@r�َ�@si��;�@t,Y�o^_@t�Q�ԫ�@u�b�E~^@v��%V4?@wV�`��@x(뢚�,@x�$?�@y�ZlV��@z���O�@{��WD�+@|p�~��@}T�Ȳ%�@~;v�h�B        ?|�!���?��w��ib?�g�
x�?�s���nH?�(�G�$}?�{��P�A?�)�⡏?춵�I� ?�Ô���?��8�	C?�e����@��7}�@7��vp-@�C����@���g�@��k��@�-oF�L@Wf2�u�@��M@�Dgg�@�w:'��@ Cp2���@!֢{[@#{��q�@%2B�#@&��>=�@(Ա�q@*��ԇ�<@,��s1�@.�T�4@0s�є�h@1��|��@2�V���@3�	��@�@5�-Y@69�ŵ&P@7ys����@8�"j�d@:���@;g�����@<����@>-9�T�k@?�!���@@�1)D+Q@AFo�^�@B;�7T�@B͈\a��@C�E�t}�@Dbf�n�@E1�m�� @F�����@Fڠ;҃@G��A��D@H�D-?P�@Io�i���@JR�'~@K8Xs�GI@L!;��@M+�GQ@M�%u.�@N�!n�W@O���nF@Pm��o�        ?w?�g��?����Q�t?���w��m?����>'�?ҢK���?��|�͆�?�<g��9�?�Q�ׅ??�$�j@��?���O��w@�t��X@Х$�@
�/vQ�@��q_@���@,�Z���@�]E��-@�n}��@ �@�߮�@#��@%Y�YB��@'�R}�@*}"���@-H>��@0��g�@1��lj�@3H�/��@4��K�R�@6�Yv�\P@8�kn�8@@:��׬Z�@<�i��[@>�Q=���@@_<ƵR�@A{�j��@B�>��]k@C�(�x8^@E���Q�@FN�����@G�y2���@H����S@JQ�ss/�@K�+�"�@M.>�X@N�����@Pf+�Y@P�=>��;@Q�؞xp@R~6�m�'@STUm1�h@T/3O�B@Uͷ(�@U�#>|��@V�1�-L�@W����@X�p���@Y��3�ך@Z�y�U@[��H�y@\�;x�5�@]�ݚ7G@^ͣ�ͩg@_�Ь���        ?|R񒵇�?�SzQ[y?�K1B�#?��V1?��$1,?��7���?�����?�.�JG?��:"L	h?��O>%׶@�����@�" H��@ٞ<^%�@�Ũ/d:@���|$5@ñϯ�%@;6/�|@��C�۞@ �q��v@#}|245@%Z�Ŏ�"@'�N&��@*A<���4@,��k2@/�v6�9@1H��2s4@2�2��J@4_o?��L@6�?�i@7��
,�z@9x����@;Kv�U�@=-vb�*�@?��~&@@�����b@A�e	9��@B���3��@C�)_�+>@D�� ��@F &��fc@G,u�%d�@H_�{�Y@I�w�u�@J���/@L$�BM@Mtp�x�+@N����s@Pb�s�@PƱ�OS�@Q|x���\@R5�C%��@R�a���@S�y�t��@Tu�k���@U<�5ߠ@V	�hr�@Vԑj�
�@W�d<ls@Xy{-��@YP�e�@Z+X����@[	F��1@[���        ?�/}���?ǗL�Qf�?�%��i\.?�.�w�?����(��@vW!�͇@Po4@��Ą��@��IJ�@ �h$+@$i�"�@(�;���@-ya-��@1PW�q<@4�fm��@7h\�YU@:F$ME��@=��<�@@� �k�(@B�vQ��@D�9\�@F�Ԯ8�N@H�~W���@K�?@@Mx�D�`�@O���.}�@QB��]��@R����@S�RSD��@Ud�S�\4@Vܣ`���@X_�#��@Y�0�&�@[�X/|��@]-2=��1@^��4��@`K��Bŗ@a.���!�@b�A	��@c���@c���? �@d�a�>>�@e�<⬧�@f�)�*/@g��X�@@h����P�@j+��=q@k%d/�4d@l??�7��@m]���P�@n��汛}@o��?��@pi�Wv��@q���Q@q�7D���@r8���;h@r����@sw�>��@toCOc@t�7�g�@uf�Ҹ@v�	��I@v���\��        ?~%���?�b,�;w�?����/��?Ȣ�z{�?�+��{?�-�+Ҕ�?�)��Q|�?�y���>�?�8+5�?�>1��@ �x�@x��n��@/��w��@8O��/@��g��@L?e##@��mW�@AV��-@6!��@���@ df��L@!���ՓB@#f���@%.xS]��@'
@����@(�DF��c@*�k�*��@-�t�)�@/8�>:@0��"��@1�����@3�Y8i@4Jb&��@5��$I�@6��x�s?@8-�#X�&@9�S�f��@:��^ج@<a��-D=@=��w��q@?ZƄ^P3@@r,PY�i@A;8���@B}��@B�����
@C����:�@D�4eZPd@Ef���/�@FH���8�@G.Rϭ��@H�\9ɩ@IL����@I�|:�1�@J�c�l��@K������@L�%*�3�@M��
`�@N�'�M*�@O�ݣ��'@Py��(�!@Q ��p%@Q�l>r@R	����        ?y	T(��?� ����?�<��j�?�8}1C�??ԏ��5�?�[s�f��?�({_���?��G�&u?��Vر)�?�_
uS#�@�� U1@�Uf.�q@�;U�)�@��7!�@�sM#�@��m�@R�nL��@�R��@!���~@#8�v�g@%�D߸ @'�KT�� @*|ȁ��@-,��7�@/����>h@1yu����@3@#�r�@4��� AR@6K��]^@8�� � @9��z<Q@;�`�ā�@=�;���@?�GH�@@ִr�OZ@A���Z^@B����3@D�{�F�@EBS�f�@Fp���@G����@H����#u@J*l�:R�@Kw���KI@L�9��@N(m��i�@O��@P{�����@Q4�q�L�@Q��sJK@R��J/u#@Sw�+��@T?4��=@U���@Uډ�:ՙ@V��G��$@W���t[�@X_I�s�?@Y=����P@Z��BA@[q��1 @[��� (@\�+O�C        ?y���ѥ?�`^O���?���u6��?��8�_�?�&B&���?�� Zg��?��w�g��?�{q�ד~?�{SVdiZ?������@L�!��z@��h��@���g~@Z�Bc�@zW=�G@�hC[�U@�׻E��@�!��>@!�S�MA�@$4ܒ���@&��֟�#@)6%N'��@+�?��Z@.�Z�J,@0�'�q�@2}/ǩ�G@4$rћ@5�M���.@7��z��@9����u�@;z��N)@=~9�O�@?�ޜ~@@��yy��@A���'Uh@C E�X��@DN�=D�K@E�k�@F��q��^@Ha��¶@I_U$�@J��,���@LV8��C@M�6m�~�@N�7�4�M@P8!����@P�!K�y@Q�(�+d@R��?8�@SS��	��@T$i�ۆ@T�=f.�@U�4��d�@V�ޕ5@W�3Z�N!@Xn+6��Y@YT��O�@Z>�֒�T@[,�Le��@\��� �@]���:@^
��7@_?I`��        ?�t���W?�T���r�?��a.6?�]8��?�\Z��x@c��� @ä���@�=��i@�Aw�1 @"��Yg]@'Xџ�C@,HfJ �@0�P�0�b@3�O���@6�����@:Z+�M�)@=�:�@@�Gu�f�@B��7P�@EQ�4]5@GaX�O&/@I�ў��-@L>�c�|@N�n��@P� F��@R.n��@S��-�J�@U(g8't�@V��~��@XX�+&`@Z��J��@[�&.b@]�ɽ��@_[Qqqy�@`���8@a��o�uR@b��ۓ@c����@d���x��@e��6��/@f�(M�@g���ф@i;{ �.@j6��@ke�5�@l��	�RF@m�h���F@o��JE�@p0#�1�@p֣^8~�@q�d�|@r+����L@r�����}@s�1	�j@t@A����@t�����@u� �"��@vk�~���@w*��˫@w�	��@x���*)�@ys���y@z:��>cE        ?��O��v�?�)\���?�8k�\�N?� 6 Q��?��7�J?�,�S�TM?�G�?�]��B��?��N��S@�H��-@�tȻN-@
)�F�@@.sw��@>����@$��W�@B0���v@�5,S�@ �MAҡ@!q�]y�@#me��J@%�O�z�@'��x��@*W�m�@,l�D��@.�v�@0�e&��@2#�z\�;@3��l��n@5�3��@6�v!��j@8Cg��=@9�W�Ϸ@;f�zZB@= *��
�@>����$�@@]T/��.@AMȦ��@BD�Б��@CBH��V@DFKƝD�@EP�ۦ@FaǭLk@Gy7T�Ơ@H���=�@I�d����@J��}�@L.O�Ƴ@MN����@N�f��du@O�}2{�@P�n�:@Q5��A�@Q�3���@R�í&}�@SAq�LX�@S�<��{�@T�%Ua�@Ui+RD.@V'Nj'��@V��"+@W��m�@Xt]�@M@Y>�4��        ?}/����?�&}3�u3?��n*��?ɱ A�?֎GVJ*Z?���T��c?�0z�XXB?�:_�ei�?�Y�p�M?�}(/¥@�s �k@s�6{�@��t���@��0���@�u��P�@.Z.�F@ܺ�wȄ@����5@"���v�@$L^���@&�V�T'�@)@�5��@+��~��@.�s'P��@0�ޣq�,@2p[�� &@43�}�@5�g1r`�@7���=�@9eގ��:@;Q��;%@=N�~ߌ�@?^���N@@�]���@Aږ���@B��E�9@D*gD$�@E_�o�X3@F��S�Z@G�Ll�n@I7��B�@J����~@K�V�;#.@M^�[���@N�P��@P(Je�@P�U*+��@Q��B<^'@R~�	!Z�@SN��֨@T#\(/��@T�H��q�@Uَ�@]@V�){v�^@W�e�3>@X�X%��@Yy�v�H@Zl�=��&@[c�N�n�@\_Ep>[�@]^�z���@^b�!Ԥ#@_j�!��        ?����K^?�R�V�V�?���*h@?͵;�t�?��]��y?�t�� t?��"���?����$͉?��X��M�@�����@����7�@�W+��@ۼW˓�@e���B@�˽��@��$���@��l�@"-&mb�t@$��>��@';ع�@*�C��@,�1��:@0
��]Q@1�nj��@3k�V�v�@5=X��8@7%Gp��@9#����7@;8K�b��@=c�!��@?��}�eK@@�2KL�7@B6��$-J@CzX���@Dȣ���@F"�0�p@G��<i�F@H����|@Jt��W|�@K�1]�-@M�Ȳ�j�@O,�+Q�Z@Pk$RY@QE}�H�@R%{
Hnl@S��@S�X��i�@T�5���@Uݮ��Z+@V�����r@W�l\��:@X��&�@Y�}g��@[�'�f�@\�e:��@]77�E�@^Z*?^�1@_���̒.@`XA!�@`���n�
@a�WO�@b-u�d[�@b�I�W��        ?���<���?ү2v<�#?萌Z$�?�j�Z�� @�(���@�4,��@����%�@v#��b@#��_�@)١āu@.�I�W$@2�����L@64�ˠ��@:<�/p_@>4t�-��@AUK�L�@C��
k<a@FB	x��@H���xD�@K�PkS�@N�k�+@P���P�@R������@T_Hk+�S@V.��Kr@X=��@ZXb倄@\� �F�@^-�;k�@`.���n�@aP�X#*�@b{��_��@c��D7j@d�[:�@f7���49@g�H;�,@h�t����@jI䇌�@k�F�r�@m.䣝�@n���>��@p9�v9|@p�+I��Y@q��qƺP@r�P�H_@sae��@t=���@u�0�wU@vj�E�@v�iF69@w�w�@x���}@yȌ� ��@z���]E�@{Ŋ՜[8@|ʸ�z@}�U�ړ)@~�a���@�؛��@��ە�Q@�|��i�@��N��:%@�5N�T��        ?��Z2_?�!x����?��OA��?��:�n�L?�bUY�B�?���rH?�~393��?�����w?�P���C�?�p�pЖ@$ϊ�x@��/�Y�@
��q�@�o�q]]@�AK�E�@JD��"c@r�O
�@���C�@@0���c@ 0��<F@!��S@#�;Y��$@%���@'�6��%�@)�sw��@+ƸO�?@-��,�%�@0& .��@1V�tR*@2�6_���@3���O>@5'�!SD�@6��V��@7����@9Tl@U@:��t��@<O'��l�@=�bLf�@?qm�V@@����I[@A]V%4J)@B6���D�@C4�9�@C�L��5�@D�!r9�-@E̫ǲ�@F���@G��]^ޫ@H�>��D@I�Q]��^@J��;>X@K��$�<@LŹD�H�@M���Ю@N�T��pt@P���z@P�DN�-�@Q#�����@Q�L��@RL���ޒ@R�iT~A@S~E�ƺ$@T=T���        ?x&յ�!?���f��?�m���?���
|�?�ZkƦ�?޼Ze	�?��iů/?�Ճt*?�9xX]A�?�����@`�]]�8@xqh��`@
l,�LX@4֚\@To�[�@Z����@�hs���@%��{Hm@�m��[�@!�_o��@$�Y\�@&]d%�@(���jˀ@+A���J@-�Bm}U�@0R8B�!0@1Jej�@3B���@4�6��@6q:�&X�@8��f@9��>�@;�?ڶ�@=�䁡�@?s�7�f�@@�V�DI�@A�S%��@B�Ƴ��~@Cܥ��E@D����D@Fw^��@GDP(~ �@Huc�I=@I���o��@J�Ht��@L3q��h�@M��e�<@N�Q{��@PSi�h@P�l�=l@Q}�]�HK@R5�hZQZ@R��.��@S��DK.�@Tq��-P@U6�$�՜@U�A�K��@V����~@W����aH@Xl!1���@YA}�zWe@Z�@Z����b�        ?| h����?��K�͆�?�oA�8o�?�Zh:J��?�]
^f�?��K�Xp�?�5�Ny-f?�R��Y�&?���?m��?��ۃ@-/k��z@�J���P@R���@"�.K�/@g��/W�@�*��j@�� ��@ ���8@"�	<��@%#X��D@'�9//@*`k#��@-9�f_"�@0��qj2@1�j�e_y@3WK����@5x)E��@6����j2@8�`�;_�@:��1��@<�i'�n@>ҴL��@@W�B�#@A����|@B�k1*@C���i%@E3b�1V@Fw��E@GâoSF@I*�@Jw<o��Q@K���@MM�8�@Nŷ+1H@P#(�5�D@P�5��@Q�nGx��@R}Y��3/@SNmr29�@T#�x蘳@T���%@U�^�y��@V��� ��@W�[[�S6@X��b�{�@Yxjf�@Zi���k@[_\/���@\X�rC�@]V���@^W/�z��@_\8g��@`2��ׂ        ?�O���~K?;w7�?�xH�]?�q^嶥I@ s���S@	$톀��@�s�4�8@?�U��	@�2œ��@#�s����@(�����^@-��D��@1��V�S#@4�C�}��@8&Y_@;��Iѯ�@?^�����@A����'�@C϶�Z�@F�#h��@Hf߽	��@J޴�O�l@Ms���}@P&�3\@Qz��L5@R�;U@��@Tv  �@V	2*��I@W���\�>@YZ��]�@[αz�_@\�.}��r@^��2�jT@`T*����@aO|��,@bQ�C�C�@c[s�EY@dk$L��@e� w�ͳ@f��j�C@gĀ�	�E@h���M�@j!Ո���@kZ����@l���;|@m���?�L@o,7G��@p?����@p�I��X0@q�0g<�@rOCg���@s|Xb�@s���S%�@t{G*�f@u:�c�I_@u�b:@�{@v� �&�|@w���)@xWF����@y%�m]�@y�{=!�Y@z���~�@{�z���P        ?{���g?���WMs?�����@?�ƅ�O��?�s�:7h?��xD�?�j�Lɓ?���ٹ�?���Ԙ��?�	[�F?���j~@��SJ�@]V�H�@	6?��@���2@� ���@���}xQ@Z��qiQ@��>�.@�u�U@n�� �@ 35��c@!��n� @#]��2u@%-mYC�@&�}�Bv�@(�V�<@*{�����@,k��q�t@.lqA,W@0>d���@1NlV�P1@2f:�<�@3��m�@4���
&@5ۄx�r@7���8l@8O8�
�P@9�'m�*�@:�g�/!�@<3��f@/@=��L=2@>�)�o@@,�̋e)@@��Ż�_@A�k�I�@B_r�}Ѥ@C!�5�@C��)ŕ�@D���WxB@E}��v�@FM[��@G sO!)@G���l[W@H�Q��ŵ@I�
6<�D@J��F���@Ko��7�@LU�=b@M?0X�S@N+"1�&@O+�!�@PG��        ?ys�����?�:��F:?�5�|>�I?�pS�?�cY�ڙi?�/� ��t?����
��?�]��i?�P�x~��?����8@@�y2�@�MF@UA��(@Q~��@:e3��Q@e��<@�`fm��@�C+>�-@ ���m$�@"ڧf�;@%q©T@'zZN�$�@)�l����@,��R��@/j%�
��@1)�{ӄ@2��?!�@4Fߌ�1@5���F_l@7�&��
�@9rYZ�R@;M��x�@=9�Ue�@?6�@��@@�Wl��@A���:�y@B�x��6@C�z���@E�z�@FB��?ާ@G{�u�1@H�K��@J���J�@KX�x�P�@L� ��� @N��Ϋ@O�ks���@Py�i�Lr@Q7_P�@Q�k�F�@R��0��9@S��ø8n@TV�w�@U(����#@U��x��@Vؤ̆��@W��1ܰ<@X�]�[�@Y~{}��@Zg��X@[U�G#�@\F^)C܈@];eZoJ�        ?v�Iv=?����{?������?�Ȏ�o�?�u��}=?�z`��d?��/�eV[?�L���?���_�ud?�ң`�L�@ ��3��5@SSI�.@	�����@���}"�@$���]�@2���@�;�1,@F*�@�POMc@"
�+H H@$>F)�@&�ժB�b@)�H���@+�i�(�@.m��h��@0�s����@2.�ZS�@3Ę�a�@5m:��k@7'�t���@8��W��@:ӁH���@<�`�|(�@>�G���@@n�J�@A���h�J@B���FC@C�UPЪI@D�KN��@F(�0XT@Gii�G@H� �H��@Jը��@K^y��)�@L��譾�@N.u�R�@O��^�R;@P�<'��@QSRް��@R���7�@R�`�g�@S�M�q�@T�xO��@Ub�܏ε@V?p�j�@W 4����@X!"�*�@X�1�A@Y�_;R�A@Z̦d��@[����J@\�g7��@]���jrE        ?�ΧN6�?�٥6��?����i?��=3"H?�k�xCn@U1�vܹ@h0�j@�@ucg@�����@ X��@$.%Ӯ@(j�A�"�@-H�j~�@1	�h�@3�����4@6�+Ǝ�@9�/�g>�@<�M4��
@@:{���%@B�fcѯ@C�u���Y@E����@H~&
c@J<e�G�+@L������@Nڳs���@P�H�WKk@Q��u@S51*b�@T���}r@U��Y'�@W[)(* �@X�t�{�@ZQ���@[ۿ��)@]o��\�@_���r(@`Y��b�@a1�����@b�R/�@b�nGz�@c�n��0@d������@e�z~�<�@f��*ѵ�@g��޲X@h��:�e�@i�Y�]T;@j��{��@k���b�y@l���:�L@m����7@n�ǛO�@o� �^#0@p���j@qw2ǉ@q��s�2&@r>Pzu@r�v��i@sk�+� �@t�@�D�@t�F 8@u>M�
k        ?S/z�?�)`;�?���C� )?���ю��?�{�|�%?�m��3 ?�e|7��V?��g���?��AB�v�?�o`��@ �MƧ�@�hJ p @q$A��E@��iyۭ@��s�@�>�O@�N��$�@�x��^@���O@���J��@ �ΤY@"�D��x=@${��ʍ�@&]��O��@(SU�ҙ5@*]�e�@,z�_�2�@.�#���@0x�:T�@1���a9A@2���~@4�z3@5dg)	��@6�~�l��@8$$�;�@9zJ���@:��#�?@<b�wќ@=�5ֽ5�@?p�dZc@@���|�:@AQ�5*2@B%KzPl�@B�G�dC@Cٸ@_e(@D�����@E���t��@F�n��J@GwW����@Hi�Bi�@I_�6�z�@JZr?|,x@KY!���@L[��xi@Mb�߻S@Nm�j�G@O|�|g�@@PG���_�@P�P<���@Q`�"T�:@Q�}@R�k�y@S��j�        ?zrI)�[�?����J?�����x�?�Ƒa��n?��}��J�?�s����?��z�mл?�	���?�+�l?�\X��G@Ͽ.���@}N���?@�4� ]i@´���@��]��@j��'�}@-����8@ ��H��@"J�Q�@$�(J��"@'N2��@)��-��@,u��Q�@/_�����@17�bCV@2��ޘ�*@4���&@6B4�J{@8��A�@9�=H
!@;���{��@>��m`G@@�dV��@A-׷�H@BQv��\@C~���@D�[���{@E�� ̱�@G?Z����@H���X^�@I�O)��@KUxG�h�@L��=i�@N>D���@O�gܧ�@P�+T�@Qp���0�@R?��%��@S~�u}@S����@T�����@U��_��v@V��m�W@W{�m2|�@Xk]��q�@Y_��ܕ�@ZXF�$^.@[U��%�@\W��w�@]^7 z�@^ig;xl�@_y0��@`Fɱ	�        ?w�|M��?��/��?����oTg?�x�e�?�ji�t�?�G���=�?�b�z9_ ?�V� ?�q�ݷ?�Q?K�+	@E�(�t:@^P�l
�@	�.(�+@	u���@O%ք��@Zuk��@��Ic�+@4�e�f@ 
�@"
���F�@$41-�� @&~��?��@(�f;E�F@+w�btQ@.$��ۏ�@0y����@1��א{@3y�)�0�@5��l��@6���1@8u<H�@:? _�K�@<s%��@>bR�.y@?��@��@A]=@8�@B����9@C'l^\t"@DE��<�@Ej¢�G @F�~���=@G�AS��@I�r��@JQ�2@�@K�wia��@L��{_@NR����p@O�ݱ�KS@P�|�`�@QL�ޒ-3@R;�/@R�cђpD@S�c���@T]6���@U*�
a�@U�IF9�@Vс_H�@W�~��D@X�>}�j@Yg����@ZK쐮�Y@[3ϮW��@\\g��        ?��6FdE�?�}��?�t�C%3�?�� b�`?�K�D�@.����@���]��@��Vّ*@�b�*E\@"��� ��@'�U+
�@+�9MC�@0�-�:�>@3�CB�+�@6����TH@:�����@=�%��^�@@���l�@B��Cb*�@D�o��Ŕ@G'C���u@I���@K��?��;@N���N�@P����4@R j��u@Sr<h[i�@T�~��A@V~��|@Xb@@Y�"�N��@[s_�1�@]4���@_�f��@`o�g�W@ab�?�s�@b]P�t@c]�Qz�{@dd�@��@er'HO,@f���]r�@g���e@h��歭�@i�gQrP@k	�M��@lA���ͺ@my�A�@n�]�|�@o�qUC�z@p�M�@qHWX�`�@q�\�\x@r�(��O<@sN�4�D�@t�
D@t��/�@umش�f�@v(Pܐ@v�vW8H�@w�C>~�@xg�Ө�e@y,�;a�P@y�\X��        ?�X�T"?�J�+��t?��)��Nn?�ѽ�z��?��`֊��?�,S0�(?��<n�?��}��"?�"PŃ�?��O�'>�@EV��@��ƾ
@ָi<y�@ d�8@����+�@W@^B<�@���YR`@��[�ԓ@���z�g@�J�"�t@!	�S�
J@"�����s@$�<{�N�@&eQ
��@(V�yj�@*Z{��>@,rZO:6�@.����/_@0nN�f�@1�͵� �@2��f	�@4����@5I� C��@6���#�@7�|�U@9P(D+1@:���a-@<,�x�n@=��ڱ��@?-���^@@]����@A)5t�|@A��5�c�@B�!�@C��3ϫ @D�Q)ta�@EcEϑ̵@FHgҋ��@G1��Xx�@H$�@Iq��f@J�3�@J�O�5L_@K��2��^@L�d��T@NNɖ�:@Os{�P@P�9(}@P�%R��*@Qw�� C@Q�����@R9���!@Rɶ���2        ?zn4 �S�?����0&J?�	�Ϻ�?��*6��?�+$э��?��[�g�?��(*Mu?�\�y���?�HKZm�?�5��D�@�&���@�zM�&�@��*���@H�5
@-���-�@�ܵ���@%����@>,�?.@!������@#���.�G@&;�=�R�@(��p�I1@+j���'O@.9�F�t�@0��0s��@2#���s@3���^�@5s ��U�@76��UO�@9����@:����0X@<�!��@>��B��@@���+Tl@A�m��@B�ב}2�@C����C�@E-��a�@Fk��N�@G�u�mm�@I�SQ^?@J^�˳X@K�S�"�v@M/X���@N���4MY@P��OJ@P�$#�@Q��~��@Rllj}�@S=�ޕ��@T6���@T����@U΂D8@V�p�üZ@W����&�@X���UC@YyH;զ@Zo7�Y�@[i��#�@\h��۷$@]kᦆ|�@^s�;D��@_����=        ?{�>dN�?�z'��xz?��o��9�?�Tҁ�Za?ԋܽ�;?�Jb�2G�?��C��?��z����?�t��ml?� 8�K�@fH�k�@���:�@�$+�@�����@}�o @�d�9��@DX`w��@��C@!ih.�@#D���y#@%�n�Fc@(��Z@*��K� �@-s�U��@0-Ǟ�pV@1�c���t@3M��.gw@4�����@6�>�
@8��Vj
@:m��)+\@<e4���@>n�κ�@@E�h�nq@A]�v=E�@B=֢@C��i�W@D��K��@F��^�_@Gb�S;o�@H�r2�n@J���X@Kq#����@L�;�1�{@NT��Ы@O��H�$�@P�NB��@Qx�!��
@RGE�) �@Sj5��@S�R�ڶ@T��w]N�@U�hZ��@V����@W�t�q�@Xq��
�@Yee�N@Z^l�J�@[\&���@\^��d�@]e����f@^qbTM[,@_��6��        ?���϶�.?�򢉩��?����C�?����ʛ??�fVd�/�@Y4E�`h@�Q��W[@�:*��@�F?���@"����@'o��
@+�=���@0��&���@3�>��6&@6��u�R@9򙇾�%@=}��@@�J��#@B�o,�{@D��{�q�@F�j+��@I3"��q@K��(��@NQ�P��@P^�UoY@Q�<S�.@S$��EU@T����v@Vq�Sg\@W�0b�PT@YMɎjz"@Z�'87<@\�4w��5@^r��ߣU@`!���N @a�u#��@bk9��@b�$E|a�@d +7�@e�?́@f6�u�@g'�@*@h@�aI@i^�K�I�@j��b+�@k�/��,@l�`Ur�t@n0~@c@oO��aiO@pH3j3��@p�WĦ�&@q�,�ƚ�@r9�_�@r�ҲR�x@s���G�@tB��z��@t��_!�(@u�|�1�@vc�V�6�@w.�kD@w�L�qy�@x�灍�I@y\�$8)�        ?�t��p	?��d��0�?�C_6Iد?��|�?��g[<��?�=�]>?�z�uə?��B�0\�?�� y=!?��5#���@;%
"�@ش��S@���>v@� �3@�i��S�@a�gw�@a?���@�
@��j�3b@��sU~@!8�s1�@"�N��@$՜���@&��VC��@(���wz@*���[s`@-z�V@/[�D�r@0���C�t@2�8�M@3Xa�`U�@4���!�@5��w�@7cP��@8љ��U@:J��H<�@;�s\��@=\$���@>����	@@L�h��@A# uC�@A�8	�=�@B൩�c@C�up`��@D�r�-�@E�����@F��C@G��q�m@H�XY�@I�*;���@J�|�Ep@K�
��Y�@L��6��@M����2@O_B8@P�v@P����o@Q@v��t@Q����:�@Ru�bk@S �"�@S��	�f@TW�Y        ?x;8a���?�DkO�T?�	#ą&�?��3xp�?ӳ��7�o?ߘ�k�M�?�y�n?��� ?S?�Zj�݋!?�.�I�	@�0N�{�@	z:���@\��y�@���)t@�ŀ�H@^.�X0@����+@���?@!���� -@#��hFs8@&tDX��@)2?O��@+ؔ
%�L@.�s��!@0 [m@2���s�K@4DX��@6�j�@7�-�t_�@9�c`��@;�3� @=�]��6�@@���fG@A9�����@Be���}@C���@D�9r���@F("�]FS@G}9�� @H�}���@JE<@K��5	�@M7]�G��@N�]�s�@P(�lJc9@P��g>@Q�HhT�@R��:+�P@S�8gif@Tb��/�@UJ���al@V7tQ���@W)hߊ�_@X v'��@Y����@Z�==�@[$���@\/v�Qnn@]?ޞ�6@^UQ�
��@_o�Fh��@`G��]@`��č4        ?�R��<��?��{�pf?��Pi��?˚G4���?��IU�?����fY?���#��??�P����?�����G@ ���o�@���ۑ�@	װ��:�@H��\@���'7�@��.@�ko'��@k\��@ ��p��@#���@%j�QN@'���(��@*�^f��@-r�r�ћ@06���@1Ū&Gx�@3h'�_@5�͘i;@6嵛��@8��
5n@:�[vM��@<���%b@>�}���@@s`���@A�,�o6�@B����g@C�.2�5@Ee�}�@FYv��@G����@H��[Bp@JN�W�|�@K�#2m�@My�t@N��[�4g@P���}@P���(Yx@Q�j7�j@R_:�$�@S/N�,�<@T�zlO@T�)|��@U��ofK@V���GU@W~�M�"*@Xg�j��%@YU:�^��@ZF�Ęo�@[;��gd�@\5e�2��@]2��'y@^4Q���D@_9�cǏk@`!�$ ��        ?�)�^�?̳7-�?��k����?��%Ĵ,?�ѻ��B@]>��(�@c[b �@�l��B�@�p�ʯr@#v���5@(
��Jg*@-��zk@1VMq�i�@4]4gJ�@7��d���@;'aN�V_@>�b��@AvF��!F@C���hD�@E֏s�G@H5���m&@J��w���@MS�R���@P�Mgyt@Qw�-��@R��&�JR@T�[�Ai�@V#�R��@W�z�`e@Y��y�IT@[]��2��@]:�Z	��@_'�i,@�@`��h�Y�@a�ҫ�{f@b�f��+�@c��S_�@dן����@e�?D��@g(���@h\�q�UI@i���S@j�a[��Q@l&@�|�@mx�);��@n��O�]@p(*v��@pί�%�@q���d>@rB��	(@s�Sg�E@s�����@t���\��@uW�-nd@v%�?H�H@v��|���@w��z��@@x��e8�@y�~U��"@zb��L�@{F$��B@|->6C^S@}׫��Y        ?v .�=g?�)��7.{?�UEFМE? ��	P?�N"`�[?���q���?�����?� RG�4?�z���?�xc�?�]�]�V0?��.Kؕ�@^GrA�@��Q�<�@	=�F@��t$cx@j��z��@��:�q�@ʩ��e@*D\64@�Y\>i�@G��pX@�;j�@ �W��@"nN���@#��8�@%�x���@'A3x)��@(��,.\�@*�B�Un@,�f*+P�@.�$��w�@0:0��@1;~�J@2C�Ƈ)�@3Sb�%
'@4iҜ �p@5�%qY�@6�E����@7�"G@9�D�^@:?�i2	I@;~1~nu�@<�*����@>�İVx@?`.���@@\�a��@A$��%�@A�P>��@Br� ;@C*��w@C�Q�G�@D�Z�r�N@Ee�9��@F)�9~��@F�1��@G���C�I@H�Z�v�{@IV�$v%�@J).��x�@J�9�@K���@L�j��!        ?tK'�F?�x�u��f?��9hV
�?���E5(?��j�p�w?�(8�v��?�?ѳI)?�a���?�Jj��rF?�2.��%[@ ����@�T�9�@C1Vܛ@�7�'@<�"4�@*Y��Ԅ@Y/�M��@ɢ�Ǌ.@| �Ep�@!8��j�0@#TC�*K�@%�q5��@'��Z�@@*pE���@-�����@/�1��c�@1\����@2���+@4s�X���@6"y�  @7��)"J@9��|��M@;h�x�@=N�g�9J@?E�7���@@�?+��\@A�����!@Bŉɩ7@C�Kn��@E��J@F0���;@Gd��e4�@H��״k@I�Mg@K0��@L��6b�@M�?�J+�@OB�
8�@PW���M@Q�I8@Q�?���@R��РP_@SU!���S@To�
�@T�}:��@U�����K@V�����v@Wj~�p�@XG-\޿�@Y'�x��@Z+b0�@Z�@x|�@[�=��
        ?v�3sq?��#~b�v?�v�Y`<<?�s4�/?�8>�v2?�)yjQ�?�%9z�?�i"m}?�x�v?��Ȩ�l@ �Bsw�~@��=�H@	y4��@�@��@�%>�@*��6@T)���7@�yBW4�@��o8@!���,_ @$�E�YE@&S��r @(�\�>p�@+Q\Wb��@.���cv@0l#P[��@1�_Ɲ�@3tr��;�@5{shh@6���>�@8�V�=@:T%��@<71D��@>+pI0�[@@lc�P�@A#��ͅ@B7xo���@CS��;Mk@Dx{{I@E��Q1T@F�"$4�C@H�Rv�@I_���@J�G#6k�@L�/6�@Mb`�ME@NȆQ��v@Pn�G�@Pֆ�E�@Q�����
@RXV	�ڌ@S�Y��x@S�e�d�@T����U�@U�g��.'@V^�f�)D@W8Q�@X͐�@X�J1�|@Y��t�{�@Z�.��x@[��K�.@\�Y��        ?�ҫH�LU?�C�����?أ1�rQ�?��ƛ?��:p���@ ���"A@!N�P[�@|i��yH@�g<�<@~���g@!	C�D@$���vY�@(�r�$n�@-) Q�'@0�-"҆@3^0T��@6�܌],@8�
�7�@;���[�@?b��@A=G����@B����b4@Dׯ��1@F�>RH�j@HŃ� �A@J�Y��fF@M�F���@OD� �@P�b`�F�@Q���!�U@S;����@T����@U�.쮴@W.�!�R@X��
(�"@Z ����9@[w�Zt�]@\��m�F�@^�O�Ҭ7@`
��K�@`؏��N@a����s@b�ǉt�@@c\��ԧ�@d<u���
@e Ay7��@fP���-@f��a�<@g�:"�c@h���@iғ����@j�}QOJ�@k�yPK\�@l�~�]g�@mބ���@n����S@o�iw�� @p��&�#�@q�}�0v@q�#�k-�@r3=|��@r�4T�@sYhm%�        ?�:�UE?�!�� ?���eDg?��B��"?���=%??��Wg�?�B��3��?���K���?���wہ@ GJ��� @�2��@Eգ@ݭ�@�"S�J;@�6�_�@�粅�E@�(�Fv@��XM@ 0��Q�O@"p�5��@#�@@ux�@%��׳�@(!l�O8{@*[�pU�@,�n�M�@/�G	�@0��w���@2�`���@3w]��@4�H�k�n@6O�ui |@7�	RԚ@9Xysq%@:����@<�X��C@>?���@?��$�6�@@���`k�@A�ڎ]^$@B����#@C�c9�	@D�?�~�@@E�,��d@F�ĸ��G@G� j�k@H��Qf�@I�Bק�e@J�<�Y��@L��
0@MB��vY	@No@�U��@O�6s�@2@PlO�s@Q
��VO�@Q��K(�4@RO�
J�)@R�,���@S�\D�m�@TK7*u�@T�����@U���N��@V^�����@W}� n        ?�r�N+?� �&���?�-�D��?ι�D�0?ڴ���?��_"t�/?���h�?�od��?��QU`�@ս�)0@�U��@ڍ���@�
"���@�mat@~�d��@H�G��@`�'�1�@!�R��@@$=^m�h�@&�s�XxV@)f�t@,5�F��@/+���Ԏ@1$.�[��@2���-�@4z�lw�@6C4���@8���'@:!��	{@<�Gh�@>#.i���@@%K�[O�@ABl����@Bh�L�@C���u�	@D���S@F����@G`q���@H����b@J��pu2@K{��0a|@L��a�5@Nf�)g$�@O�"���@P�`�k�[@Q�J���a@RU�y��z@S)��k�@T�R�L@T����G�@U���X@V��v�#c@W��*�K@X�0��#@Yv'�@Znb?A
�@[k+��p#@\lc־X�@]r̂F�@^|�&�@_�pFS}@`N�q�Mn@`��R�        ?����$J�?�E����?�)1���?�	�f��?�V/�L�?���k&�{?�V'��?�>����?�aP�8�@Z�5T��@!�WoͰ@��rT2+@I0^@��[^�@Kp��U�@J��P�f@ O7V
�K@"��I� @%#��Ѡ@'�<��@*�A��3�@-���<1@@0iE��sz@2w:>�@3�j��rh@5�A�L@7���b@9����ַ@;�q(�/@=�Ӟ�d-@@c)cV�@AB�Xͮ@By��	0�@C���|�@E��i}�@F`�F�f@G�>ˡ\@I.���y�@J�9h���@L(ƣ�@M�GH`��@OJ�hK��@Pv8XB�@QK�.��@R&����@S����@S��!O7@T��0��@U�����@V��-@W���H�@X����9�@Y����@Z�l��K@[�ն1��@\������@]����@_W}��@`��n�@`��5W8�@a9��a��@a�Tݓ�@bh�$��!        ?������?���n3?�H�=F��?�!�}D@B9S���@;���@~�)�H@=��z
�@$S�!]�@)�2����@/�{g<��@3}=Z1�@6��[J��@:�P��F@>�&�ב@A�����@D&��E�0@F��|V@Iw�� H@LZe�#�r@Od%�j@QJG����@R�Ʊ��@T�v͍�^@V�A>3��@Xk�^��@Zb�F!�@\mZ�~��@^���9 @`]XV|��@a~��6b�@b�<jE>E@c�#{K@e0�%�@f`:����@g��G��@i��"��@ji!U���@k�^"�?@mFv�F��@n�Y�\��@p#z��H�@p���P@q�M�s�@r�0v@��@sW�΋
@t/&�"�@u
�^v�@u���_@vΫ魪g@w��%�@x���7$M@y���u}B@z����I>@{~�?bW@|z�Hx+@}zO̖��@~}�kb@�`���B@�HP�Q�m@��Դd]�@�Y8��׺@��yb6v        ?}?��i�?��?�
�'?���	R�p?��l�Rǽ?�_9�AX-?�H��E�?�^KHCI�?�^^���?�����?�X�Q�?��+�L�@�~Y.�@S�P@
4*_23�@b�Sfoh@o�*�;@�[�
��@]ЊQ&6@Ox4��@�Gh\�@�ő��@!���@"��Ƭ4K@$Z~>�Yd@&"��<,@'��L���@)��C��@+�m��p@-�<H*�@0#��	z@1+<F���@2OZΧ{�@3|p+��_@4�lL|7�@5�>�l��@78֒��2@8�$��B{@9��wy@;C���@<�ˀ���@> n�X��@?���6@@�����@AU|�iL@B��p@B��<gf@C�1&j�)@D���K@Eq�)�{@FOo�}��@G1ʑ�9�@H��@I-u��{@I�"R�C�@J�⫉��@K�fK/�@LХ���Q@M͘�2@N�9=x�@O�~ƱvN@Pm0��h_@P��c�,@QzqQ��        ?y�r��s�?� �k\?�E���W?�/D{�i�?Ԁ�B�W?�P5cH�f?�� VW�?���`���?���r->?�r����@�m?��@1m褛@Q�G��@�`�Ş@΢��y@��\�@����/@��R��@!a*샚�@#�����@%����l7@(}�j@+&͍�;�@-�"��j�@0tj��v@2 ����@3�O#Φ�@5Rg�0��@7I�_�M@8��QJ�+@:�c�I�o@<֑����@>�s�=��@@��,�@A�Yh�@B����D�@C����@E&j�� @Fe�>/�G@G��n��@I �B
�@J[x(2�@K�|�1@M,��H�@N��d�)�@P�&�l@PԸ.��@Q����	@Ri��'.�@S;K��R@T��''P@T�xƮm�@Uȫ>�f�@V�)A&�@W���l3@X|�;9d�@Yl*�'�?@Z_�/@�@[W4��:�@\R�'�^*@]R�M9�@^V�|�1@_^�\r�u        ?}87S5��?�60!3?��V @0?ɱK�m��?֊⻡Mv?��
�7��?�+"~W>+?�7��Z��?�Wp�8?�|��J��@�M���@x)��Tf@���Aޖ@���6C@н�>�@;L]���@���@髫�r�@"=��g@$^vaL��@&ʥw1i@)[�ʿ��@,L�q22@.��ĳ(�@0�Vr�PV@2�Y��"@4/���t�@5�L��K�@7�D�V��@9�� b�@;�5�7�^@=�'Ni��@?������@@��9I��@A�B�,�Q@C$؟�]�@DT���ΐ@E��2$I@F��!824@H-��p�@Io�oC�@J�+ե
�@L3��Ӌ_@M�d��ݸ@O�2�@PN�Cn^@Q��^@Q������@R��A0a�@S~�Ɠޠ@TU���wt@U1>���0@V<y��@V�����@WގU�1@X���Cr�@Y��E�=;@Z��*O�/@[�|~��@\�����Z@]���a�@^��+H@_�5�;
;        ?�ǖO��?ʫ���?�#P?�k�m�p?�(�ۀ�@'z7<��@�0�B�@zi��*x@Xz��5r@"���a#7@&�p��F@+��$ȣJ@0�b��/@3i��q@6�x��@�@9�0d��n@=`�@�I@@��c���@B�Z�Ì@D�����@F��W@I4&�Z��@K�+���@N+V��@@Ph;�@Q���Km�@S5{Z�:�@T���Z�_@V9H���@W�$CD%�@Yr��P��@[#:!;�b@\���s4@^���K�@`B t���@a4i���@b-7����@c,^���@d1�Xy�{@e=��9��@fO�tSW@gg���D�@h��|�B@i��o"/3@j�!��(@l�[���@m<d�9*@nx��]w�@o�v��L@p��\N�D@q(�}�\�@q��#:�(@r�3�J~@s/Jێ��@s���Z�@t���!?@uN�G��~@v	��@v��M� @w�@#��h@xJ A�"�@y�~�S@y��� V        ?v*�z_�_?���<�g?�;�# 6�?&�T�?��&:�b?�ԍ�H*1?��&7�?�{�-h9�?���e3?�n�\��?�T�4 ?��դ~e.@Y�'@�-��t@	�A�@���{e@kg�m�@�w��@��yi-@0����@��T�r�@T5v��@�G�3@ �^rt�@"y�����@$�[F@%����og@'R����@)]���b@*�a��]�@,����R@.��<��@0F?��w@1HC��@2P���)�@3`���x�@4w6���Q@5��n}Y@6�uM@�;@7��g��@9��m7@:KT+3�@;���n@<�	���@>^!o|@?gͿ�@@@_.�z�+@A��'Ŕ@A�ڭBWF@Bs6=uB1@C*�);m�@C��:W�@D�:b/y�@Eb�o��u@F%��{"A@F��!��@G�QG}�@H��,b�@IO�S���@J!�f#e@J�&�-X@K�u0��@L����3        ?s����5?�&D��L'?�����{�?±����?�ĵN��?��|�.�??�$�L	�I?�jX�!c�?�2kd?�(�k.=?���ͥ5@�b��@7�t�@�sΓr�@�10��@�pk��@.8Qv�@�t�ڊN@@-d�@!�o7@#,��@{�@%d����@'�vU�;�@*9�s��*@,�l�Y~]@/�ꢊT�@1:���'@2�����@4Mf����@5����@7��iE�p@9g���?@;<���W@="�@�K�@?��ѿ@@�����@A��	.~�@B�w��=�@C�k��)�@D�o�±@Fp�~;@GO`=��@H�+`�E:@I��2@K	\	2@Lm�颁@MǎU��@O)��ɴ�@PI�ew@Q��@Q�"R��e@R}㞋�@SA@�(�@T1�[+�@TҰ���@U��S�!s@Vr;x��	@WG9x�`�@X�u�34@X���?d�@Y�Ò��	@Z�_��rl@[�Q6[        ?t3��Y*?���Nh��?�*�P���?�+宪B�?�#����?ہ��4PJ?�vg��r?��S�Gy?�g��s�?�I����@ g�$@���A9@/�|̹�@��J��@xT���@�M����@:�U��@i`��#a@����M	@ �x��@"��e��@%�IS��@'Y4^}��@)��Nf@,<X��4<@.����D�@0˲���G@28��[��@3��,J@5>���ּ@6���>ƛ@8#���@:5c70+�@;������@=�yh @?�����@@ͪv^�h@A�	@-N{@B�c�d5
@Cݰ��@D���� @F
�㿗.@G+�<�&�@HS|3Y�b@I��i�g�@J����9@K�8=	�@M4��Aw�@N}~�p��@O̟�T�@P����@Q>��(	�@Q��VG@R������@S[Tk�@T<���@T�V����@U�eI���@VU_���\@W>���@W��� U/@X���ns@Y}�"Ie        ?�ķ���V?��>�$Y?���Zץ?�."o��?��Y��@ 9���(@j@S�B>@�׿�E@U��/@���_��@ �q�{�@$#��J�I@(
�S�;@,H�5� �@0n���@�@2�΃f�@5�ot��@8P�*Bu@;F�(��E@>g�m��@@؅�5�@B�M��ON@D`�,c�D@FCp��8@H:j_X@JEi4�υ@Ld?@��(@N���$e�@Pncޚ�6@Q�z�@R�bV�̌@T6��Y�@UZ}�8@V��N�0@X�P�W@Ym� -�@Z��#F�@\R�����@]�rkmg@_Z0�=q@`ub�e�-@aA�P��	@b�ylvG@b�P��@c�*�ߕ�@d����X@e}���w@fb�[ g@gK�v�@h8j��f�@i)���@j����4@k���@lg@N�i@m�ޯ�8@n��x�h@oaG+@p�l �@p��m|�@q&/�Z�O@q��|k8@r>����0@rͬ�v�        ?�;ֲ}�?�9�0�?���nt�?ɀ��CE�?հq���?ࢦ��O.?�ë1��?�E�?��k�	?��U���@ l�K�B@��N�[@��J��@���.��@�ˢ��@��'�`@�S>@������@�\�8Z�@�#-ڐ�@ q����@"جA@#��6@%�U,�v@'�s�o��@)�����\@+�P˝C@-���_#�@0�ACa'@14u��8%@2f�D�J@3��vE�@4��B�~�@65�}M%�@7�W�[��@8�)׼�@:\mlld�@;���%��@=P�����@>��7��@@5ClN�m@A���7@A��a�"�@B��b���@C��;®@Dg7�]�@EK���[d@F4����g@G"�Z��@H�Xl$O@I�O �@J-J��y@K+ŗ�@L{A�R�@M]��LB@N!�`zq�@O3|���@P$�{��@P���F@QA�/F�@Q�6�d9F@Rf��AS@R��^���        ?|<S_O?��~l瀝?����N?�d��Ԭ\?�O�f5?�Ә���?��҅�7?��Q�?�6����?�^�d\�@��f]�@q�����@�+f2��@�LYE\!@��fW�@W�y\�:@��t@ �T�P@"=��X�@$�l5!8�@'�ziT�@)�S��@,f��;S�@/P
���@1/�D&@2�}����@4x$Y�Z�@68�k|Li@8B���@9�3"s�9@;��Ց,@=��4��C@@
ZӤ?v@A"���4�@BD'R��@Cn�H��@D��S�G@E�P	��@G%�
X@Hs�����@I�Mܚ}�@K+�n��@L��y�r@N�0:�[@O���p�@P����Z]@QG�#��U@R��0	�@Rߺ�� @S��ә>�@T�.n�n�@Ubv�NR@V@���hv@W"�O.�@X	����@X��<���@Y�f�l @Z�5�*|@[�s~ĉ@\�`�s��@]��|�H@^����!@_��c��G        ?|.*�CO?�}�|��?���t���?ȸ3��?ո��P�?�0�'�*8?�KM��>?��Ɋn?���"�k?��E��[@M(�@װ�7�@�ߩ��L@Gb^�@_���Ҳ@���Y�r@h{�Q�@Zh�R��@!���@$ʃ	��@&u��f�@)3Cn@�@+��c1@.���R@0Ƅ�a �@2X�d���@3�����@5��1�@7��>Z�5@9_#�k�@;P\.��)@=T� $r�@?k��qc@@�!��Z�@A�ϓB$@C�9Zf�@DC�<�@E~�㹙�@F�|���@H�]��P@Ii'�T��@J�&g�ۚ@L4��%��@M�\6���@O%��rc @PV	��-�@Q��o�@Q��g�e@R��dKO�@S�՟N��@Tlv�A�@UK�̻� @V/�Rm �@WwD.0�@X����v@X��ȋq1@Y��6�4�@Z�_��ï@[��VF@\���o@]�yǴ�@_ \x��@`�ŀ�        ?��%0��?�{k�p?�0�aސ�?�&F�	g?��3�(
?@��Vj��@�h"p��@��[1-@�3c�ļ@"޵�X��@'L�TL�4@,4��a�/@0ʀ��@3�E��]@6ߛޒ�@:D�>�"@=��	�\@@ߦ�Bz&@B��ou2�@Eo�� �@GYM�Ό�@I�O�@L<Q@>�@N�1?0�g@P�fS���@R4�pk@S����@U5Hg���@V��[��$@XnJ�	�@Z��%8/@[���|@]��S7��@_�?'v12@`�(I!��@a���e@b�d\�YV@c���&m@d�F�e'�@eߢA�$@f��g��@h�!�@iG���@jv��XE@k��VE�@l��\g�@n+�Uo�@ouJ=%`)@pb���P2@q���%�@q����@rmF�F@s!� q�@sٗ��l@t�u��!@uRq���@v���t�@v״��N@w���}h@xi;�@0�@y6���vG@z㧆��@z�9@j�        ?R�hl>~?�y��π�?���y�?���T�?�6��p�?�w��z�?�k�	�H�?�3s��%?��� �?�p�e�G�@ ��:�@�ձ��@wvFi@���y�5@�os��@%����A@�~�,��@��nȖ@����@�Q���@!f�;4~@"���|��@$����@&vEÞ\M@(p�8�ȁ@*V�p+�@,�~��9�@.��$2�@0����\@1¤���@2����@4@\�@5�$�WC�@6��a"�@8GZ��p�@9��)Z@�@;'�I��1@<��Nͭ4@>/1?�'�@?�M�h�@@�y�p�@A�xJ��@BXK��3:@C4;$��@DТ�jL@D��PT@E��܏��@F�C�5(�@G�D��\@H��tb��@I��Kt�@J��焎�@K��@BE
@LȀ��@Mֶ��3�@N�ni���@P S0�X@P�.]���@QG�9V@Q��Ү~�@RE,���@R��F3��@St�"��        ?{�����?������
?�77��?�"	F�<�?�'/����?�C����?���@}E?�cĦk:?�86T6��?�f���\@�����@�'�^mT@�����@�� 4�X@�K<�1@i��{�@,�	�#%@ 7�l��@"I��>�@$�$GK΄@'���};@)�	�J@@,wÛ���@/b�Cȧ�@1:7�?@2��;U'@4��3$@6GIsL�@8���U@:>��$�@< ��W@>{;�p+@@�񮶝@A2���@BVi�z�@C�m����@D��
�l@E�u}j�@GBi��@H��½��@I��f#@KT��X1�@L²�M�@N9�C<C�@O�"֡�5@P�Ϥc�@Qk '&<K@R8��%@Sf��w�@S�S�+7�@T�����t@U��2���@V�n@Wj��m��@XXa>�~@YI���@Z?��8�@[:���p@\8�����@];��O1f@^C�9��@_N�s�Y�@`/0��²        ?u�I��<?����I�?�d�s \?�k��|��?�:�� }?�<�;�?����X~?��[A�	?���Yl�?���G$B#@b�k@.���5
@	��f�`�@�i��n@J��K;C@apD��@�yCN��@Z-�_�@ �a���@"3$���@$j/D���@&�?�U@)@�0@|@+���7F�@.��t6y@0����r@2I�9�@3�(��S@5�4�/��@7A�8�@9f\G*@:ꕿ�<N@<ل�ɢ�@>�7��oJ@@vX�mWp@A�{�p"@B��a^"�@C�w?���@D�Q��Pd@F*ۑ$�@Gh�89#�@H�S�@J �ٯ@KZ)�_v@L�j���@N'��۷b@O���o�@P�6v�X�@QO�)@R\��rG@R�vMB�@S�/��f�@T��>:�@U_��޽>@V<��u@W�.F�?@XȪ&��@X�D�<@Y�!�]I�@Z�]
��@[��r`�@\��6�@]�4�_�H        ?��KpK�?ɫB�:%�?�(�R++?�:BWz�?�g4�=��@�)��@2p�)@�"��@�����@"=�c�/@&���r,h@+U���v@0I��]@3"�P��@66^���M@9��?���@=
d�Q��@@eS�oy@BaK����@Dy���e@F��K��@H�P1�@Ki�Q��U@M���@PI����+@Q�FhB��@Su�]�@T��Gn�@V��<��@W��Q�@YJj�|@@Z��[���@\�~���@^}Z�@`)X�I20@a�l���@b>IVN@cFfVo@d��T%@eH�ߨ@f0*���@gG;�iOG@hdp�&U�@i���̰�@j�ڜ��@k�h�f:@m��dy@nP�V�8�@o�%ixCE@pl��g�@qZ��@q�s��X@rh���=@s��?�@s�
��Ϫ@t	*@M�@u6�(R?�@u��]�]@v�\2�`_@wo�:��@x3N�ܛ�@x����a@y®��>Z        ?���D?�{?������?��{�{8?ͯ.cb�?�-;\�w?�E��@q?�~Y�J�?��+��?�Hli[Q?��aȷ��@���@�hx@K)�P��@�":�@��Y�t@S���,�@CH��]o@b�0�E@�K�
*�@!�@ɖ�@"��V���@$��W���@&��@�_@)�Y���@+9�Ϩ�2@-�&ՙY�@/��Ai`:@14�,f)@2}˾��]@3�!	3��@54Cd��@6�lL��@8H���@9��[wg@;*!~
��@<��+�:�@>h�I��@@���@@��_t�@A����w@B�V�f�@C��<��@D� �@E�x��?�@F��̛)@G��Z�FP@H��z��@I�+O��@J�y�1UA@K��PO��@L�<'t�f@N�]���@O1�pB��@P.|�8X�@P�v߼^�@Q`��}�&@Q����$�@R���qs[@S>��'@S᰽��]@T��U>�@U/�?�^�@U� E���        ?�5���c?�n3�u��?�I_'��?�0z�߬E?�v�ȭ��?���*r�?�om:�n?�ZӍ �?���)c @wwA׼�@Ij�q@������@m#	��@ϝ :�@��_1^n@���Z@ ~���y�@"�u4��L@%jg'U�@("��,[@+:;�~@.Z6��
@0�����@2b����d@4/,�g@6%d�F�@8����@:@9�W@<A�	�\b@>~��tr5@@h�͇��@A�rW�r@B�5˭A@D(\�DS@E}���@F��Z��b@HJ�2�v�@I�^��@KC�u�E@L�~�#@Nfǻ�; @Ph�=�@P�ǳ��@Q�y|Z�@R�u�B�A@S}���}�@Ti)�5@UY͊��@VO�Ë\�@WJucB��@XJe8G(�@YOZ�ӎ@ZYI�M�E@[h*��7@\{�֮�@]�����@^�#)��@_�D��Y@`}����@at���@a����q@bF401�@b��f�$y        ?~"���?���Z".�?�\ �}N
?�%���?8?���5�?��c�?��+�?�|��P�?��kܖԪ?��/<��@�� ��@˔L%G@~v[)@�<�Y@S`5��@�+]�|�@G����@ '��k.@"N�Ls�2@$�!p%t@'$<D�@)��	C�U@,[��U%@/:��)AW@1��x#@2�w)� 0@4Xc�L�@6���k�@7�(j$�@9�
��l�@;���9�@=�����z@?��߮z�@@�'���@A��[-,�@C!�L`#@DJ�.b�@E|f���@F��0�?�@G����'@IC4�#!:@J��Q��p@K�.����@MR��3�@N���\�5@P�M�@Pԑ �#k@Q�l���a@RZ ����@S"��#��@S����6+@T��M�l@U���DR�@Vj�^��@WF\�G�@X%%??��@Y���$4@Y���0@Z��N@��@[Ƶc��@\�Y��@]��T8�r@^���n:        ?��S�Y�?�F�=�Y?�����<?��f�l@R�u���@�`� ��@ �z��o@�B(O�@"����F�@'��RLl@-.��>
�@1��G���@5�˾��@8�t�&q=@<�M	��K@@s����@B�/6��@E"��鳆@G��Y�G@Jf"Zq�@M?0�x@Pt�%�@Q�����H@SR�~�@U]M$�]@V�܈�m�@X�P}$@Z���I�|@\�� � @^�h�)@``U���@ay*�Cr�@b��C<@cĲ�O�@d�@$fq@f28q���@gu�"�b@h�J�ar@jʗ�
;@kp��=�	@l�h��H'@n@,V��@o������@p����n@qYC���@r��dL@r��5L��@s��:@t�Ņb�z@uZ54���@v2F��(�@w�H*f@w� ]��<@x��d��@y���<@z�|o;�p@{�_���@||�G�h@}o��̰�@~f����@`O�a@�.�9͹@��l-�R�        ?w�[�T>-?��Eo��?�h����?�S�$�[�?�w�G�v�?����>?�o:�H-�?ꂶm�S?�^r�Ki[?����?�O"�N@ �1~���@�NöUZ@7T��K@
���(P@���;�@�Q m�s@�jqZ@P$%W��@�.�H�@�z~.-@Vuq�} @ �(	�bw@"+���N]@#��ws��@%ng!o�@'(i�k�@(�ʯ���@*�}��:@,�z4D�@.���\@�@0_��&}d@1mx;Xi@2�n��@3�{��bp@4ǚ*�L@5�İ�-@7+�"H��@8j%	��;@9�M~t�@:�f�B�@<Tf��ai@=�DƠ/@?�ꊱ@@B��C��@@�Kp!�<@A��?�DI@B}�x=�@CDD��@D�@�@D�wSx�@E�Ǘ�߰@F��屻_@GZ�`���@H6��'�@I�R�F;@I��'��@J�鈘u�@K���AѬ@L�YjO�@@M�t���@N�!F��@O�]m��        ?w+�Z%��?�R��jgC?�m�c�G?�r�H}�?��X ?ޘ�#X~�?�3^Z?���
��&?������?�ݏ�@�l����@Ź �@
�U���-@#>��Z�@�K�I*@P���f@�baE�@�8p�7�@ �q����@#w/�!@%Xjz�@'Ё3��@*m��}m'@-0���@0��)b�@1�ԙE��@3-녺W�@4����r@6�X�P�@8n3ũ{�@:T^a�@<M���ؗ@>Y�Y���@@<�e��M@AU���X�@Bx��g@C�Z �L@D�u�+z@F2��*@G`E���Q@H��sx��@JH��@Kp#F��@L�+!�y�@NST��M@OҐ�O��@P�i�>S�@Qv]_�r@RCv�)�@S�e.��@Sꆱ��@T��i��@U�{��@V�zPrSZ@Wm����@XYd�Hɢ@YIE����@Z=g9�@[5�8��@\2W�-^@]3��|�@^8��1@_A)i��9        ?sƯ��ø?��Ӿ�?��,�?�'�'S�?�)D�L�?ۛ,��?�$��?�	l�Ԓ�?��^q<U?��w�1C�@ K���/@B����@�,�h!�@�m���k@�{�� �@��;X�@Վ���8@\`<[�@'�c��@!�P���@#ǅB
&�@&��3<z@(�,�i�@+�&���@-����@0W�O.Q�@1ׂ$j��@3h�!�5]@5/X>:@6�@��_�@8�#`��@:`��QZ@<KL���k@>G����@@*���3�@A:�I�Ud@BS�L��@Ctq��^@D�VL�@E�9'H0,@G�4;r�@HP}S�!@I���F@J�ѽ�v!@LO��!�@M��B��;@O"��6@PLh�!�V@Q�Pκ�@Q���v�@R������@Sa3%z�@T0a��7"@U��hw�@Uڊ��b�@V�y@ΐ@W�G8��*@Xv�2�w@Y]l<6@ZG���Z�@[5�
f��@\'�e[s@]K쫊�        ?�Kag�?�f�N�U�?�7�15$z?�O�G�?�欍]r�@��P̻�@	�vc�`Q@u���E�@�+ҊF@:E�H?@"Xh�c�@%��%�j@*'���@.ø{�f5@1�w$�W@4���4@7g\�	Y@:q1U@=�����@@�C����@BP�+56@D1/���@@F(�EV�@H5~��/@JY]���^@L��W��@N�J�M�`@P���Ro9@Q�H�ǭ@S.���R@T�7�@U�/L�@WN\��D�@X����J@ZFN\
�L@[��Dim�@]jĂ�|�@_��
	�@`]�n�|@a:D���@b?��@c�$U@c��Q?o@d��7�q@eڴ���#@f��[��e@g�K��_@h�^�*�@i�'�ω@kz�\�@l ���@m5��F�n@nW���@o~����@pUe��%@p� �1��@q�$�0��@r&ϔ�lK@r��<:��@si�U�@t�] �V@t���D��@u`��8�#        ?���uZ_?�1�oie�?���� �?�aNP�h?�Y��?�I�- ?�\8r�?�}�?�z�o���?�#�g៵@ ��k,�O@;
�'�@{6V�@5�/!�@W��޳@�QG�'�@M���@�N��@����@�3_���@ �D�s��@";Ḿ�@#��Q�@%Σ��G�@'�ȑ��@)�{�.=�@+���k�i@-�G684�@0
��:<@1.����F@2\t�C��@3��X�T�@4Ԇ���@6�m�@7ror�<@8�p����@:5�^���@;�M!|J�@=�Q��@>��ܼk@@��@@ߤB
:�@A�C-���@B�dn3�q@CYkZ��@D5BdI<@E�\9�@E��J��@F���eٿ@G�} n�@H�p+*Ջ@I����[@J��lx�@K��n�n�@L�� 횷@M��],��@N��Z�@O���@Pu1+�$�@Q �\�x-@Q���t.{@R|��@R�Pw9@        ?v�.��O,?�A��0�?�SpW�O|?�B��l�?��S��,?�&/�q�Q?�Y�� ?�_�a<�V?���w\`?���u@nֹ�@���@
Sj�?��@�!gZ��@���|:@�IAG��@;��t��@.ӵ@ tG6unp@"��d�&p@$�|ңo�@'B�1"~@)�Η���@,�yD�@/T��;Y@1'��rc@2���6�@4V���U�@6	�*L�f@7�a�8�<@9�%��4�@;�Γ6�%@=�Q���Y@?��G�@@�^=N��@A�H�%��@C��P�@D;�窒�@En��*�@F�M-�@G�Rt��~@I:��7b@J���`#�@K��c�h@MU $�Xs@N��ۃs?@P�Q̺�@P�g0`[@Q�d��@Rm�|�BX@S;^�g�}@TVОu�@T㝫a+�@U�0�z�5@V��h�@W�2�x@Xg�dO<�@YSG!6��@ZC2���s@[7[��g�@\/����d@],\���*@^-0U )�        ?|x��v?�`��aԤ?��g/��?�t2un�?���&K0?���g: ?��T��?�`B�?�u�5�?�l���`@7�t���@�#�=�@Ս(� p@;a�.��@S6$GW`@��p��@[4@Kz~@Lmz
m@!Ã�{�@$�H,iV@&l��ۨ)@(�9Q?@+�l��@.�5���@0�u��@2Or��@3�8�uN@5��p��@7pc]�?|@9KJ���@;8�Y��f@=8}��^�@?J���%�@@���.f�@A��ZAL@B�9)eGW@D$���	a@EZ��W�@F�,lYk7@G�L�W2�@I3D5�a@J��s+�@K�v%=P@MZ�D�8@N���/ڮ@P%��Y��@P�Z��\@Q�F<*db@Rzui��Y@SI�q�#@T�r�EF@T�R��i\@U�GZf0�@V�X5���@W�|�K=(@X}�`8�~@Yi�]�
j@ZZ\�@[N2���@\FF����@]BD��'F@^B'z`�T@_E���4        ?�6Nw�?�si��?�iI7?�S��u=E?�c����@}���S@	�Q�Hx@�'rpl@O?���@!��oh�@&��U@*��;��@/�MG�þ@2�,nҘ@5�g�͠@8��n&�@<;wG@?���J�@A�i�\�@C�0
 �@E�+�\d@H9G�	X@JY6�\�@L����@OB�;U(@P��<�X{@RI	��>@S��U�<�@U#n#K�@V�p�B��@X/�L�Ł@Yȶ��T@[m�T�J�@]��`\@^�l�rk@`R��t��@a=z)A�@b-��+T@c$Ts�W@d �m�b@e"te��@f*'[c�@g7�-r�@hJ�S���@ic]��@j���Tk@k����@l��D��e@m��S�'@o2&-�5@p5Ͽ�	@p�D��&M@qwZ��@rr�+@r�T �lb@sm,�n��@t�6M`�@tȁt�P@uy��:��@v-�U�� @v�o$��W@w�kr>%=@xX�d(��        ?��~��?����.N�?��=���?���ڮ?��>"vǫ?��Ӻ�O?�1�7!}?�s��H��?�b'��?�y��W��@��=��@���[�K@!  j��@ښ��U�@zm��_�@7���fV@%J�ia-@B��/�@�Q��9@!�����@"�o��4�@$��|�<�@&��J�M@(����@@+%���@-s��v@/��[�@1*ETڙI@2tH�CI�@3�U=�@5+�YS�@6���؄�@8�%�@9�d�U�-@;&�Պ�H@<�ܳ��@>j��4@@���@@�=�!@A���n�@B�f�Q�@C���S0N@D�wG��@E�6�Š�@F��	�?�@G�
5�
�@H�5 -@I���ɯ@J�>]!P�@L	WO�}@M.���}@NXt�A`�@O�pk1��@P_(#�@P��'��@Q��J@R@�C��@R��.I]g@S������@T9Ԯ�*@T�Ϭ4�@U�r�ft�@VK�	���        ?z���K�?�Kю���?�黶a�3?��ԯ�1�?��M��?�W�q��?�68.^�?��v~H-�?��Cҽ�?����h*�@~�B�cm@��6�"@3���׀@pt#}[�@��}��X@���|��@�<6BwY@���ʟ�@!��b��;@$66���@&����w�@)36-s�@+����@.ƀ���6@0�_'N�@2xg�t�@4aE�=@5�QD��@7�<��@9�%K�g	@;yoa�f@=~�S %D@?��c��@@����@Bm�W�@C*l3�ٱ@D\��qm@E���h�@F�g��E�@H-^����@I��~G�@J� B�x@LR�mu�@Mǲ�=�@OE�ꑅ+@Pf�$�Ny@Q/	'G�:@Q�?��@R�ˌW�=@S��X��@TB��@U^���u@VB���.@W+m8�T�@X��#�@Y
x��1�@Z ΅�39@Z��l�\�@[��%�@\�o
@^}�@_��@`v�z        ?}�Y]@��?��_Y�?�{9g��?�^�"���?�1����?�\�7Y�A?�V����?�֗�]��?�51,�6�@ SȰ׋�@���ƻ�@	r��c��@�?�NA|@p� �b@�LC��@W���* @?�ܿ@ �uŨ;@"����7;@%i����@'��a}�)@*�Ig��@-���~@0T��@1�b�Ҫ@3�V�"@5_؋=�x@76ڳTw|@9!���0�@;!�բ@=4
��� @?Z��4�@@ʖf���@A��RP@C"$#"�@D\\��VO@E���|�@F�U�t��@HC�,��@I���̩@KNH�q@LsF�@M��w]@O���u@P��#Eu@QQ�sH�}@R!_5؛O@R�b
�,�@Sͺc]R]@T�]��@@U�@�@@VpY30��@WY��v@XG �z!@Y8{_V2X@Z.}4TS@['��\[(@\%)�	�@]&�_SZ@^+�g�A�@_5L��L@`!>NY@`��t�O�        ?��	*l�?�k7~�A<?�C�Z�fo?�J� y!@D���א@
}�9]
@�x9d�8@�*�xdX@ ���Y�@%+I<�n@*"@j�ǋ@/�4�.Y.@2�F'�C�@6V��@9��`�_@=i x9S%@@��H��?@B�z+�ַ@E)8��3`@G����aB@J�S���@L���ʏ@O��X�,{@Q;��@R���o�@TV�dk'@U�����6@W��PId�@Yt�MSQ7@[IKjtr@]-�gޒ@_!�(+ @`��`���@a�ܭ9g�@b��Y/�;@c�;Ǘ�9@d�3>Q@f
�t9�@gD6Ӯ�4@h}8cO@i�
X�fo@k�-��@lW	�#@m�%�b�@o��!�~@p;2E�XE@p�:@q�!�@rm$ʵ�@s/�y���@s�jx�q�@t����;�@u����@v`	��A�@w54��]@x�X��;@x�`�Xl@y�V;��:@z�؞{^�@{�����@|f��A@}mb�+��@~^�4X��        ?������}?����?�+�!��:?��`S��?�D6�.�?��A$�WE?�FZ;�?���U���?���s��@]f@>�����@
�8Hns$@��%��@�H�i�I@�u%��}@�g|F�&@c2��@ ���@!��5��,@$�1h�@&)7�X6P@(m����,@*��T���@-J]	���@/���?׼@1K���h@2��6�~�@4*Q�@5��0��@7A,U���@8��Q$s@:�z��΂@<M^12��@>o�Gن@?��;�6@@�?�R�@A�\�2^R@B�?��0�@C�7�2;Z@EB�]�@F`<R�@G7�ޠr�@H\����@I��AT�@J�s@�@K���(]@M8M��5�@N��<.!�@O�`,�%)@P��=ª�@QB\H�{~@Q���@R��@t`�@Sd4v��0@T!>��Ny@T���k'�@U���GW@Vm��T�@W8�7O��@X,(��@X�5�B@E@Y���U@Z��!�K        ?{W���i?���vy"?���m�8�?�w?Y�?՚i�y�B?�)�O��+?�T�42�?񳊍tJ�?����:?��;6Is�@q!���@��ǧ@'��#h5@jn�DS�@���㔵@���N@���^�@�ī���@!��"�@$%���cw@&�x���@)ƭØO@+�1�k�3@.�rwx$@0����s@2HЌhG@3�gbs�@5���b�"@7Iko{fQ@9�!,�d@:��%�N@<��*�T@>�,?��@@r��7�@A�H�Љ�@B�W�J�R@C���8��@D�͛�jB@F ���@G3b��@HlٺcV�@I�M�@J��q��:@LB��ĺ@M���_@N�.�_��@P*��re�@P��$L�@Q�P�ǣ@RP���
@S�W�@S�W�i��@T�'d��@UY�/8��@V#�M�Ji@V���@W�v���@X���+<C@Yf�"d6�@Z>h����@[�Z��@[��A��@\�ƤbUS        ?�W|l�e?��%���?�~"��:�?Ӝ�]���?��E�*o�?�B�p�?���+?�A��;�@e>@X��5�T@�Ů��N@.��_�.@�Y���@����@�@��@ ��=��@#P�UJ@&�8X�@(��_	d@,۳r�@/Nu��b�@1d����!@3;J���j@5*�٢Sj@72؎�&�@9S����@;��Pm�T@=��hK��@@%���:@Ah��C�@B�Z#v�!@D�L��U@Ew��J"�@F�-%Zc@Hi�`�@I���"�$@K��.Ñ@M.�o�@N���g)�@PLI�f�)@Q/��}�@R��W�@S�Q�4@S�3{_�@T�����
@U��[oJ@V��z8hO@X磥�@Y!M���@Z/� �Z�@[K���!{@\mx�|V@]�}�rv�@^�� -E�@_�m�@`���z@a2貤�	@aә���@bv�9�@c�(�qP@c�琀�2@do��m%@e�5* @        ?�$�jv��?�����'.?�3$R�&�?��ԓ�K'@G����@���6_�@j�~��@ ��Fl�@&p����@+��4� P@1|�=�l@4�!'���@8��u���@<�;�xh@@�v8x��@C'�3 8�@E�̲6�@H��!�+�@K�c��`@N��wF�2@P���JXK@R�ĤWnk@T�_�n�@Vk���,@Xf�y���@Zv��nS(@\��}�o;@^�n(W�'@`����@aŮ��q@c�|���@dJ��#�@e�^`'@f����׷@hb�<q�M@i�<�u�@kR���4�@lښ��@nmP�
&`@pZh85s@p�b�$!@q���Ny�@r�tZ�@su|��\�@t^ڰM�@uM���7�@vA��J��@w:��H�@@x9�e��@y=�۬��@zGB�&*�@{V��<�@|jA?�9/@}�̣�<@~��	7�@��Vڽ�@�x:��M�@��}�׬@���f��@�FN�Q�@��*���@��\f4��@�+�i��j        ?���.D?�W�{6�q?��le?��d� �?�ˡ=�D�?�;�tq�?��"��?�SpT�?��\3u?�#�����@��p�q@ʉ� �@	���--@}dԉ@�4�*|@T�	9@&l(�T]@&�E��@VQҕe�@ Z7$�@" ��c0�@#�)���@%�����I@'���J4@*!a�[�@,ZLk��r@.�%M�[@0�=U)@1ƛ�n�S@3&,|��@4d״Wv�@5Ĭ����@7/�zS��@8��G� @:&򤼦)@;�RJ�@=Jݧ��@>횘��@@MƦZ@A*[M��@B��b�@B�M����@C��{�@D�~�a�?@E��q�?�@Fʳ`�=q@G��!�>@HְH<@I��$D~@J�A���_@L�wJE@M/9��A!@NR����@O{i�MR�@PT�K�e�@P�Q�Y��@Q��?&�@R)ZZeR@Rʿv��@Sn�0~�@T:�$1�@T�H���|@Uiۉs        ?zj����q?��P�?����ك?ǖv�D\�?���n��?����P�?�V`xr��?�����9?��w`?���,��@���@��v�@��+�B@��h���@��p��@zxM�@�N��~�@t2m�lM@!J���@#~>,9@%��Uq2�@(SК�:�@*�r�n�@-��ٿ�I@0SqLc�Q@1�m䀱f@3u�y{fI@5"���3@6�jx �@8��yU7�@:�H��{r@<���u��@>����7K@@[�)$�@As:�7
�@B�%�[�{@C�^���@D��j��:@F.�EO3O@Gt�u�n@H�6j3$@J���ڕ@K~ȫ��c@L���H�"@N^PoY��@O��l��@P�W��@QyQ�xhp@RE�>@S����@S�|v �@T���&@U����W@V�Q�!�@WqOd�@X]��IШ@YN�N�۩@ZD�J�n@[>��ڼ@\=�gW@]A���U@^I�sX�@_U�.�N        ?낮�Ï?�DB�?�v���?��=�PSc?�i���?�o�G���?��rf��?��9���?��T+�@ &/�X��@R��]c@	�!
��@J��@6@\Vm�@<³�f@�3���/@tw��@ >p���@"g_|��e@$��6�y@''?b �L@)�Au�8@,y����H@/ZOm��@1/����)@2�a!���@4k^�$S@6$��Y�_@7���M@9�g1�}Y@;��wϯ�@=�{��@?��:ɳy@@���ۑ@B4�?�o@C;���]@Dh�q�~~@E��eCW@Fݼ�\<j@H%I���@Iu�[��K@J�v9"�@L0��O@M�)�/̋@O�^�^c@PD	\L�a@Qޕ��@Q����@R�;E��@SdxorcX@T6��T�g@U���2E@U�#�Է�@V��Φ�}@W�z��b�@X�"�W�C@Yz����@ZiK�3C�@[[�(Bn@\R��\@]LFB��@^JN�HF�@_L)k�b�        ?���u��?�c��!z?���[���?��0@ �o���F@	����Ҕ@=���(@���R @  ��9	�@$hsY��@)4�]�@.��..�@2-��X�@5Y�w߿@8Ȍ��A�@<yV���@@5����@BP6\q�@D�@v �@F��G@Ic�&�@L ��74�@N��eܥ@P��p!@RL�$�DN@S����{@Uz��╂@W)IJ�zP@X����o@Z��^�޿@\���p��@^���׏�@`?�޻�y@aF�y
@bTn�{N�@cj�u̮�@d��߿�i@e������@f�d�7�@h�z�@iO|,���@j�ð��@k��"hۛ@m6�4��L@n��Nss@o�2`�w�@p�s@�ǂ@qk|�H;@r(t���@@r鑉��h@s�eQ�)@tv���@uC�,�@v��<�5@v�go��@w�y&5��@x� ?�*@yvW�CGM@zXI���@{=cer]W@|&-��.@}s���q@~.~�        ?x�?���
g+�?� �șJ?�V��.��?ш�G?=?�._/ r?�����?괟���?�~�KB�?�4Zn4�?�z�֎@ �mh�@�b�%%�@M+>�m@�n�'@����@� Oẕ@�^��)@F�X3�@ǢM�@h� a@(ꬵ��@ ���Jt�@"r��=@#��$:A�@%,E!�g�@&�'�� @(�r~��9@*W��6�|@,-���h@.�>b�@0T�@1 iv
��@2n�@3��".@4&��@5?�ce
�@6_cA�M@7�hu*C�@8���n��@9��q��@;.��@<Zy0���@=��w�d�@>�j�.@@KS�}5@@�����@At�
J�$@B%jsU�@B��:x�@C��Z�@DFE���@EEL��O@E��f�X�@F~���'n@GA�@�BF@H��?n@H�9�@I��e^+@Jd?vt�O@K2�ߏ��@L�q6�@L�̛��        ?t�25?�t��'?�����/?Û����n?шQ�$�V?�%T�W�?���*�+�?�|�F!.?��B�K?�����@ u��"O@n��\5>@䬿1��@����R@��yЬ@���49`@���7&�@c��z�;@(Z�f�@!�����@#�J�A�@&ڋ�к@(n��I\@*�U��P@-�j=V`@0<hNa?�@1��}*��@3@h�AW@4�B�2x@6�_~�I{@8G�U�m�@:i�Ľ�@;�W�.p@=��5�@?���ݤ�@ARUZ@B@�$�@C/�m��@DS��nw@E�p	1@F��k@d @G�3`u�@I9Q�d�U@J��b^Y@K��˪ZV@M>si��@N�`�F� @P]j��@Pǿ"s�@Q�S�ɮ�@RMu;@Sj���@S�*�^I,@T�p �	k@U�ר��{@Vc[��@W@��m��@X"��wT@Yb�@Y�'���@Z��R1@@[��ā�a@\ǌ�D	�        ?y��q���?���e?�;�^Zn?�:���''?ԙ�Y|��?�k�]��2?�Mjg�m?����]�?���7t��?�������@Ј��?@LT�X�@S����@�C,���@��pL@a�?�n�@�Q n@������@!����T@#�� �	@&B�}��@(����@+��j�_�@.]�G\��@0��g���@2A�gė@3���g@5��9Y�6@7lC5��x@9J��M@;<B�i�@=@h�B��@?WA��u*@@�_���@A�i��IP@C�,O�@D6CG��@EpD��@F��?�{@G� t?ь@IT-���@J�n��	U@L���@M��0�V@OYU�
@PB�|��@Qa���@Q�h�a8@R��C�Ǌ@Ss�.ƽ�@TK� �@U&���Po@V�x��@V��л�@Wә/ �@X�|���@Y��H�@Z��:މ�@[�s�S�A@\��S��@]��d��v@^���� @_��&�~�        ?��O�rz,?�Y��L)?�uc�?�������?�8���@��?�9�@
��d�O�@=g>:�@⡏��<@M����@"�%�5.@&�.p��@+���Cc@/��I�;�@2k����I@5#�uү@8��u@;��Jx@>W�N���@@�a�B�,@B�j@���@D���uï@F}�V?e@H��A��@J�����4@L���g@O�$��s@P�O�k�$@Q���N_@S-#'��@Tu��|a�@U�dR2'@W">��j@X�B;,@Y��C�Rn@[h1!��>@\�7(���@^l���"@_���D� @`�lM�%�@a� �OBy@bl���'@cD�����@d l�+�\@e  )I@e�R��@f�� q�@g�3�B�@h��-I@i��=H�@j��:Q^@k�5&�H)@l�@y��@m����@n��B��i@o���m�@pM���@p��-�$@q\J��8@q�L��@rq�w(�|@r��_G�@s���=�p        ?z��|�?��f���?�#E�
r?�Wo�o�q?�%�*��?ݍ1Z7�M?�58�$�?����qV?���Q*ƾ?�򛺿n�?����Bz@�*����@b[�V@	u�� @&���2�@�J�Y��@�u��@��.�.�@�}gl�@ڃ�6�o@�%3U�@ c'�O�@!�k��B@#��ɺz@%\4\���@'(��.�@)�g]��@*�ռ�U�@,����U�@/��)�@0�KE��L@1�U���@2��Cт�@4�A�@57��2�.@6t����_@7��67�@9q��@:]#IMK�@;���qw�@= ޘ�,�@>��skE�@@[U�Th@@�GoL<@A�$/jAH@BJ�<��@C�����@C�,��S_@D���&w@E��M���@Ff�酋�@GD�m�kB@H&t밁 @I�÷6@I�(jx�@J�*���}@K���}x@L�oh��@M��|Th@N���,�s@O�/���*@P_9wQW@P��y        ?v���O)?��=�ô?�9i,;:?�1u��aq?�ٌ���H?�$$�[e�?�]����C?�jʭ�H?�'���+?����8m�@yHw��@����LA@
c��v��@��6��@��	�VF@��-���@Ii:��@�0#-:�@ {ȡ$B"@"�o`��@$�8��@'H��z�@)���t�@,�b;�@/U��?@@1&�x�@2��GP��@4Q=C���@6A�̅�@7��/�d@9���t/@;zZA�"@=o�,' @?v����(@@�@ũ$J@A�Ĵ�Q�@B����L�@DAz2r�@EL(�_w�@F�uq�I?@G�I�S@I��)}@JW^Z��O@K���h��@M���@Nv�(��z@O�˟�@P�]�C6�@Qo{���U@R3��~_�@R��	4�)@S��b�W�@T���s�@Ul2����@VDI�u��@W U����@X Tmp-c@X�B�4��@Y�A�u @Z��
@[����J�@\�Ea@]��E>h/        ?xf)���?����nn?�Y)��?�Sy���?��&���?ߙi��u?�c��Pq?�cX�]˛?��2�M?����u�@�!���@j
���@<�dS5(@Jŵ�/�@:�a炱@oq�Q��@迌S�L@�-�*x�@ �zT'0�@"�?A�@%AxxRy7@'����2�@*8]�c�f@,翇�{G@/��,R�@1V�u�1@2�
���@4~+��t�@6+++��@7�����@9�a_�]@;�hX�8�@=��1j�@?���/@@��\�'@A�me���@B��Wk$�@D[݌�@E<� `�+@FmxF�`�@G����'@H�s���@J.�!d�@K~�� @L��ɿ	�@N6�-��@O��u$�@P��RD�@QA�vJf*@R �J��@Rïkiu�@S�4t�<@TTg�._@U"A�+��@U󻬚F@V���78@W�r��=D@X}���@Y]Yy�2@Z@��.+�@['@e���@\e��1[@\��ϋ|M        ?�&|�xl�?�8���?���"(��?��"�L?��Ռ��@�,����@�	}XOJ@o
��+n@m.9��@ gT`�@#�?�L-�@(+]V}�@,��)�E@0�S���@3���î+@6�Ъ=�.@9��$_(@<�,a@@:����@Bq��QU@D`��,&@F�O�
�@H.��My@Jhf�x/@L���ۇ>@O"�e}SE@PѱԢ��@R�l\�@Sum+��@TثD^!H@VG`E�
O@W�r4!)@YF���V�@Z�;]�B�@\r�����@^(�f�s@_�nyC@`�:�ءA@a����:�@b�;�O�(@c}'Z��@dpO��@eh�Lw�@ff1c}@gh�bp@hp����@i}{���@j�b�Tq@k�N���@l�6��!@m��G��@o����c@p�K//�@p��t�o@qK�s�#�@q�)2E�@r��6o�@s)��ݚm@s͈\���@ts�O�@u�C`o@u�����@vu�f�        ?��d��kj?�Iܾ��?�)�n[��?��h�L?���o��?�V_y�f�?�2�P���?��D�l�?�2!�|bq?�]L��@#���A�@����N@
,�|1b�@�viGD@ؐ4%@����Q@X'��|�@^�w*9y@�a�R�@ }S�u�	@"G�0�X�@$*?E��@&$m�B	�@(6rs�"�@*`JO� @,��yN�@.�TZ��@0�9�l@1��G<��@3J��;y�@4��V��@6����@7�D��@9�4(�>@:��M��M@<# 3]�@=�V���@?s/$��l@@�R��9@Ax�B���@Ba=XRa[@COr��@DC��� @E=k�}B�@F=3�4@GB�=��@HN_�� �@I_��ۦ@JwiQ@�@K�M����@L�o2��t@M�}��0@O|?�yc@P"5��o�@P�����%@Q`�Y%�@Rp?��@R�ƛ�=�@SSQ�I@S�N�'$�@T�}�'FV@U`��Z�;@V��78        ?z��]��Q?�\����K?� ����?���s�?���@	?�_F� ?�z�6�9?��47��?��}�?��is92@q=w8J�@�ã��@0����@Z�Ǿ7�@r�7J�@к �K@w��8@�@gC�N�@!�8~#P@$�Z�?@&x�Yax @)!�8�q@+�=�\��@.�9�W_�@0Ɯ1L�o@2X����@3��7[K�@5�ۘa�@7����@9`7�@;Q̨=�I@=V�� ��@?n�a��O@@��l��@A�A���@C�?@DGz�`H�@E�x�#X@F�
�.:�@H/]7v�@Ip��?�@J�(f�E@L>�.�� @M�R4��a@O35k�@P]ϻlB�@Q&��ޜ9@Q�,6�"@R���@�@S�6Ō�@Tz+33	=@UZ�_�RP@V@=%`Rf@W*R�"ݸ@X�!{�@Y�c�φ@Z�����@[?QO_E@\�d0�~@]g��q@^٤]m�@_!�^�7-@`�74�        ?�@���?�J�j�j?�c�?��}L��T?�Kǩ�N�?��k�XG?�{τ�B�?�6/ِ�?�V�誌)@UM��@�:�=@�Iv5j@J= ~}@���e�@S�m�		@X�F�+@ Zy���@"�TK@ID@%:}��2�@'�]�GB~@*�U�#�@-��Cȵ	@0��i��@2?�58��@4mi��@5��ze@7��z�@9���n��@<$!��F@>e���@@^�}!v@A���ɜ@B���L0@D*�&�]@E���1�@F�-{2�@Ha��X{�@I��@Klb�R�@M H6s@N���I@P*!**�>@Q=��$@Q�1��#]@R����@S���
_l@T���@d�@U���٤�@V��S��@W�$�6@X�A���@Y���d)@Z�a%�I@\W��g@]$�<5@^K�t�S�@_x�1�YB@`US>3�@`�`�_n@a���G9�@b0�E�@bԩ�r�@c{2�@"u        ?���6"?�?��?�XY�\}?�YY����@+
���[@� |ݤG@�q��@�W~Y�@!�O]�s�@&]}!iF�@+��KQ��@0�$�@I@3�!O��-@7p��!Ќ@;6����5@?D�e�g@A�O�k@DO��<R@F�Iٳ�@I&?f�O@K�</���@N�J��>&@P�<V�(@Ru^h�T@T�4k�@UҾ��z�@W�f��:}@Yw�E"��@[ene��@]d���	@_u�
<��@`�Ih�<@a悱��@c	����V@d5I�B@ei�d-��@f���Q�b@g�bq�1@i;(ͻɓ@j�6��@k�ޒy	[@mZ/VQ0@n��9+{�@p"#�b�@p��+5@q�J{@R@rq���-�@s?w�5�@tmKE�~@t�jX2~@u��S��@v��.n�I@w��]��@xj�%j�@yV<�#�@zE�AI�@{9��6�@|1�em�G@}-�@j+{@~.8B��P@2�[}�_@��K��m@��,��é        ?{ O
�M?����1�d?��%Έv?����(��?Ө����B?�I��?�$?崉����?����$?�H����?�m`l�z�?�-�� 3-@C���^�@�!�Nu�@	�a?ձF@���G�Z@�pˌy)@B���#@��i�Q@K�נ�@����@߲�o��@ nr�d,�@!���Q�@#�?m=�@%O/��@'�f�;c@(��7�3@*��a�5@,�@�I��@.�ԔU(�@0f5Kxj@1wrwh@2��~�L�@3��E��j@4�?@k@6
��1�@7B�i��@8��un�f@9��)�/�@;׍h�B@<o\A��@=�q��k7@?3�2zP@@P!�b��@A
yL��@AȌ]�{�@B�S�)��@CO�����@D�%�]�@D�攱@E��m-��@F���.Af@G`�}&�@H;�n��@I�=�@I����O@J���W��@KɊon*@L��%���@M��!Ow@N��7v�@O��s@PC�H�o5        ?| Ü(�L?�NO��e?�I�\u�?� ��D�[?���� �?�a(�_�{?�&��~]�?���A콨?�~b���e@ ��d�t�@���ak@	���ֆq@����j�@�߿�@Dr�:��@�HW�;@�x5�@!5|E�h@#��Pz�]@&&��o@(���N�@+�l/@*�@.����a@0�]R�AU@2�<���@4P�ޱ��@6'G��
@8~dwO�@:0����@<,bjZ%J@>Y���@@M���@Ay���� @B�-�z��@C�P���@E=�)��@F������@G�rJ+�:@Ib���v@J�+��p�@L\)��@M�㖻#@O�X��@P�@��ý@Qg��v�m@RCo@̱�@S$�S��@T
�S5�@T����c"@U瀩7%?@Vݵ��D�@W�)X	JR@X���@�@Y߼�?@Z���:�@[�}��|@]�:@/@^+^���@_J���@`7��[�@`���Qg�@adT�E�@a�k����        ?r뒯��w?�
�w�?�;K��?�4��\q�?�K���?�-�MC�?���\n?�y�%��?�)5	�?�2`Ҫ��?��ݼ�0@.���@>��R@�w1E�@|j�s�N@E���b
@L>k#�f@�f�,�]@��G!`@ i��J��@"iN��@$����M�@&�Z��1r@)%�g�K�@+�~G���@.C ;V!@0��8ވR@1�%S�c�@3o���V@4�"���f@6�ʘ��g@8N��US@:rי*a@;�qT�M�@=������@?��t���@@�w�l�Q@Aߚ�+@B�芇t@D��ٓT@E'�Q�p�@FP���@G�x=+$@H��lo��@I���Vd�@K?�`�9@L�	��k@M�b��V@OE��<P�@PV6D�(S@Q���|@Qȹe� M@R�¢'��@SJ��p�@TS{�*�@T��?CfV@U��%�@V|*�װ�@WQ�q0�F@X+�;&@Y���@Y�{&,d@Z�2R���        ?�����?�m�T5?�7v�b t?�[�	�?�nX���@��$��@��/�@U-Ē@�g��E�@!w��c:@%�A�[+@*'��@/%�9V��@2G۶�4@52y!<?H@8Q�eЯ�@;�ӽ�]�@?*�(ݪ@Aqԅ�R�@Cg2�][�@EueRQ3@G�9Ht)@I�zRO|0@L2�^��)@N�z�B&�@P�i�@Q�|B�]@S?�0�@T��iN�@V���U@W���z�@Y!o���F@Z��*Y�@\V�^��@^�l��@_��7���@`��=Y�@a�Jq�&�@b�Uf�@c��<�0�@dx�$u�d@eug�jI
@fwb�[�M@g~ҙy��@h�����#@i��t�@j���*�M@kҤ�-,P@l��А[@nv�O��@oI4�S �@p=��$y�@p��a�@qw+�~�v@r�"�@r��go�@s`��L��@t÷@@t�n�n�d@u`��~h@v=`�0�@v�^���@wv�Q[�z        ?w�M��?����%�?�Z�r��U?Û�W	0?�ܻ�ѝ?�d��?�Ư��g?�_4�?�����?�N(�@<?�`@HY?���'�G�@�Ɇ�@h�z@
K�8ѣ@���@ 2�C��@0ԅ�@�����@�;i��@�XW��@4���u@ S{Ooj@!y���U�@# h	@$��:WZ�@&:��!@'�s�Y�a@)�{�up1@+��Q@-_�/@/L{>P@0�P��@1����@@2��3���@3�^�c�@4���O�(@6vǆ��@7(���>�@8V�_��@9����9"@:���dV@<�tR�,@=Q���@>��
�@?��F�׵@@�\�u'2@AZ��m!�@B0Ju|�@B��q��J@C��c��B@D?����k@E7�C�@EŲNm�@F�]�y!@GX;z@H&Lң��@H��WU4)@I�jQ�Q@J��,N�P@K~�� �@L\��᷿@M>\�`        ?w���I�?��S|��?����˶r?��|�f	?ӈP�p?�_�����?�_@_+�?�x2�Ŧ?�>����?�P��+@tA��ޤ@�c�G��@�P��D@Ȃ4�@�4A�I@@���@��T�z�@��}��@!���� j@#��o�@&R3��Q�@(��Y�n@+� �%M8@.�4�k^�@0Ѡ�x@2m�Ǳ4@4�C�n@5�)�|@7��W�@9�B���@;�L���@=�;���@?�7���@A��]��@B:r{-l�@Cm-g�@D���d�@E���v5@GAi#(��@H�ԫ�@@J �i���@Kol�h��@L� ֠��@Nj�ҭ3X@O����@PƮ"k{�@Q�Ն �]@Rk��׀@SF:�@T%��ڙ@U	u/�@U���)`�@V��{�|�@Wү|v@X�t�Ma�@Y�*d��@Z�η�}�@[�_�R�@\���K4'@]�@�Ɓ@_ �F��+@`\�i@`������        ?tS~_��?����1�?�!)8 ��?�� �P�?�	��6��?�Mu�e?�G0rC0f?�|�����?�,`C���?��0w��?���-Y$�@�ļ�܇@�R\Y=i@qs\	�@���-Ѻ@���iX�@��� �@�B�h@Lل�.w@ �Z��)@"vkl[F�@$���ů�@&��<�`@)3���b@+n�v젰@-���5fE@0JK���,@1�~�D�D@3g�ÆO@4���%��@6ܩ�7�@7�(���@9J��_@:�@���@<��>Q�@>}4�K��@@)+�_��@Alj�<@B.5�[;@C�
À�@D�g�A@E�<!�@F+.��s@G@���'�@H\^|�z�@I}��}a�@J�.�@K�U�D��@MC����@N=�}ߛ�@O|D��F@P`� �{@Q彝Z@Q�p-�s\@RV�+��@S����@S�_	�
�@Te�U���@U�PW�`@U�3N&H/@V�QA��@WH��<�}@X���        ?��p�{?��S.?�OШ��?�(d��E?���� ��@��澔�@	�����e@��-�V@�t�J��@-�i3�@"O�a@%�~}sG@*'�Xt�J@.����z�@1�b7f�@4�*�kI�@7Y��A�K@:]�;}�@=�z(��@@u�H#;@B:�RN5@D�P]��@F��߭?@H
]�.�@J$T��b�@LSdZ?��@N��.�k@Pw�9'@Q���k�@R�w���@T8I��R@U�St��@V�Z#�k@XQ�q$h�@YU쾫@[=S���@\�8�?�@^NK^���@_���@`�QG�a@a�ȳ�Z@bo�%�=�@cMTm*O@d/Z/���@e��9y�@f �;U�@f�9s�l@g����8g@h���i@i�U�J��@j�'����@k�U6-��@l��j���@m��e�e�@o�]�@p]�+{@p��O$5'@q,���8�@q������@rR�`]6p@r�E�JR�@s�� �ǉ@tЁ��        ?y4��g��?�
��Zn{?��7 ���?�Z;.�m?����?��d�?�l�z&b?�T,��m?��2���?��t<u?�܃?�@�-MyV@F!��$A@�(IW @�OOt��@�d�a@y⬡@@g2��@��˼��@yc��P!@6Ek��A@<x���@!
��r�@"�<��@$=���*�@%���_3@'��qH�@)�Lۭ��@+f����w@-Y#���@/[S�^�U@0���?�@1�M����@2ߵD>��@3���뵙@5'Mu�_�@6VT�KY�@7��e�B@8�r���X@:b�E@;[xcn��@<����ڗ@>�pRT�@?j
v�@@i	���@A �/0�@A�`[�*o@B��a�1@C[>mИn@D 2�8�@D�w:�7@E�����@F����H`@GT���P�@H*Vn��S@I�m��h@Iޫc@J���@K@K��q�� @L��F@Mm93u��@NX�k�@@OG	2���        ?w�;:�2V?�a s�a?�&OT�?�-pSD�?Ӻb��6?߉���2?�dCj�%D?�j�oЃe?�N�x?��A�
@6u/@��W3�@r�Գ*�@n�xF�@i���9@��j���@2��z�@����@!�	7o@#:�X�3@%�ōzm�@(pǭ�x@*��%w��@-]!M
m+@0{���@1�$����@36w�^�>@4�\�~�@6����H@8\v9�&@:6rMIK�@<!�G>�@>�RwB�@@X��P@A$9�>�6@B;jh|�w@CZ�	�@D�|6Q}�@E�?��T@F�I	t�@H)�C@Iq��j�@J���x@L;�ڙ@Mx�m�Ǣ@N߲�I"�@P'K*VZ@P�4(�@Q��i�@Rd�K��@S+kJ@S�m��VI@T�r'�@U� ?�*@Vjo��:�@WCX��ܾ@X�+�E@X���C��@Y�_�o�@Z�`?k@[�����:@\�����@]��u�k�        ?uoj� ��?�z�?�Dj"�:?�QD@,[?�)6Uwb�?�'߾yCN?�u5R?��?��
P �?����M@z��@;?�"@	���3�+@�?�L�@^��@|%�Z�@ވ�Ŷ�@��3L@ :��#@"U^�`�2@$��&�;.@&��;~�L@){찵� @,&%V���@.���'h@0���?�@2P#0x�@4+����@5�NQ^A@7��6h�w@9d�?fa�@;K�Q,�%@=E,�'�@?Qw��@@��wT�@A�-��X�@B���s@D�n��W@EQ!���@F��)OЩ@G�hϐe�@I%�5s��@J~�@���@K���q�@MM�\	@N�ԕ�Zo@P �=�v@P䄚�n@Q���%�@Rz��H@SK�jO�@T!�<^��@T��2��@U���@V���Z.	@W�a��.@X�K�M:)@Y��Lщ9@Z|����@[v,�@\u���W@]x�j�M@^��L^�-        ?�):�I�J?�/S���/?�~A'4��?�ϩ~$��?���@��+@�@�zx@v���1@�4�2k�@�>xv@���P_@#>]��@'UM��O�@+�`��I#@0X���/�@2�÷N�@5�#+h�@8ҙ�Y�@<ƈy��@?mG�a@@@A�YN*�@Cc��P�@E]�fd�@Gn�I��@I�؈��"@K՘���%@N*ќR�e@PK'�][@Q��>.h@R׫ۜ�@T.C����@U��L;�:@V���V%@XrJ.�0�@Y�`��n@[~��pV@]�Ӗj�@^�Q�#�H@`/,f7�@a�@a���@b�C0�O�@c���P�~@d�ѝ.�@e������@f�I-ʜ@g��|в�@h�h-CnS@i��I5��@j��.�>�@k���و@l��Q$�@m�i6V@n�}�C@p��M��@p���c@q'ݪ��@q�J�ȝ@rV����>@r��e@s��w��@t-�W��@tή�Y�@uq�E��>        ?v��f�0?��ڃ�F{?������;?�d����?�ˉ�D��?�%���?��L�X?����\H?�uVD"?��!,�^"?���6�*@ U��uԴ@��dޜ@�q��׵@
�ӥ�@�*���@���� y@�DrMl0@6:n�,@Í�� @r�h���@Dr�kk@ �a%A(@@"%IOLV@#���ݎ�@%jD��5�@'%�4@(��W �[@*�n:�:�@,��>=��@.��*\�$@0[�r�i@1hh~�@2{����@3��L[^�@4�8���u@5��9
8�@7�Qn��@8K�vh�@9��s@:�H���@<x�[�@=r��$1:@>͘B�@@���W�@@�[	�@A��� �@B>�pj�2@B��:��@C�s|�%�@D�>�f@EKBM� *@Fwɭ�Y@F��\*�e@G�]�ŭ�@H�P/@Ib�C�eY@J=��ᆽ@Kj1[�@K�R�*Z@L�>�I4@M�,�@N��ONR        ?t�a*���?���nZN%?������q?���7�?ѱ���˗?�nL�10�?�-9��k?�����e?�!�d��?�Db#|��@ ����8�@�6P��@	7݄��X@<~���@�Cac��@�W6.�@+t&��@�S�GȖ@}Ua"��@!���i�V@#� P��@&4`�[�@(��*~��@+(5U�&�@-ӊ��gU@0O��Zx�@1�F�� i@3L��n�@4��8yZ)@6�	3�G�@8B4A���@:	^��t@;�uU\��@=�d���X@?�u�-@@�@٭rD@A�E��;@C e�;@D�=��F@E<�+�_�@Ff��s��@G�`x���@HыR1@JEl.T@KZ�űC�@L�?<��@Njv�#�@O_��P@Pb��m@Q����@Q��P��@R��Aiɀ@SSY��t@T�3o@T��Κ7�@U��w
@V|��4@WO ��W�@X%^�/��@X�$?ա�@Y�K�x��@Z����"�@[������        ?t�ՀC�?�$`��2>?�.���|�?�V����?�?�e�:^?�a�`b�?���߅*�?��*d�:?����в?�@5rL�+@N���o@����@
2��)��@k��k�@��xl�@�K/�i`@#^��@��oY�@@ aޅ�w�@"}�]��@$��I�a@'3�ru@)�<�ζD@,H�ʹ26@/�Mi{�@0�i�[(�@2�,�@4��f@5����d�@7~!D @9G�2A4�@;"X�4d@=;n~��@?�,7 t@@�
�w��@A��)�Y�@B��w�3.@C˾S�4@D��S@FA�qw�@GT���]@H���M�@I��OE��@K#L�Z��@LwG�$@MҳS߄B@O5}ܒ�@PO�b�e�@Qs
�&.@Qİ'P��@R�y>���@SG��M�@T�����@T��|?�-@U�q��18@Vw|ŷS�@WK�v.t@X#����"@X��m��O@Y�����@Z��P$j@[�Q2��@\�O4���        ?��>�?�=�1p�>?��k���?�uښ��?�p�^�o@0[��@���S7@��~��@eh�Rޜ@�a��I*@!�ժ��@%����
@)�9q�e@.J��)Bx@1�S�k,L@4D<�V�@7���p�@:G���E@=N��I�@@V��%�@Br�nu@C�w���@E�}�@��@G�J��<�@J���
s@LBSF�H@N�	9�_@Psf�+�@Q����@R�����S@T<h�\�@U���.@V���^��@X^��8@Y�S�@[P�A�/:@\�:�[�g@^h�~�D�@`pR���@`����@a�#� z^@b��]u�@cb�њ��@dFwYY:@e.i��� @f��D�@gJM[@h !=�*u@h�.Rj �@i�gL��@j�µ�[o@k�7Eﰞ@m���=@nG(F�@o%И!�@p��S:�@p�^dև�@q9	��@qɡW�I@r\&���&@r��z��@s�ꐥu@t"4��j