CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T113716        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?�� �":�?��=x��?����6v�?�l�,�A?�R2�*��?�㣩9xT?���Qm?�OB�%�?����^A�?�x�^��@��t�g&@/���$�@	+"E��@|�b���@M}�Օ@�O�s�@;~��K�@��w}@�Vo�@=�l��/@!J�f"E@#�"�d@$��E�mA@&�L>�@(�2���@*�`��@->i��Y@/WV�m�>@0�g���t@2���s'@3N�l�P*@4��5@)@5�`�@7R��\�@8��uP��@:5˯�@;�=5?�@=A����@>�A�,6�@@<��X�U@A+]���@A��`��@B�$Ns�@C�s(<�@D�����b@E��Bc@F�����@G{�2-@H{�s�g@I�1��@J�R#��H@K�C
�W�@L�e�]ܗ@MŶ�}@N�0Uu]�@P僘�@P�>�Dr=@Q/橽�@Q�
��@RdX],�@S�C�>s@S�V9�f@TFl��te        ?�c�� �?�¦ �p�?��D]��?�n�@�ѧ?ڈ�L
e�?�x� 3�?�(d����?����A�?�O�B�S
@�DB���@
qA[��e@�.���^@a�D)�@�G1d@n��F>@!YR�D��@$<��Be�@'b�g��@*��nA7@.yBb�@15�Q�{�@3Q��xٖ@5� �Fό@7�G�d@:y�1��Z@=#WO
��@?��a�@Aq�+@B�ӐN�@D���;"U@FGr�3ʲ@Ho{hy@Iۖ'fY�@K��!} >@M�~e�*.@O�Mq̉.@P�0���@R_���@S&�8�]r@TP90�K<@U��! �D@V���x=	@X�Y�O�@YRd�̷@Z��	��@\
-گ�@]t=%�@^�g�@`1�ώ�@`�l �@a�����@b�����@cXU~�w�@d-��?�@eb��e�@e�ܒ�@f��)��@g������@h�0-��@i�L��@j���[�@k~���vQ@l}̸�7        ?
�WU�?��{dK?�Fs���?�F#._3?ݘ�I�P?�#wrA�b?�>e�Z�?�O�7H}@�&��,+@�RǾd@V��K@�)`�@��L��@�BJL�_@!��I@$2��b�o@'��#�u�@+\�����@/m�FUb@1逝-��@4G!� @6�C.��5@9�j��^@<gIK�@?u�m�"�@AX�_��9@C���@D�VI^w�@F�C�ɧ@H�yQ�|�@J��m,e@L�1ґ��@O1���)@P�&!���@Q�9M���@SA68�5�@T�$��H�@U�����@WT�����@X��hF%�@ZH��6�@[����p�@]m���@_;s�G@``��dy�@a>�3�b@b#G_�QF@c��Ｚ@c�l�b@d�=#�@e�Tg@f�}=l@g�iA�@i*�s�N@j��Wg@k:�0w��@l[�7��@m����@n�����!@o� ��G@p�����@q-j0\_@q��3�G        ?��Bd���?�!9��N?��CC���?�݂�ᦠ@��o��@mFc��y@�ȧ�,$@"#m���v@'֣@'��@.`6�e�@2� �5�@6�ُ�|�@;�n�:@@B>���[@B����`�@E�^#ή�@Ix1@@Le-˾e�@O��o�[�@Q�����@S�A���B@V?�s�@XD��]j�@Z�K�s�r@]A�|q
@_�pVO;|@a(d�W��@b� �F�@c���x��@e��y�G@g�}�_@h��6a�@jW|�8	�@lv/�O�@m�p��@o�c��P�@pǣ���@q��>��@r�Z�(�f@sŔ�?@tҮ8��@u��N��@wkZ��X@x# rQ�@yKY�s2@zzphv��@{�;t�@|챗-�@~/ɢD�@yz��rf@�d�-i3@�Bs���@�����k@�p����@�%׺��@���&(@����
@�X��8R@��xS<�@�ޢn�-�@����/V�@�qq���_@�?f��u        ?xC$�zz�?�q���O[?��K�^�?�~YO?�7�O�&-?�N�}�n�?�m�CX�?����7=?�Z�& ��?�\K�U`b?�������@� c��@�Z�9
@���4�I@��vr) @����^,@g3��B@�e��
h@@���@����`@ߜ�Xh@ ����Ȍ@"R��mnQ@$jm�s@%��=#�@'�&��Q@)҆V �@+�e�3�@.�}@0%D���%@1M��{H�@2�+��O�@3��@q?_@5��ߺ�@6T^zɛ@7�:Xd�@9$��G@:���*�@;��^d�@=~H�ѻ�@?
���9�@@PWҲ!�@A ):L��@A���/�]@B����z@C�����@D��Ц>?@Eu��t@Fa��dZ@GQ�|�R$@HF�AY��@I?����@J=|�{~�@K?�2tӣ@LF"r�Q@MP�!�l�@N`��W�@Osm5Z9�@PE�!���@P�q8�ȕ@Qck�):@Q�rxs��@R�_9p        ?�]|RK�?���(�zv?�x���H?�կh?�Ji�t��?�x�L?�|N�w(/?�D�/�2@'�� @���Y��@J�hȨ�@q�RV��@�mï>j@��֦��@ ��Ռu�@#�����@&��1�@*��{�o@.����%@1wl�5�@3����E@6Ef���D@8���N@;�gO���@>�ך�s�@@��_��@B�$1�5@Dd�ҧ�@F>M{Y�K@H.b滸J@J5A��g@LR��Q�@N���ɬD@Pi��|�@Q��	m�6@R���5u�@T !��+@Ut�ģ@VӅRY!�@X>�2��@Y�-Lq3�@[7]�8L@\�!�(��@^^xί$�@`��43�@`��(*&�@a��E�Gq@b���°�@c�D���@dt��iTx@ei�V���@fdgJ)�i@gd��8{�@hk#hr�W@iw�{��@j��˶=e@k���$@l��ws@mߏ'"d@o�F��@p�Q1Ҁ@p�����@qQ(z�        ?|��O	�?��'���?�G�(���?ΉE��E??��{����?�׫����?�UN:t�?��UV�,`@)Q�=@���{�@:n� �H@mG�n�@Ɏ\�}@�y�� @ ����'5@#��b�1@'�N�@*��_��f@.�)/G�*@1��SD��@3����@6e����@9Z��y@;�Y���v@>�W&S+�@A]�w�@B��?�<�@D��p�h�@Fpm�t�}@Hg��|�"@Jv>���@L�qF_�@N�J�W�@P���?�-@QΠ�k��@S?Gr@T_�vf�@U�[�2�@W ��h�v@X�eP�ht@Z�;�r8@[�gv���@]2�	��@^�^>��@`A�rg>@a-S�@bKs�y�@b�q��/@cڍV���@dϜE�d#@eʛ�*�@fˈϙLo@g�`pD�P@h�G�>@i�����@k
C�N6�@l(���Ŋ@mLֻ��@nv�G�@o���D�k@pn(��?@q�G��@q�h��        ?����[>?�Fh���?�'g��O?����N@�@}���@�?|N<|@p녟��@�H|w�8@#�����@)�f�@/=��{~@3����@6�U�\��@;.��N�@?�;����@BcU[�Z�@EW5$�u@G�R^�Oh@KmIا�@NE��@�@Pܵ^��@R�1��G�@T�Se�B@V�����@X�O�<!�@Z�@zB�@]<R%/@_�N�^I@aX4E#@@bZ
Ab��@c��ˀ+@e<i��@f�����@g��3�@i����[�@ki�vb	@l��>��@nY�f�"�@p�dT�5@p��Uw@q̗�H2�@r��N��@s���#��@t�~x�@u��B��5@v�WFv�@w����I�@x���}>@y�ZG7�@z�gEq�~@{��PI��@}�4x�@~?��h��@kȲ�~$@�Nr���@��1VN>@��	ʻQ@�'(��T@��pzr�@�nA*��&@�r��84@����]�@�j�J$        ?z�&�[.=?�ke�c�?��==z?�b�Rms?�Lp�	de?��g��?圄�t�?�'B�D?�m<��5�?��*Y�t?��2��.�@�J���@\XY3#�@
^�|z!N@�����k@�+?�y@:	��B�@��t##@�PN�=i@�΀�v@ ����@!��{[{@#{s)2�B@%X@f)�@'Jr��s@@)RV���x@+o�����@-�,�g�@/����(�@1#D�ƅ�@2\@#VK@3�>�P��@4��c4�@6D�k��@7��G�E�@9�63{>@:�q��8�@<
�qG@=�Њ��@?)��>�@@dD o� @A8�Ջ&�@B<��*@B�w��u�@CӸ��i@D��iَ@E�ȸ?M@@F��йB�@G��w.�@H���	@I��N_�@J�U�`f@K�P|�p@L��##`�@M���@N�C�U�@O� ���H@P��ո@Qt�gߔ@Q�^9H`@R@d��%@R����@Sr��/�        ?���W??��`#b�?�\�|�?�E`
���?�q<�l�?�Z�/�2E?���O��?�$��l`@ �]�$0"@����i@,�=@����_@�{)�(v@���Zi@��Q�@"�'���@&���@)���~sF@-n�ү?@0�.rk��@3��m�@5k�]�@7�R>�+@:��OSNj@=�.E�ts@@V��@A�}$B�@C��tw K@Es�a�H@GT��I�@ILJ���@KZ`E8��@M:�q2@O��_!u@Qa�1,@R:��@G�@Sz���@T�N�&@V5�X�&@W���%�@X�%��@Zf�f� @[���b�i@]|J��'@_A�#�n@`_�CN��@a9]��=@b�O�$�@b��l��@c�W��5@d��sPO@e��Bh�@f��΃��@g̕���@h��<� @i��N<�@j���O	@l�[�R@m*�\@nM�wF�@ov���@@pR���J�@p�{�        ?���L�fx?��)��?�q�(��?�ʮd��?�a��T�?�!K��?�}��@/?�y�.V3�@���E�@؞8/�@��o9�@8�:�*@����p@��|�In@!'t���R@$A�m��@'��P�@+d]H��@/oqN�J�@1�V��{@4?�dEL@6�X<�@9q��O�@<K}X��|@?P��P~@A@��Rm�@B�Q$���@D���ɔ8@F�y	�u5@HB�J�J@J�:�R�@L�f_��k@N�ǕXf�@P�/d��c@Q�S�.�@R�Z��@TA)T�9@U�Q�ڦ�@V�s�@XU����@Y�|j�@[E\����@\͜�\��@^`�w��O@_����@`��L�B@a��R1 @b�:�pK@cq�+��'@d\�^٫@eK�iy
�@f@q^� �@g:�_�1�@h:!*�-@i>�H���@jI�ܜ@kX_�&6�@ll�)1d$@m�ŲSG�@n����u@o��d<�@py�7�`�@q�M�;h        ?� ^�A�?Ӌg3QH?�_�/��U?��Jc�G�@H[NA��@*���@[�Lt!a@"!� d�:@'��B���@.����^@3#1!�@7d��I��@<�a}@@�$���1@Cs؂{��@F�����@I��W��@MI�J���@P���>St@R���	�@T��PT$F@V�HG�1]@Y*~��0 @[�F���I@^/�:Ֆ?@`o�#�@a�� �b@cI3)�K�@d���.Df@f] ��^@g�tל��@i� ߯-@ke�ĭ��@m/?�A@o�Z�+�@pv
	��@qo�*�$b@roߖ(&@sv�!C�@t�ű ��@u�B��ڤ@v�a�@r@w���@x�OݩZ@z-��mg@{b")F��@|���]ّ@}�a!��@'c�pd"@�:�K3P�@���c�f�@��-� @�Bk�z��@����n�?@��鐵��@�e�}ZN@�!J_s�@��a��(�@��_��2@�g=w�f�@�.���@��z����@��̄\kI        ?x�$U���?��|��?��mm��?�셵?�	�p'?���*J��?�,��J?떗,�MO?�&s���?����?��@��@@h?�N�@�m:��@����@�
hǙQ@v�?�@˿d9�@JGS�ү@��oN'�@�y(h�@�_|p�@ o�r�c@"ӓ�@#�*����@%��;�L@'����`�@)y��@+�jN� �@-���k�Q@/��.8�@1��?�p@2Kv���@3��N��:@4��U/�@6�P��@7u��9)@8���U�@:Ha�1*[@;���.@=C���@>�S��O@@@3�Y��0@A�O�K!@A�fB�-�@B��,���@C�"\*׶@Dwhˇ�y@E`�����@FN�=�)�@GA�(}��@H9^⩱@I5��;@J7^��*�@K=�����@LH|�m��@MX(����@Nl��6͈@O���;�@PQ���@P��p"r0@QvNl�û@R:F��@R� ,���        ?���9IY?��o��`�?�H����#?�=I5t?�?�P5�(o?��S�s�?�n�Еt�?���(J@8�ڙ@�b΃"r@#�9�=i@Y�@� @��,@�$ ��@ ����b�@#�Y�zx�@&��8x�@*��TÑ@.���@1vO�}~�@3̖ow��@6O7Gt�@8��F�.!@;ۏ�v�@>��.k	@A/���@Bė����@D���ɻ�@Ft�Lٵ�@Hq0XWh@J���H
n@L�ۘ�d}@N���m��@P�|Ɣ@Q�$��ӓ@S/Ld.�B@T�>Y��@U�S��rF@WSL����@X���u��@ZUd�M]@[�Ί�@]����;K@_8r,�O�@`y�!�_�@a]fa<��@bG��8�@c8lG@d/�] $D@e-]�1�u@f1��V��@g<I����@hM���@ie9zZ'a@j�u.#=�@k�4Y�l@l�w�@�@n@.��@o=�U��@p>1I�p@p��?9t@q��R��&@r0�v�        ?y �O]M?����?��[�jx	?ʮd���?�^~�;��?���Ie��?�I�B�G?��8X���?�Әf@�8@ɲ�NBZ@	��rs�@{m�@�Ye�@9����@F�R��@!5�3X
@$*�Ń��@'g��I� @*�]��Q�@.��@��@1o��ow@3��hP%J@6�]��@8��9@;3�A��d@>	���@@�:6�B�@BF��N�@C�"�81@E~�7.3o@GQ��V�@I9��]�@K7$2]	r@MI�R�&�@Oq�a�X@P׷�	@RD�v�@S5�Lɨ$@Tt�9
T�@U����Q/@W��-Ǌ@Xs'\<�@Yݞe�@�@[R�܃�'@\��g��@^^֭�@_���^]�@`�5�ԇ@a���	�@b{�}c�@c[}�Ǵ@dA[G�5@e,��y�@f0�^m@g#H���@hmh��@i
ڼ�O@j�����@k 5Ɂe�@l0�!��[@mF����@na���"d@o��w!��        ?��
��?�U��VE?�@�]��?���.�A�@�3���4@V��Z@G��P�@Cވ��@#R�z\P�@(�f�,@.�#� �@2����S@6�t|�w@:ʣE&@?E��=�@B�q�F�@D�"`�l�@G��C&@J��ug@M��^ʯ�@P��^T�@RQSb�^@T1��B@V(�rv�S@X8�55.v@Z`_����@\�	A�;@^��E���@`�vC_��@a�����	@cFZ��{@d�u�De�@fC����@gz���.Y@h����@j�7A��@l)�� �@m�}+@oc �)�|@p�孽�@qnو��@rT�@{3@s@˴*0@t2m׿l@u)���@v&"1�7@w'�w�x@x/*�u�K@y;��u��@zM�G��@{d�nE
�@|��a�i{@}�NqJۯ@~���0@��2p@���8���@�-���@����zE@�j�vc�H@�Z���@���R�g�@�Y8�F�@��s�V        ?{�5B��?��(�^?��	�X?����+A�?Ӷ����~?�x�ױ��?��{�) �?��ٱ���?�P�⬄?��S9�I�?�����"@��Ȼ�?@`J����@
Z)8�)@���\�F@�	yN��@&ty^�@�^�1�@��#�1@�(����@�D�]�C@!��L�?@#Y>~0q�@%1�)V@' ��@)%=HϦ@+?�f�@-pa�J�D@/��.��]@1	W�|�@2B-b �@3���:�n@4�IP��@6-�b� �@7��Q���@9 fs�3@:y�pJ;@;�F�= @=�H%_;�@?&���*�@@e�+ftV@A=v�W�@B�b/t@B���O@C��c�-@D�.!�!�@E����@F�b3�p�@G�4�-)�@H�'Ѱ��@I�7����@J�ap���@Kՠg{k�@L����ft@NO����@O$�F�t�@P$�󭾖@P�R� �@QP���?Z@Q�QNήC@R��('T�@S%E�,��@S�u"p�        ?��� +�<?�B��4�?�O��5��?Щ��m�r?� d]+Y�?�yG�J��?�qu�d?�K��G��@�����^@��>��@~Ǔ��@(�tL�F@� 0؝�@�ԩ"@!$^8g�@$B��-@'��>Dh�@+s+�C	m@/���t@1�"ֽ�q@4[�0-�@6�]☜@9�ג�ӹ@<��O�·@?�P+Ra@Au����@C0T�V�V@E�)�@F��]!��@H� <��@K �iv3@M@:�}�{@O� ���@P�}e��G@R8�1��@S�����@T��A�+�@VCan�k)@W��[��@Y4���/�@Z����}@\ZDߒ �@^ t}b��@_����Mr@`�6
�@a�����+@b�1ٍ�Z@c�+�$��@d|�>�w@e~H���@f����@g�v�b�@h����`�@iū:P$@j�YB� @l�aQ��@mA���<J@nx�Mݮ@o��F&�@p}����|@q#c�$��@q̌ws�@ry%����        ?|`mծq?��5���?�E[hn?�K���C?ڠ>I.�q?崎6�a?�e\A�?�iV��]D@ 67UH�@(uu�M@3qL4!X@
��9-@$�5V@��=Ū�@�1�Ƅ@"k�IU@%\�ɹ@(h��� �@,@	�@/�C<@2�?vK�@4KY���@6�s'e[�@9:q��*@;�S��@>�R�*�K@@�ќo��@Bv� N@DkM\L@E��nB3@G�t1VJo@I�ۗ�2o@K�7���K@M��[��@O��1@P����@R��Y"�@SBCٸ��@Ty��\=@U�Tf�@W�M:
V@X\$���r@Y�j"�n�@[$��ù�@\��%| r@^m�c�@_�<ȝq@`��Do�D@ab�8��@b4ľ��@c��Ezy@c�"!
E�@dǇ6��@e��m6ޖ@f���ud�@g�\�wp�@hx���
�@ip���oM@jmٶ���@kom���L@lu���=X@m��Ʉ�@n�:^>Up        ?��ف� ?Ӵ��c��?�ܸKZ�?�$TAj@`���q@8|�9�X@j���qf@")�Z.X@'��J�@.�5�p�@3)���q@7k����@<#2�K@@�_���@Cz}R	@F�A$}�@I����D@MW�FE	@P��'��f@R�ˬ*J�@T��|��@V�,#� @Y=o�*�@[��6)x�@^I�_K:@`~K*P�O@a��rG@c]yI?d�@d��k9Q@fw>�)D-@h��\��@i����s@k�[�E��@mX��w@o3�9I��@p���@q��M��v@r���:6@s��;7@t��tr @u���*�@v߉�X�@x��D@y1�f��N@zd�����@{���t�@|߄H�Ԩ@~'I��N@u:X��o@�e9��|@�؏���@�����Em@�x_��($@�0��M4@��#A��)@��xv��S@�k�W@�0Y�}@��?�q�J@���X��@����E�l@�d�y�Z@�9�h���        ?z�EA��?���HjO�?�hA�nt�?Ż賲>�?Ҿ)�'��?�'м��?�����y�?천$��?��~2Z�,?��\N���?��v�@ NK���@�,�e�@	�,���A@���.��@.T���@���nt @@Q�~�L@
�!�m�@C��<@#z�ǼN@!9�t��@"�{⹷�@$�4���@&�BG�`�@(���Ng�@*˙N���@,���`tt@/<��ݵ:@0˪�ӿ[@2.��@3G��{M�@4��$�@5�%>�@7WTo��@8�p���@:D�v�@;̱�6�@=_�K���@>�_��ͱ@@T#u8w@A.�O��@B 9�x�@B�-==�@C�����S@D�kăD�@EɟJ��L@FƊ��`@G�-g+�@Hх���B@Iߒ.Mgv@J�Pme6}@L�R!��@M+ԭYk@NP� 3�_@Oz�qIe�@PUpB�OM@P�3��=�@Q��-p��@R.�\ �@R�$ڡ��@Sv��-!@T�9�>&        ?}zV�G$�?�l^h2�?��%Ǘ?��,$h��?�l[��%�?��#=w-?���׿?��mA?�&?�f_6�@�����@
��x��@�M~Rau@�
�8@@�*s%@P�-?�@!���H:@%,
�=�@(���@,9H�`D@0!���@2PvK3F@4�H|EK@7-c\��@9�V�{��@<�ٕ��>@?�D��@Az����@C,��R�@D�Ik�}+@F�dkp@H�Ǝ�@J�Y=��@M�2��Y@OBț�� @P��d!@R�k�dp@SI���+@T�Vh�@U��j�Y�@W^�`��@X�a.��9@ZV8󙖤@[�,z3�@]`��<�@_&���pi@`m\�z�=@aM�hy��@b4B��@c!5Y���@d�E0�r@e,�S�@f8�HB@g���o@h!���~�@i4a��@jNq�[��@kn�:��2@l�!5��]@m�&��I@n����O@p˕�z.@p�����@q[v�ي�        ?~�S�?�ϔ@h?��ÚN��?��=0z��?��7Ƒ?���0#�[?�I���V?��L���@ �c:˔@h6r�xi@ݏ�t��@-;ɻ�@v�G+�@O~�v(O@ _��zo�@#e��#�@&��Y8�2@*eMl?��@.c��#)y@1\���)@3��.�4�@69�B>U@8�gI22@;����ȩ@>�&�O�y@A?�x�@B�D�hm�@D�y�̀@F�37M��@H��w���@J�m����@L���<�@OMD��>@P�z��#@R%�ar,@Sz:FG@T��N�L�@VK�a��@Wɯ��a@YU���!@Z��@i{I@\�H�̿@^O���&@`
,�/��@`�N��@a�9�-f@bݶz�ʏ@c݌����@d�­�E�@e�__q��@g	h���@h&�m��k@iK�&U��@jxIU��@k�=m�á@l�㾦�@n*�<Z��@oub�U�@pc�Y�@@q��?@�@q�r�@rv��K:@s.h�+V�        ?��0'�B?��1�1�#?���(��?�s�$^�@`@�6e^@�B���@2q��@  Hߵ�@%3%_�G@+6Zn��)@1��Yu@4�߳���@9$�6�@=�m��K@A�_�|�@DK?4��K@GP�"P
�@J�� ���@N	��逸@P����@R�)0�@T찚%fG@W 9��?�@Yq¶,'@[�h"��@^oC�@�@`��3Г�@a��]�-�@cgvh��Y@d�0߾�@f~/Dttq@h vЮRq@i�n@k��z��@mc?ʛ=�@oB�6Z�@p��T_�@q�A���i@r�@	f�B@s����W@t�xĝ%@u�V�c�@w���@x6nb���@yk�����@z���w@{�L0F%@}:�-o�@~���@�'D��@��s�J@�])^ae@����@����@��C�m!�@�ZD�t;@�#.��@��ݥ@���n�@��G��h�@�lA UXa@�Hg��@�'���O�        ?wf8�y8?�g,�Yb�?����g�f?�F��N%?уc��j0?�6���)V?�₱�C?�䰴�C6?�ė�1�?�����{�?���d>U@�k���@W�[���@�8��̀@�#v��@�,�g@b�����@�C���@m|�ʤ�@.���N�@�P(�>@ ���ӳ@!�I�3F7@#a��R�y@%&� ԥ�@&�*|���@(뵼�[i@*�.����@- �+ ��@/(�)�5@0�p�1{@1�_z�u�@3-e�$�@4G�}	�3@5�S/볺@6ܢ��B@85�����@9��kg.@;k���@<{��՘l@=�OlŞB@?�y	dr�@@�8���@A\� �H@B/����g@C�v�p@C�
���l@D�f��Q@E����@F�����@G�w�vD�@H�"�;q@I|��-�@J{�V_6@K�Ưv@L����l@M��1���@N���e�4@O��ֽ S@Pn�W���@P�' P�@Q����@R'g����        ?�0�	q��?�~t����?���j3t.?������5?��?���?��y�?�l��ҧ?�>=s�I�@ �~Tk@��b��@,���y@�}�$�A@���E�_@1��W/@I��ܸ@"u��t��@%�8��@(쒍�[k@,����@0C�b5�(@2c3Q�@4�>��©@7�^$	�@9�kv/�n@<`@'��@?A.y��(@A$�Uz��@B�R� �@Di��jH�@F*: Xp@G����s�@I�釸'�@K�/�K�@M��U���@Pd�9v @Q+���x@RR��j
_@S���e��@T�j�c<@Vv�@WV���U�@X�:��@Z�2 �@[��� :C@\�	0 f�@^�cZ��@`w* ޒ@`�SiW��@a�D�֐@bzI,@�@cU_&G��@d5���@e��@f��XX@f�F���?@g��#��@h���x�@i�h�F�@j��k�[�@k�Q�<�@l��W�@nV�=�@o#�y�        ?~69A���?��܂`N�?���h�}?�ˁg�w?���	��E?�$�#�?���6�!?��2���B@��ԕH@=�����@���,�@�Zr��@F%W?�-@F�l@ ���[��@$
��o@'u�e��@+3p/�J@/E]��@1�7`_Q@45g:DP,@6�� �KY@9x۠Ɓ�@<^9���@?qU
��@AYM��l@C7B/;@D��@���@Fǈ����@H�:~O�@J��=1�@MJ;�=�@OQۣ@�@P�Ht�p7@R��a*�@S[X��� @T��GcV@Vc
�@W{IkA�@X��D'�@ZxqU���@\	r|�.@]�����@_Pd�mz@`�/Y|A@adX�b�@bK�-+��@c95�D��@d,�Ad@e&͗�0c@f&����@g-$���@h9�d��@iLBP$;@je�0��@k�-|*�@l�p����@m���n%@o�'�@p8��;@p�AZ�8@q`b����@r����!        ?���3�?ѥ�=�?����h�?�����[�@{}Y�"%@�cG�9=@{l�/@ ��5#Z@&Z����@,��B4Dg@1�n�ar@5���M@:c����@?H���d@BN���;�@E2A�B�@HN�N	#@K��MuK@O4/�-E@Q~�b��@Sϖ���@U��ޢ3{@Wؿ�\��@Z0g�.�e@\�қ^;�@_5�wtѹ@`���H�@bW+_�k�@cʼ�ڸ@eL�&�E�@fܴ&qz�@h{�Y�z@j'�u$�?@k�qX��@m�m[�!;@o�� ��@p��᥺f@q��RWV@r����w�@s�hIh�@t�[ɔ@u�\ƫd�@v�l>�?@x�d�q@yG���/@zy�C�@{��:@|�S?��g@~:��K�E@�˲f�_@�o�@���\�@�λ�@S@����:�@�<t�d�@���8�N@��.ᗬ�@�{J*�{X@�A����\@��oi��@�ي�*6@�����P�@�! �Y        ?��X��?��ڠ^[�?��D4f?�y�=9V?ם�"?�?l�'z ?�3��{��?�����?�T�*?���n�V@K�p��@-f�D
�@
p��u��@����@X5eV@���R@�Y��[h@�UNI3>@ ώ�y@ �X;3��@"�l�T��@$y�V���@&|����@(�΢�#@*ʳ9�@-I�G�@/wjE/�9@0�s��l@2@��h?�@3�����H@4󪙁g*@6^	Ed�@7ӎ��s�@9T&�ř@:��u�@<vR$Q@>�mB@?�P�v�@@�ߘ��@A��f �@B�����@Cq�.�D@Dc����@EZ�e��@FW�9��@GX�jh�g@H`5=�ҩ@Il�X��@J~�HI��@K���@L�(����@M�˝/�B@N����S@P\x��@P���	|(@QG1��@Q���V@R�J!t0@S(*���>@S͘@�ΰ@Tu��Zmq@U �&w�@U�4\%��        ?�^��n�S?��Ŝm��?�ӭ��"�?�����?�ʚ~�|?��7!�?�:��sF�?��r����@{��Vwg@	�aq���@iE�)�@���e@JK�#?�@�^���@"H��}k�@%�IҖ@)3� ��j@-)8�R�@0�W�%��@3��8�%@5��ɨ\@8>�7)�-@;W$�@>)� �@@��7�*@Bh�%�y@D6ˏ��G@F�(Gg@H�J|#@J2��B7}@Lbe�	��@N����@P��d3�P@Q�E��M@S?/��M@T`�<��@U��v�@W/�wzZ@X�  �/@Z0|j���@[�M�ߖ@]a�T�Y�@_����1@`a���U@aCL��#@b*��MI�@cH�-%`@d�s��@@e��@fg�՟@g	�ث�@h�S�$/@i%�XM-@j<Z��f@kX�O�@l{Y���@m���~?D@nт�s��@p�혍v@p�T�jB�@q>���@q�IʙS�@r��+N\        ?�ja;�i�?�&Z��$�?���^	:?�	�Z~A?���-T?�5���qM?�,�4İ?�5Z�@��wS�@�mT� :@�aɖo�@�ݶN�@��{k2|@�(I=U@!�g�0�@%2�Ц�{@(ϟ�s@,�0ɜeU@0��i���@2���`u�@5[�'�iC@8
�Hl�@:�=TY@=��>ݽ�@@�2��rt@BO�3�¡@D0m&@F�t.qX@H
k���@J�h>F�@LK�Ǵ�~@N��.�e�@P{1�[��@Q�YЁ�@S��/B@TW�/
4@U�/����@W(��W=@X��#��@Z+��>h�@[��.�E�@]_�)
2@_�	_��@`bĆ�r@aEg���@b.-B�9�@ctl�l@d�ʦ@e�h
@f4{۽(@gT��B�@h"t���@i5���Ԓ@jN�*XI�@km���`@l�^�oOu@m�j�-j@n�F�}@p��8�@p��r���@qP�{1�@q�����@r�9l�;^        ?���ԋ��?מ��
?���� �@ 3�+. @�d�l�@�OD	�b@2
�+�@%W��_6@, ���@1�]kԗ�@6@�-R	�@;��;��@@@ᅁd2@C4-�B�0@Fj*��$-@I�0�T�@M�z,�m@PϓJ� @R��g�L@U4P�I�@W��ҙ@ZnYye�@\�%���R@_�!�Ζ�@a=�P@b���Z@dXp���@e���63@g�����@iz��ٜ�@kP�JrqP@m6�(m��@o,Z�@p����x@q���@r�����@s��$44@t���Յ�@vNu���@wK����@x��FÔ@y�p��O;@{��'@|^g�;�@}�ЏFSP@#�ɦ[@�>;��@��2����@��#���@�nҝ(ǯ@�1=Uݷ�@��aP��@��;ﻦ@��Ƃ��@�_��+]Q@�4�p!o"@�dE���@��F��@��U&��[@����f�@�����1@�~��;��@�m:"�        ?|�h*��?��^0;�	?�	�t�"�?�K���*�?���B�D�?�\˿��?�����z?�b����?���	�8?��؂�@ ���@c�V�V@���W@����X@c��H@��E@z._�ё@G*�ao@� Q @�f}p�@�3�e�@!�+7�b�@#E�I��K@%	���@&�n���@(ҽH`$*@*��ft@,泰e@/vY���@0��h�J@1�DD<@2��Oؚ@43,�yM%@5u���G@6���e��@8��zD@9t㡵�^@:�.�|�@<L�'���@=���~��@?H Z��@@i�AD+@A3��0�@B7��[\@B�zՓ�@C�jqq)@D��#>b@EhY�\@FL�~��@G59�<��@H"GC=�Z@I��.@J	Y�[�@KY��d@L���U�@M4q A�@N�$S@O"��&@P�DO#@P�o�)@Q(H��< @Q�9���p@RFCq(b        ?~q��i�?�&�I��?��2�_?��~�E9Y?�9�6u�?�\�����?�"qk�x�?��E	�@?��0�d\@�+Ҟ8�@
ٽ�}f�@�x��f@װ\'*@NU��3	@K�)� {@!�� �@$�&X)<�@(It���@+��a�4@/В�C��@2G>_�!@4EoH}�@6�����@9>�l#�@;���5��@>ב�}UH@@�S��r@B�3����@D60A��@E�I98�@GΠ�N�n@I��{�Y@K�%/�?�@M�`2��9@O�E���@Q�Dqi�@RCw�T�@Svt����@T�.�A�Q@U�/���8@WNq�u�@X��}+@Z��y��@[�u�{Y@\�oF;k@^���Z�@`�ql�d@`�i�Fm�@a��#݅�@b}���q{@cY�FV
@d9��Ýk@e�r��@f	<�v��@f�hj�bQ@g�o�Ҟ@h�J��q@i���8�@j�i���@k��u�@l���w��@n	?���@o�y�L)        ?|wxx/F�?�|�*m3?�.^[%	?�r���$W?��lc�?�����?�F:^��?��m"��@ �ٶP�P@������@7"v@V[6H�@��$@�i}u(@ �I�;��@#����?�@&��##@*�xx�F@.���h�z@1�.`��@3���X@6\z�	Y@9Ȉ���@;��Ν@>��F���@A��.�@B��|��@D��M<@F|�L٘ @HxPV�@J�����@L��w��@N���~z<@P�꿖O>@Q�M�ɲ@S,��ֳ\@T��CAk@U�[���@WK'N��@X�f[�@ZH"'��X@[�b.E�9@]w-�"$�@_!�*�%@`l@�{�@aN
��w@b6'ye��@c$��,�@db�m�V@e��n�@f���a@g�;$�3@h,1�=/+@i@�n��,@j[��3{�@k}}���2@l�u��"@m��N���@o��>@p"��Z�@p�����@qg=0-�@r�k-��        ?��o/���?�֤5�?�?xK?�l"�?�i@֔�F@g`���@��bj�@ H�a�o]@%v��wѭ@+j�.�@1��&o�@4�4�-0�@8��7� @=�9I��@A?	N�@C�Q��0@F���ф@I�g��7@M)VwȹY@PRs�7)�@R*	�(E+@Te"���@V&ygЙ"@XK4�k��@Z�����@\�G��j@_Rls;@`�i�-'
@b@0+��S@c�{�^��@e	@�<w@f�p24�@h �dS@i��vjll@k0�p��@l�|5�@n��aN@p&��h@qN�|��@q��b�Й@r�*��@s�*��@t��i�O�@u�9��@v�kԍj�@x���$�@yql�bz@z38��@{T�HƜ$@||9��Y@}�j��\;@~�a� j@�
����@��Ĥ{�"@�K�[e��@���z�[�@��|��@�C=�	5@��[�)�@��w9��3@�SX*�+@��.e��@��bW���        ?wҳ�N?���߼�?��t�@�?�mG�D9Z?Ѩ��t��?�q9��p?��Hu�N?�Epe7?�Ƭ;�y?������?�~0�h@U��W@^DT<@�����5@�;z�@�&h�@]�@��:@���O�o@dBS��@#�P�@e�XN�@ ��G�H@!����p�@#Y���@%͢K5@&��cw@(��r�X@*��z�9�@,�We�@/�b{�@0���ޝ�@1���(�@3����@4>�>3-@5��t|�@6���"_�@8)�.��|@9�s�_�O@:��Nt{z@<k8Wi�8@=�GzZ�9@?p�3&0�@@���ǡ@AM�7s��@B2	�1@B�<d�Y@CϿ��a�@D����5�@E�����@FyȢ�@Ge܂S2�@HVBܟFW@IJ���
c@JC�/�G@KA*d��@LB�g�s�@MHR��F:@NR6�@O`H��9�@P9Bۑ��@P�tC��@QQ���?-@Q�ߵ׮        ?�?�l�-<?��x>�C?�f���?�pJ��.�?۳�y�?植�qZ�?�(�uL4�?��1G]�!@ �'��}	@`�u&��@�\��@?@3�I�@�@/y��@b���K@ l�{ @#u�OE�o@&�]huf/@*x�`Ir@.w}�S�@1eA��@3�P��M�@6;g=���@8����@;�	�@>̘��lb@A��i�<@B�?���@D~K�	ߛ@F_�w7�@HYU��@Jj��[��@L���<f�@N�/�=��@P�X�8ʻ@Q�9����@SA�j�Q@Tfx�YG@U���[�c@W-�*�	J@X�^�7?+@Z%s�3;�@[�ϣ�@]NIk	R�@^���R�@`S����@@a3��1p@b'GG��@cױ/1@c��jhCk@d�Y��T@e�"��q@f����[@g��J��w@i	k���0@j KP�@k:�%QF@l\8M�O@m���+�@n��O�I�@o�
Ic,@p��P��>@q-�Xd��@q�+g�;        ?}�3���?�_1�Ȧ?���h��?���dAy�?���$qC?��) �Y?�Y�*"?��Y���@ >�C��@|��U��@��k�@d���|@w�]uyW@3\S6D@8$,,}O@"v�mΗ�@%����!�@)��EJ@,�A�x@0jh���,@2��߆6M@4��uȞ@7l-��A�@:��H�E@<�ɳ��~@?ߒ�w�<@A�0*�;@C)�"?��@D�t[/TR@F��ٛ-@H��f�@J����@L�����@N��X6JF@P�.��@Q��HoC�@R��ۃ�q@T&�}��p@Up؁�ݾ@V�yn-�;@X$� }�F@Y�	�K=�@[��P�D@\��?�~�@^�s'a�@_�L׋@`�h���e@av�|���@bQ+�X�>@c1E�Ae@d0����@e ���i@e�`Pp��@f�` �]@gߡ�l$@h� ҆@i��&�G�@j��+�-�@k���@mK�xlN@n*Ӑ�Y�@oI�RP@p6���[        ?�dP���?�mEȁ?�e��=��?���U��@pƺ�j@�OH�@�mKi��@﮷i�@#����i�@)X�`ğH@/�-h��@3W7�hA�@7<�[�8D@;�d��?�@@3���@B��$L�q@ES?���@H<�\c�l@KX�.)�@N������@Q�d��@R�p�k@T��E֦]@V��y�@YԴ��@[I�;@]�Y���@`��tޭ@aJN=T�j@b�ڵ�@@c���9@e]��d��@f���@hQ�XK@i��/�Ț@kuĽ0�&@m]�m�4@nȨ��>�@pA�@�H@q% `�@r��t1@r��OJ��@s��~D@t�7*@u�'��wz@v�7��Y@w���<2�@y	p��L@z��%@{9e�>�@|Yg��A�@}~�Z��k@~�N�W�@�#�		�@��B���@�$7��5@����qn|@�f0Ĉ�@�^OcF@��_��c@�\Ab�@���px�@��~�� Q        ?{�t���[?���{s?�����DP?ƿmݖ%?ӂT��\c?�/��o?��;f�?�`GN�O�?�1:�W��?�N�"�?�j�S.�@-iX�Ü@�.Ճ�@	g�� 72@wy�Q@���vv@>Z�1�@��ߎ@Y��l��@!<����@ot�%@ ��L��a@"/8�Ӻ�@#���҉[@%��yɋ@'{8Ei�a@)e�8��@+ce7F=�@-t[���@/��Q��w@0�Sl+�@2|��ӄ@3<�Fb��@4u@�<�@5��:���@7e�Y�@8X�v*�D@9���A�#@;��i�@<�RĐ��@> �	iQ@?�!����@@���߬]@AY��1 @@B)V�Ks�@B�k�(�G@C���9� @D�� �@E�L���e@Fz��@Gd2;�@HR�Tt�E@IEo��@J<{�ǻ�@K7�O�Vj@L7K����@M:��Y�@NB�}�@ON��v@P/Q�A��@P�I�}�d@QE>����@Q�,�e        ?�f@3�f�?�Q�Q^A ?�ǖ���?Ϙ4��2�?܄���ۯ?�(��N:?�s�F��H?���z�p@>9�W�@~u���@����@/����@o]kB�B@:˹��_@ KT���@#C����q@&��%�^@*,>�3�@-��lz�@1!�X^@3Y�n�@5Ĺ�~�Z@8ZW���h@;i����@>X����@@��a��y@B.�S�@C�t-�b7@E�\3��@G�{��3@I��!$GF@K�� �@M�4d���@P���@Q*��8@R`g�@S��r�
@T���@@VD��|�@W��pe�@Y��-�@Z��pg�@\���w�@]�k�U�V@_@oe��@`s�8^�s@aMdš0�@b,�r/!9@cn
�M'@c���@d�H���@e�@{z��@f����!@g�:�`!y@h�9�^r�@i��c�@k4��?@l.5QV�@m:�>�!@n^'zs@o��D�d�@pZǗe�@p��燷�        ?�H\��M?���Ť?�4�!��.?�\{aU$?� �QQc?��QDh?�	��˽?�7�ů�-@ 6�Cl�@�}$c�i@܌2*@O@v�����@{o�ݪ@U{�2C@9����@"O�w�E@%_t��&@(�c���3@,U��h�o@0���?<@29�d� �@4ye����@6�d�qT@9k�ۄ$@<G���@>���و�@@��|;�1@B�s6��@D:��:�@E�~b��&@G��h�{@@I���EE@K�5F]Ҍ@M���k��@O�ׂ}A?@Q�W6@R(v�s��@SWŕ��@T��l3�3@U�XoA�@WG�o�@Xu�<�i�@Y�R��2g@[@�e�_@\��O���@^4��8@_�pi�@`�c�^@au����@bH��L@c ��J�@c�r}'��@d�@��@e�􀟧?@f��91�@g��ZG�`@h�Q9I@i�|��
�@j�~��@k�U6��1@l��d��@m�q����@n��W�D        ?�@��]�?����)^�?�;��@O?��ŝ�c�@�(Q��@	J���&@�oz6�@ ��˫p@&w�n5@,0����6@1�PdL��@5Vb��X@9�(P�I�@>'j�)[@A���+ח@DG	z�ˍ@G-p�U��@JG)[ p@M�TRNz�@P��࣫�@Rd���Gn@TX��bN�@Vf�����@X�P��*@Zϱ�+|n@]*��W�@_�_D�C@a�)��@bj��a��@c��Atn@e8Ng��6@f�4	w�@h8{r�@i�\�T��@kj�INk�@mY]�@�@n�K�(@x@pI6�u�X@q1T�Bx�@rt��|�@s�ٌO!@t�j�}@u{?#G@vA�\��@w�)�o�@x0B5��T@yGk�-t+@zdP���@{���+K@|�'&���@}��Wu�@|{���@�$���$@����fW@�f�'�@�
�U0a@��*��2@�\IU=��@�	c��@��� .�@�j��~�@�VRe�@�֭>5 =        ?v�����?��Qz��Y?�p�/b?�֕S��~?�*L�$�?ڲ�df��?�Hc]ˮ�?�d
���G?�V�b�IY?����?�c�� ��@ �`�j#%@�{$n�@rVJ@qI@J"�
C�@nYB�\@�?����@M��;�@���Qv@~�g��@QO��Ж@K`�ou@!60RG+@"�N�+��@$�gXre@&^gẒ�@(>]֞Ο@*2Y�w�@,:k�nЍ@.V�z���@0C��e+@1f(7�l@2����J�@3ɐh[5�@5
�pJ@6V!YMG@7����H@9�!�&@:vG�{E"@;��m�@=j.���@>���@@C�rT5@AD�B
@A�~X�)@B� ��c�@C��.�[7@D���*�'@Em&3/��@F[vQp�@GN�P���@HGo,���@IE_z@JG�{?f�@KO�8���@L\^ꛮ�@Mn>�P @N�)Q��@O�j���@Pa����@P�F��"@Q����P@R!�\r��        ?~�����p?�u�Q�i?��a���?�
���?�q�� �?垄��!�?�afa��?�v\��@ KEw@P��<T(@v�Muf?@J6�B��@Y��@@��X@���@"]f��@%|Lړ�@(�G�[N)@,��" >�@0Mi+u�3@2t�:BH@4Ð�� @7:	*��N@9ؔ0�y@<�}Պ+@?�5Q�@AS�ʄ	�@B�^��s@D�� ��r@Fs�N{;p@HR;�S@JEe
|�@LMlϗ��@Nj4�Q��@PM���@Qqu�o@R����>w@S�gIi�9@U���xS@Ve24��@W�M�<�@YFxH�@Z��{)�@[��x���@]~�$pJ@_���@`N��K98@a�2�q�@a�K@�v�@b��r��@c�N-(��@d���{p7@ev���e.@fd4+��7@gV��^��@hN�=T+@iKRY�`�@jM	(=D@kS��@ x@l_negEx@mp*ă@n��<��H@o�U��Ǵ        ?}��"�V?�ii���f?�|�\qK�?��F/�w?�mp�3�?���=G�?�A�p?�޹+�Y�@�ѐ�G`@�h9T@`�HK�@$���Ѥ@�,�d��@Ő��H�@!> ��{�@$h��)>3@'偮A;@+�xP&��@/�[�ŧ@2*İ8�@4��#��@7)���9@9�l�p�@<ۀh�o�@?�`��@A�w.E|�@C]���^@E0����@G1�ށ@I����@K5u�@Md�<l�f@O�kRD-@Q�����@R? F,7<@S���>�g@T�5�>Z�@V2򅃌l@W��vU
@Yw�m��@Z�&�3Y@\
N�2�@]�m=��@_L1�/i�@`{�*Hh@aV��^&w@b7/��i�@c��	 @dNA�B�@d�ݚ�y�@e���^G@f��lc�X@g�	�S4@h�r�)�@i��>v�@k	�R~��@l!d��@m7�RɄN@nV8F_�@oy���H@pP�[�G�@p�HS��@q�z�?        ?����~�e?͂��E?�!1M�>�?���Y\�@��n)@_�-W
w@��%*:@��,�*@#	� T�@(l󀋲%@.��^ַ�@2��Sߢ4@6��5CI�@:�)�)c	@?n��fX@B7P���@D�r�(�@G�|�8Ľ@J�I��2�@N1T��@P��z�@R�$=��@T�Y��R�@V��ʔ3H@X�'���@[��ݠ@]v�1H�@_����@a>�$]�@b��_�@c����<U@ef~���@fㄆ՚@hm�!fm@j=\&8�@k��l�@m[�Moq@o ���@psр�E�@q`��'_5@rTG�2iu@sN~O8��@tO\4�J�@uV�k�Df@ve	�!�W@wy�ύ��@x�AH-��@y�F����@z�����@|�V@}D�dJ��@~����T@�S�J�5@��#�x��@�-˨|O�@�؜�z�@�������@�7���^@���E�C�@��9��9�@�]�ӝ�@�*�~�N@��� ţV        ?~�F�?����+�?� ��$�?�dx0?�ͅ*�?��{�p�?�9���V�?���</\#?��D2�?�q�`:�8@ �jܤ�@�C�D��@���,�@���||@�nF$@Z�%�`�@�	*��@���Ӌ@	�̍,@Jg(�O@!\n<�gT@#*\̰fS@%�4g��@'	��@)ae�R@+C%TΫ6@-�"׽�w@/�B�B=�@1��΃@2_ɨ���@3��G�"@5 ��:S@6a�NT��@7����@9Cqv�+/@:�q��5�@<P�"�7@=�%���u@?���Rg@@��=��@As���@BSn�VB[@C8|�(@D"�Sd�q@E�"P�@F��`O@G �A�C@G���=�Y@I���I@JU�Q7�@K*+� �@L,?cX�@MC�|��@N`�h�q@O��_���@PT�.�g�@P��U�=@Q���U��@R�R��<@R��8XO�@S]��4�@T ��FU@T������        ?�9���u�?���;>��?���[��?�Lb�B�?����ùa?��.H?�����!�?�g��@�Vw0=�@�W��@�$K�'@��"�e@�^P��!@¥�q�@!�ݢ��W@%{�"V@(�X��@,�SK��@0cL���@2���GС@5#���(@7�����@:���]��@=�Y���@@^�lb@B
�p`�@C�Aq�5Q@E���`�@G�#�6�9@I�k��@K���T�E@M�,]
^@P�r~�?@QPH���@R�$���%@S�j��@U)��m�@V�Ϋ`�@W��u��@Yh6���r@Z�<��@\u��H��@^C�ĝ@_��@��@`��xQ%I@a��7��X@bm�m���@cUyP�@dB�bF�@e5��KZX@f.2���@g+�h�IQ@h/_����@i8T��؈@jF́�"�@kZ����H@lt<��F
@m�1ܠ��@n��9\x�@o�C�xL@p�zYݺ�@q"�'"��@q�`Z�r        ?~�#��T�?��'�3E�?����M?��И�>?������N?�צ�g�?�ג3���?����F��@w�:,�	@%�TW@��l� @�Cf@"���?@���ګ@ θv?J�@#�$���\@'?᰿�,@*�s�'F@.�$`*��@1��t��v@3�����@6q�G);@9ĥ�m�@;�~�\�@>��4.�@A
*S��@B�����@Dn�<7�@FB���B�@H+�<d:@J*����@L>�ѥ��@NhR�?<@PS����N@Q}r�4t@R��n�t@S�����@U:G\=o@V��Hca@W�2.)^@YT�а�@Z�=d���@\D��b@]��ŰQs@_[���@`{t!{n@aM��nȩ@b%K%�I@c�t9x@c��f ��@d�����@e��6H|�@f�+�5��@g��l�-�@h��^q+�@i�WVwg	@j���t4@k�Ѳ���@l�|9�P�@m��y��@nȊ�	�;@o����oq@p݁�u        ?��t���?�UTX��?�B�Z�?�m֧x+�@�u�
)�@�
o"q@���?k@!��V���@'bT��E�@-�_�A�@2�g�9�@6ʌ���@;_@�)�@@3D���@B��LP�@E�,uc�@I��v@L��y�E@P��	@R ��@T���@VBY:�95@X�r[e�@Z��N�#@]uG8�@`
�>�#�@ai��f*@b�����R@dR��
1@eܚDNj�@gt𺛦�@i�fFl@j�d2�}�@l�cb��w@ndy{�O@p!�Q��@qM+L�@r��x3�@s���@t%Ijo�@u7W5Sdm@vP;@wo�u���@x�{M�}@y��+�o@z��5Ά�@|2�.�Mq@}t�#�U@~��yu�@� .�{@��T�@�_|�N`�@�@o�� @��j�i�@�~���+@�:�G�8@��o=&!@��R^K�@���o%�@�M{e��*@����:�@�뉡�c�@��ʠ�og        ?v����?�m��9�?�a>Ύ�D?�Ԩi�?�3k�hh?���D��1?�j�qۜk?�.f�|w?�:?{?�` @���?��nd��@ �o��o�@JC�6$/@�?���9@�hce�@^�a��@`��P@�tb�@k߂"�W@,��|`	@��6V@ �U���@!��v��@#^��b�L@%!��I<�@&���K@(��~�D@*�Cbd�9@,�'����@/�_7�@0�"*��<@1�.>zV�@2�����>@48 �]�@5z��� @6�@xY�@8�r��@9|(hF@@:�M�OC@<Vr0��@=�}MyE�@?U��N��@@q�v�J@A<�~ ɥ@B��U�@B��G�L@C��(
\�@D�
�H�@Ex� ��Q@F^�EK��@GI���1@H8��@I+ۧ�X@J#�G�.n@K�=$��@L�h��@M$<�օ@N-K�xg@O:H�L�K@P%�z�º@P�W�.��@Q=Jc�@Q˷Z��S        ?~�a�ck?�C:O��w?�Z-q�D�?�e���f�?��N�ш�?�����?�?�̪�.�?�����@ j�����@��?��@�Y�K�@�(�Y�@@�*�h�@��P)[�@��=��"@"���%�@&3/�N+@)�Fƭ9@-���5�@0��M@3+�*���@5�:Q��+@8/o�Llu@:����u@=�c� !@@}-��F)@B ��6��@C�`<N�@E��m�e�@G��"ݦ�@I�̵��@K��B���@Mнܦ�I@P	�H��@Q7>�^�@Rp5?�54@S���(K�@Ug$I_�@Va�$D7@W�ߙc�D@Y=�>O�@Z��ӕ@\I�KDz@]ᙜNZ@_�f�t�@`�����@axweG8F@b\UV\q�@cF0Z�.L@d6��P�@e+��\,@f'�9I{�@g)n�O�4@h1,�D�	@i>�$"�$@jR��K��@kl%��H�@l��w-�E@m�.��A�@nܗ����@p�S�0�@p��D��=@qA'�`-         ?{����y?����H�?���gw�L?���eS?ڊ"|Z�?��2D1N?�{��$|?��(�)S0@ 9��r@���G�@�d~�@H>�b@�@*@�@@Ob� �Z@�kxS�@"�O��d�@%�n��˂@)`�;��y@-/�D�q�@0��8�@2�7��@5A��h�[@7�F�= 1@:��vi@=cD����@@7D=�@A҉��0�@C���6[@EJ��G�{@G'��Ѧ�@I�]n�@K#�^s,�@MCj���v@OyL'($�@P��HC�8@R!�8;)@SP��-�@T��B�Qt@U�i��@WJR�{k@X�����@Z(���q�@[���'S�@]4�M���@^�~�-�@`6����@a��4�@a��)P@b�*¯��@c����1�@d�Rp���@e�`�@�m@f� $;P@g�m�,�s@h�iR ��@i�����@j�As^@k��C�C@l׉{�8�@m��Џw�@o+N��@p$*�dRg@p���i�        ?�}���t?�^L악�?�bD,	��?��A��(<@Z��?��@4m��6/@�E���"@Rj��		@"�j8@'1q�~K@,��:�e@1�߂tݮ@5R�p�]�@9C�['�@=���@AP�U#F@C��s��Y@FHQ�o�@I#�c�si@L,�_�\�@Ocp`�3@Qc���@S,�-�p�@Uz��gj@W���*@Y�a�Y�@[2���W@]l���*{@_��hx!�@aF���b@bOD�H�@c�/jni�@d����@fJ���S8@g�Օ���@i'�ܑ:�@j�[����@l/un4��@m�
����@oa@(><@p��@���@q^���@r<�)!#/@s 2�4�@t�A~�l@t��N�4@u�}$�%@v�-=H@w�|��@x�B
�h@y犓��@z�?s�@|���H�@}���9@~5�6��i@U�J?�5@�=I�M~'@��'��"@�ip�@���l�@��.��n@�=�.c!�@��b8q�d        ?}����8?��~�f��?�4��=5�?�3��C�~?���|��?�q o�ە?�����a?���	��?�jܯI��?��pq��)?�{9���@{��	�@^.�@	��`��@0(��x@O��\Vs@�i�~@J�:�N�@�c��@�|�@�|�D�<@!$.��@"�ޝ�Ύ@$~Y�{\^@&R�G�@(:Me|4@*5�AB �@,Dv�/�x@.f���V@0N ����@1r��R>`@2��v��@3�(�@5��c@6c��}@!@7��9y]@9����@:{�4�g�@;�Ǧvp]@=e�^��@>簪7�w@@9�J+�@A(7i�@A�ЛUD@B��R�l0@C~��8�>@DZ�j��@E;�j�ۯ@F ��4�@G
cK��<@G�B~���@H�s��o�@I���]�^@J۸2(�@K��1*5�@L�.�ZL@M僓o�@N�/��rE@P ����@P�}e+�@Q�����@Q��!���@R4��e�        ?~K�����?��!:U�?��c`2kq?̉��A�s?��:1w�?�#��a�?���+�*?��b5[�?�b����@���&�@
� ��J|@㺝�d�@�[y�Cu@b�b��@o��66@"�h��@%2_�@(�ז�1@,/�9�z^@0-C��@2>\Q�v�@4� ���@7	�v�@9��Y�@<v?�,��@?mh*r7�@AG�qT�@B�O��_�@D����,@F|�[��]@Hd�'�|k@Jc=	S�g@Lw��Dɶ@N�W(�o@Pq�$ v�@Q�k�|1@R�gx�5�@T�$�%@UdA���@V�/�Q�@X!~[���@Y�4ĘZ�@[Z�	�@\��qvzP@^%��_�@_»%C��@`��e�;h@a�_ybe�@bp�ּ�@cV�t��C@dB�3�L�@e4E��Ui@f+�*f��@g)g��=@h,��gN@i6$�F�@jEe���6@kZ�*��@lu��CJ�@m�ػ���@n�����:@o���]@p��W�>        ?�~�_%��?�р��?�c�g}�?�r�6 �$?�|��p�:?��ӌ��?�1&x,/2?�NW1��@���y"^@��	�O@|U1s�@�	�P��@M�A6�@o�Xk\@!���k�@$���H@(7�`ʢc@,���u@0j:��|@2IpVl�@4�5��@7;ѢLBi@9�
P�7
@<���b�@?�%�9@A�=�lf�@CK�.\��@E:���%@F�!�-��@H�T�S�@J��LX�@M$��S�@O_��2��@P�x#���@R47���@SKO��@T���L�@U鵧�IS@WI���#W@X�I�r:_@Z)���C�@[�i �9�@]5�[t�U@^˸c���@`6;�b%@a�@��"@a����@b�C7#�*@c�ذ/+}@d���#`�@e���b��@f}	/�}b@gw�ry�)@hw'(���@i{��
�@j���ay�@k�����@l��,7@m�e^F@n�Bo��o@p���!{@p��`�C@q,B�95        ?��R��Nc?�-z�B�?�8�`C3Z?�~7���@�0L+�@t��X@��:I�@"���\�@)
�Q��@0���i}@4�}�@8|Ar]��@=q���"f@ArԠ̮[@Dl���@G��F�@K!@����@Nܰ�:F@Ql��Y@S�Z,2�@Uʶ�Z�@X*��@Z�@Z���h@]L���x@`Í�#:@aw�%�t�@b��3�y�@d� D�i@f+���`�@g����@i��%�Í@kp[�z�W@mQ��L�@oC�ɠ0@p���S��@q�>�K�i@r���=@s�]���@t�����@v�0ǖt@wL��f@x��A�!@y�a����@{�&j�q@|Z����:@}�ce�]�@��u�o@�:���c@��C�)�@��F��%�@�j�+�Ӹ@�,�B��@��ѧ���@�����g�@��өm�@�[<��N�@�0.͈�@��@�f�@��5�	�@��EpX@����*@��mZ�8�@�{�E�pG        ?~g��r��?��9�?�3�N~?���z�=?Ԣ�����?���v�/�?�ڻ"~�@?�#&94?�b\2��+?�߶g4�@ ǿ���@o�$>,�@1H��@HՖv^�@�d1E?@=�qC+@��żF@�J��=)@c�����@pb_�B@ S�z�P@"�>�z@#�����@%��P�ܰ@'�dׇ��@)�})��@+��9�/�@-�/0��@0��=�Z@1EL�oy�@2}k��#@3��b/�@5%
�-�@6d�*_O?@7�v�D&m@92���6@:��w��s@<){`���@=�,���N@?H��z�M@@s�i���@AH]~Ӷ@B!�#��@C 8��'*@C�A��@D��GI�G@E�/#&�x@F�_�ɽ@G�|��%�@H��[l�Y@I�v�n��@J�TM�@K�T��@L��^��G@M�lDk�@N����@P-.���@P��̓��@Q+�R���@Q�^9�/n@R[>�uN�@R�����0@S�#`�        ?��
b�s�?��s;2�?�ʛ�Ѹ ?�f�_p�?ݯ���?�%�j)?�6�&nU?���@���@�z2���@}JS��@4���@� ���@i����@h��e�@ �*R��G@$M#P?�@'{V���8@+1�����@/:�8�{X@1ˀ�:9@4#���\w@6�Le��@9U����@<0Z�=�@?6��q~@A4�\Z�@B���M@D�ħ2D@F�u�z��@Hz��S=@J��~oG-@L�J�H9�@Nܣ� �@P�]��4�@Q��s��@S�\�#�@TN�̑�K@U�FLyt@W%�ݹ�@XnY����@Y���<�x@[f�%��L@\��.;�%@^�#�_�@`�7�@`�A)}�@a�B*��C@b���|@c�	�-^S@d����V�@ex"�
'@fq
[<F�@go�2:�@hs�$���@i}��VQ@j�A�"{-@k��R%�@l�/sJ@m����:�@o N|�K�@p��pF@p��}|�@qH�:���        ?�1D��u�?�)�Bp.?�9�2���?�h�	�.?���C�Y?�~	 �0?�a��]�@?��u	��@�0J��@
$*���@�r���@��3o�@���t��@jo����@"�v-ym[@&&�ɢ�@)�H��0Z@-�q��U@1)h���@3�^�٦l@6�J�g@8��k��1@;���t@>��s ��@A��=N@B�.�;N�@D��y�R�@F���9x@H�r0h@J�)���@L�.��q�@O'��q@P�:��08@R��F�@SO����@T�?��[@V
�>��@Wz��2}�@X�lo��@Z�M.jR@\��H��@]�mb��~@_e����@`�C��Kn@as����@b]� ��Q@cN�@dD��+�@eA[�G9�@fDg�O��@gM�A��@h]O,')@is'{���@j�?�U@k���if�@l�%�
��@n�1��@o=竏J�@p<��R��@p�3J���@q���w@r'��.�D@rѡ�(�        ?����I?֔	ڧ??�5�T���?��
j�g@
aO�;:@��.�@�.�6\�@$`�� �@*��� |@1/p����@5m/c3�@:+��E��@?k�W�b�@B�{�U�@E���d��@I w���@Lȁ���@PY���K�@Rpg���@T���1�R@W�����@Y}��@\��  �@^�m`�m$@`��t�N�@b]����@c�fb�F@e��F�i@gE����@i򠐞%@j݅4�{t@l·�Z"_@n�{��9�@p_a�8&l@qj��A�d@r~P�k>�@s���Y�@t��?n�y@u���*��@w��-a@xZ=�}@y�wa)�"@z�1_�@|>�M�-F@}�>��U@~�w���@�5��#N�@��ފ���@���|��h@�o�Y�X'@�5�B�@���|2�@��A���@���2�+�@�ts?�O�@�M�s\p@�+1�`2�@�\+Xf�@��^:��@��3uU��@��׳r�]@��G I��@��}�q�Y        ?v�l�t��?��~w?�V,9��?�qYXP��?��G�\\?�84__�?��h�IOu?���V�u�?��R�A�?��E<>�~?��fYj@ �=zx@��k� �@Ov���@,���5g@X�KQ�@�G�>��@O�-c�u@�)���r@�X��@oe)�:�@tT��@!P�H׻@"���:�@$�[/Nz&@&��e�ՙ@(rU��D@*l|]�T@,z�>*8@.�g����@0i�E��s@1�A�4y@2��ud7*@3��Nsތ@5:���c`@6� #��@7�%�_5n@9@ԇ�@:��5�	J@<D���!@=��"&��@?%~i2�@@[��}�@A)$�g��@A�~�{��@BҐH���@C�N��B�@D��| @Es����g@F] ���(@GK��ه@H=�q1�X@I4l��!Y@J/��r�@K/J��@L3<���@M;z6�@NG�鳽�@OX�[&@P6�H�>@P�`8g�@QQ���w�@Q��'��        ?)l<�rP?�wxR�#�?�t>i��?�Q'��`c?ڗ����r?�̤B}+?�bѵ۩�?�n�3J"@ *�)�@AR�8j�@a�M���@=����O@L6�a��@�Ym=vq@Ӛci�@"\���P@%�O��S5@(�J�Ln@,�����@0_u�4�@2��}f�@4�Saz��@7m�h�@:�Ϡ�@<�y��@?�'
��@A��'��W@CE���A�@E�<ML@F�݊\��@Hܲ�cy@J簄� @M	�b#M@OC�2�|T@P����j@Q��;�]@S?M��<*@T���k�M@U�^Қ@WG��l�@X����v@Z40A@[�]k�w�@]P�PϨT@^�ׯ�2�@`N����@a*����@b
p�(@b�I�B�5@c㜅��@d���Tl	@e�h@QW@f�⟙�\@g�ke	@h����@i���Qs@k`���c@l0'&��@mT����@n呈�Z@o�ݸ-�<@ps�Q��m@q�.��6        ?{L��T�?�����"
?���n>�?� iR�N?ڣ�u���?�؏!��`?���]��?���#l�4@ ^D�|e@��(�\@���\�@��.Mw�@��
���@��[�\@�3L�@"�/��@&9AL��@)�N:�.�@-�+���x@0�Dr�t@3=y{qg�@5�캎�@8NH��,D@;+-hl�@>'�r��@@�c���V@BEDޝ�@Ds��V@E�(L�W�@GϗK��'@I��-F�@K�f̡�@N1 ϶�@PA$MMU�@Qv�7@R�;f�F�@T��Ƶ@U_"�s[@Vŭf�F�@X8�&}�@Y����wG@[El�(3J@\޽M�@^����G @`غ@`��:b�U@a��v�Xn@bδg�"�@c��} �3@d���~��@e�� YX�@f�'d���@g�,�@MU@h���}�@i����@k�O�@lC�H� @mq���z@n�����J@o��"���@p��};�<@q3�Ə�@q٨���        ?��b���y?�=8�TLv?�5���}?�rD_��@,�8&��@
�_���O@�6��E@9���H@!��F�@'"����@,�N��ǈ@1�!C�b@59�(Ԫ@9+�$F&@=y�>b@A0�m@C�Ω�7N@FHDz��I@I)�-A�7@L9�I3<�@OyV,��D@Qs�Q�@SB�P}L@U)K)���@W'lu�f.@Y=7����@[j��a�Z@]���(@`_��o@a@�)V"�@b���+@c��	��@e6��Ll@f�,8A�@h���$@i����0@k#ozz@l���覲@n_���i@p�E@p�h�	@qȸ�\S�@r���P�@s�m[ϝ�@t��;��@u�����*@v�C�w9�@w�aٕ�@x�[3�@y�2�>ۦ@z���mi@{����2'@|�~�,7@~%p���)@P��#��@�@��)�@�۴�x�C@�yVM���@��``�@��p�Z�@�a�B_M@�	�E�4\@��bo�G�        ?wo%�)F?��k?Y?��A(�C�?�D�\8F?ёƇ�e?�^�P�_?�ʼ�[L?���Gީ?�ԧ�?���4�?�6v��I@)� ���@�=����@4.�'@0�w[*3@>�*Xo@�\ð�s@<�l@���"��@kJCwG�@[�!#��@ :/����@!��ӗԽ@#���A{�@%X��S��@'6f]?Y@)()�r@+.8��i�@-H�G�A@/w6l���@0��(��@2��I#�@3>Yi�`�@4~$�7��@5� '��@7����@8y�,���@9ᬊ��.@;S�s,F/@<�A���J@>T��2��@?�Z��ݞ@@���N*�@A�O��[@Bf��t��@CA�%�@@D!�@4��@E���P�@E�)����@F�w0B�@G��;�@H�<y9��@IŦ��A�@JƵ����@K�a��x
@L֠\��@M�f��AS@N����@P0��s@P�@�z�W@Q&��3�@Q����U@RMz���J        ?������?��*�$o?��ӓ�t?Ϸ�P��L?ܵ1^?�W�M�\�?���IK?����%d@+�g�3@��|�6�@.��X+@W��I+i@�^�N��@s~�3d�@ lW��+@#i�K�pT@&�(�a��@*J�& �w@.2#�y��@15��@3z*\�J@5�Tr@8�2�H�@;Dr,�@>1��/Q@@�{���@BF�����@C��c�<@E�#7 F@G��*V"�@I�N=@K���M@M�N����@P�7��@Q6�\/�@Rj9)�$<@S�v���"@T���#[@VIK3�#�@W��L�2$@Y�$���@Z�_"��@\CN$��@]�=���@_3LO�M@`k6&rF@aBM���@b�[��@c�?!g@c�j��@d��g�_[@e�~����@f�����@g�=��@h�Q��a@i���/�Y@j����W@k�I�t��@m(���@n"u_�'W@oF-_�9L@p7�`Z9Y@p���k        ?{���H?�]�oF.?��f��?̚���#�?�����?�]�\�?�2kw'��?�4�L�h?��&����@���Kp@3 ʶ�@!�F�@*��V��@��v���@�-����@"=F'[��@%Yо��@(�˓�I�@,s�B�b@09��cw@2`�N--�@4���Ur@7&8Y�RD@9�\=�J2@<�F�`}@?~D�?�@ALMD�@B�A=��D@D�~f@Fp��x�@HQ��`"Z@JG��ux@LR����@Ns����@PTH�0�@Qy�`4��@R���O@S�K�<Hz@U)�Sa�{@Vyv0�>@W�����@Y90=�0@Z��42�x@\#/i� @]�8��@_7���z�@`h�uS�@a;��M@b��P)Y@b�R[��@c�M�A�@d���N�@e��dJ[@f�w�e2�@g�6�@h�ߒ�@i��M	�@j�?k�9�@k�u��ܜ@l������@m��s�@n�]5���@o���3�        ?��M���?���xE�?�蚈��7?��GVc�@v��k�@�'�@J!�ګ5@ 
�UUx�@%5͊��@+)"8��:@0�.$���@4���!p�@8�0�ᨻ@=s����c@A6r��@C��}?��@F˅���@I�c���@M1�S']@PY�MD��@R4�z���@T* �Kp@V9�ڭ@�@Xc���t@Z���9+�@]�w@_�/ �%@a	�]�e@b`�K��@c��~>c@e6�����@f�\�=��@hA��ں�@i��c�ư@k�����@m5c*�N@n�e��q@pbE�|��@qO�Q;�g@rD�z��@s>��_�>@t?�n%�k@uG�e���@vU��Q��@wj:[�^Z@x�,�My@y�}�q�8@z�'��b@{�!�x'@}0d/�:@~j�7"�@��tiL@�y@��2@�ī"��@��T�8�J@�u�::$@�%����?@���N�@������@�F)��7@��T>aj@��嚝��@���݀        ?w@˓��?�xd��J?�*:`�I?ĬS���?���.��?��=j��s?�8!!}X�?�,O8�?�6c)O�d?�2�C��s?�ϵ&��@��3�ʥ@��+�@�#���?@�~�)@����,
@��giQ1@zu畅�@)�"�[�@P[ɹ@�!�W�@ ��G�L@"C����@$��77@%�|��p�@'�Tݏ��@)�v�z�@+����;�@-�p￠@0x���@1F��B�@2zB\���@3�H��@5 �}�+@6S��}�@7����dY@9M8U�'@:�7V<m�@<u�_Q�@=����@?�9˺Z@@\~j��y@A/-'?�~@B�3e�@B��{+T�@C���	 #@D��#�,@E� �r@F�)I#��@G�Z-�5@H{�����@I{���Щ@J���A�$@K�/%��@L�\�wɠ@M���c@Nǧ���@O��,g#9@P�n���@Qx$&k�@Q� 'Y/@RH��M @R���        ?�M[��*�?��mq��?�x��$~?��+B�0?�.����?��Oa��?�T�*�~?������@ �c.�P@h���{@��,VN
@#���õ@cH^�@.����@ EZ�83Q@#=ߣ^�=@&��<��#@*P�5@-�O����@1�c�{�@3W)���O@5��J@8X6�Y�E@;�S��@>M'x�-@@��Q)f@B,xR�
@C���@E���$ @G��[\�@I��9��8@K�r� ��@M�v�g	�@O��J�@Q"
�T0@RU`1�O�@S��*��|@T�z�sWq@V2C��OA@W�7 ��@X�VP�z�@Zs�Z"S@[��)�@]��.sJk@_�%>�[@`^P��L @a5kw���@b�5@b�hn���@c�J�l�@d�Į��@e�֍`@f��Og8�@g��AF@h��H4g0@i�DF��@j��?��@k��~a4@l��mLn@n��l�@oDa�s�_@p7�'	�@p�!%�TZ        ?zQ��t��?����d�?��QT6�?�.#8VN?�ȵ+l.�?�%sB<�;?���L�n?�����N?��\��*�@Ŕ�@$�@��@�L@.su�W@�b���@�j�&��@"P�Y��@%v���*L@(�^F��@,�}b/@0[����@2�M���@4�ӓa
@7d����#@:�v�X�@<�ݼ@w@?��s3�@A�{�j@C0��h@�@D���4@F���@H��_t@J�<���@L�l�!�(@N�qJn�{@P�+�5@Q�}�K�@R�����Z@T>���K@U��~�%�@V��mA@XFS���@Y�"�8~z@[,�u2��@\�����@^?Rf��B@_�蜓@`��U�Ӑ@a�\����@bsr%@cU�"���@d=��.�@e+ �J��@f�_�@gn�a-@h��d5@inlU�@j�;S/@k)�� �@l;�Q��@mS)A��:@no��)i�@o�W^�a@p\G_
�        ?���`���?��<|h?�*����?�N
�b1@{0KF�@��z�l�@I<��R@�P� ��@$b�q�@*'d�Z�b@0Z����{@4�lL�&@8�o_TP@<��)O��@@��o9�@Ca�`{@F<���C�@IL�I��@L�ր�@PcB�;@Qކ���@Sу�(�h@U�i��T2@XG![N@ZL(�s@\�UQ(>@_%���@`���p�@b5#[%tN@c���7�@e�]�\�@f�e�=@hn���e@i��pCMa@k`ȑm֗@mo�-@nکv�5B@pU�z-�@qD�s�K@r:��.�c@s7�O\�@t:��X@uC��(�@vS߇�� @wj�5nB�@x��t�}�@y�Ð�kd@z� ���@| ��|�@}>`U'T�@~|<L;��@��x�ݚ@����6b@�.T��A<@��5����@��T���@�;����@��T�s�@��9ej<@�fb'�ɓ@�%�Y�n@�芳~�@����x�M        ?��37�?���)q�?��2��k�?Ό[!}?�����?��ܑ��?��:�M?�psl��{?�b6^L�@ xó8�@���$+@ډ6Hs@��]ޣf@��I�~�@x���0@Z4fFer@m��W��@��U'i@ �Cߴ@!�-# %@#�&߈�@%�p1�a�@'�N!ଽ@*4�1�@Y@,�JuXM)@.�!�L��@0�����@2݀��@3Y����@4�F��@6,Sy���@7�>���@9-����@:�����T@<]��r>@> C�<�@?��$>U=@@���?�@A���� @B��=�&J@C���RE@Dx"��%�@Et��+�@Fw`�sV8@Gu�S�@H�%C�G�@I�f�4��@J�3����@Kׄ8^�y@L�Q��^�@N$�@Jã@OSG��u�@PC�[���@P�l{���@Q�E�E-@R!�B�T�@Rƙ���@Sm����@T�Dģ�@TĎ�֝X@Us�tN��@V%�����@V�K�_��        ?�����?�I�	�7�?�QAm�K>?�QFm�?�;�<>�?�QŹ�tp?����r�?��Ȃ�B@}�G>��@c��J��@M�صo2@���{)@/'�r@M��Z�@!�7��@$���7�@(!]�u��@+�+��y�@0��I��@29����@4���@�@7'�ŏ�[@9�@Ѥ0�@<���@?�m�OU�@A�_��0�@C8��{@E�r��@F�_��@H�XԳ�@J��6�5�@M�FHd@O=fṟ�@P��g�M@Q�E�D�	@S5��
�n@T~�D�9@U�j�o�@W/����G@X�F$�V@Z+d��@[�*]+�@]����@^����@`$����@`��Q02�@a�3si�D@b�ˆ���@c�����m@d�ĳ�m�@erl�@ff�L&�@g`Th��
@h_+��cC@ic]�&@jl'$Z�@kz:�!Vb@l�Q;i B@m�b�BO;@n�g+���@o�V�r�$@p���N5r@ql*��        ?��M�2?��\�H?�
�%�j�?Б��!�?��U <�T?�^�D�T�?�_O��x�?�4,zM�@��0�(@��/�=�@j�:c�_@�P�@�p�jĜ@��]�}F@!*#���@$5��p�@'��5�d@+\�\�Ay@/k ��S@1�|N4�@4A�qk(�@6�!f�Bz@9y�a��4@<V����@?_���H@AJ�[$X�@B�j�`@D�:�@F�2�#;@H�F�Ξ[@J��nN�Y@L�!q/#@N���Ա�@P�C]��X@Q���u�@S�h���@T] �#L�@U���)�@W��%�@X}M�E@Y���|@[u�4�ҹ@]�Af��@^�&�wV@`_��\�@`���į)@aӰ)X��@b�'�2�@c�!��@d��j[�@e~Ŋ��@fv���^@gt�#���@hw��۳�@i�,���"@j�����4@k�]@{�@l�w��>U@m��ZU�@n��}�Q@p#��i@p��� @�@q@��n�"        ?������~?���G��T?�56G,@?����@bJ�Pޭ@0[�x
�@�>Y��@$����p@+v��?��@1�T 3@5�z�W��@:�Mq�@?��,�|@B�Pc�~@E�R�p�@I7���[�@L��	�<@PV�x��@Rc��։2@T� �F�@Vی�9�@YF5Ķ��@[��y6G�@^x0ي!�@`�����g@bJ�9�B@c�"X��f@e%����@f����$9@hs�)F�@j1���@k�N��@m�&q��	@o��v\�@pܲG�!@q�ςe{R@r�oY@s�o���@uݙ��@v3R}a��@wYćG��@x�)ġ��@y�w��\Y@z�� �>�@|8�)V�@}�mg@�@~����2�@����͜@��w��D@�s��@�(�0�L@��\[�-�@��/zް@�\�=�@�K\�]�@���^pڴ@���;�.�@�x{�W@�G��H�@��FJ@�ﰬ�h@�ȅ2r�_@����&��        ?}�
~{�?�H���~_?��`D��?Ȼ\M�	�?�2_%�H+?�\�#M��?���V?�����?�������?��?9y4@ ~��l1@�R���@鲾^Qw@'��.f�@`wn�	�@�	-��>@��Ϳ[�@Z7Ic6�@^�\��d@��sI@ ��:@"�M>1@$�s��y@&�w�J��@(�N$�'�@*��X�;@,�@���@/KF�M<@0����jL@2�ڛcV@3a����z@4��!�!�@6����@7�sQ�~@8��շ3�@:|�`%@<
ly킣@=��rd:�@?FsGY^�@@zn��k=@AW����@B95��I@C �k���@D]UТ�@D���?0�@E��h�@F��L�<Z@G�K��@H�l�R�@J	�C>��@K��r��@L2��'�@MNgK��@NoQp?��@O�:'H��@P`u�s�@P��"@Q�K���@R/��K@R�DO���@So�&��G@T֥\��@T�0_3I�        ?�gx�=�]?��}���^?�e�fh?����А�?ޏ�ݑT6?�"���?�"T{�?�`��#��@�df[�[@�]�(�p@_���Cg@I�%�O@r*��3E@f���b�@ �(��K@$ǚߜ"@'dzѹ�@+�*�f@/�[�@1���_�@4�l��@6~av�c�@9&��ݯ@;�,c���@>�4ZȎZ@A�8B:@B���_�@D�CtC@FX�w?��@HH4�W&Q@JNRw"^�@Lk2tOȹ@N��+�M@Pt��Qi@Q�u{��X@R᨞�7Y@T)U�5@U|q[��@V�&���O@XEL��E@Y��M
%
@[<�dC@\�ŝ*Y@^`��"&E@`SG�w@`���.@a�K�/�@b�j'��)@c�HD��7@dq��[t@ef>J���@f`R���@g`�b�@he���2@ipܱ�u�@j�ǃ���@k�a����@l��&d� @m֚]��)@n�2�W6�@p��`E@p�&�q�J@qKd쓿H        ?~�@��?���d�(?�V&�E�?�V��4>�?�\�!~�?���T��?�`��y�?��2�	�@ ��kՐ@abW��@ƄbB�s@�_�W�@N_}��@ߣ���@ 2���S@#&S�w�k@&f�� �@)��I@-�意+k@0��P�@3?�Þ@5���N��@8=�Y0PR@:�{�ݒ@=�k��d@@~��Q@B�&p�0@C��Z]��@E�N2��@G�6Pt��@I���9J4@K�Ν�i4@M��쎍@O�d�B�@Q'��g�@R^C�W�@S��_@T�LYP��@VF\�G@W�j��"�@YH����@Z���.;�@\�����@]�*�r@_M8�ғK@`{h�x�@aU�*���@b6Kˀ@c^��
@d06ܠ@d����H%@e��dI@f�G��@g𳷐d�@h�xH��@j#�jZ@k�5�@l44P�)>@mS-�$�@nw���1�@o���@ph�0af�@qj (x        ?�X����?�H�Ƶ�?�J�H��?���),�@��b;��@}[ˮ@�}yWP�@"M���@(x����@.ƹ"p;@3(暲�@7_M�x�}@<`�̌�@@��j��@CW�Hk��@FW�L��@I�� � @Mq�3�@PZ5�)/@RM��߁@T^��~>8@V�}#��@X�����@[>���	@]����!@`0��F@a�E���G@b����:�@dv)��͉@e��n�p=@g��F��@i9q}9�+@j뜝�@l��]Dť@ny&�{@p*.��<@q�8���@r�=Q �@sNiFG�@t#�)��@u2~�8ua@vG�n��B@wc���@x���@y����@z�
q���@|�؂�@}Oa\
�u@~�u���@پ�P@���4��@�>]LK��@���$�@���C��@�O8
��@�n!��@���:�5@�z��`��@�9����@��G��r�@���:&��@��W>�E@�Q�� �        ?���6���?�C�t�n@?�
��H�?�:I�^?�N� 
m?��_)�x�?��al�>�?�{@�*?��,��4S?�%�Ǥi�@
LF��\@�(�(�@
��R@�spLQ�@��v�&�@��g�[@p	��<�@�����o@�gg�@ ��E�$�@"sxM7�@$_�\f��@&dg��n�@(��u��k@*�!V�@-+�q��@/k���P@0�G.��@2@꼞��@3�����[@4����F�@6l�� ��@7�/�\�@9q�>��@;�}�@<��Vπ�@>U�5�M@@s4���@@ꍒ��@A���C?�@B�^�״�@C��@D�����/@E����@F�a�D� @G�ٿ[�?@H�wJ�@I�X�HiM@Kc,��@LE�a��@Msx��H@N�˫��g@O�|.
�@P�w��H@Q3�|�~�@Q�7C11@R��o���@S05�,i�@S������@T���I"	@UH�g�l@V۞�5@V���        ?����k��?�,���J�?�5���4M?�.;��ڽ?���vF��?����2?�፜��(?��}���C@ZIкT%@:) j�|@�6ҽ�@�/���?@��s@9�q�@!z ��@$�)�+@(%�8�5@+�T�P�@0�w�մ@2O!�]�v@4�žM��@7SuQ%α@:��nW@=�����@@/Q���@A��e�Yv@C�fV���@E^:0Zj�@GP|��d@I[]>���@K���@M��p���@P�i��@Q@E��j@R��a���@SՊ��[�@U3h�CXE@V�,�;"@X�qQ�@Y��aN�'@[,\$�r�@\�,�I@^wj���@`
$�9�@`���+�@a�o���@b����g@c˼`�L/@d�����@e��\o@fח3�9T@g��N@i j�£@j�� W@kC�����@lo�ђ�@m�	X�&�@nٟ���@pbdN��@p�<����@qU]�B�E@q��'��(@r�r�`��        ?�hp�+��?����W~?�#vlc�?�(��,�?��T
�q?�k�m�?���	N�?���Ț@>Ԃ�Ys@O�fW�@ۭ!@[4o�@�qgy��@޸ /�@!?[E`�@$\Si�"\@'�,�w�2@+��m�&@/�5'��@1����-@4V dj+@6܍t��D@9�v���Y@<lT�oli@?v�[1ݖ@AV�J4(6@C����@DѼm�Ot@F�q���m@H�+u�<<@J�
k1@L�+C]�]@O�c{��@P��a)��@Q���ܠ@S-1��J�@Tz����@U�	)ʸ>@W9V�5ˣ@X��d{�@Z'���[�@[��L�v@]FMZ��-@^玨�(U@`Jk4��@a' \@b	�<\1@b�pHg�@c�&U��u@d��[M��@eС���@f�e��@g�,�D�@h���oA$@i��^�]@k�M�1@l/m�D.�@mTG��L@n&'WuG@o�	pAe@psx�yS)@q��y�@q�i��|�        ?�	�PD"t?�AL���?���f0�@�4��D@:�v���@��I�s@ R]�8�@&UO�A!@-^�]��@2�
��d:@7I�5��@<`�$d��@A ��a�E@D��=@GppӘmM@K����Z@N��7g�2@Q�X+�` @S�'��{"@V)?�DUh@X��^�@[ME�ODl@^4�Ϡ@`8��*@b)�@c�v�=@eH�A��(@gT�P�l@hѮΑ�z@j���@l�x��@n��^U�@p[. P@qm�\MlX@r�֒mП@s�Ҟ�W@tٛt���@v6I�tE@wM��	l�@x�艑�]@y��t���@{=���@|�y�A�G@~	�j�@|��B�@�|XbB�@�>���(l@�!�Ų�@��̌��@��AJ�k�@�r���G@�J�%Z�@�&��Cj@�y����@��Y��5@�Ջ�{�@��ۍJ�@��ꘆ�@���]3�@�����ˏ@��V�9ą@��i��@���b��>        ?x _�s[�?������?�M���Ye?į��t�?�۶V3-�?۴���?��U^�Rc?�>�O���?����c��?�����ܕ?�@۶d�@�H��@R4(K�@�pHP9	@�j�ڒ�@�f'G�@1�"�/�@�ƻ�m�@�s�@�S�@�隦��@~8���>@!JjB��@"���V#*@$�:0�@&X�{I�@(*ϡg�@*T3Ni@,�����@.�]b@0���@1&O]@H�@2C+�mɒ@3hU�1@4���%u@5�8��@7�q� �@8NJPqU@9�����k@:���Ӯx@<M�)���@=��tZ��@?��"ȵ@@IM�0x@A�	HŊ@A�UJ� �@B�dEU>@CV��@D"z!�l�@D�u���@E�2*2M@F�)_��@Gwϧ�!Q@HU�Ʒ��@I7��C�@JwzW@KſO�l@K�`�g�@L�<N�@M�M�}�|@NƉ}���@O��� �u@P],rE�b        ?���ݹ�?�p�!0��?��Hb�@�?��61�
?�H�^�?�-=5���?��U?�L�̽�0@hk2
�[@&vv�3@�8�S�@�Xg8�@s��OL@�����@!/�;!X@$g��� �@'��o��@+�$v���@0۽j�@2_�J��@4�;�'�@7��&7f@:ps%�@=��5-�@@d2y�@B Oh��@C�Y����@E�zqIQ@G�����@J��;@LU����@N�|󝛂@P�3|�CL@Q��r6�@S23�?.@T�h�q@V�g��J@W���^��@Y�����@Z�-��@\]r=��?@^ ��4�@_�����@`�:W��@a���G�@b�6����@cē^�/2@d�6�8�@e�%���:@f�ep�9'@h��b�@i3�'�q@j`5op��@k���F@l��uk�@no���@o[T�+\@pVSp��@q�#��k@q��Y�l�@rf�ɇ�@s,�
@s�r�4�        ?}	�U�6?�	���??��g��8?��y��!?�#�ͦm�?�<���'?� ��t�,?���"L��?�)��P�@���_;�@
sk���v@�DU+N;@}���N@��U,@�l����@!�^\�@$���O��@'��?@+OrB�o@/��6�Y@1���?'�@3�zw�@6#�'��@8�x�ka@;B��Q,h@>GyB�}@@|��K�x@B7��`�@C��t"Q@EUoC �@G��q�@H�0X��@JذA(�
@L����U@N�Mʌy�@P�"��L"@Q�s�MU@R��&�@S��M]ɬ@U#� ��9@Vc:,h�M@W���a#@X�0�#@ZW|KԘ3@[����N@]'L�J2@^��{8��@`L���N@`е��@a�z��-@bd����@c4��w�@d	���wD@d�y���@e��j��@f�_3כ@g��/�Y�@hp_w5i@i^7%q�Z@jP+){Y�@kF5f��e@l@O��K@m>s��.�        ?����q�?�}g�`�?�aV�I��?��68Z��@�m�@�y��`�@�����~@�+v��@#�~g�r@(��0�].@/ 2#��@2�E4�Un@6�;��;�@:�/���t@?t5�''@B)��ȸN@D�+��Ί@G���4�!@J����!6@M�W�*3"@P�"e��9@RC�ؽ}@Tl�M/q@Vr�5�@X
�h���@Z#k=��B@\Q��8��@^�?�7@`w����i@a���E@b�d��z>@d<7�N�5@e�.~e@f�'����@h\_w8�@iϠ���	@kL�Sӵ�@lӬ@��O@nc�x:�g@o�w�;i@p�'lmA]@q�,�[P5@r��-60�@s_�j!�@tC��$��@u+��&~
@v C��b@w		���s@w�O�_�d@x��E�r@y�ɁF�*@z��3�@{�<ߘJ/@}�����@~U��@*�̆@� _��ɠ@�����R{@�=��(�@��Rr�n@�a�����@�����r@���4���        ?~�U�o�K?�Ɗ�)L?�d]��}�?�e����?�����8?޹�^�>�?��M0n?����r?�1-v�?�ЗZSU?������@�-�Ҷ�@3��x]�@
�^Y?@[���{'@v����|@����,@����EO@P10�@CFQg��@a���}�@!U�#�
�@#?�{@$�l�ө@&ƼIQ��@(��3@*��ɨ�@,��~�d@/<�O�۠@0ȣY��@1��4b�@3>?^vM�@4�t��R}@5ߌ1��@7@z ���@8�3Z� @:"�!�!-@;�خs"2@=/��B?@>� �'�@@3�Eyw2@A	^�[@A�jz2$[@BĶ��eF@C�APu�@D�	ڢ>�@E�K��\@FzXӵJ@Gt���ů@Ht�8=��@Iy�%]��@J�� CJ�@K�WJ4@L���j�@M�̇��v@N���-@Pv�@P��Vw@Q.N��v�@Q��
��@Rdl��\c@SXl���@S�����        ?����u-?������?�������?�)�O�]7?��ɡ�&?���q?�h�%a?�P��
�?������@��(6@
���P�@�o����@�t�GWX@�e�M@��Y�T@!�q����@$���3�@'ߎg)F@+av#i�A@/*�EǪ�@1�����@3�
R,�@6�)+�@8��c�W�@;/��\a�@=��n@@k�op~@A���@C�,e���@E7���@F��[�)�@H�rcո@J��>O�@L�%�a�@N�-�	��@Pd��암@Q|��۳=@R��k�eE@S��&@T���ɖ�@V8o�?�@W~p�l*@X͝0q@Z%�>x��@[�\���@\��֝)Q@^ev�� @_�"�ڛ@`��D��@a{'��r�@bF�k�4@c0��
�@c�媮�3@d�2��V@e���~@f�����@gk���@hU���J@iE���&@j8�i�c @k0�x>�@l,�1^W@m-�r)O        ?�
熕�G?���ܗ,N?� %pL;�?�|�W�?��`Go��?�
w��d�?��jwx��?���!}T
@M�Bl��@%���@ �W�o@t�����@�	CD6�@6�5
�@!\��v�4@$�l�ou@'��<���@+�����s@/�1~� "@2%< L@4�����@7P��b�@9�d����@<�⦨I!@?�OW���@A�o�B�@CJ����@ETRS��@G���;�@I	����@K#�0��@MV��z�@@O�i�
��@Qgiᓳ@R@gEu�!@S���NO@T��S�@VD�'��@W�XAӰ�@Y0��@Z�>�?�L@\N� ��n@]�|p�N|@_�nI�@`�-��ف@a�/ ��}@b{��1@cl\�w��@dc���u�@ea5+�5@feJ5ؽ@goӥ�v@h��A��@i�J�0"@j�8y|��@kڞ
�oj@my�g8@n6ʟ���@on�v�W@pVa�l�_@p����|&@q�;��-N@rF�y[ԫ        ?��?��?չEq5m�?쮕�!F:?��d]�@d@���/�@)�Q�p@�>����@"��h́�@(�|x�@/�BT��*@3��w�-0@8H�H��@=&�)�h3@A?*�ȣ�@D(}����@GOȼ�6@J�~��b@NZ�o�@Q�֜��@S0����s@UbGp�|@W��]'^@Z&%	��@\��q^�7@_k��C�@a�[��@b���B1@d$]`Z-{@e�>�ߊ�@gjv���@i%�R�i�@j���G|@l��ػMP@n��*޽�@p[��%@qa53d�@roJ��W@s�K��(�@t�/f�h�@u����f@v�y.Љ5@x+�Le�?@yh�T�tE@z��� �@{�q'5�@}N�(u}�@~��|S�{@�k/>ԇ@��=����@�v�}�0@�4��D�@�� A%�@��X��Ns@������@�Q�.�T�@�"�6gl^@��uP�Ҷ@��%��@�����-�@��R,#h@�qK�d� @�Y]��|�@�EGQ�E�        ?{�
�]&?��b[���?�oCΊ?��ms�V&?ӥ8����?�lxK��?����?���{��^?�Õ���?���"�?���̠�=@�s>S�q@2vK0A@
!�)��@X����,@t����@�(7�!�@��%�@Cʗx�@1O]@HU�ٱ-@!DrJc��@"�~���o@$�M;$�W@&�ג��@(�����@*���T��@,�}�N��@.�)Lۏ@0�u��@1�'�� @2�t7��@4=�|��Y@5���/x�@6ߠ���@8?�:!@9��]U�@;F�.�@<����b�@>%56��@?���={@@���[0@A}[Ff@BU�:��@C2�9�~o@D��@D���^�@E�g���@F����$@G�p��ݵ@Hǟ�u�@IƋ��x'@J�-����@K���v�@L�|���@M� F&B�@Oex �>@P$,`�@P��?��Q@Q2�=g@Q�I;<R�@R]�~�4&@R��[.�        ?~-���l?�� ]��?����(��?̃�n2�\?��d��?�7��+�y?��Ђ��?���/?���d�@����y@��/��@qU�Q�@�J���@������@�8��@")E���@%E`vb$@(��ω7�@,`�l�@01l�͹�@2Z@Y��2@4�i��EJ@7%uqB��@9��0Ќ�@<�1Ik��@?�ɹ,�@AX��"b@B��F�&@D�+gu��@F�vh��@Hu�⓹@Jt�(�� @L��(��.@N����@P{���Z�@Q�&b6w�@R�!�N=@T#�Lo%�@Ur����"@Vͅ���@X3���1�@Y�3׾�9@[$7($�@\�d�H@^C̲A�@_�r|g@`Ʌ�!�@a�O�G,@b��]��@cq�w��$@d`�L�*�@eU���͔@fP���]@gQ�h���@hX���d�@ie�U�r�@jx��Ŕ@k�+`%�r@l���4�@m��c��@o�}Q
�@pI����@p�E%݅        ?�ߦ�m?���NG��?��J��PJ?ϫQ,U�??ܗ���2�?�.��h��?�n�����?��T�Z�@ �s1@KF����@���'��@�BV��@xueD#@��&�z7@��yj@"�E�"S@&�s�6�@)|=�i��@-<P}J�@0��5���@2�����@5&O D`&@7����@:F���oU@=��op�@@�zR'@A�|=յ@C8%Ř�@D��Ļ�B@F��vc��@H�X�*?@J�4�k��@L�J�W@�@Nȱ!�@P�>�V�C@Q��k�J�@R�L���@T��+I�@U[���2�@V���� w@X
RX]�@Yrcʠ*@Z� ��@\bY�[�@]���y5�@_~���,�@`��Z��@acL��f@b=�n��%@cU���@d����@d�]|�=@eݠ���@f�cV-��@gΤ��m�@h�e<��@iգ��"@j�_��",@k�>��@m	Mj�bL@n%}/�fJ@oG&� ~�@p7$:���        ?��|���l?ю�snaj?��!s��y?�?D��;�@L|?,@b�_r�@�w7��q@ M�2U�@%�P>>�@+xz �R�@1���+l@4�B��~�@9<��v$@=���@AC
�/�c@C�>�sf@F�')I�@I�Ms.1�@M" 7x�@PLC��rK@R ��x7@TIA���@V���;2@X4�za5c@ZmQ���@\�׳��l@_)+e[@`�����@b#�٣+c@c~�"f @d�%��@fW0��	@g���@iasS@j�V����@l�� ���@nK�s�@pK��e�@p�
W�N@q��[۪@r�o%�P@s��E�@t��z��@u�جw)f@v� ej��@w��5���@xٞpC��@y� �T��@{��@|3�o�Z@}\��_�1@~����1Q@��,`b�@�|�$�"y@�VDv�@���bN?@�cc!F�q@�
ވg&/@���(�Gr@�a�08�@��R�9@��̡�
s@�w8m7��        ?wHJH�?���i�B?�xPK��?���4= �?�B�j���?���� ٔ?�o�6���?��S�/?��ս�?�O�9d�?����=�@ ���u�@.��KP@�^��@�׉f�@������@Egb|]>@�M]Q;/@M�<D5@V	�%@�$�Z(}@ %?�,^@!�D-�.I@#V�Zָ�@%;>�F@&� u0�@(�y?��@*�^�3��@-�JF��@/6hӷ+[@0�1�"�@1�H��ԁ@3m�E1&@4[��$0@5��ȁ�@6��|K@8T�N�l`@9���B@;,�j��@<���a��@>,X^��@?���v��@@�}�ε�@Azo�m�@BP0�r.@C*�ǣ�m@D
 ȶm�@D����&�@E֟�_*_@F��X��@G����D@H�%(f�@I�冃�R@J�*��_@K��*L��@L���s�@M�۸��@NΧ�j5@O�c��+@P~"��@Q�@�%@@Q� �*�n@R/��f�        ?|1%�gT_?����?������?��V��d�?�d�aq�?��Udrܻ?�D��Ub?��ْ�!�?�Ρ/u@��
�5�@	�<��6�@���?@�	���@D�3+�7@ ���@!DI�@$?;���?@'���<�@+��D�@.��fO�#@1���@3�l�ˀ1@61;���@8���u�@;x6����@>ZX�( i@@�gp_г@BN�ԉ�@D ?i��@E���@G��b��@I�2"2�Y@K��2J`@M��v,0N@O�+��@Qt���6@RP�V��b@S��w5@T��`p4z@V(Ga 
@W�Qxs�@X�j&�@ZgS�_�@[��'���@]v�WES@_�<���@`YķF9.@a1�� @b��#@b� )w�p@c�弱˙@d͹�W��@e�~���@f�7�<@�@g���[-�@hȒ��|@i�8�ٵc@j��[M�@l���@m#5�u��@nH�K{F@ot���}3@pS;T�\#        ?{��^@S?�r�� ?�qM���5?�k �ͽ?��hR��?��?Ǭ?����_�"?��m���1?�L�\�I'@���:�.@
�3�+��@�e��@��O��9@;�����@;�'̾�@!�$���@$�Zw�	�@(J;� ��@+�E���@/����*@2�R��@4R량!@6����Kc@9V�����@<(*LT�@>���=j@A���w$@B���82b@DU���=�@F|��K@G�n��K:@I�s-v@K��fz@Np�*j:@P1��Z�@QA^���@RoEF�R@S����b@T�Qi�@V9}���D@W�qʥ@X�.M`@Zd�SÕ@[� ���@]b�~~�@^��R�s@`E@A��@aj[sD�@a���8|�@b��Tw�/@c�	J�o�@d��!�@e�t�Iw@ft�� >,@glϺ`�@hh��Z�M@ij��/<�@jr4���@k~�D���@l���p״@m��|㔎@nðצl�@o����        ?�˱�O?�}���`�?�m�N3c�?���%�1�@f�(���@H$}.�D@�H�m[z@h #���@"%����@'E��˒�@-0/��@1͔��|@5i�I�@9`�d(cg@=��7�L@A1>��c*@C�
gcw@Fkg(O�@IN�����@L`���x�@O��t�*@Q����@SXz�EL@U?�����@W>�rn�@YT�ĵ�@[�� ��?@]�R*`��@`���f"@aL��_��@b��l��:@c�$�@eA��R@f���~s�@h�
x�@i�XX+�@k(l��W@l��K	a@n`����8@p) UD@p����@qő���@r�;$�L@s�|�F��@t�K��N@u��ό�@v�ge��@w��~�	�@x�.n8m@y�.�@z�=���@{ȟLg�&@|�-�e|}@~۬i@0�CZ��@�.�&O��@�ǕiZ�@�b����@� ��)��@����{H@�C�Ec��@���L�d@���Qs7�        ?yi�I׈e?�6!���v?�(z|ӹ?Ŕ�I���?ҩg5L��?� �6�?��g�J҄?���ua0?��{�ҝ�?�ᴠH��?��>�V�@�;���@|� ��@	NBM�#R@qq�1i�@�w��y�@W��!�@� �3�8@�^��cj@}nQ��j@�s�u"@ ��iǊ`@"�eiA��@$S�q9:@&,��M�q@(�:%�o@* ��4�@,9_� ��@.gݏ5,9@0U��R,@1�4Ż�@2�5�gB2@3��R�@5F֘_!�@6�b����@7�]��N�@9i����l@:�y����@<_���]@=������@?~��<Q�@@���< @AcR��@B=�%/@C�pz��@C�����&@D��K�@E։��Y@Fɉ�w�d@G�����@H��A�S�@I��y�J@JǛ��u@Kӛ-ڴT@L�\�!�@M���J"@Ofea�@P�4��K@P���\~@QA�B���@Q���@Rr����@S�FL��        ?�,���?� =PIK?�Q8V�(?�Qs%���?ې�c�e�?�t
��?�sSW��?�j/�9�@ ��~�@3�*�@��5��@
���N@N�ʹ,�@"���P�@ E�k'��@#F��᷉@&��k���@*7�m���@.+�I�j�@1:N�>W�@3���9�r@6�+�_�@8�"�ʟ�@;�w^�1�@>�9�c@@��WB�@B���A��@DN?�9��@F,��@H!����6@J.��@LT�P5O@N�PΓ�@PsQ"*޼@Q��3Y�@R��]вi@T;��W�`@U�A�2�@V�l0�7o@Xq��/-@Y�I�(@[}���-@]��ay�@^����%@`5+Yd��@ax��i@a��~��@b�K+$a�@c���n�@d�\�?r�@e��+pv@fȠh6ll@g�Q��@h�x�u@i�ϛ�%}@k�W��@l0k��@mWB;D��@n��]{2@o��6,��@pw�i!jx@q[��61@q��4�Ra        ?~Tks��?��M���?��c$��?΁��^ɐ?ۤ�3p�?�{K�9�?��S=�/?�,����c@ ��N��@�U��w�@Q�k�@���s�@�ֲ��@Q��K�@y�-��:@"�x�yK�@%����ߩ@)(Zs�@,��@P7�@0sA�p�@2��r��@4��rq�@7fw�vj|@: Ns�@<��6o�@?���*EA@AmЦ��1@CEխ�r@D�,��(@F���g�/@Hnh�m�@@Ja����@Li��	^�@N��}��@P[7�$�@Q}��l;@R�\���@S�#���@U"��O�@Vl��'0�@W��<�@Y �b^A@Z���NF@[���$�@]y�_���@_ ���
	@`H�r�@a�$
��@a��/@b��O=%@c��=^�@d{;в�K@e`���J@fJ�-��@g9ք��w@h-�^��+@i&��߀@j#+���p@k%n��@l+�M�s�@m6���x@nF����>@oZ�a�c        ?��$�ɻ?��W���?�3�^T^?���2t��@�xu�H
@*�����@~4\���@ ,�V/�@%b��^�@+a\�e�t@1��
#@4�W����@9�#��h@=��#��
@Acm�)@D�ݖ)�@G�5l�@J9fR�<@M�U�7�F@P�]p=1@R�#��@T�h۶Z�@V��璈/@X�{w�<	@[6"=
�Q@]����S�@`�2B�@ar�V�2�@b� i�P@dIY;�@eɲ����@gX#y��:@h����'R@j�4Tە`@lWǖ�V=@nX�h?�@o��?@K�@p�<L��@q���t�8@r�~���@s�P7Q@t��S�O@vⲠ 4@w#��T�@xE'J���@ym��TS?@z����8@{Җ���O@}?��#�@~R�RPYZ@��3A�d@�v����@�"�S��@�ѥ�R��@����l@�9����[@��!�"k�@����1@�o���<�@�2����@��K�¬�@��+?1/@��\�f(        ?|'调Td?�L ��>?�=G�l&�?ǂ;����?�2�1��?�>�_�#P?�x@b��?��#?���<�?���5���?��bG���@/{��v@�+P��@
������@^a��@b;���@��V �@P�1�e@4�]���@D���W!@ @�%���@!��1�o@#����%�@%��Mj�`@'���M�@)�3��@+Ȟ��9@.̰�@0(ǫ6�@1[{����@2� ��'�@3�J]�	@55#3U��@6�q����@7��RDP�@9py��C@:����@<xkn��@>^S߹�@?���BǶ@@����[@A��75��@Bb��c�@CG8�Q@D0ž��G@E���ܟ@F����p@G�`?@H/~��Y@I̀�>�@J��䭶@K%��N�@L8���*@MP��;C�@Nn`JC.|@O���͈k@P\/<'��@P�vǪ�@Q�?A�@R&���)@R�F��i�@Sd��it@T.�z#e        ?��͒ǎ�?�>���?��D,؟9?��
I�?��
���~?�a®���?� 4v�?�)�V��7@5yx�o@�?;K �@G�'BӐ@j���G@��P�,@��P�5@ �mC܈C@#�c��G�@&�|��%@*�7�NK�@.���
,�@1h�Ā=@3�́�$@64��	�@8ܘ^��@;����;�@>�U����@@�S��@B��+�O@Da�K˰�@F<���"�@H/GP`^&@J8�_�\m@LY��Ox@N��ʸO@Pp�݋�@Q��JH@R�'� ��@T-��0,�@U�����@V��IH�@XT��\Ox@YΌϫ|�@[T�|I@\�9W�(@^�+a1�@`m��?~@`��r��@aϻk"W�@b���@c��N-��@d�=�]7@e���?E@f�H�Ch'@g���i�w@h����v@i����@j���
�@kӴ���@l�gԈK�@n�AD�@oGh6@p<��0o�@p����y@qw�_P=Q        ?~�L )e�?�]�.���?�#� &�?�8��A�?�LY, h?�w͂w�?�V�o�vv?��z��+\@ ��ji0@=�5�1�@�����P@蚉��@��m�@��q�>B@�I�B|@"ъT�
�@%����,a@)i�3�@-$c7���@0�ڕ'�C@2����@53�Ӣ�@7�ı;8@:*S�3�@<�\6U+@?�X�o�-@A~f��@C��.j@D�<KZ%�@F���&��@H~�m�(K@JrA����@Lz�S��4@N�K"Y$@Pe[�Bb@Q�}�\@R�S�@S�#��/�@U3����@V��c<,q@W�>/?{�@Y=��ʡm@Z���Bo,@\$o�o��@]� ZԽ	@_6` L�@`g��E0@a9٠c�g@b^?J@b�_g�W@c���P��@d��ACm�@e��t���@f�ȳTz@g��X���@h�܅�9@i�H͞�@j�*�s�(@k�ʄc��@l�/���@m�b4
~v@o i�j�o@p�]f�        ?��eJ�??���0?�8��C�?��KQ@ͳ�=	@M��_��@�y��Q@#/»�΅@)NŜ��@0,�b�I@4)��f�<@8�5o��@=���2EM@A|�1�*�@Do�/C@G��9�`�@K���o�@N��xA�}@QYC5�@Sq.���@U�����@X �N-�@Zy�yM�@]7�A=�@_ɄXY�H@aP�9tβ@b�#̸�P@dYS "@e�w�LP=@g���}�@i]��*@k)[e|ց@m�|K@n�\�Af@pu����@q{��`�n@r��a^@s�a���@t����Z�@u�>�(�@w���s�@xB��؈�@y@nP��@z��1��@|M���@}d�H(�@~��x��9@���s�@�Ȕ�@���lg��@�@����@��*�r@��{�k��@��g|�a@�`KS]�@�2&}Sq@������@����Qz@��n�A�2@����@������*@�p)��y@�]�8�        ?}�#U]�"?�#u�^ ?�3��N�?�^VD�D-?���.M�k?���ʖ�?��1��?�i2($�B?��U��?�ҭEL@ ���Y.@}��f�@8��ZQ@G��Mڅ@����@0 8f1!@���k��@c+Ǥ�@;S�DX@=+�C�J@ 4WH��@!���V�@#�^8g�@%r�����@'[��~@)Y�3��R@+lɑ !@-����@s@/�W�Y��@1{�(��@2D��Q3@3�h� x�@4�z���@6��\.6@7y�)@�@8�N�@:R���B@;͖*�g�@=SIЌll@>��Ղ@@>�k�F�@A{·<q@A�ro�7@B�`�n�@C�B����@D�V�GJ@Etʹ��}@Fdf>sW�@GX�	y�@HR/<L�@IPP �|!@JS;��@KZ��o@Lg]�Hu�@Mx�O(�n@N�hO��r@O��1Y�@Pd���@P���8�@Q�W�@3)@R �o�@�@R�ߌ��@SU_-�        ?��;�;�t?�;[���?�=��U�!?�+�W]�f?�ּ����?��D��ʛ?�ϓWB?�w���@�.)a��@�y*�@M���@����=<@NO�1�@.����@ ��i��@#�^u8K@'�Ҝ�.@*���a,@.��˲�@1g2n;�@3��1@6�`B�@8���s'B@;i7�Z��@>Q��H�@@�S��q@BQ_$�Q@DV�F9�@E�+}w��@G��H�t@I�x��@K�YU�)1@MТ�s�@P4�E�@Q*�S �_@R\��O�@S��l�ɣ@T����R�@V5qT�@W�'G��@X� ��b�@Zsb&�xZ@[��L�~�@]���5@_*���@`\ń/��@a3��,b@bY���Y@b��2�@cڰ�uuv@d�i�.ߖ@e�؃XG�@f���v�2@g�����@h�p�]_�@i��b���@j��E���@k�-��'@m�c�e@n%Ll��a@oLE�Qt�@p<}���4@pշ|]��        ?{D�P�(�?��H3��?���b�?˕g��#�?�ʧ`��?�\P4�d?Z?�?�����Y?���E@�'p�.@	�Mi��@	��lDf@�a��@�Q^�@��ɱU�@ ���eq@#��~�b@'|~�@*m �2�@. '�ʋ@1ޱ�i�@30|j�[�@5xl+˫@7�#F���@:z��+�@=4��v��@@)���@A�h�Z��@C'��q�!@DӺB9��@F���Fq@@HhT��@JQ����@LN픗H@N_�q�K@PB�(�`�@Q`J�`�@R��Ly�@S�!j�@T����a�@V=�$���@W��5�=�@X�Ѵ���@ZQ'mg�@[��WAC@]=O�n@^�%d�&�@`)��iA�@`�+�~y�@a�ٟ�C @b���M�@c~�ٸ��@dab��]@eI�(�@f5���@g(�kM@h��}�@i#_Fe@j ���,@k%q�hc@l1q^E�@mC���"@nY��}�        ?����^�?ԑ,�A�?낢We��?���c���@�H��@�W���@�a5���@"F��hY@(
�����@.�Q�]+@3o����@7<�¼��@;��?�·@@q1�@C.����@F$w�f��@IR�H�&<@L�ӛ*)@P,�	|�@R"���@T!�`x�@VG�yx@X��)�@Z��$�� @]aapU'@_�d�>@aU�a��!@b�����@d4>��@e��1o��@gK�=iI�@h츧K�
@j�p0@lY��+x�@n%h����@o�b�N��@p�Ţ�@q��n���@r�(-�@s�m�)_@u
��U[@v".1��@w@I�N��@xe���Z@y����#�@zĬ-e�@{��Lfb@}?R捇�@~��$o��@�@%L��@��0 ��@�CxM��@��h63.@��
#��4@�a_��@�KTS ]@����/�@������@�b'��@�*� :"@��S\(�J@��hE4��@������        ?=ٟ*2�?�ZM7?y?���� �@?����-A?�%����?��R�7S?蘖χ?�ĸd��t?��Mm[)?��|+��$@IY��~3@�3̳�/@	�����@���dC�@(I4;�@��� �@��i��@~庆�@��p��@�N�q�@!��'��@#�?��@%���A&�@'�� �]q@)�R����@+�]��@.B�e�vm@0U%���@1�vX�f@2�B`]j@45~�т�@5�$�$�@7-����@8|�����@: O(��z@;�Xd�J@=)�1=��@>�4�T�@@?����v@A���@B��f|_@B���@C�X�;��@D́C�{@E��rø@F�#9��@Gʄɺi�@H�6/v�]@I�*�	�=@J�W'iSG@L�l(�7@M/,&+`�@NR� 9z"@O{b��@PT��p&Q@P��E���@Q���I�@R'��}�@Rȸ�+�@Sk�-:s�@T���Ay@T���&E@UdS��YQ        ?��S��?�l�m`��?���/u�?���BCE?ބ�vo?��ⳅ��?���M�?���n�9�@R)�@<7���@/�9��i@��}@5I?y A@d�F�RL@!�D���@$����4@(X[��"�@,6eA�A\@05Z���@2{c�A�y@4��&��	@7��>�h�@:Z��|s@=Vkv��@@@2�ui$@A�C��@C��*fA@E��f,ԇ@G�D,=�@I��d���@K�� �n�@M�<>'@P� ���@QV�Y�@R�l��S@S��FkB�@UA��v�P@V�K~�,�@XB�2G@Y�i�3��@[%�N��@\�T�&�w@^a٨ق@`�����@`��t��@a��o2��@b�a/��@c�광��@d��L�@e�gJQ��@f�[!��@g�su^)n@h��=��@i��1�|@j���@lS� �@m/1�@n]<_4.m@o�t���@pe�`��@q;̯��@q���	5a@rP#�0�V        ?��eik�3?�}�=|�k?��Ѕќ?ѯ3�>�?��G\1f�?��&��?�}?xUs�?���p�.@�	��x@	W(@���s @3팾��@�;6��@3䜺~@"��s?�@%V�$�%@(�K���@,��ͻ@0���,��@2�*�]@5^��"�@8�Gi�@:��%�r�@=�,���@@�~q�|�@B<~��q@D�H�1q@E�^,@G����1@I�x ,@L�{�i�@NS.:���@PU1gg)@Q���ǉO@R�D̮�@T��So@U{!O"y#@V�ql+��@XU��?Q@YԼ �@[_���@\�h�-�@^�����@`#�3�@a �P��*@a�`9ċO@b��K|�@c�WǠ��@d�tя�]@e�I��>�@f������@g��x��#@h��^��@i�A:��6@j�G���@@k���Po�@m @��d@nA�U!��@om�6��k@pO��9��@p�=��rO@q�~7V~�@r*s���        ?��`2+?��Cf
?�lj�d&}?��\��@	�jJR��@Ծ���6@��e�U@#�&�9@)ʷ�\�@0sd���p@4w�j�J@8��]!�@=��r���@A��Y��@D�kq�kM@G��D0��@K3�z@Nۧ��~@Q`0F���@Sq��r�@U�Y`wҷ@W�&{�؊@ZZf�y�C@\���^@_����\@a*���X@b�-b��@d��;�@e�5�@gN?L2#�@h�$�@j��\ѵ@l��d��p@n]焭�v@p#8v1_f@q�>��@r!��7I@s+�A R�@t=;���@uU��y��@vu�-���@w�G�Iĸ@x�ڳ�p�@z���=@{>�Ҡ@|��l;�@}�T�ݓ�@ �xN�@�=.E���@��vf:G@��</�h�@�X{C�)�@�/�D)�@��Ux�qU@�����ۙ@�W�7 �@� U(Mڶ@��)TC��@��ez�r�@��G��@�dM�W@�={��N@�I5Y'�        ?{ӕ�~ ?�����W�?����X?ƥc���?�dY'��?����?�҅�N�?�S�}pڠ?�6(�a�.?�fX'ȫ�?�:��f��@YiUX$�@�Tޅ@	�Z֛ӷ@�v^n��@@����T@��4PL�@B�]��@	dD@��N�@�@���.@!��.G,@"�O��K@$�N��@&rhH�@(bHgG�j@*f�1J�|@,�`�@.�8D�@0wAT �@1��Ĵ�@2��Sx�=@4���M�@5^3�B��@6��|�>j@8�A�	F@9r��4�@:�5���@<[���-}@=�p S�@?i���@@|����@AN�L=�>@B"M-�;j@B��`i��@C�/`G�@D�R$�P�@E��.
��@F��UGv�@Gv'x{=@Hh�V�'�@I_�z��x@J[+P�@KZ���@�@L^>����@Mf'ra=�@Nr;5�˖@O�u���@PKi���@Pר�%@Qe�,;Bx@Q�S��0M@R���h�        ?���MQr�?���XJe?��HY�?�q�AF�?����?�~��;�?򓒛��?��JϦ�>@J`ҩ�r@Ef���@R�n��@�3�^`�@m�҃�@���HM@!Ұĺi^@%��)X@(�;��@,������@0���JR@2��"�4@5\�2�@8��G @:�SW'.J@>����@@�"�;D!@B\ޮ27�@D//�W��@F?�c�O@H50�Q@J;1�ʠ�@LqScd�B@N��1��w@P���Ε�@Q��Qh�@S#���4}@T~VجG @U�ڞ�B�@WZBlp)�@Xۘ�|@F@Zi�?�6A@\:ڳE@]��d�1@_c�R`@`��:xJ�@az���/@bi#u1R�@c^0��6^@dY��eq@e\!TL_�@fe��<�@gt�$X@h��cst�@i����P@j��T�C@k���f��@m%�w��x@n\�9��@o��F�[�@po�;��@q2��4�@q��5.m@rj'YGr�@s�y1|        ?~�}��?����?�0�J��?�#�����?�Q�??�=8pb�?�ʌ6W�?���JV6�@ h�á@�<�\�)@��D""@�&�y�@�בِ�@R��Zr@��M�Z@"�,�+��@%ȏڝޛ@);����u@,�]���@0��@��@2���ξ@5���Lt@7)��k�@:"xU8+@<���S('@?�KJ�R@A~�4�Q�@C ��x�@D�5cL�@F����@H��m�\@Js�`�&|@L{1�1�q@N���Y9@Pc���`�@Q���n�@R�	�iZ�@S�}�@U)���@Vs��y7@WȌI�g@@Y'pn�h@Z�i���@\t�a��@]��	K�@_�h�?0@`Lj�N@a��S�r@a�o@b�����@c���s��@d��� �@ehj9"��@fS�,\�@gC��)m/@h8� ]YK@i2���f(@j1�;�#�@k5%XW�@l=q���@mJy�%@n\5����@or��b        ?�e
O)[?�<bO(�?�r��4�?�H� �o@���-&@-{g��y@���V@��/�@$fLXd�@*b���@0<Q�aq@3���ge@7��sٯ#@<��
�@@f�ʽ�@B�[&'|�@E��ɚZ�@H���Jh@K���a@O��bhZ@Q?���̈@Sq��f�@U_i��@WL�-V2@Y+�E�@[a����@]���j��@`
��b�@aI`����@b��GdM�@c�D����@eJxOÐ@f���2�@h.�Y=I�@i�&�}�@k@q!Q@l��]�@n~���@p�u���@p�提@q��\ڍ@r�~�:�@s�d@��]@t����^@u���&�X@v�]��)'@w� ��o@x��9\4�@y��w*9@z�Y/��@{�*�&��@|����Q@~��4e:@*LP	>*@�)�_j�@���?�q@�Z��2Q�@�����@��(d�@�5�]F�@��(�@�~��_�@�&��c�:        ?uf�3x?�{���י?�&J77͆?«��-|�?�EƗá
?�z�.�h=?���c�?�3I*��?��+�q�?���D���?��DH��@ t���%@�'A4hg@h�0�9O@`�����@�qA[�@'�\S�i@���	^@K-q{��@!�_z�@�nN��@ #���@!�`{Zew@#� |�@@%i0�C�/@'W�m�{@)\�/.!@+x���{@-�t��o@/��bI@1(�ac�@2c���7\@3�7��S@4��-?$�@6X�a�	"@7�Q�x�@95$�@=@:�a����@<?	�P��@=�n{�/@?v��03q@@��sf�@Am���fG@BO�B='a@C7��j�$@D$���M@E����@F��r��@G2_�@HM�/�@I�@J,l/��@KAdt@�@L[��^�@M|��/Q@N��=�J�@O��H\1�@P~���=@Q�\���@Q�[I��\@RW�����@R����@S�i�<{"        ?�c1x�?������?�7����e?�iZ�/�?ܧr"��a?�w.����?��*�Ja?��5���@���Z@L2�p�-@[Ō��@�o�o�@x�׿�@�*�JPw@!#S��Y@$O7�A@'΋#X�@+�h��@/ϺTp@2*����Y@4��ӱ<�@79	ݱ��@:���@=��ӻ�@@w{P3@A���$�@C��d��@El\;��O@Gd�\5��@IvT��/�@K��蝾@M�8}~2�@P!r�r��@Q]��LQ@R��\,i�@S�:��#@U]���*@V�[�,K@XJ�%P@Y�����@[jڦx1+@]�p�@^�b�X	�@`?{�yH�@a%a�� @b�8�;B@cf���@c��P��@d�e��@f�D2�@g�d�@h'��I@iB�NV@jc����@k��.�¤@l�>�+t�@m�JNQ"@o*�	bnn@p6����@p��S�i@q�vz���@r-R�@lK@r�n����        ?|7��Y�?�c�s�?�?z "�?η���8;?�6����P?�7�T)��?� �R�0?�ts�j�O@���.�@RDx���@)��jW-@c���@�z��Y@�G�|P@!G3~��!@$~~N�1@(
��;�1@+�j-�@0�����@2aW�9�e@4�_7��@7�\ VT�@:\��MH@=e�K�g:@@O����v@B�D�@C�6��@E�om���@G���B�Z@Iԥ�s�T@L��0)}@NT⡟ L@P]�9��@Q�j�@R�X��9O@TE���?@U� gy@@W!v�G@X�D���@Z1�/#@[����@]v�g�@_-IE�E�@`xr�O?�@a`��H��@bO�h!q�@cE��1�@dA��m�@eD�©��@fNJ�]��@g^er;Q@hu^�)@i�X~ս@j�*�z0x@k��1�Q�@moa��@nHٰ:
@o��5�B�@pe��Y�@q	�*�@q���@|@r_����@s��21{        ?�v�!��P?�$�϶"T?�L����?�i�В�@y��@
祀�Ce@��ؓ3�@NL8<S�@"'�:xE@'_S�2Y@-P{��@1��TGn@5��-��@9̠6 `D@>EU7��!@A�A ؊@D/p|�)@G ���_o@J��r�@M9qL>]�@PP�؛�h@RYR���@TRO��@V�O���@X��x��@ZS�>��/@\�F�A�@_�l� �@`��pOߦ@bL�c{@cl�Y�b�@d�۰Ol@fHn
�Z=@g��)H��@iX.x��@j��ZE�@l�&}@nQ�`<�W@p
<�C��@p�'R�;@q�Z�'@rկ*�\�@s�N�V5@tӂ��j@u�K�um@v�z���@x��	��@y�Rq�@zA ��x@{j�W��E@|���k�g@}�T��0!@T]���@�(����p@���Ⱥ�@�u�S�@�!j4��@��c�}�y@���|���@�5a9��@����S/�@����&3�@�eO/���