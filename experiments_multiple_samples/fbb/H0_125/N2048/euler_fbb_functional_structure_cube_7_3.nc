CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T105546        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?�� ܚ=&?������@d���C@$�'V@2[>n���@<�u)��@Du?'+J@K�
���@Q���+�@V�����@[��Y��@`�P��v�@c�D)Ù@g-��r��@j֕�L�S@nż}4��@q}��$;�@s��8�@v#�Yg@x�dny��@{I �ރ�@~�׀�9@��L=��X@�
���Z@����[�@�Z�G�܍@�#�s�F@���|Od@������@�I`8?Z@�Cs¶b@���@�_@��z���@�<\(5T@����Zx�@���fe@�GpBD�9@��LAkU`@�.㍕��@����s@�:��2��@�̬�#�@�3.���@��/<�@��3r�g�@���ݕ@��P_/�@���K@�r����"@�rL��K@�|����@��H��L@������.@��I��b@�a,�%�@�f0N�@����!T�@��7MA�@��%��
p@�|樶�@�?+<���@���Ɛ�@���Ȫ�        ?�)I��C?���O��@Fgz�D@(ӵ���@6tٻ�~r@B0��P�S@K�$m���@U����@_���"?@g����~@q�r��k�@z\)f�&�@�ji��V@�+w��B@�@�tS�@�����@�C��D{�@��f���,@�0��
J@�in�V(@���V��@�A��:��@�ގX��@�U�Q� @�_}��j�@����@�@�m	#*�@�a�<�(�@����;@�6�u�ާ@��shd�@�ױ|JD@�^��@�%�=�@��vHIV�@��F���@�*��i�@�����)�A�����A��j9vA5 Ϣ�A�ܕ��AS����5A/ލ�A�v.�{AF�.:TA
>K!�kA�˗|gA�U��^A�k��AZ_S�4A�>�DI�A ��T �A" �(\A#j��O@A$����K�A&s����A(н��wA)����(gA+��ܓ�A-RN��r�A/2�6�aA0�0L��        ?���ڴ��?�g�AY�@����@*h �ޑ1@8��n^�@Do�A�(]@O����J@V�@�B{�@`�Jg'�@f��*���@p	�}vpY@v�3Yp�@���i@�$���hy@����Nf@��Aߎ�@�\��'
@���/[@��]�ר�@�-�-�W@�i�b�@��ܗ�d@���v��@�;@� 'D@�x� ��@�QN���1@������@�n8���r@�	���]@���o�/�@ڏ*��T�@�j��%O@�' Ob�@�6���;@�	����@�v�(�yu@�߅�k�@�B�ǫ��@��:*]�@��I�\]z@�E��{�a@�"V��@���'��/@����N�@�=3@� �:�@�@T
�0N@��ˊh8@�\!��@��!9�\�@�tw���@�1z�:�@���: @�&��$�m@����-��@�_h�g@��sf�@��r^�^�@�o q�=@�3ٳ�M@�<^�0�@��[fJ�@��aŏ!        @�/�*#��@�/�àH@�n�-�E@��OH+�PA�ԤS	 A)��,��A�ۧ'A���seA#�����A(�>�3��A.�͖�MA2#A��?A5�y9��A9c�����A=�LxD��AA$��v�AC���Z��AF�����jAI�$��UALؠ(L�AP/㳙AR�c��AT��EAV1Qk��FAXm�)~�-AZǔr@��A]>�i�A_�V�UAa>���~Ab�2�W�Ada�	��Ae�8ԗ�Ag>�Ah��~]�Aj��'Q�Ak��T�TAm9�qm=�An�S@���Ap8��Z�Aq
�d��SAq�)=Ar�>��q=As�VI+9AtzE=��Auc\����AvSɧ@�SAwLd�<��AxNJY�AyZ�~��$Azq���ǔA{�<���A|��No�oA~����AK�z�7UA�Q��!?YA�f�FI^A���9�A��ܖ�:A�O��qsA�$�Z-�lA��u��dA����A�����4        ?��`���A?��w���?���|�[�@��m�@"���ӿ{@/���'�3@8j�E^78@A�I��Y�@G�ER��L@On��S֚@S�N^��@X�����@]�f�$��@a���k�@d�{;|֠@g�f�"{@@kx�Q�I@oA<OO�}@q�&:ٙ@s�L+�zk@v���3@x��0(�@{-�W�k@}σ�R�@�Vh��v@��N��$�@�n�Q���@�)�ꀐ@��Q���@��j���{@��;F�*�@��B�@�%^u�ct@��Mi���@��fOF<@�Y����@��䠶L@�2�ؖ�c@���|m*�@�R�o�|g@���+�\�@��A���@���K+u@�>�Z�+�@�=k�N��@�Fdv��@�YFr�j@�u�]�l@���W���@�͖EP�@�	@�9lR@�O��X$?@��
R v@��KYr��@�`ۨ�b@��+��ue@�!�L�%�@��) rp�@����J��@�l����@�9���"@@�� �@�����]        ?��Q����?�7qQ+^R?���q��@	��P@
�3h�@+��W��u@7���sl@B�Q40�]@L-a��@T;�RD�V@\) '@c>�	~�@ibi���@p����I@u@�U�@z�큣��@��5���@�����5#@�I#|��@���y|��@�H�k��@��;#�@��,���>@��^e��@�K)�n@��z���}@��QP�@��2'�@�_�-d1@��㸁��@����[@��H�J�@�PQ*aD@��h����@�4��;h@�|��$�@����@¶�!�f�@�w���m(@�V��P�@�UU���@�u�v5#h@̺]O)��@�%)�Jf@��nQ>�@�<$����@ӳ=I�,@�CS�!-@�����m@ص�)
�@ښ3��@ܞd�	�@�å��@���	�^@���b�z@�QY��f@�\9ފ��@�����\@�Ho� ֈ@��/6��@ꀛ�N��@�9#P}=�@�k_oY        ?�k|�� �?�W=q�Gx?�fԎj��?�ֶ� �\?�
���S@"Dƫe�@���-�@!|�I��@-c��-�@8Mv���@C�S���@O�~��m�@X��;�Tr@b�N���Z@l��&�G@t*�4��@|V;��[F@�xz89��@�7+�,@�Q�?�=@�~=I�P@��3��.@����w@����,ې@���+A@�Ť��h_@�&k�d�>@���`�x�@�E�Doͯ@��.=�e@�/Y���@�r!.D@�O7 �B@��y\�q8@�L`��@�Z:���@ԑ4|Wl�@��<Vvw@��Z�>v@�9!�Uz@� ;W$	@��g�I@⽘y�ز@�x�'�@�L���@�8�pa@�>�7z$@�^�:���@�^~a<@�u�ar�@��%^�@��P#@�@�?3����@����k\@�q�g�@�y����F@��Ó*�	@��RPS@�!0��9�@��!Aj{�A ;X��[A[���iA�@觩        @d����u�@�	{DTF@�,�T]�@��˒@ㇿ*��@�r���X@�3�xN�YA��W�Ar�� AѶD�oA+�n��A�L/D�A���(��A!�6�8�A$���P
A'�4���A+PtgY>A/ɷԇ2A1�g ��2A3��lWoA5��`EA8e{��&^A:��O�	A=��'���A@\�^�0�AA�R�Y�5AC��H��AEeQ��AGN/(��>AIZ�!W*{AK��^��"AM��h�vAP;=���AQ��՝�ASO㮸AT�F8�P_AV$Ŏ�5�AWՇ@h�AY�����A[~SC)��A]y՝��A_� �C�;A`���=�Ab�WHI�Ac=[f���Ad�2q���Ae�F���;Ag3q2���Ah�sѹ�=Aj򑳅�Ak�g�O8Am:�%e$An��RaApBI�#��Aqf����Aq�%"q�DAr�c����As��V]At�A_�
�Au����vZAv��/p�&Aw�V}�Ax������        ?���lr�@�.V�@,��v�c�@@|H`���@M�IB�B�@Wn\��
r@`�_a{�%@f�
� ��@m�;pQ@r���S@w�0�>�@{�3����@�[͚�@�`�42�@��ݨ��@�qq�_@�U��u@�ƒ���@��$�g��@����ʕ~@��Obʳ�@���پ��@��\�He@�^8�n�@�R jT&@�Z��Ggz@��
t���@��d ��@�.7-#0@���Aǌ@���A<�2@�aYHԐ@�����-@�c�1�{@��Ѳ&�@����!8T@�%��3@��KRR��@�Ԥ�&@����X�@��iy�m�@���\h�$@�y�Cr@�vk=+~@�q>�*�k@�q%>�k�@�u�O�]3@�]Ҷ'�@���T9�@���QN��@��5�#��@��9��S%@�����@����r��@�-gKE�@���4b�6@�gjT��@�	 X�h@í��*E�@�UZ0n@� v��@Ů��?a�@�_�i%        ?�	���$?��vLv^?�䟏� -@�:�@#Fc1�o@0��s�@:h�[eF�@C��)��e@K�F�\�@S��F'*�@[�Kq�@bz�,�@i��T��@p��ė�@vy�-pR�@}��Ώ�@�P��[R�@���[Q@��� E�@��c�bJ�@��r���f@�9��j�@�X5���@�ᘒ�@�?�Y)�@����X)D@�!t��0�@�(��CC@�Ia���&@��)����@����d�#@��鱁tJ@�6���f@ƫ�~�P@�O֥�0@@�'%/"h�@�3!���V@�;.b){@��PZm��@�Տ{Y��@���@��Z���J@�+��-�@ݎrg��@�_��m@�b���6�@���$�@�Rӡd]�@��ˢ�d@瞶D#?@�il0Xל@�M����@�K���:@�dè�|�@��A4�ڡ@��j���@�(�M}Σ@�ku>"g@����T�@�ǰ{� @����ȏ�@��Bw���@�x���O        ?�F�d5�@&/1x��x@Dq��O�@V����@c�7n~M@m:!���@s�H^�1�@y�+t���@�[��k�@���D�h_@�hq!�n�@�,Cq�@���M�@�7��?@��:fV�@�0�o0�.@�e	Q�@�8����u@��]'�@@��#q�@���6�@�D��O�x@����77@��g���@�� e-��@���{�@���RN�@���q�@��TXfX@���\)��@���6@�q�c��e@�����*@�S�>�6@¼�dڍ�@�8ב�!J@��%!In@�nT�Gp�@�)WƝ��@��=d	�"@��/ $ �@��l��Q�@Ѓ#�a@Ѡ��/@�˲���g@�ė�T�@�Q�̐�@֮ԋ}@��@<��@ٛYڈ�v@�-ߜ��@��Ҵ�d�@ލ֔J@�.HG���@� T2�S�@�d|���@�%���H�@�9�E|�@�Z��s)@憖��L@��x.��@�����@�Y�T��4        @�Os��F�@�[iޚ�mA�E���}A%���A2o��i!�A<+P�
IAC�U `AJ-�w�/�AP��i<pAT~��+�AX�m�`]�A]{��A`��ys��AcW�����Ae�E<�vLAh���1\zAk_�X��An<7�ۏ�Ap����Ar��`As��t�KZAu0D@Z�Av�|��Q�Axh��Kz�AzF��*�A{â�'[A}���A5�AJ��g-WA��,���A��;H���A�K�b��A��{�o��A���>�~-A��'5�D"A��,�8 A�ނr��A�ŝ��A�7��~�{A�m�@^��A���5�A��K�`(OA�2w�y�A�?��A��A��m$!�A��c���lA�C��5�A���E�~<A��3w[ %A�`�d�u8A�����A��V���%A��.��]JA�a�%TV�A�*��Ί�A��"�!�A��s�a�A����[wA�sw7��#A�OT%�'A�/5-&ǬA�0�ݏrA��^��xA��� %�[        ?������?��Q��@��m�w
@$�L�P@&����@1��ٺ @9Ɩ�m�$@A��)@F�7҅"!@M�-4�@R�2��%@U�IA��@ZJc��2�@_��F +@b;�ri��@e,-���)@hf�� �@k��[���@o�M���@q�-�Pq@t>��R��@v��w:�@yO�* �@|;X���@u�ņ�@� u
r��@��e/.�%@���O#�r@�j-*ޝR@�[冹�@�dhq���@���·@������]@��A��@��вY5�@���F]��@�(`-I&�@�u��t�@��S��w�@�2¹>ȏ@��BQ��@���w��@������#@�>Z���@��j�|��@����c�@��8�@��@���h���@�x���@�l���3�@�g�C�A�@�i���M@�p�j��@�~p0�5@���X�@������t@�ǥ�b��@��~���@�o���8@�?h[���@�8�-�F�@��"��@�r!��+�        ?���do�?��-l�Ә?֏�S�?�7j��8@ 5��9q*@)�����@!ܲ��gG@2뱞bC@A����@P[�b�t@\ԼP�}@h.g��G@sYߣ��@}�CN���@��Lqq�@����(�@���H=
_@��;o��h@��b���@�l0]#��@��P�Han@��?o��@����@��}�G@���D���@�,��[�@�mX�|�
@����@���#9�u@��Ć3^@΃�V�g@��3n�@�"��R�l@�R3t9S<@ׯ��6Kb@�=���@���z��@����ZL�@ᓣ��@�I��h@�ø�k�@��0P"@�)Q���4@�`!��@��t[�*@�/2��@�f���@�� d��S@�3���h�@��Z��U@�@��̎@�ޕ�?b�@���ud�`@�Gx2�e@���d�@��-�T~�A �i�:I�A�GFA�����A𳡑G�A�q���Auɺ��A:e��Q        ?��3�.�~?� �7pX@b��w@���	�@)�J��y�@5c#��6�@@���}�@H�ۧk%@R>��숡@Z����a@c]�0DP<@l�Gnv�@tL;�@�@};��X@��O�^S@����o6@��+��"@�Ö-Cq@���h��k@�d�$z� @�6Zd� @�7�qD�@��E��Z@��?��z@�1ȥ�X@��V@�*!&��@��:����@��%�@�ථ�ͣ@��bT�`@�V���-�@������@�pދ�:@�m�I�@��>��=@�@����@���g�@���X(�@�a���6@�/� �@����)�@��P�:'@�Ȼ��^@���e]�@�e�3s�f@��4��kxA �(�l@AU���A�;QA��׫�`A]�o�P�A	@�\�K�A>�?���AW����A��g{�A���X8mA"�7�4Ad��(��A�$p��-A�@��aAwӀm�A�P�        @v�,7��@��d x<�@ǃHƛT7@��զ��@��\lJ��@�}"3^��@�5���U�A�5���3A��q���A������A��$I>3A�����)A��z$��A�^�X^�A"-	>GR�A%OMsGxA(�8wL�A,���세A0�����A3	��A5�����A8�H��mA;���buUA?[x"m@AA���DObAC���)S�AE�&r�AG��R�< AJ.�讲}AL�^�}�xAO/�-4��AP��� jAROs��6OAS�a�͙0AU<��8� AVǀ'��"AX`)�a�AZ��K�A[�����A]$u�'A_P?�i�tA`��;E\Aa��0"��Ab�s?��Ac��ǴAd�[k�O=Ae��)�ֺAfº��Ag�*�y2Ai0u>�Aj:��<6hAkqh����Al�$�,�Am����Ao>��RڹApH����Ap��U�
�Aq����ArT*��\�As���:As�!��Atz{���6Au7�4�A        ?�"���E@�\+o@o���c@+љ.(�5@7i�q�@A�:��@H�ժjh@P��A�z@U; ��#�@Zw�@@`��F4N@cAxq��<@f�U��J@jG���X@n$��ͥ@q*d��@sE����@u���r��@w���� @z]��؃�@|�2�k��@��QrJ@�3�˦`�@����O�r@�'��o@��B���@�S��r[�@��7ve�@�����O@�q�+7@�=ș�v@�
���t�@���y �,@���0��@��9syy=@���|�@����4�@�n헼�@�3�����@�N+qـ@�l��b'@��xB�@��ٛ�@��Q���@�G�",@�O�]�Q@�Hb���G@�욬/Q�@���oɵ"@�@�u)@��	f�Zl@��y�u<�@�Wt���B@�3�^0@��f�I@��dY�?�@�X��j��@�%Xu�q�@����N�@��{2'+�@���VE|@���g�`T@����a'        ?gh�
��?��~��!?ד����?��S�y�@��`��C@�e����@%�G�%�#@1ԟ㵜@;HA���@D{�f�g@L��d��Z@T �vC@[�����%@b��T.i@i�1�̍I@q�W8 $@vu��>�@}3�4�Q�@����B�N@��LFw�@���h�{.@������@��A]��)@��ZM	@�������@������@�,�?+G�@�4�S@j@�o�4z��@��\���@��ȿ���@��O�:@����P.@���X@��D#��U@��zS��p@�A
y�@�P2 ��@�����Q�@�s��a�S@�Rݍ��@�4!;��@��t[�@ԧG��Kp@֓����$@إ����@���M%z@�C��'E�@�ԥ��0�@�JW؇��@��0:�@�V�3zk@�.ba=@��~'SI@�c�%>�@���@��]z��@�g]\@�J@��S@����q@���@m8@�V&�\t2@��[Ԏ�P        ?��q$��?ɻJ��?�
 �@�B���@����1$@%ay���@1��<��@9���1k@B�D�ɰ@J]�V�@Q�BI�UN@XL�s�@`1v.�b@eIIw��@k��j+�@q����S@v�Ǥ|@|_�,��Z@��4a
�@����@� ��)(�@���n��\@�/paЀJ@�_n���@�;T�F�@�jT� S@������I@�D�����@�eG���n@��FDr!K@���@��w���@�;�7�u>@��=/#p@�U�B7�@�v����n@��,��o@�Ke� �@����S@��3�}R@��Z��C@Ѳv�Gm@�y����@�]��0i�@�^t�G�@�}T����@ۻ0��3@�!
�|�@�L&�J֓@����@��zN�� @�tG�n	@���}�P�@�e��v�@�D|f��@�rR�%@�ܲ�n�@�ǳ��GC@�c����@�n�-,z:@��!�@�8b|"@���vp8�        @�	����@���Zh>a@��G�g�@�� ��J�@���dy��@��~a3�3A7A��� Ai����eA������Ak��!�AӼ�ZA<��["A!{����A$��hp�A(_���A+���ՖA/��sF�A2Ywg!A4\���A6�ݰ���A9�Sroi�A<ZĢ���A?c�;��AAO���wACªAD����AF��j�-AH�0z?AJ�d�kAM0�W؀AO��ɩ�tAQ�)��ARY%��dAS�)NFAU-�B~��AV�Ncr
>AXA�֕K|AY�A=X7A[�f�`��A]FI�5�A_T	��A`n>����Aa]l�AbRH�AcNqM_<AdQ��s�Ae]k1_E�AfqBΆ�&Ag��x��Ah����9�Ai㬀��AkS��=AlaFc�}�Am��;J|rAo	c���0Ap7"��Ap�kS���Aq�����/Arrh���As<�w���At3�;�!At��V��yAu��4�F�        ?��`��n{?�!r+B�@i���/@���u�@"R�顖�@,��j��@4�Z���@;�#%�@B ze.�@F�<��u@K���.�@P�(�Ks�@S�'r�k@Wf ���@[�����@_Ѹ���@a��x�5u@c���r��@f?����@h�	+3��@kRC���@n-%2<@ph]��2@q�?�!�@s[�Ly�C@t�0�Z@v�+��@x3��C��@y��K o@{������@}�h��X@�Ry�@����gg@��$.�LM@��ꤋ�@��o�@�L���,?@���e$��@����ګ@�>�[C>@��	�;I@�<R�5�@��=J"z@���HaA�@��ᔟ�@��8.�-@������@���qe�@��ܞ�i@��&dV~0@�)��V�s@�ly�Ud@���{O�@���s�@��]e��@�
�ȯ#@��@�§@���Hi��@�d�Z}��@�?z� $�@�!�72&@�Z���@��C��'L        ?�@I���?�y<��@��%�m@!�I�@�\@/K���@8n⏜h[@A��]�m�@H���t@P�62��@Vh���K�@]T���:@c	t�p��@h����i@o�K�{�@t`*j�j@z��ع@���B@����?s@��@ŗ�@����+@����W'�@�3�g�G�@��4$u�@����l@�4�"��@�es�|��@�#�3��P@�;g�P�@�3Hѥ��@�|�
9T@��7y�@�
* 托@�4��V�f@Đ%�o�n@��Ъ�@���7�ft@���"��@�_�@Ѿ�)�C�@ӖVJ3y�@Վ�l���@ת80Vy@��8��@�N�?�#f@�ۋ�|9@���$��@�9����@��o�@�aqʽ@�Ų��@���ٝ�f@��9��@����f�@�"�Z[��@�Ӧ�KD@��qt�L�@�E)�i@����=@���{�@��ճ�w@�R����@��I��_@���Xb�U        ?��I�*L�?�;�5l�!?������@5�|c��@��َ�W@/������@@��S+@N��7$ij@[9����:@f�P��|@r}�2[�@|��ƛ6�@�a�}�1�@����X�@�ù�W�^@���m��@���#6:
@��K#x��@��>��6@���V���@�˷��c�@�_�:��@���^q�@�L�I�*@���K�o@�E�c��@�^�>�r/@���ؚ�@�I[N��,@��R6�1@��R��@ޮ���@�ݼ�,?d@�ry�j�l@��~n�@��=K�hf@�a�h.@�It�@����<@��7eS-@�읆ڈ@�s8��@�u�6�s@�~��g�E@�aة��@��Wf���@��Lm�!@�䯦��@�����@�A�����@�{��od@����[�@�6�:G�@�W��Y�@��t�k��A �-��w�A@R	��GA�DE�g�A��e KA��HR^AIg��A�~�A�I�o<�        @�\lq��@�5���@�L��@�A4f�*�@���s.�@�2�k2lgA��1���A�)�[A��0#�A&�nƬiA�a�b�XAӔ��pWA"��,���A%W/�Nm�A(>
�pppA+Bu����A.c���[�A0е��4A2~-�h�A4:q����A6`Yh`�A7⾜90�A9Еj^�A;�"�d�<A=��Y
� A@��E~AA(�[/�ABV@�u'�AC��t��{ADم=�V�AF1��AG�l%f�(AIz��/�AJ�HN�w~AL6����	AM��P_��AO�V�C��AP�62;AQ��<�AR�n+�sAS���c1AU�}b%AVKVLQ`�AW��@�AX��NUɊAZm2��g�A[�]=��3A]�j/ɟ�A_>�A��A`�'e�AamSu��Abc��NeAce; �zAdqN�� �Ae�rK��Af�쩷� Ag��·Ai���AjY���Ak�K|��Am	��+C�Anu9���Ao�,�/��        ?�v�2�;@G��k@(�����@?�xo��{@O�8�g4@Z�^۴�Y@d�j��@m�Ѓ �@t-����.@z�!��l~@��44��X@�����@���f�@���F�n@�7��soc@�D9fJW@��b��j@�Մc۝@�����G@��䤱w.@��D����@��B��$@�bZ��4�@����1	@�/ȓ�>1@���>��@�/�h���@��?0�u�@������@�}����@�
L/�+@����9�@�P�Fl�{@�
X���@��* o�@���2��Q@��Ǆ��(@��, ��@��R� O@���x�@��m҉�B@���ץN�@����EJ@�#�Z�T@�GL���S@�o�qQa@˜H�#mH@��-�6�@�����@�91��Zu@�9��&}@��V�Z��@�u��4@��_�=�@ҳ��#Y@�Si%؋'@����,�@Ԓ��vڃ@�2Y��@��rI�+@�q��m@�g&N%@ױW�r 	        ?�t�UD�x@8o�s{$@Z�E�a@p���_}@�k��+�@���X� P@�������@�x/�D�@���7���@�����P@�lŞ��@�p�L�L@��U�=AG@�Ӌ�y#y@�����@�D�h|y@���bMh�@�SԺ:��@�_��a!@őV�i�@���3�1�@�raP�@�(-%	��@�9�2x@ї:�?�@�B��x��@�w�)�@������@�=�U@@�/�qz��@݃@vtsL@���<��@�PJ��4@��!�%�@�3�^_B@�������@�q�B��@�5<"r@������@�}^e��@�tVU��@�B;!�B@���i�ʖ@��'���@�A���b�@���j�-@��ԏq@�jٍD` @��5����@��3,Q@�'$0ȏ~@��`�yA R����-A?��.��A5�N�@A5P�~�A>Z���AQEJ*AmWǕ'�A�ip1tA�7U�A	��Ja�CA?�!�        ?�t�5^9?�B�n�vy@�4��o@$(�O >h@3�8;L�@@�M9��D@I�B﵉@S	�M��@[Q�1�W�@cF��� @j�2^P@r��� �9@y�=YvN�@�}��O�@�����~@��/dB<6@���@��@� �!�η@�me�6x@��K��@��]/��:@�H�5 @���N(�@���rq�@��S-�΀@���8�n@Ĩ��9@���ل [@ˋ?_�S@�shktX@���[��@�Nٸ4@֑�+b:@�3�"*�@�h��*@��CV�@�%5\��[@�����@佹J�r@����G�@�ބ�;@�(!f�@�5#Jݛ@�<��"@�E����@�`��n@���i~'�@�DC�Z@�	��Th@��),�@��3�ؗ@���$��@������A�/��vA;]i�S�Ag��n7�A�v��m Aܦ���JA%V�mAw�@I&"A	�a��w�A;�Jz��A�?O̉        @�Ҍ4@��OW��A*�Y8.�A!�Z��}A1E����A<qr���vAE0�B��AM��?�AS��u�r�AY��C�A_'��Ab���=xAf��+$RGAj��
�An����#Aq�#I�At�:�.�Av��ݪ4"AyO�� �(A|�=�N$A̭?�~A�g�»KA����s��A�1z���A��f0��WA��"���A�\��ð�A�3f��J�A�hU�zCA���!�A��VW��A���RKjA��F���A����S�A�����lA��x�jA�$BAඡA�WV��+�A���F �RA��4ۦ2A��N.sQA�k2la�A��M���6A���AJ9A��=b�HA�tneգ�A�+H��sA��_|ҁA����.dA�]L�7�A�2���A��f���A����jl�A�_�΁:�A�"L,�<>A��T����A������A�l6E(F2A�/��*xA���#��)A���s�;A�|��ω!A�A�D�{        ?��G�(��@ �tO�!�@?\,&��@R?/ (�u@`���, �@jS�,���@s�=���@z�L!�@��O�n��@�{7,�P0@�tD�oh�@��N�>�@����~@���|�@��(�Ϋ�@�2b�$��@��~�ү@���.:$�@���7�@�]T��@�n�	8%@�ޔ-G�@���%��@���Q@�_��0b@�9o݋�.@�+Bn��@�3�m��3@�So��=@��r���@�����ݭ@����@�S�t��w@Ö*�G@��˔?*@�0b�^l@Ǉ����d@��M���@�J���@�@˷U��A�@�,=	�]�@Ω�ڡ�@��N���@�����@Ѯ��p�^@ҁY�M�>@�Y
��6M@�5��2�y@���@��j��L@��K��_b@��W>md@����ZPH@ٻiu�^�@ڲ�N[�@۬�4�o@ܩ��^��@ݨ����Q@ުq�B��@߮����@�Z����@��3��!@�dЊ��        ?�"�V�#g?�a�0N@Mȴ��@����@&�RN�V�@6հ����@F:õܴ@T����	z@b�sX�"@pY�|��@{��3B@����|��@�c��p��@��Ct0�@�'�T�;@��`��	@� :�M3@��L��@�%�a1@�$�O��@�@�?��@������@� 3��@�_e��9@�prz�4Q@طF�Y@�-��Gm@��\�s��@�ǽ^6J�@��N�@�a�N��@�����@鿾8�i@���1�9u@��Q��w@�|�0@������@�(��a(@�B���ny@�a��y;�@���� �}@���/���@���u��@�5�s�@���w���@���B5�9@�WKW�ă@�֒�_��A 3B�z��A���qAݠ�e[A����A�(0LPgA�#��ZA�a���nA�z
a��A��A`A��c�#�A	�	��#�A�ȭ@�AB�?u��Asw�[��A�����G        ?���⎙C@/��P���@J�={S�~@\�&@h��w*@qѥ=�'@xZQ|Z�@��w'��@���g�}@��j	|s$@�+��u��@�A�k�@�����@�UYN?��@�r��(@��^�'�^@�0�Z�i@�5D|�@��&��S@����[}@�rp�#@�v�n�?@�H����@�E�O�+@ }�X�@�5�Oo@�c$�@����()@�9�Ŭ@��׆�*�@ҊɅ�@�Tx�&%@�$��J8�@����\�k@��z1�@ۨ;��v@݂d�d&�@�]�b�@���ѩ�@��S���@�r��;-@�\]��D�@�C�O#@�)�R�@�w;���@��,��@��ZF1��@�{M�L@�(x�C�@�ny�3��@�N͕���@�1̞3n@��
��t@� @�3�@����D�@�加<��@�qѠ!�@���}�@�~q�k��@�*��+@�,%��#@�=�/@�஥k�b        @�W���A��L���A&~g%�ZA9e�5��AFߨ��7AQ�9� �AY�cT�NuAax�� Y�Af�g���Ale�)o��AqVg3td�At�-Q��;AxW\��iA|-�˝�xA�����A�=$Q���A�w��ΜA��7�Q�aA�C��%�A���0���A���pdLA����E�A�K=��`A��Z�jA���Q�A�P#�"
�A�v٫�4A��a�A��bi�_@A��%�EGA�Vn�3QA�R��ǡ�A�Q�{dodA�Sw�R41A�W
^�A�\fI1ɜA�c}��EA�ld?fA[A�wI:
�A��a���A�����] A����0�A���.���A��͕a�A��l��B�A����A��P�)A�'v�dZMA��ya*=A�Qb�h9A��,ki&'A������A�	����A���<�9�A�YV��-hA��?���AA������A�=�Y�WA����A���̚�9A�/	�I�]A����HaA���,{��        ?���T�=?��W�[@U	���R@�aR�Q@$/a����@0Mnq֜]@8����@@�:��`�@F���rY@M'A9z��@Rf�}a�@V�lQeW�@[�l��@`����K�@c�m��@g ���s"@j�ҟ���@o,ZA�@q�%���`@t~�A�@wQ,�b�r@zgBQ(@}�r��@�����1@���=��@���3?U@�[߾O<@���>�@�,�}E�@����k�@���T��@����}�p@�$�*��@��nB�!�@���g��
@��z�&S
@�~�;\�)@���Ȑ�v@���>m�g@��t�U�4@��%�M4@�6��ׅd@�j,�1j�@��g�#?@������@�8)!tt@��m��P�@���Nf�J@�P�x�V�@���1�&k@�52��(�@�Z:n]�.@�P
a��@���R��@��MM�<I@�����c@�^6!�T@�;�0��@���K<�@�H[Ʈ@��?P^h@������t@��M��Y        ?��ݡ)Y?ճ��m�?�\%�}@��'��-@�#XW�@!�Ov���@+����5�@4T�F�#@=UL�O�"@D���\a�@MQbǊ�@TT���so@[���ӆ@b��o�@h��2d�r@p	yp0|,@t�Uc��v@y�j�"�@���?�A@���SZޒ@�R0:�@��p߉�@�1�$�޾@�F t��@��o����@��}fuBb@��=�q�F@�7����i@���b���@����&0�@��jj��@@�6�j늾@���{��@�
f����@�G1H|�@��<�o�R@�Z�*ߍ5@�82H$�@�(��@�ա���@ã�*�p@ŕD���@ǫD	�@��Md��@�J�
#��@��c %�>@��C|�U�@�8�T���@��|�E>3@�a�4�FK@���<v@��_y�#W@��߇|0�@��x���$@�q�\�F@ਊ�>U�@��V"mIp@��+ ��@�s���@��H�Ly�@�S�M
¦@��$Y�}�@��K�B        ?��*H� �?�YVDvy@ T5A���@5hm�q�@#h;͊��@0	�6�@80,�c&@Av>�4@G"ٲ��@N� ����@S�MkKu@YC/f��@_�fp��@c��~k�@h�Y���@n��0�[@r�Ha��5@w	c�t�@|,~�@���W	��@��$����@��_��@)@���2�@��g���@��͇���@��{%��@�#�f�+@��C���@�����@�(n9�_,@����E@�ޑA��@����щ�@�=Y ���@�
�,���@�"3��@��)����@�����3�@©�+A{@��}�-�C@�H'۵'�@������#@̳~�{�@ϼkľ8@р?�LV@�AE5pl@�"�d8H
@�%�$í@�LD	]��@ۗ)��*�@�� fR@�O�HX}@��Ý�@�$�>A�T@�7��g8@�OL��M@����y@���Dis_@�m1��&@��ԩw@�Ȱ���3@��J���@�x�M�        @��,^��D@����x(@ҹ����s@��%2@J@�#��&{�@��V����A@�ʬ4tA��=��A�����A�[i��A �ȡLC�A$!��$�A(��I��A,�X���$A0��&�YA3NL����A62�p�hA9\Z��L�A<��󣫛A@Gg�jABN��
�AD��A�PCAF�sw�w�AIf�04��ALR����AO'{XAQ\S�Q"AR����hATqJ��w�AVI_6��kAX;��g�AZH��
�A\pR�#�A^�9�y�SA`�[.jI\Aa��i�Ac
�f���Ad_5uO3Ae��[��LAg+��N�xAh���l��Aj&�S�,HAk�Z%���AmL��1�UAn�G�'4rApN����Aq)����Ar
h{�?Ar�=�i�xAs�B'�Atˇ�46Au�&��T`Av�:���Aw��~�e�Ax�e1�C�Ay����`�Az���%A{���лA}C���A~FgW�Au��uA�V?��<�A��pd�        ?�pb�Z��?���.�?�&@�$m?��2�L�N@ ���Ԝ@|e��b)@�?" �O@aQ����@%{��
�%@,c�l�p�@2=�TW�@6�Jp�pb@<::���
@A�h�@Dp��RM@H�G��o@L*ee���@PH���1@R�,��7@U:��@W�V��N�@Z�5�C��@^ ��O��@`��兇@bcZ��'d@d9���]�@f*�P}@h7T c[Z@jdw@�n#@l�7��@o-e"� 0@p�.;��@rPO�G�@s�ޑhA�@ug@��t�@w��n@x���h�@z��i�>@|�"�x|�@~��*J-@�y�ٻ@���yB�@�ͦcsu@��or�@�X
r[=�@��؄0@�	�C@����;�@���n@���]���@�D�[�3@��A)�r@��Z$�/K@������@����Sd@�����1@����Z��@��3s���@����摯@��ȑOq#@���D?�/@���I.�@�z�aU        ?Th��$�?�'�դ��?�R��&�?�1���|�?������g@��]b�Z@��P�8�@+hi��@9�����@F�WM1�@Sf@8�@_�19:��@i*��@s7�q@|����ȷ@��Ϋ!0�@���q��N@���ڮ�@�H�W�@�	��4�@�9� ��1@�y����@�;g;K�@�S14��@��~>�@�"���@�Yp��@ϵi:��@�$p�m@����!�@�/�-&��@�A�~	�@�oD)��@�%��*.@��Q�s�@���]@�T�]� @���,b�@�؍�Q`@�_D���@��ߍ?�@�����xA ��A����$TAX�V�g�A$�ƾ]A��xKoA	 �z�A�����A7ZpH�4AuW�ȚGA�n�PQA���HA^����tA��
]=�As���VAkg#
�A�0�ݛ�AU[8ϧA�[h��yAf�#��A�R�}�JA L�@y        ?�/���V?�=��n[?�C�@U��@ ���@|��W�@#��Z�@0Œ�4\�@;L�kU%@E߭	@OQb�~9@V�}٥	4@_�Ŷ.R5@e�^��H�@l������@r唿�<�@x+��@~L�<2>�@��1F�8@��'���?@���"�,@��/�>@��:Q%�@������@���+�@�P�9��@�"A�!8�@�Q����@���ʰ�z@�g�&@�Xa6��@������H@��:�L�@@��1��@��}%f~�@���kw�?@�n�GV�@�=3u�:@�4��ir�@�4�ñ�L@���9��-@���3~�@��Żۋ@��A��@�B'Y��H@͹=�9 J@�-���ف@є�*��@��ʰ��@ԪAJy��@�Y�+���@�#a9GN�@��t��@��g��@�"�b?�N@�-�Y�#b@�X嶒O@����S@��H˜�@�4��Ch@��]\�U@�tE/{�@�uޞ�P@�1�x��z        @E�����p@���pD��@�����@�5��/I�@��#F�@�z��^@�[��<�y@�/�]2�@����rj@�RL�(^*A ��νA>�`+:PA
4�޷+6Aϫ]\ŪA	�<���A����AQ}S�Az-�c�qA!~f�c`A#���%�A&�`ظ�A)P��ʊDA,Er��3A/e���3A1YNpG8A3G�R��A4�$N�jA6�ZY4�zA8�sA�0A;�	΄A=C���A?��%6�PAAEj��ABk�����AC����AEO�u��)AF�^�T�AH���ӑNAJ:B�&@�ALzj*��AM�����bAO�鼶�fAP���萸AR�Y__�AS$��q��ATL�7��AU�� m�AV�Q�pFAX�==�FAY\Կ�AZ����ڿA\!e�-W A]������A_�=a�A`C^MSF�Aar���Aa�n���(Ab��e�CAci0����Ad?M�J �Ae�_��SAe��>��(Af�X��        ?Ɉi�;�@ ��UF&�@ ;$z0��@3uݵh@BNG�@L�.���@U�@{ў@\��yS0,@b���\\A@g���
��@l��L��@q/ȥ�X�@t2ے�Z@wiC��@zӺ���P@~sb*#�<@�$�#�7�@�*^��a�@�Jط�7@������@��\p�G�@�IA$�@��xa[��@��'�{�@���X~@�����4@�Q#�X�@���s�%@�!��@��X�p6H@�x#��}�@�:(���@�-�U��@�w}@�3�@�q�~<��@�u�'�@���H"
@��^w�H�@������B@�ⲣG�@�qo(�g@�S���C@��AL��@���� {@�A���b@���>�'�@�s���@��(]R@�tQ���@�/�����@���'�WZ@����	�@�lM��*�@�.L �@��7-Z�A@����[��@�{-.��}@�A��圯@�	�tʉ@��4���-@����>L@�j&���g@�8��k	        ?�C6U*��?ղ,b�V?�.{��;@L/�8G@�?;���@(40}�G@2�gW	q@;����۪@C�< ��x@K{_E�r=@R�g�`�;@Y,�n���@`�g���@e�IW3�@l0a(��~@q�9�J5�@v�)�]@|?��Χ�@�b�=%��@�)|)v��@�HC�{-@�p@��@��TD@�.&��5j@������@���a�%@��!����@�N�vF�@�پ�x�!@������@�U�k��@��� �@��u�M@�d��L3�@��:�.Q�@��贮f�@���<F��@��E���@��pȴ�f@�|��x�(@ł�+��@ǰؿ��"@����;H@̌V�P�@�=
�JK@�����@Җ���@�8w�[�@���R,��@��ߵ�@ٻו�L�@��wD�@��&��[@�!��̙@�XT�c��@⠆R|@��Y=�k�@�ja��@���d�@��Mx�@�<�A��@�
[�u�a@��Z�-        @4pt���@1�.�{�@L���t@\��%�2@g5�T�l@praI�@u���JK�@{�P����@���[0��@�W�V�.1@��y���@�� ��j@�x%��@���
@���2l�B@�4ƴ/?@�pm1�D@�_�Ȩ~@��l�I�@�uz�]�}@�*����U@�N'[1�@�/�z�@��!� 
M@�5�����@�03u%u�@��,���	@��}��;@�����@�s�i�@���kgT@��:k��g@�ğX��@��_ܟ":@ÄZe��@œ*V�@���a{�@�7NO�ڍ@�Ќ{�)@Ϛ�S�@�J����@��陦@Ԓv�/�Y@�^l�z��@�G�Cj��@�Pb!&z�@�|٭��@�͎<��@ࣲ\�s�@��\�p�@�\�.F@���4�4@�i��ZP�@��jN=/@���v�e@���پC@푛h�a�@�0�۔@�ْ8�@��lw^	R@���Z;�@�Oඎ2�@�����        @���V�3@�+'�\��A1�

�A����A'���)A2�U�ׅA9B�/A@z��n�AD�^�.��AIWړ�2�AN8w!��AQ���4_ATf�:w�3AW?��1ْAZ;�˹�"A]ZG?�A`M�^AGNAa�e��P\Ac�%��$;Ae�Ԝ�_�Agp=%s!Ai[�C.IAkS8�/:AmW@^�JAog�_�=�Ap�w�|�;Aq׭��NcAr���tAt"��h�AuE��R}�Av}�t]S�Aw�Ҫ9"Ay^#��Azr1F���A{޶0�5A}Y���6A~�g>��A�;���
�A�G�9�A��&9��YA���Iq�A������?A���0uAA��A��`A��#m�A������SA���*{��A���U�.A���+��A���Rt�*A��Q1.��A�����A��g[��!A���S+�A�F:���A��ֵ*��A�C}/E'A��v�1�|A�By��A�¥S�(A�D��{�A���e4xzA�Mc�2Aa        ?������?���2��A@��d]
,@,�
w��@:.���7�@D�yp�@N�"F�@U+��2@\�@e��@a�w���v@f_�ߖ��@kED.75@pU6�9��@sK���%\@v�e��t5@z@ۣ\�@}��Ƈ�t@�PQ���@�=�_a��@��,
�Z:@��� �@����L@�z�ӳ��@�,����t@��\T �@�<r���@��g`Y@��,�L�&@�[s�	@�7��%��@�(Tc���@�-��b�@�#�bo�@�;x��9@�]�@�@������@�Ñ�l9@�K�,�&@�VEjSA@��M�i(M@��d�D@��]#3�t@�����e@���{��@�"���@�Զ"��_@����%�@�~Fj��:@�[>��i�@�=�S��Z@�%%�Aڧ@���f��@�xn���@�����3@��j�N@��Ϯ�I@��\�OF�@� I���V@�2�%F�@��� E@�/�-~�^@�#�j�U'@����Դ�        ?���;��9?���x�@�P�h��@�ixc|�@#±~&@.���{�@6��G�]@@�I�}@F�U�`@M���J6@S�8�@Y�T�:��@`��u5@e�C��Ѿ@k�[���W@q���L
5@v*3�dl@{�"�{��@�':w��@�	�=�Y�@��Mv@��ѥg�@�R����@��Q�dt�@�nJw��^@���(P@�-.��@����j@��֛��@��i�-S�@����!@�X�ʔ��@�J�I}��@�`�#Z6@����t�@���z`J@�����.@�Cu�~@��iQl&@��;p�r@��F�>��@�|S�Ϋ�@�SQyR�@�EaU���@�Tuorj@́_O�@��N5��@���"%@�c�+��@ӻ�H��y@�&���f%@֤$���	@�5����j@����|@ۘ8v��@�kLb֡�@�VT5�r@�6�]d�@�a͋U�@��MW��@���ǒ{@�>�{)��@��=}��        ?��f�Qe?��9����?�Fs^�D@A\fJ�<@�? �@ /��E*@)��On�@3AR*8t@<5��A=@DO0[��@L��Q�s�@TJ��wl�@\&|~{d@c?�v�1@i�gS��@q+�f�m�@vae;R^@|�V8��@�)�(�@��T0E��@��]A���@����(�@��M�d@�����@�����Ė@�h���f@����E�/@�>Ȓ�CI@�>����J@���w,@�-˭�@����B�@���B�@@�""�`zz@���a��@���e{�@�����w�@��E��@¸&��@ģ(���@Ƴ@L��@��'30Zg@�I�ö��@��˩cAN@�C���ٰ@Ѵ B3@�;7�}�@��SD�Y�@֎ƿ��2@�[׷���@�@�����@�=����@�R�,�^D@�?ŕ�T�@�bWV��"@�����@�˨��@��Q/��@�e��j¸@�Ŝ�D+�@�2l\T�@꬘!$�q@�4�o4�        @�Zל���@Рw��/@��%(�GA�x%�4A�7j�AB�
A",mD0RA(�Wr�8A0�>ہA4SX��A9}��A>L�gC�AB	C�2��AE3>���AH�h8��ALi�շ:AP>I�k[ARqOz>"�AT�%`�AWYf�>�AZ���-�A\�b_��A`�C�T�Aa�r���Ac`��:�|Ae.ؔ�UDAg,]u�Ai`�|#�AkS"wqAmB�H�)�Ao~J8O._Ap��!
�`Ar{�`	AsZ~K�'At����bAu��U~I�Aw\��6��Ax��n�AzC	���A{�E,(�A}V��N�NA~���C��A�K<oA�#�r��A�.�DA�����RA��ce�A����^�A��s���ZA����ٸA�ȳ�W]�A�ٹ��qxA���nE�A�*���A�=�� #�A�o
4p��A��@�NA�������A��N���A�?~d���A��ݯ��A��Y1�4�A�G�I{Ѫ        ?�g�˶ݶ?�3��E@ �-f{��@)$��1`@$���o�q@1.���@9�C/�@B=o�A��@Hl��0G@O����,@S�a��1@X<v�I�>@],0�@aG���@d1���@gR�-iA�@j�f�4#�@n8�}��@p�su��B@r�yk��@u�kt�@w[m
�V@y���[j�@|<�R{m)@~䴎�"�@��?�@�0@�W��@��Y8�Z@��� g�@�g%�M�2@�T��#�P@�fmt�0@���&��G@���D1O�@�E���Ä@��l`NXO@��ߊ@����Z�j@�Mm=�*C@����b@��,���@��N�؅�@��{�\@��nK���@�Ԟ���@���}��@�a��E_@��4�8�@�/ɻ�;@���`�g�@�C[P.!6@��T@�1@�����n6@�ey5P�p@�����?@���/m��@��uΏ��@���v���@�����?I@���"���@���t�/@�{�8V$@�U[��@        ?�q<�-�{@|�
��@9#��w5@S0�es�@ed{�C@rݡ��B�@}��6�Q�@��3R��@����?Y�@��=��Lq@��x�@�����j@�~�"�@�й:�6�@���T� d@�<�m�Y�@�q�J[��@����m@��Hj~�5@�!�)�$�@�tP�j�@�񔴬��@Ǚu�"�@�l��Q�@�m�'��L@�O����@�۱O�@��,�W�@��\/'2�@��өZA�@�!<���@܀Ti	@�`�,@���|�Ӆ@�_���2@�2j@`x�@��m��@��v}��@�����@�TK�l{@��qa[��@���@���
�l@�pn�[H@��V���@��c�ؤ@�wz�ra@�N��\�@�@[�i/�@�L|���A :�(�A\/){A���T�WA̐B>{A��E@cAzp��3�A驴to�A	j��!A
��#EpXA�jez^A[�"�?A	̈́�eA�c�g&        ?mQ���?�3�g��?�'�[:�S?�ZX4p<
?���{Å�@:l��;@��E��A@.4���o@;;U���@G�n���6@S��jb��@_(��|@g��u+g<@qW�i��[@x��TRЈ@��t��1�@�OſL҃@��|��@�fƵ�=�@���o1�@��aE��@�����=�@�3�+O�M@����t�k@������u@��\�"�@��U�K@�x���8�@��B����@���(��@�WJ��@�<T)��@�#��T�#@½���+�@�n;-�	1@�6�,S�F@�0�D��@���xWO@�:o(���@�|�=��@�q�܍�@ѹd�.>@�'IV@ԉ]�@(@��%.��@׸�����@�w����@�R��?@�K e�w@�aݐ���@��e�`�@����8�{@�6"�@��@䅭��^�@�����n.@�\�C"��@��B���@�C`�@�0��y@��,}�p@���F�q@��Pnf��@�؜F�m        @rIq�6.F@���Or@�i���p�@���̋� A��{8��AC��ϮAܔ�O�/A!������A'աA��aA.���z�A3;�;�A7t�c��A<�b�9�A@v��rAHAC���}AE���AH�����AK�=���AN��E6�/AP���
AR�<���AT-�<�AU�p���.AW�m�y֎AYX�/�קA['�h�,�A],��C`A^큓UP"A`tý;%Aa}�&�FAb����aJAc��Y�Ad�lo�Af7�_筺Ag���n�dAi k�?\�Aj�[�s�Al�i�EAm��ֺ�)Aot���Ap�Q\gH}Aq�f��9Ar��L���As���HQAt�ؠf=�Au�E{_�Av�9����Ax	����GAyA񆥄�Az���\�A{�ao�wA}"ɍ�@�A~~���h=A��9�&�A��_�4@$A�_5����A�!][�A�ټ��A����ީ�A�^-�sg�A�$Q��A���� ��A�����2�        ?�l��8�?�R�X�L@��Oj��@���7t�@%~�̚s@0ڧ)�]@86��Ii�@@`t�1�@E3bq�*@J�B�pB@P8q<��H@Sl�^t[R@V�C���@Z��2L2�@^�5O��F@a�x"[@d��N@f��V6\Z@i~R�eO@l�yJ @o��j��@q�xWV2@s�z���@u�4kd�w@w�%c{�d@zD�����@|���5O@9��]��@��ZI�]&@�U��9ڮ@��ݎ�0�@�N�Y�@��3É��@��Q���@�G�`u�A@�xȁ�q@���h��@��`:�;:@���k���@��V��@�*�f��@�T|�y@���'���@���{w�@�*���MY@��7$���@��X�Ӆ@���v��@�*��96z@�ս@��V�2�@����-��@��Q�=@��MlS�@��b����@��N;移@��3��G@��C{X�@�ME�p�@�A���@�� �?@��>����@�����        ?a���?�~���?����?�qϡ��?�ec��-@ ="m��@߾���P@��{}��@)pE(�+"@5��al�@A�ER@L�5Z
*@U�hUA�b@`����@g
��	�"@p����@u�D�i@}:�S��@�"M����@���=@gK@�6�{���@��)�K��@��
�V@�U��{��@��7q@���E)@���g��p@�?5:em@�I��9(@��~���@���0�F�@��S��X@�#�S�?�@�sa����@�~�H�
�@Ķz�3V4@�ض*@ɴ���&@̀�bs�{@ς�<U�W@�^���ň@����~@��!�}N�@��
���@��8��Bv@�45���@݊���@� ء�*�@�M-���*@⪝W�;f@���et@�u��@�-�6�-@�� X|S�@���k;�@�[��#EK@�>�u��Z@�bޒ0�@�"fFr?�@�4���?�@�R�ǭ4�@�|��X�I@��ÁX��        ?�m��@;y�1
H@ Q���	�@2X!�_$@@f�'��s@I�oh�8z@R����@Y��ؚV�@a`v�%4@f�
��-�@m"A�T�Z@rv�����@w)�=���@|����ɦ@���b�w@��ڧ���@��I��@��y�@�Q+l�w�@�(jJ@�~s��$@�C���/�@�$Lk�<@�h�v���@�;��@�>�W�!@�q#�̊^@�Gㇶ@��I�ة)@�	�Np��@��?��d@�����*@®k�Ш@�㒞�}T@�C#yH��@��F�G��@̆YS�x@�lٺ��@�A�]B�@��r[�@Ԣ���S�@�y��p��@�k�
�f@�xp�[@ܠ�q�ȵ@��`U�@ࣤ�1�^@��/m�F@�1��9(T@���@���?�$@�{QHǓ\@�	�\�^n@�ws�i;@�Xg��g�@�����	@��E�w��@��K�8k@��W/��@��PD�v�@��?L-I�@�
,="t�@�)LT3�        @}D_�ȑ�@���޾�@����j%�@�p���}R@��f�G�@��.���A�d��AN�]V��A=谪�A�^�xYA�Ĉ���A �;q>PA#�BC��A&���A*w��ư.A.G#?��1A10�U���A3eS(���A5��{pA8I=���A:��Y��A=�C�7�+A@j����AA�� ��AC��h�)�AEd^���AG3m�H{9AI��c��AK��P8AM_Q�TAO2�k�h�AP�K��ztAQե��]�AS�=ŚCAT<q@�W$AU�o����AV��K��AX*��!ĚAY��4F��A[i,�AFA\���VKA^,q^�A_�U�I�wA`����RAa�h��8AbjG ���AcTfѡ��AdE�ȗRAe>q�|IlAf>M�u�GAgEP`�guAhSh!*	{Aih��p�Aj��W�!�Ak���WAl�P3D��An
2�ycAo=?�V��Ap?
i��mAp�R�q9BAq��R.�Ar7�S���Ar��.[��        ?���čn?��}�7��?�b�[:^@��.�
�@�R��n@4�Y_�@&V�`�̫@.��f���@4S�:�ֲ@:
O$@@: �V	�@C�ȶ���@G�#p�!h@LZ�l@P�էK�@S�H|2��@W�-��@Z�0)�5@^�V$&@a�
�k|1@c� ��@fwwR�@i7�k?��@l2����@ol�&�."@qs�=!��@sP��9T�@uK��X��@wc�)�Ť@y���z��@{ꡠ��@~Y���q�@�r��T��@����K�@�*Sn��q@����@�|$�9�@���o,��@�WX�0@��b��@��եy�@����8�@�TPT&@�X���@�h�@Q�k@��w��/@��L�W<@��PF�0@� |T[��@�l���@��
W��@�)t��'w@��#�� @�2�&�@����C�~@��M�,�@�l��^@�D�W��J@�$%�c`@�
���@��>)��@��,]6�@��Z<��        ?w�z���?�?Y����?�Y$�f@�9 �ܥ@ja�Y�>@.y��p>@@YD�9_!@P�_���@]�\ �1�@i�����@t�i��\�@��2@��9�r��@���B�E@�\?�
�T@�F*� 8`@�pGo��j@�)Bȣ�m@�o*�2X@�Ni Jq@��$�-�N@���A��E@���0-��@ĩp2���@�*�r�@˹2T"b@Ͽ����@�զ�Ӎ@�j�*p�@��hvSR@ٯ�f"j�@ܛ��g�'@ߺq��ݹ@�䷪�F@�K4�� x@�*5?@�#����@�63#�$g@�`�l�
�@���˓.z@����B�@�0J(�3@�nN,c@��,k�@���X�B@�c�ce��@���p�J@�>�����@��_�r@�P����@���<@��=�!~ZA �h@�$cA��U�@bA����]�A��N
LA�\���A�,��͆Aݫ��QA졡~�A	MZ]9j�A
�b��A�v�B%m        ?�asõo?��-7� z?�= ��'?�aX̿@�|��{@�9f�@%?^�	�@2��׼@=��}c��@G�%��8@R�&�v�@\3Ȫmx�@d���ˢ�@nhl8|�&@u������@}�7����@� z]��T@�c��^�@�IPI@�����َ@�:�:�X/@���$���@�����@�Q(Wʘ@�1�Wi@�����rW@�Z��|�@�5�g�O�@��	��.�@�Lm.�*�@���+��@�L��`�@��;��@��˲j��@Ѣ&v�r�@�&3lb@��ޔm��@�����f@��ϱ�@�I֯��c@�;�XXh�@�Z Pb' @��gG@�*0��ٖ@��Tk��@�����@�{#@�x@�W��@��y�S/@��]��]
@���:5�@������@�e\\�T�@���k9�CAY�r	\A˼�]�AR[�VA���@A�=r��_A	b�P��A>x�?�A/^7�SNA7qy�p        @b':u�3�@��.�@�>ޥ��@�ހ&#�W@ډL��1_@�|\�x�o@�J���@��V���A4�D�'�A��|��A���lwA%�~o�nA\Ȫ�&A���-IA"模��A%�09�K�A)�So�\�A.c�sN�A1�'��	A4M��iA7"�b�%7A:(���A=`N/��A@f��Ϧ�AB;M��GAD0��T��AFI�5�eZAH��u�SAJ�����WAMC����AP�e�U�AQ��ߺ�kAS`/|�
AT�~�V�.AVS�>�&AX�O��AY�L��XA[��X���A]��l��A_� x�BA`�*M	��Aa�>a��Ac}��pAd=��:�#Aeq�DAf�_��,mAh��qَAi�fH���Ak�����Al�o�8��An�ͅ�ApI��94UAqRc,E"�Arj-s�TAs�\:�8�AtįˢY`Av�����AwVD9�ZEAx��ЙAz(�a�0A{�=�A}(zS�A~����0        ?��	��?���^�@eS�
@�6 �@*$�\��q@5*:��U@?;	[�U@E�kd�I@L��6m��@RW�u>��@V�ꐪ�@[�-��@`͡��@c��J�q�@gAQ᮴�@j��C��@n�ed�i.@q��*7'@s�kj�߯@vR�}Ҿ~@x�� �t�@{�Ew�@~��#G�@� 8���@��?�3� @��.�t@�m�h��@�t���l@����ޘ@�݂L^9@�@yt��@��%���@�2o븈�@��U�'R�@�k���@��`�<WF@�#��S�@����o�h@��W��@�_�Ÿ;+@�E�s�7@���9��@��K�9E�@��&p9!@��L�:Y@��:��@�us4�1@�R����@��B%8�4@�ف1�_@�+g�0Ǒ@�����`@��#��ra@�Z�=-ħ@�i`�.�@�)��i@���l�"@���*#�@������@�WK��Y@�-\��o@���B�@���gK        ?²k�=��@,�a�,�@$q��R�I@<K��
�X@Ml���G@Z*��-`�@eV�%��@p�#�@y���j�@���+G"�@�k$E{@�z/p�T@���)C�@��F@d@�	T^��4@�u�p@��_�ғ@���g�
@�@�8M�@�l��@Υ�{��\@�ǐU$�@�mf��ob@ܘ@|[@�Qw&=@�����@��G���G@�!��Kk@�t�w��@�?�v��@��ּ��`@��%�6+�A #x#Ų�A�3��aA_�P���As;�W��A������A��T:A�gw9A(Z���A��eX��ARZ����A;�� I7A_��q��A!`��0�A#0�,!_�A%!w�HDrA'3�!B7A)g���z�A+���A.8C����A0j�ޥ=�A1�y��ZTA3>�+х�A4���a�A6^�Bf��A8n�G[�A9ξD��A;�@�A=��oe-xA?�s�i�A@��/t�AA�9
l        ?���w�?�� �΄@t7 �A�@4�~�tI@DC�I��@P�)�&��@YFg�=�@a�.��y�@h*��o�@p<�+��@t���9�u@{5xl�DU@��&�R�3@��7j6�u@��#�j)@�'��;#�@��Tҹڟ@�p&PA̦@��9q3�w@��@B/[)@�Tb�!|�@����$�F@�,��a�8@��IH"��@�=� ]�@�V��@��;�<�@���|
;@ɥo���@͡�R5{�@���jp@�z�US�@�,�9��Y@� '�7}@�X�E���@���r[6�@��z&���@��	���@���x�@�x��~m�@�����@���F�X�@�Ub�Z�@����u�@󃹀�4�@�<񟶉�@�B��a@��m��K@��8~G��@��ӛ�a@�Ü�"A �\��A�E`��%A�v>��A);X�;�Ah<����A������A'�]eA	]	�
 oA
�92�0wA.��\��A����A&
�c��        @�I�8�Π@�I	�%�s@�&�Y�A
F��;LUA�`�>��A%)��'�A/R�z���A5� ⶅ�A<;�ΨTAA�	�	�AE͕BD
AJ��-DAN��A�AQ����k]AT`UQ �xAW�XxX�AY��4#lA\�F�6�XA`����Aa���G�Acx�}i=KAeR�>rLAgG̡�[�AiZ@1���Ak�x����Am���dAp,�W���Aq|����Ar���#�AtU�]��PAu���AAw�g%~�<Ay96�&�A{�T�[A|���iA~짏䐓A��K�@A����ɔ]A���23�-A���F���A�F�F��{A���b)��A�#���A�w
{nLA���ԧ�A��u9�lA�5��C7A��lf���A��.M��A��YZ(A��U�Ÿ�A��6ž��A�����A�ζ����A��=Zn��A�y�79�A�2G).A�d|͍�bA���N=sJA��bį"$A�+�3��A�}�(��A�k�&�WC        ?��=ˁKG?׾l#:t�?��NAx�@?�z��@sd�/ @&4�����@0a�}��@6��:�)�@>.k�V��@Ch>&��@HY��X�@M�����@R$h�P�,@U����@Y�إ��
@]���&�@a\���@c����@f���@i�@;��@l��(P�@o�U���@q�&n
@sZ@���X@u'��%�G@w2#�*�@x��W��@z�2�k7�@} �"�E�@!�QLO@��j,�@�@��GlC�#@��*RxI�@�1�F;B�@�uE���F@�ī�2�@� UCS'@��Wp��8@��&B�j@�xd����@�c��@��+>7$�@���<ݲ�@�r ƨ_O@�Mܡv*.@�/d�U�@�l��X5@����!@��.t�d;@�ꓶ��k@�����@��*K~��@��/ty@��n���c@�,O(�q@�ova�@�=�sg@�c�4���@�I��M�|@��אd��@���3�N@�/�x�@�ۈ�r��        ?{|$�Aا?�݅�P?�ˉ����?�4g$k^@�ƈ�+@g�	u��@��Ը�@&��Ɠ�@1�����@:���@Ceg�dg@K��tOzZ@S2�p��@Z>�S��@a��T�@g�����H@n��i��@t#`y���@y��_�%G@��> �أ@����@�J�fr@�O��h@@�
{sO�2@�bܣS܃@�e ��g�@��r*q�;@��k�5@�k4"���@�t�/S�@�u'=�y�@��T�k�@����(F@�s"��].@��֙��>@��ل�v�@�5�hǒu@���<5@�1���@�*"��u�@�[0��ǆ@˥�P�za@�	)/;A�@�Bn����@ь-NUJ@���1J@�B�t�<�@կ;� �@�&��5<@ت\\�֭@�9m�ڏ�@��eS�gp@�{��;��@�/�um�4@�xS�z�@�_����H@�N�gU-�@�D�-���@�C�����@�J�;K��@�Zڣ��@�tŊ�X@��X��        ?g/ʓ��,?��?�)r?�	N �G?�Fx4�?��W�ڎ?�Ӯ�A�@a��~@���@!R	�ɣ�@.{Mý��@9�D��G\@D�?����@P�L;/w@X���B@aG|+�[�@hj.},@pF.x��@um��ֱ@{��C��m@�W�!�m�@�l9umH�@�g��'�@�,Wu�k@�o����@��O	���@�l����@��nu��@�|��W^B@���Ԁ@6@�B�TW)�@� 4^zil@���3 �@�M�K,A@��8$X	@��߳!�@�+��@�|V��"@�iOd7M@���#�@����@���L��@�g`�(��@�So��@�c�&0P@ɚ=��RX@���m�;@΀�;��@К�S�(@�	�����@Ӑ� �/@�/z���@�噪�K�@ش�%ύ�@ڜ�krx�@ܞ'����@޸���[@�v9p~N�@ᜫ��G@�ϕ��ժ@��w$H�@�ZT�}��@���j@�p3J        @\�D��@�dQ��#@���f� �@��-	���@܆�F��M@�U�U@���9��@�����B@��+qrPA�`�ՃMA�*?F0AČ/�)�AC
�q�AppkK�DA��8xA�R�2RA��cI��A"
�T�iA$T�[���A&�|'juQA)@G���MA+�[�I�A.�y
[�A0�$�^}�A2-��J:A3���u�PA5@��5�A6��]�=�A8�=p5��A:67X�PA;�uV�#�A=�۳��A?��!k7�A@��> $AA�E�uAB�HX��)AC�p�LAD��7?��AE��. �AF��pWA�AG�&�� AH�Bg �IAJ!^� 5?AKQ��\�AL�5#ؐAM�h��AO�y`�AP6}ۓ�DAP�W��[�AQ�����ARQ���AS�W��]AS�
�.ӺAT��EEIAUc.@�|AV3	�V�AW�y��AW��ǯk`AX�G�غ
AY����u*AZ��q��zA[yء�A\l�Y��        ?��Ӊ��O?�<Q��|@��[��@z[rGڇ@%Q����@1Hi��W@9mX�&H@A���Y@G
�7���@M;�_�@R�8 ?@U�=h�6@Y�A?�]�@]�f���@aB����@c�b$|�@f)5u:@hɅ�ن@k���R{�@n[꣗
@p����C@r)}UQ6@s����J5@uV9ϣ2'@v� �1�8@x�����#@zs)]��h@|=e�C�@~����o@�X�j�@���C ɕ@��~��uJ@��{{�d6@��8��@������@� ��@��<:y@�*~�r,@�E�hh�@�f>W�H@��\��=@��/��i�@��?1��@�e��@�)�����@��;@���@�mу'�u@���`?�@���L�s@�n_&��@� �L�H�@��j�y�@����V@�N�m9��@���k4@��>�H�@����*�@�m"�<	�@�>��8��@��i�M�@��h���X@��}�@����7b        ?��Z�T��?�gV���w@��M��@#�,y�|@2m�n'2�@>_Q��d@F��Q�g@Pa;�@U�Gt�"@\_���z@b-,����@f���Ш@l����Cs@q��	ٮR@u��/ل@zg��̨�@� =��c�@�F�t��@��Ƨ�@�u��<�@�;:d��@� &כ�@�Eq�i��@�۱�tG]@�ۯ�RB�@�&$O��B@��"��Q`@�MB"�w�@�CEӜ(@�w�	W@�&���@��ѤK�@�� K$@�A�Y�1@����~@+@�I�Z�\@��]	��@��hp�١@�$9Ӛ�@��$��-@ũ��#@Ǘ���_@ɢ�����@��mm�U@�E8΄%@�?p��Q@у�@&�@��0�4M6@�?���@շa��&D@�@��^��@���+G�@ډ'Y�I�@�H�:�<@��p��@��'�g�@�������@���<��@����S�@�%!##�@�E�`}y�@�o���7�@�q�W��        ?��G���?��~?���?��4���8@��aU�@!{l�]�@-ƚ�L�@7>Wkr��@A6SH��@H�N�0��@QV���j@Xo驈�@`t �W�@fNm@�1@m���)r�@s�>���f@zs��r+@��m�pr�@���m|@�t9��%�@�1�ω7@�LF�&��@�4���*@���} �S@�	��@��'�$�@�Ѥ;Wm@�z2��@�Yv�,&@�C�4�@�B��v@�,'A�@��x!t@�+J�?,�@ć�G/��@���yP@��9��@�⤮�6�@��� t8@��J���@ӗ�]+�$@Ճ�����@׈���I@٢�$5k@���� (�@� �)��@�3��P�J@�f���@�؅;@�ᔉDS�@�*�؟� @�{M5�|I@���.�m�@�4~���@����@��Lz@펕��v@�U��N�@�V!RbV�@�'XG��@��ܐkL@��T��Z@��P�d�@��Sy(        @z	�PyS�@�t	v�@�O�{���@�_�ӑ�@��Z�5�A����AC���MA����A	jX��	A m¶)�A$*��nڦA(6\m��A,�ل�A0�X}�'A3\���A5���֎A8H�#P'
A;k�OA>�@��/A@����z�AB�y��tAC�i�0�AEY��'�AG�]� 4AH�`��^�AJ�/��ALL�t�@AN�wq&�AO� ת_AP��o?�/AQ��¨�4AR�%9խ�AS��6zRZATu��p�AU`��sq
AVM��.AW<D��S�AX-?��mAY �<9�]AZ�*�A[�
�0}A\�Ui�A]
��H=�A^J=�}A_����A`Q�#d�A`�#��}AajGAa�_.QAb6�f�w=Ab� B���AcY~Y2��Ac��ԲAd��tl}Ae Oe�-�Ae�2S�&Af\�;��Af�#���iAg�6�I�1AhK�*H��Ah�EY�E�Ai������AjQ�u<m�        ?��h���?ڮ�t*t�?�3�c���@վU��P@����UE@&��h}�@0!�K��@6#�rE@=�gЂ1@Bw��p�@F�Lsk@K�)�d�@P�j��M�@S��T"@V��u��@Z'�c6G@]�H�/�@`�Pb��@c���@eX��z.-@g�M��)@jZ�׀��@m�r9��@o�L6b�:@q�@�=8�@sv���O@t�cwv�@v�%��?�@xn���#@z]��Y�@|c��k��@~�|���^@�ZJ��J�@��9�+�@�� u�~Q@����F@�7�ۇ�@����[z@��?SvZ�@�_���3�@�ި�s:E@�m!b�+>@����C�@����֒�@��T���@���ܻ�3@������=@��m�i¢@������@��iZ�&@��e��]�@�ӈEn�p@������@�0vS7@�n� ;/@�����r�@�
��),f@�j(wO@�j�j8t�@�&��9� @��u=��g@����P�@������z        ?���L��?�e�N��j@�}jY�0@��b�@&�ӎ'�?@1���}��@9���Γo@A�����@G/�J<�@N�"8H@SU <A~�@X��G��@_������@df�"n�@i��DZ��@p@�� ��@t�yf��@y�z��(@�: ,+�@�����v�@��*c�&@��چO�@�*�4�@�ڨ%���@��-"��@� �j�@�K�L�5Z@�z����@�,�i"�@�)�N�@��I|�@�s���,@�U:�B@��33E�@�¥&C@���a[y�@½x��1t@�(�Em�n@��Uhh�@ʼI�R�@��e����@бh�:�@Ғ��ӈ@Ԝ���@��]���C@�+�Y��5@۵d�3�x@�m�D*�@����L:@�7�M���@���Q�ݹ@��� �@�yZA�@�o%^�G@��	\e@��MB��@���5�@�.����X@�p/�L�@�|O@���+�6@������@��B'�        ?��ße�?�5����N@���zA@%� K>e(@4 �d��@@ �R��@F�S�D�f@N�n�`@S�nnƝ�@Y(��"��@_.��� |@c���h�@gMj�E�@lB�#��z@q9m�5�@t�@A�N@x�I.l�O@}���TP@���H軡@��,Y��@��p���K@���WR�O@����*�@��U�HJ�@��Я�u�@�]��P�@�Ws�	�Y@�d��^@���t�6@����:�d@����OR�@��ԑ��@�l�Dm�>@�}�B�@��"],�#@�C�^g:0@� ��a��@�56Vw<@�$�O�:�@��)s,r@��=𖪅@�:�B@�X;	�+�@��X�رf@͒�gI�`@�?�_kz@�Ұg�21@ӂ~���@�Px���@�=�׃9C@�K���!@�{]37�8@���Hb_@�"��f+l@�q�7�4@����X!O@�H��gʪ@�ӻj�j@�s�R��x@�)�����@����_�@��n�H@�����:        @x�h:��@��T={�@���1�
�@⠊�'��@�N=��R@���J8�A�>�F�0A
���uA�z�`�A�R+LAP�W���Aߒ>Q��A!Uk�kFA#�vtg�A&s_�{a�A))w$��A+�T�#�A.�sɨ��A0�T���EA2����_A4$"=��dA5�#M@6\A7�A�#3A9[��~��A;7�/�b2A=#cOo�A?�k��A@���NAA�Z����AB�zgfAC���fAD�NYr�AFY$�NAGP��*�AH���-�SAI�*)�IAK�9�_TALw���FAM�R֑i�AOO�g��vAPh6�şAQ0;2d�AR �O�AR�����tAS�G~a�AT�Zh�AU�*�'��AV��ט�]AW����YAX�*ǘ�AZ��z;�A[T�j��A\�!VxVA^�X���A_z6�6d�A`~�d��AaHt+��,Ab����Ab��DwV�Ac׺i��VAd���F3rAe���ؚ�Af�w��c�        ?�Rj��Q?��ҭ�z?�
���@�K1��@�r���_@ �����@(z��^Ve@0�h�I�@6}�"���@<��'�q@B�܅RV@F*��9q�@J�*�X�@O�KZ�@R�zn�@V�k�O�@Y�^�R�s@]�2 �j@`ݥVNfc@c)�j_�@e����P@hSr�՝@k3Y��^@nHq�k:r@pʐ\`��@r����D�@tr z�G�@vwzeO(�@x�vdM�@z���@}cIrH��@����mS@�b8�vJb@�ه��(@�fE�І+@�	���@���cGU�@����L�@�|��l��@�~"H�t@���f��@��R�i�@�6��"@�C�ﾫ�@����!�@��fn �@�<K��2�@����B�@�/~9P�@������@�e�X���@��MC�@�qP�_��@�^>�"u�@�TD
�9@�SOP�Z�@�[V��*�@�li���~@������@��<��u @�׃n��@���	]@�QX�L�        ?�ʖ���e?�⥧��?禦j�uP@%2��?�@b�ۍw@#B"��
d@1�d�T J@?��4<�@J���81@VJ��,�(@a�[|-P@k<�$�s�@t����@|�$r��@����8@�&�(�@���e��@�&�鄩�@���o
m�@� �z@�K��#�@�:���8J@�T^�i�@���z6�@�s�-�G@�_Z�It�@�V�8n
U@�sK�G�@��HrPG�@�4{��$@���+��@���9�vV@��h����@�<����@� J~�gl@�-}e �_@�f��W@����͕N@�h36�ZJ@Кy���@�ک�1�@ӹ�6q)�@�t�:�1@�O>�0o@�I�{��@�f��
1@ݧ���@�gW�-�@�N�
ך�@�O��@�E&&��@�M*V��@�G �M�@� ��(@��)ςQZ@콭����@�����@�q)<���@��.�{�@��^خ@�����ƛ@�3w"�`@��rL®�        ?�t�	p�?���.5�?�\ ��>@Q�X."[@ c8P�@-���@86��9@C����@O_D�Q@X6���.@bp��:��@kO�U�v�@s�
iE@�@{?aB#7�@�]-
E�k@� �Ov@����xy}@�E�6jtZ@��1ı	@���H�@�$%���@�>��Ё;@��	�:�@�q!K�@��oe���@�Ĉd��@��a��3@�7~8�[�@�'A�Q�@�X�!ͽ�@�ho�Q�@�I��,��@�Q����@Ƃf����@�݌���@�d��T��@�1�Ʊ@�~]�yzJ@�I/�$@Ӫ���.@�f��P�@�;�vj�V@�*�^�@�3��k@�W5'�U}@ߕ�g��@��'��3�@�3��z@�}Fʡ�@�բF�}@�<��fw�@�/��[�@�5�J��2@��~~�h@�f'ą�@�4?L�&@���QNt@�ċ�݊�@�	�Q@�㨖�]@��Tt@�r�v�d8@�g7N@�*        @_���X� @�6����@���S\!@�<�>��@�T�G��@��t]��@�S��mv@����>��@��Y�)iA;��A���nW�A
�z�&�rAWi�}A�����AJ��D�9Af�B�FUA�N�A"�EV�A%N�F�zA([�F�KA+���(>bA/H����A1����A3�;��zA5��~$[A8`���2A:�����IA=���f�A@d��䒽AA�{�+[�AC��P��AE���@�AGy��d$0AI���\B�AK�ZǇjAN	����	AP>@Φ AQ�Cv��AR��B��ATW�%�3�AU�KĈ}�AWw�Dp�AY(S���AZ�El�A\� �D��A^�J!��A`qf��Aa�Y�΃Ab�|���^Ac�d�_Ae6���& Af������Ag��VD�Aiw�����Akvd���Al� e�O�AnP>� :�ApN�6��Ap�ZZp�Aq���͙Ar�p��As�r�FAt�W�u�        ?��v��?�o+�'@�^B$�@��E�x@&��ݰ�5@1��Fw�}@9A�����@A"�
�"@Fb>���@Li�ؔʙ@Q�C���&@UuTO�@Y���d�@^m!�/@aέ�|}@d�����\@g�P��J@k&��G@n�;��ї@qa�nP�X@s�����@uƹ�)@x4z�1Z�@z�]�eX�@}���f��@�<� �r�@��6Cx�@�o�WT�@�/�?wF@��8��@�J����@�?���@�N�@�@��wQ��Y@�	"J��@�R6S ��@���ʺ�@�Z��O�@��@��6@�"���r@���9�@�p��	t@�0�?�@������o@�n�
]w@�d[���@�b�b�k@�gHAg��@�s����v@��C09�@��A�kl�@����@��Z2�i@�(|�G|@�e�HF��@���[5Ԍ@���Xlm�@�UuR���@�\��p{@�lqR#~@��n�$�@����2 �@�V�%�        ?��oeR�?����q��@	#��S�V@�5ݳ��@-`W��b=@8�gˮ?@C�V����@M��n���@VF��@`*����@g`�/�@p�緑�@w�&�p��@���B���@�Ѵ�/ł@��ȇ�y@�����)?@�g��~<@��[(�/@��s��1�@���ң7@�k���@�b��	�S@�d�X@��_�؉@�������@ǳ(�J��@����g��@�k)F	@�&���,
@�;h$3/@ٴl�_H@ݝ�ܱ��@� ��9I�@�s�E/72@�*4
��3@�"^�
U@�X�r��@��L�8@�Wn�d�@�L#K'@��d�q��@��j@��j~@�P�I��@�ec	S��A d��iA�A�;r�A�0(�mA.�aÝ�A����2A�	�7�APd@�0A	ʼ�Q�zATڈ�&�A�~�L�
A�\蚥�A1���HA�_L��A�&$5nA��EF#A1����KAS����l        ?������?�m-|gV�?�w�M��?�*}� �@���T��@���&��@*A@UxX@8�y���@FnD�6��@Sj�!!Q@^p�kɽ)@g �G_5@p���zh�@wr�^���@��_���@���u�@��I���a@��Ot^��@��Z��@�FLT��M@�`2�Fx@�i��D@�A̀W�@��3؜�@���,��@���$�]@����K�p@��4��
@�t9nW4[@���_?�@��%E��e@�N %��@�Gim��@�hJF���@ǳ�v���@�,b��D	@�֒�FQ�@϶w�|
/@�h�꘿@����P@��p���@�څAn�@���>Y@�=���@ݯ��Ɋ@�(T�NI5@�T���5@��@r�@䰞 ��@�h��.�@�<
���H@�+�8-�@�8��9�@�as�6�4@�T'R'��@�;�F@��~-�Z@��T@�3@�y6���G@��0Ɇf�@�h��<�%@���)T��@������3        @�w�v��K@�!j��@є��֕�@����?�@�>�H%yj@�p�[�-XA�̑5��A	i 7LfA"&�X�jA?ZH��/Aުj�bAI>Ȧ4A!�%���A%��˻�A(�l�{ǮA,c"!�PA0R\�*[�A2�k��A5=Τ1��A8;vh�A;%'7��A>�!��2�AA�HpwAC%�Y/KAE/
UɥAG}1E�r�AI���N�AL��O�g�AO�6�CAQN�p��AR��ֵxAT��N��AV���AAX�G�U�AZ����A]$��qA_�s�"�-Aa���t�Abcb���AcʛK�w�AeCiT@Af�9'5�AhfNM��Aj��&��Ak�u8�fbAm�ޘ��Aoy�/�3�Ap��4Aq�'G�1�Ar����Asܽ��At� K"Av'/aa�Aw[�&�Ax����Ay�)[��0A{3�OY�A|�j U"KA}����=�Am|��|�A�v:�mjHA�;��dW�A��5 �N        ?�P"76@L�1�@!S�5�	�@3Xa��i�@A@9I-W�@J�!���-@Sk���*�@Zbf�6%s@a0׭d0q@e��1@��@j��k�@p"����@s'x��j�@vk)�|.@y�(W�@}��@�j�@��pQ��L@��~�߻�@�&��,96@�~o���@����W��@����u�@�E�R�+@� )��_@���&�vA@�Q- �@��/eֿ�@�w���eY@�?� w6@�� �@�;����@����@���{�@���*!@���*75@��<�ww�@��^[��@��wX�S@�,�G���@�R�C���@�xƓ���@��+���@��ZW�0@��[ �@�#/1�@�%��(m@�"o��d�@��ך�|@�A��G�+@��.v��9@�d�a&5@����bZ[@��DA��@�%dq��W@��Mk�r@�^R�j�@��Ð+�q@����HQ@�M�z�	@���U\f�@��s,@�@�a) U\@@�\TX        ?�y��|S?��t�m-.@��ڲ_O@/N���_@<��W\N@GʇgƵ@P�A캺@W}Ӝ��.@_�=�@d��2o@kG�U�E@q���@v�����@}��9�@�s���A@�G�,R��@�#�n��y@�pv%��@�?�C8@�!I<'�@�eLÌ��@����hބ@�Z��F@��	��K<@�!!��y�@��>�Sz�@���c�"{@���}��@��࢈*�@�W�'S�@-�2@��9]�@���S�@���˽D@��/ҝ@��b]�C�@���b��e@��-���F@�J�e��@��p��@܉��>S@�x��a�@�O�;�*�@����O@��X.H@�L����@��L/�@�����u@�S��q�@�ѹw��g@�<����@��;H�@�+�����@��O�%^q@����(�I@�ck��$@�c`�"�@�����h�@����A*~u:�A�-+�;�A�?���Ax�d�        ?��Kv8?�?Qf�$?���"?�;�5�5�?�"8M�3@�D��f~@`��e�@"���k�@1y�)&�@@5����@L����M@X>�SB�@c��A�c@nD�'P:�@v�Y��B�@�9�(���@��n(�"r@��=;WiS@�{���G�@����eZ@�ú��F@�bt��"@�w7{@�)�#���@��C}���@�G��t��@��&1�@�h��4�@³b�E�J@Ŋ�55�@Ȣ��)@��Ԛ+@ϔ~lRR@ѷH�y�=@��i��@��Sj�O{@�=�9�b@ک/���(@�3m��,@��B>�1@�Qe�M��@�ã���)@�D��G��@��X�d�@�r�:��@� ��߷@��v=��}@�l�u�@�|ң@�8����@�7�@�1@�@WA2��@�R�HT��@�n����@���e�@��O�P�@�P�q�I@�P�"�E@��oȏ,=@�����@�}h���@��{܂Q{A F$ޱ�C        @�	�l�@��5w��@��ID���@���ۆ�A�����A�LU�K�A�旊��A!X]��A&fE>�A,��t��A1��A4c�����A7�e?�dA;�Q���A?�Q 5X�AA��Ш��AD4Kq!AF��_U(JAH��=yʮAK��ᑍ�AN+�n��APy��f~�AQ���0ASr�e��AU	��#"AV��ץ�AXo����AZA� � �A\(�m@J�A^%��ș�A`59ڞQAa0�����AbOi��Acx[�&��Ad��4�*Ae��G�Ag(*D�Ahq�rV�Ai�Av�F�Akr�B/�Alf}Zg�Am�yғkAo�?�%Ap7���Ap����B@Aq�� !��ArA��GOAr�Á~As�,��� AtX�S�# AuSiZ��Au˙=L�zAv�.r�AAwO�ﳈ#Axj��|UAx����Ay���߄Az��s��nA{y����A|_�t��A}K���[A~<��1~A3�:���        ?���/L�?�uJí�#?���u?��k�@/�ѺR�@θ�6��@	A�r�@!��FO�@'�x`-�j@.@�����@2�5U�'@6�Þ���@;DP9�_@@	���@B�sHE�@Ev��{�Q@H�����S@Kٸ���@Ow�S}I�@Q�.Q�@S��q�m@Vm��@X�����-@[$vy3�?@]�2��@`k+0��@a���j`@c�����@eH\�K-�@gae�@h�,����@j�8���@l�Zv� O@n�����@pk�Սd+@q�e7�@r����d�@s�i�4��@t�̉d3�@v.:X4�@ws !�W@x�q��@z���?L@{���j�@|��f]@~r���{�@�Ie�@���{�@��Z����@�r�K��@�O�����@�1]x@���b7@�	\���@���Y�F�@���ym@���w9t@��Y_@����i@�	��I@�#����@�AY�	�q@�f�}��        ?GE@���?�_Ԗ�%?��̟E�?�~Rw\�?�v��T�?��Ż��?��Ly��@�c1ss�@�d!�C{@��nO@%�	.qF@1G�"u�@:��4���@D"܏% @M\�H��c@T�d���z@\��SH��@c};|�:�@i�8De�@p�n��@u�eΏ@{Ft���@��5�OT@����c�@��P��Z@���l�V@�p~�jw@���a�ý@����0��@���}�@�h����@��r�@�$�+�@�JJ�oj@��x'J�t@��:��k@�wU�@�d�mm��@��O��q{@��e��L;@��?�J@��^�}�@�IE�"0�@�6kًN@�L�5Sz@ȏem���@�ȴ�-�@ͧ��l|@�BYG�?�@�γ���@�{���@�J%=(�@�>
+O@�Y��\�v@۠�/w�@�֝�{&@�^6y��U@������@�V^�8ɾ@���]��@���k��3@��2>�@����0��        ?}Y��7�?�ɼ���E?�����s?�ȩ��?��Dπ�@�)�g{@[���>�@� Wь�@'V��38h@1�����@:�$(��@C��naN�@K�����3@S?7��J@Z���@aZ�2��	@f��P�3;@m4�����@r���@w7f��g@|���<��@��V�@�a�-��@���Fi�C@���{�NG@�0/Iu��@�g����E@�%^��o@�A��@�ҥoGΗ@�X���22@�#�}�4\@�6ߘFJf@��e��M�@�!(:c��@� �I�@�HMP$@����m��@����K�@��`��IS@��
r��@����jM@�h��w�@�i?�	�@�����@�Ⱦ���@��n�Sd@�ޟ�&�@��t �@�0�"V�@�f�?��@ҫR��@��D�XP]@�b�c��@���8�D@�[W��d@��*�v��@ۘ���@�R�pn-�@�+����@��|6:@�y^6�FM@�}oqIm        @Dѹ/	;�@�� ���@��_1@���[E�@�/�_x�@�ywǆ@�7�C�՝@ߢ�y��,@�<��K�@�!��K@�$���<@�SK?�k@�^o�@��@���6�2A \��GDA��J|T�A|�`_y�A���p�A����A�-#0��A�8����A��(�<Ax[�}A�V"tA�g�pg�A�s!�~kA �M�VVA"�bU~%�A$P�e�5�A&)?D'(A(]�w_�A*!{Y��CA,AH��X'A.x��U/A0c�-��=A1�ޏ��A2ո�[�.A4 `�r�A5v�%��"A6�̠}o�A8I���xA9���sA;M��[�A<�E�e�A>�]�3�A@��sDA@������AA�{��AB�#�YAC�ʸ@lUAD�mii�AE�O��AFĞN��AG�H���ZAH�,��=[AJ	p2*AK/|o�]�AL]f>yAM�-��AN�	7��sAP�(E_AP�Ğ �AQa��̢        ?�@����?�@/RSd�?�����R�@�R5���@���v�@#N�IR�P@-iB���@4�!��@<mjܪB�@B�ߣ3mq@G� ��@Mc�ŧ$_@Q�3"$�N@U�)��a&@Yw`���@]�&���@aM5��|@c�ʷ�	@f���yV�@i��J+�@m+�{��@pa~�bñ@rO�+���@tc(��@v�f�>�@y �!@{�T�3@~K�?~�@�����@�)/-�Z@��/`lf@��EZx��@�s�&'Fv@�p`�H��@��3H9A3@�ļJ5��@�����@�KxÞ��@�������@��h��Q@�j��B(�@��U ^X@��lfL�1@�?��%�@������@��1��o�@�׎�d�c@��1J�{@��74rT@��~C%�@�=�(d�@�lY���@���-�@��\�	�/@�<_���@��wӚ�1@�����@�y����@����8g�@�H�b]@�f<2��@��a:(�@��7����        ?a���=��?�b��f�?�8�#�>E?�fi��?���!���@�9��0@��=vD�@*�߽�Z@6v"��1@B��5>@M����,@V�T.���@a�����@h�..>@qm�Ji��@w��
@����_�@�.�56�@�c	**@�j�$�r�@��l��@� �g�5@�k��J@�����@��L��]@�I_���@���A�;�@�b�戃>@�q�X�sc@�ϳ2V@��5��r�@��$���@���^�ct@�Zق���@��	���@ʽ;2+�@���+�@Ё4���@�@�m� @�!W���@�$v|��@�JQ|-7@ڕ����@�̡��@ߠ�{���@�1ϝ0mK@��z��@�6�����@��&
�R@�*z\�@@�q��
G�@�d?l�=\@�r[>��B@�*'�@���@��@�&H��&@�igᎥ@���Jdҁ@��\a�@���n�F�@��õ�F@�������@�QМ_K        ?Ɠ́l�@ K�*��@ oyl(�@4_7��&4@Cl��D��@O���a�z@W�D�@`s1%+�/@f#)N�e@m�8�@@r�^n	��@x.a"��0@~˙�auu@�{Yʔ�@�|�q�6�@��zg9�@��u�/�@�K
d)��@�m�8��#@�7n/y@���Ҍ#�@���ۯ	u@�T�MZ��@�K�W�@�H3q��@���<2�@�v:���@�����Q@�<��ѝ�@�߻Ɏ��@��a�@����Z�N@�y���M@�"��>�@�0���Vo@�g�2R�@��S�k��@�V�f�H@�Y�'��@���\e@ፄҰ��@�6���h�@�����[Z@��PNbݡ@��O�w��@���J@�J��y@���(�@�$��)l@� �^�@���h7�6@����G.@�&�x��"@��W�4/�@���&���@���zE}�@���^0xA vE��3�A����bA��D(S}A"���A����A��O��z        @j��+��@�,;�c�@ôGZJ��@��^N|
@�!ٻ5_t@���s� =@��Y(G�AȤL&��A��.�	A��-fX�A *���dA�J��A H��	4A#R�5X*#A&��w���A*]��j~A.i?9���A1kq�A3�P�f�A6v�*
��A9R�A<k�y��A?�� :�'AA���g�AC�	���AE�X�,AHՓ���AJk���AL�m��eAO�Q'�AQS�����AR�S���AT�����AVD�؟yEAX%וAZ��iKA\#D��$�A^Q-bĢ�A`N����JAa�����'Ab�ш>�Ad"Jq�Ae���i��Ag���8Ah��A�]�Aj<'����Ak�a�r��Am�&����Ao����LAp�C|��Aq�>t�.Ar�,X���At;�Bb�Au>�o�ŨAvyV�u�Aw�LB㶤Ay6We��Az{�M��A{�D�D:A}r�5�\A�Ƽ)�A�VnS��A�2�u���        ?ß"v��9?�Y:-��@��n-@0,i��u@?j}4��@I������@Sf��+��@Z�芵�@a�����@f�Z�J��@k�t�@p�rR�]Q@s�J����@w4��X�@z���$@~n\�!��@�)l�*]�@�1\Q+�O@�M���2@�|�7��@�����@��3s��@�zQ�F{�@�{Q���@���PS��@���V@�z���J@����@�j��A�@����t@������y@�D\�@� �F��@��5�#^@�����@��	�m�_@���21�@�×&�92@���Fb)]@�ڵ#$"�@���n�¡@�
���fZ@�,��ȳ@�S3�)e�@��_`]�)@���A��I@��hh���@�0e���j@�=W\���@���-@���,uJ@�I����@�:8cݛ@��j�m�5@��A�;@�Q�
�'f@�!X�Y��@��.�sǿ@���9��@��Rxn�@��>�Ӆ�@�x�s��P@�d^'y�y        ?� v�N?��,1Ƣ�?��DN8a1?�BM3�g�@#]�@�@
�O���@ ���@(`0�MJ@1FO�ߎB@7��~j�@@d�e\c�@F>�[�Y@M���}d@S���Ф@Zi����@a?�*�tV@f@y%KD0@lV=��{@qϥ�5�@v?���@{#@��Y@�x۠p�~@����]@��&�JM@��H��e@�Wl�~@s@�	����@�	/�h	@�]_�8�0@� S���@���x{-u@�åz%x@�/�C�2@�Ѩt �@��G]�X@������@��mW�ט@�I��JS9@�,H�7�P@�.�ɓL@�O��J�@���z8�@���-���@�����"@�
1���@�-��P@��s\M@ōj~�@�4pB�J@��9B�W�@��΋�@̷<"�|X@��GA�?�@�s�78$�@ѕ�`�x*@������ @�
DyAh@�]��	U@���H�ep@�<��'�@��)�R@�ji:)J�@�!;_�yW        ?��`m��@+��p	�@J�q���v@`sʀ���@n�M}'��@x��+�t@��
%o��@�FP�A�@���?ʮ+@���ؗɖ@�eiH��@�z�D�G�@��2��H@���ꪳ@�>�O=�@�%mH�@�=�;@��)�o�@�N`�Fi�@�B�A��u@��<ڌ��@�&׈P��@��qYW<@�Ƽ���@�2,y-*@����e��@˽���1�@��൥L@�&��8@��5��'@�������@���!�@�c�Z"�@����<0@�a�L!+@���JW�@��� @k�@�v�bIL�@��ڸ�@�.���@�Q�',$m@��XJy@��2&bԒ@��H'�u�@�7�Ǜ@��Ú�@�i�˵@��qղ@�s/y,@������x@�ҿ��K@��u��*@��l�C=�@�t\C��@�t�mv@�5���@�M���@�g�w;�@��X����@��8����A \�޴A ��|�Av��T�a        @�_��Xp@��n��@��qKA���5�A�/�^�A(�H����A1��yA7�R�G�A>�3�nAC�J��AG ��O�AK?��aI�AO�s�MIAR@D/�AT���&��AWV�m�]%AZ	�{f`�A\�]���PA_��rp&SAaU�q��Ab٤�BW�Adh�{hAf q�hAg�f#�.AiQ��Ϡ�Ak���PAlҢ�1�]An���?�%ApD�2�BAq=4x�P�Ar=Fd�AsE&|A��AtU��Aum7ֆgAv�̮�9iAw����Ax��&NsAz#"�A��A{fAReA|�z�UA~܊���A]�6͡KA�^��.�
A��)�f�A������A�~��E�5A�8T�+��A��?�lA��c	��A�r��՜RA�5��_A���T��hA��k�0�A��"vEL�A�^��A�0�X�7A����F�A��[�BW�A�����A��y�7A�sc{
i�A�T>�ұA�z���u        ?��{��33?��{�a0@�v��@!�(�2�@0'�,�@9*�A��.@A�r9ً�@G�����@N�B#��@Sc�	�@W����@[bl|c}@`hZՉ7@b~����@e%Y��>&@g�Ts�Iv@j�FTg�!@n-�e.H�@pʥ,���@r�X�(�@t��@�W@v�r��6�@x��_��@z�����@}=�k�,	@���Z�@�����@�k㓗�@����]�@�.�����@��ӻ��@�#���@��;:���@�N X�4&@��C����@���h*W�@�8��x?>@�!T���@�,��@�l���@�+0���@��t�~�@�'�`ܰ@�,�:��@�7/�w��@�X�^�ǽ@���1��@��D ��@�����@�9A���@��~���@�r��v�@�%ݫK@��C�h@@��� Ia0@�d}ͲZJ@�3&/��@�	ڪ�U�@��U>?��@��٫��q@�ê��8f@�����G>@���b}�        ?u
L�p��?��@�h?��|ʙ�W?ꢑ�a�x?�DS�T�@5+���-@V�@Y�@)b�/@5���Rr@B5¦0�C@M4��q�$@V�4O!m@`��e"�>@h[���@qM�T�@wJWf.6�@~�`9�[o@�+��@��#�E��@�+�Kt@���X�@�(�K|�1@����A��@�3�V�l�@�4����@�������@�(J�}��@�#��#δ@��gո�P@������@������@�}��]�!@���(wq:@��?m5�,@���^���@â��$�-@Ÿs�#��@�����@�b��0�@��j�n��@Ͽ^->�}@�Z�N0��@���0G!@ԛ��y+�@�c)��ʥ@�E �L��@�BglM�@�[����@ޒ
т)@�s-~?G^@�ﱸ��@���K@��@�R'�A|@�Q��P@�?� 7�@���R�O�@�}�ƶ@�>S1	Q@���9��@��9�S�@�@��@� \?,i^@�D��+3        ?��y���?�2�-xQ@e��ڧ@$)�f8@2F���3�@<͆+��@D���8QM@L���V�@S`L�*��@Yz��5[ @`�X��1@eV���o@kZY�4�@qp�����@v�� ��@{����u@�o��� @�����#@��zj�+y@�Hٱ�(@���n(@���c�:�@�@�Fy�@��CZ�v@������@��*@��Ө�<e@������@�����4�@���� �@��w<��@�{�[s�<@��Տ]��@��$��y@�̌Tl��@þ���@��t�n@�@����G�@�q� ��@���I&I�@ϵ�p�҇@�N6{h@��'x���@Ԁ�y�?@�Cdc��@�#����@�#�)�'@�ED�F��@މΡQ�@�y�P�,/@����e�@��s�`�@䐼�*�v@�V��@�r-=�A@�rR�@�D`e�@�1O�C�p@�9����@��`Ǻ1@��t^�k@���Ř=@�C���H        @���iE�@�l��*�_@իq<_�@@�٩-�&@�f�CdSAE06)B�APsL��A�d�lA�M��AL��"A{�>�A"����`A%����A(=ڻ_�A+�O@jGA/Z2Aq�A1���g��A3�GLC�A6�(��:A8o2E�=�A;��U8�A=�Y̎A@`�^Z;AA�K�b?AC��ĤX=AER��UAG$ ��AI	| ܇�AK�_d�AM�;�AO3Ym���AP��P�SOAQ�C9���AS_$��ATO��:q�AU�X/ �AV�0��AXW��<�:AY��u��A[H�F�A\�:�1]�A^o��B��A`=c�]�A`�<��eAa�(�-��Ab�X�f��Ac����-Ad�n�	i~Ae���J�Af��-��Ag�Wr��'Ah�����}Aj'�����Ak`is��Al�����Am�����Ao]D����Aph���Aq+r��(Aq��/�$ Ar���k^)As�#�} At�����        ?�s@b?�W��!@�_E�z&@*����@8q����@C�nV+@K��>I*3@S4�z�g�@YR�� �@`#�� f�@d՗�<@hN3]�@l���C��@p���K(7@s������@v����Y�@y�&ӹ3U@|�e��@�.:�v��@��
ߝ@��W�3�\@�����@��UYx�@�\"}���@���*�3�@�5i0��@���;r�@�D����@��.L ��@�080�v�@�����-�@�aIl�V@���d�/@�ޣO��@��\A@�_@��ͅV�@��jVI_�@��z��@�(pG	)@�6�^J[@�l�Y�@��z����@���UH��@�Z)Z��@��nJO�$@�4H\#4/@��qz) @�;��n��@�g�zh��@�7vC�=�@�y�s] @��8�@��i���(@����؄�@���W��@��� ���@���_1)@����th@��0���@���P� @���.d��@��{i��n@����;0�        ?���o�Et?�w�S�ŕ?�ٜ�@U7���@�w�W�@,*	�8�@8n�Q��@D�P.���@Q5/��d�@[��z��h@f�v�hQ@p�*�,��@x�a�q�@�������@���+�Y@��]�FhI@��Y��t+@�t���v@���3�r�@����B @�z��@��@�߮�%_@��:/t�@�1�W�~�@���tY�@�Ik�D��@�Yà��\@�����A@̂D�Lg�@�QX�1��@Ғ�)��@�(t��@׭(�@P�@ڈL;�^\@ݗ�靜V@�n�LC@�*nb��A@� ��WS�@��4�\�@���f�H@� $sj��@�_�]_!@�p�@�d�k&@�ފ�Kz-@�4K/��m@��Hj�@�
^�3̓@����lM�@�d�BP�@����_@�p��H�.@�6��s��A d��\�A a����A�Ϝ�A@浵�A1��PA]D���*A��NW�A�lם�IA	;d9�.`A
�%�=�        ?�&8~���@���0{�@#:#j @7��Ա@Fv~���g@RA��޺�@[��;��@b꺹�pa@i�u)@�W@p���U�@uã�E��@{��hۻ�@��4K�JZ@�T�&3�@��1�IM(@�XB�HN@�b����#@�.�{��@��Z`���@�:i}QW�@���@��@��N6�9+@�R�C;w�@�?��N�@����j)@�U�����@�����!�@�������@�G)@��@�0>��FC@�d�N{@��>� a�@��	YN��@���o�7	@�6���1@ק�%�6@�Fk�6��@�[��B@�M?j�@�@Z�6*@�ZU*�(@�(�|�Y�@�����:@��c�m�@�5+�o�@�pXk�D@�ǜ�g�z@�����@�e��<g�@�רJ�@�""uZz�@���BpB@�÷�@�� 
B�@�O���@�r��_�@�ŧ���A Lֳ��A?vO�NA:���A?j���OAM=�^�Ad��a�E        @��j�D�C@�zF��d@��*E^@��nx�uA!0��t�A_X���A L�]'A&X	./��A-O��i�A2����A6���ۣ�A;�p�ړ[A@�(�5ʳAChX� ��AF�`h��AIԖ)AMfq��e'AP��?�d�AR�i<?$�AT�����fAWգ=�?AY���ڟ�A\��!�XA^�q���A`�ٙ۱oAbL<*���Ac�?Xϕ~AeD�)KAg5��+�Ah�����Aj�g@c��Alѭ��i�An�R���ZAp|{-(Aq��F��Ar�<]��mAs���ѮAu,����Avv$O�EAw�Uɴ$Ay,rИP)Az�5)�A|�@D��A}��0A)'��XA�cg�r �A�8_�"�SA�~ AA��Ć5�KA��9.ƲA���&ދA�����A��+�� �A���2�GA��)��oA���p��A��w���A������A���M +A�H{���A�x)?�p,A�WU�D�A����lH+        ?�n�h�8?�tК���@lF�\@"�#��@0 � *V�@8��.1��@A�%���@G��<�@N۫]���@SO=9�@W���y�I@\E����@`���9~@ct0ݸ��@fr��p@i�+��X�@m%9(\@poߘE�@rn����x@t��u�@v�ར �@yAZǉ��@{���=@~���ej@��.����@�2}�L�@��u,8l@�pD�DN@�-eH� @����l��@��p��69@��l§&�@��Z{�2�@���AJ��@���AeY2@���h��@�!��`�@�M��f�(@����ļ�@�	���@��_�L(�@�����<@���G�L	@�O[��,&@��3M��@��.�<@���@���@����@��$���b@�z���@�!�qd�)@�L��t �@��.���@�ŷ?xT@����V@�p���v�@�ڭK��@�RXd�P@�l7J�@�6�z�@�����@��q+
_!@�����{}        ?��Q���?��*�@n��3|@$��V@5�o�{@A�4���c@J��4�U@R���3I@Y?8��M@`�z�"�@e^V	��@kL���ߴ@qUR�C�@u�W���@{�����H@�G�gh@���CVOd@���ˌ�a@�R�>t�,@���ʡ@@������:@��,�mc@��e�N@�(�U���@��HZ��@�x�'Ϟ@�����f�@�;:L�c�@��t7�@���m�_`@��4p)�@��z,�k@���綇x@¥ ���@Ĭ��++�@��ao�@�*���,p@˥���^@�L��R-@Б���@���S��@Ӳ_A� �@�kU�|6@�@��`m@�3dY�Dq@�DlF^@�t�9�[�@����X�@�%T5Au@�d�\Y]@㿯qlS�@�,�{��@櫨��@�=�dj[!@����%@�b�hp�@�j6Bp�~@�M$�x�@��S��@�k�5�@�t����@��[���@��=�.�        ?����+�?���G��@/��2{�@$���x�I@6��yF@D���	/@Q�ڬ�@YYxh� @aƱC{g�@g莹�F�@o:�T\>G@s�U�;L�@y2|��ϖ@m����X@�nb%��N@�٨�H��@��r�� @��]�6�$@�2�B�{�@�[W���|@�%��P@�Ь�(¥@��;/�@�v�ke�@�og�dk@�p�)p@��=P��@��K���@����iL@�7'�@���%�@������N@��KO]L�@�Nj$�^i@��7���@˚P-��@Δ#Cu�@��{PW@Ҡ���t@�}�%��@�~F(}R^@أ�ðiD@����@�d #(�@�Z@.ex@�f�q ��@��M���@�w����@�%����@��ˤ�@��rHׯ@��#��f@��c�V�>@�F%3��@�N�X��@�gmd��@��N����@�W_q)�@�ؒP��@�o�"Nc"@�kX���@��2��X@��dȗt�        @�\n����@�-�TX@��S���@�,�lAAB`���A;�����A�ۣi �A˘{�`;A"�x��<�A'�_�^X�A-��_O�UA1�FO��(A5�� �A8�J-ԢUA<��JJ�A@Y�<}p�AB�����AE����AG�I��AJc�,�	AM\�n�+,APDe��46AQ�����AS���*AU���� �AW�p5��AYώT�A\&���A^ur~�4�A`}g5Xn(Aa��TxAc9lU�"�Ad�)5�*AfF�����Ag�f�u�Ai���|46Ak��x�%�Am���h�+Ao�a~횼Ap��Y���Ar����AsOp��,At��M��?Au�W����Awd�,{��Ax��ԥ��Aztt�T-A|�]Ő�A}�

-�A����A��Q��A��6SPA��L��A��-I��#A��� �|A��9e~BzA��$�A����=A�U�B�үA��㎔xA��F��[A�4�[�:`A��À�|�        ?Ğ�����?�p���@�0�'�@)Њ�~ɼ@7b6���@B����E@JخR�s�@RR�{��@W�p @^.y���@b�r� <@fR
�vl@jk�=�(@n���$�@q�N�K��@t_a��@@w4��>�@zP����@}pS��K@�0���ו@���6�1@���i\�@��04
�@��u�oL@��J� @��+/�%@�L��B�>@�Z`	�K@��9f�<�@��.HI��@�@ۓAw�@��7��S�@�Gs�t�@��,V��J@�' ��\@��j��o@�iV�>+o@�B�6?�@�q�b[@�[�4d\@�M߰c� @�H��-d@�M���)`@�\ԄM�@�wv����@��GG�@��v��A�@���2��@�wK�u�@@���/�F@�i�}	*@����fs@�ٯUޜ�@��H͢c@����@����@g�@��O��;;@�����T@��'U�]t@��v��@�@Hi6c @���F��u@�֍7u�        ?�Ϫ���?�c�T_��?�Al�/@��� X@�_S��@$� r��@0�G�&��@9����A@C|Nw��@L�-��F@U4�	u��@^r�蝃�@ek�fZ@m�%�(@@s�S�
I@z@�E�[@���=V0P@����in�@���:�@�����Ui@�i�Ո@����s��@��
d銺@��3���@����	D7@�A���G!@�P��D��@�rδ��;@�����z@���j��@�%��c�@��<���@�\셻g�@�/;�8@������9@Ǡm!Y@ʃL��@ͦ�A~�-@І�.�k,@�\Z� ��@�V	�GZ@�t���'@عͅY�C@�&N-3�@ݻ��Ӳ�@�=R�#�@�~HO�@�=�!���@������@�$Pg�@�n�M���@�\��6�@�e����@���7�@�h���@���.@��]�hU@�/��r�\@����&��@�lRQ��@���Զ�@�4��A+�@�����        ?���3i?��t����@Tt���@#�lS@2�~����@?GT���b@G�JG1O�@QK��U@X��`t@`_�B�`@e�k�0��@m8���@s��c��@x膤���@�%���@��7�G �@��d�ِ\@�Ԟ��}�@�#9:���@�L~��_�@�3����-@���6[��@��#=4q@���Դ�@���|M@�����a@�PmFJ�@�ԧ2c�@����Z�@�ɘS�3$@�A'��C6@��
F?@��ȿ��|@�B�!�@�s���^y@�wv��$�@ԱU��H�@�&�Wˠw@��@[��@���h�?@��t��@�֓5�5 @�Ƿxo@��ow�Э@�'�ٹ�:@�Y��@�4���@���'pTj@�wRM:@����Y�@�����@�g��`MG@�:&�eT@�#��%.@�%��N�@�A$�t�A ;.�̓�AcZү{�A��'�<�A�J��D.A1��D�A�� ���AJ�6y        @����@��	��iO@�T�}���@���9=�A�@�iA�%Ͻ��A�РSgdA|��c PA �̀u�A$�nay�A)���~mA-�99�l0A12D��ֻA3���buiA6s�MI�/A9T���A<df�S=A?��T�fnAA�Y��ACg%+��6AE\�%�V&AGp?�I��AI�s��ѳAK���RaANa���APw+7Ơ�AQ�&T~��AS/�AԸAT��L'�AV#��.AW��c�cAYQ�.�`AZ��r��$A\�S<�7A^�0���A`4���HAa,�JL6Ab-��bAc8�Eu{AdM�;���Aen\��GAf�P���Ag��vȝ�Ai���*Aj{M�ԧ�Ak�a�.V�Amt+_�1fAo����App��B�6AqfBP�VAro&�cAs��ydv�At�u�]�]Av �&��AwXʹ��Ax�^�̑;Az?��ᯓA{�Y�.G`A}k?W��PA"W���A�ko�{-�A�R?����A�A�8        ?�J�6�C�@$2��It@?D!�� @P8��ؑ�@[�#��NX@e=��z6@nCBSpY@t|:��M@z�(�y��@��)È]	@��F��f@�45f�M�@�r�4@�����@�nR�.�@�s�kx��@���q���@� @��oA��@���h'@��1�B��@��u�z�@� k'(�@�B�Ɨ�K@��pr���@�>Zj��@�H)�g��@������@�� z@�X�ۚw@�ͅk�{@�O�畅@�߈�Q3@�}��i��@�)�J��@��Ճn�e@�V7�U�@�A0���\@�3A
U�9@�,,#�~@�+֋�Yd@�2��˫@�>�XM��@�Qq��j�@�i�q�@ɇ��W�@ʫ?�Zq�@�ә��o{@� Ў��@�2�G�i@�h�X]�@�Q]��͔@���q�@ѐ5$�@�1�B�L�@�ӽ{�I�@�v�}��q@�E�Q�B@Ծch��@�c �H%�@�)�"@֭��
�@�S�M        ?��|��k?�Ls��@e	����@0�V4@@�|�Z(W@L���#�@U�2M�L4@_E��]��@e=�X��@k�Έ�g�@q��^d2m@vng��h@{�e�iM�@�2:�o�@�Գ�g�@�8
���@�\�՝��@�0k����@��
p�$@�Ĵ��c@�z���@��@�S�@��kc�@��9]�@��m+:�@��Z�9�@�-��6�G@�> rDa@�EaЁ��@�կO%�@�b��<L@A��u`@��&��P�@�~g�"s!@�K]��@�Q�b2ZF@�JW_6��@�
~�O��@��_$ k@������M@�
X&�^@�L�8o�@ܯ��2@�5N9ej@���'`@�U��ɩ@��G��h�@�XT7�@�����@�o��%@�p�/�%@�N;Q*�a@�A�P1@�&�{(~@�8#t�@�@�VP��S@����|@��4�D�[@� �Kٍ@�Vۻ�@��e<;�@�.PB�L�@��r�.J)        ?�&Y���`?�P�[@� ?��y�؈@?��|��@k�GgL#@yu0@�@$t���@/�;a�Q�@7��>_F@A��kRǵ@J>�L.'@S =���)@[	��cjY@b�/��@iݺ9r�@qc�M��@v�ޛz@}�%a?�@���@��F�BC@��_����@�<q͙�t@�#�Gց8@��~V@��Pq	(�@��)�G@���C��G@�������@���P�R?@��@I�J@�������@�:���@�2�eq@�n��ocG@��J[�s@���$~�@����I�@�//�"�'@Ȗ^���H@�+�s1��@��z� �@�u(����@�4�?�X@ӿZ%|~�@Ր��+�@׀�=��@ِ�Pnɻ@��n/�� @���|O�@�M�iX@�)T�X@�
2�|/@�/�6��@����m@��.&Q��@��~�Y=@�wgʫ��@�s�p �@�b�j��@�ߟ��@��	���@�?p6?@�^4�        @�gi	��	@��W�gA�N��C�Aq]̚HkA�(�؅LA((�����A1�(�6A7 ��Q�A=������AB�|�.z�AGЕ���AK��o�OAP�C��AS]�|� AVv¦NCxAY�԰hJ�A]cJyE(A`�~�~��Ab�0j��Ad�z��S)AgC�ZAi��\�g�Al,����An�"	�BAp�m;��Ar7�4�As����PAuV�7��Aw  �U��Ax���˸�Az�+���A|h3F�DA~[
�׏+A�0����A�>B��oHA�U���uXA�w��A��l�C<+A��q2$�A���# =A�h�DQlA�� .�*�A�j�QtA�������A���q��A�y�����A��Q�K�A�F��5�A�`P]�A��0�"*�A���<j4JA��פ��`A�b��J�A�>R�/ٲA�0y�c�A����PA��ŖvjA��m�)&A���W�ϒA���;:p�A�s#�N�VA�[�}[�A�E5�e|`        ?���>���?��?�� )@\�1�9�@`(Q�C@,(�Vu$o@6`@�ݼ@?�~��s@E����*@L@��X9�@Q�5�ZC@V"��]��@Z���e�@_�
>e@b�����C@e�p�6:�@h�G����@lD��y�@o�f'�@q�]�k�y@s� ��h�@u�=��[�@w�]�%N!@z)d�G�@|XĤh�@@~�me8��@���*�@����*F@�E�
bR@��<�֟�@�'̍ ��@���>��u@�K_��1�@�����%�@��ꢿ=V@��xe�)0@�CU�oW#@�F�R�@�U����@�p�	>@��an?e@��?���@���$��@�V�4� @��eR�6@���3@��LY3��@�.���@���P�#z@��\�G�@������@�g<w�@�R8i��@�F�r�k�@�D�d+��@�L��#�@�_�O1�@�}�5��@���IK֪@�ڝ���X@��0k�@�dS����@��&��Ł@��-�6�        ?l��}$�?����<�?���p%�?�+L�y�?��{ z?����yx@)ґi@#״�@"f#�]i�@/w.���@:<��s�a@E;bjې�@P��Q�B@YLh#�`C@b�Kb%J�@j�r7�-@r��Q�F�@y�_�?�6@�:��}]@��*���@�p���@����e�@����)��@�tOo(�H@���;�@���o>�@�{�`�@��RC2@��ga(x@��X�$�@�`����S@�F@i���@��7��:@�P+�?v@œ�M��@�BxЄ��@� K)m=@�,����@г��I(�@�g�6�]3@�1�f���@��×@��'1B@�T�%�Y@�3��W@�h���V�@�YC�X��@�9�i&@��9�X�@�-�[6@�Q�q@槽]��k@�G��s'@�r��-d�@���5Ў�@�e$�n�@����:@�0��@���S��@�b�����@�<Ը;z@�����L@�����        ?jW����?���@�Ҫ?�ׁ��?���+6�?��,Jb8@ A1t<��@C���@Gf���@%,�½�@1:��d�@;<�d�K�@D�*DE��@O1��	@V�\/xWi@`DJXc@f>ae8)�@n5�s�ŧ@t$����@zj};��@�) ��^@���@cF�@�D��c�J@��rPBS@��y�U�@�(!zf�;@�4�9��-@�� �o A@�.ۋMM�@���1�&�@��8�o�@��#�8�@���	�@���C�b@�u��c�@��֐-\�@��%�)@�-J�`q@�e
��w@�	�p�d@�"���c�@�V>��y3@ˤ}���@��1�z�@�F�ygz@ѓ͉gz@���6*�@�Q���@���U��@�=����@���P��@�V��D(�@��Ea��@ݜphG6@�O\��ң@��p�SS@�jksCM�@�S�R�v@�A�-@�@�5 7��@�-��\@�+E��w�@�.8��@�6�H�z        @k�ƙm9�@��6���@�#�V�4@ٵ�p�/�@�Iۉ�@�\�e9�@��Z��bcA0j}��tA�V�\n Ag2�=2�A�ګ�LA��B��A��g��A 8���rA"�7�|x�A%º�0�A(Ӎ�9�A,����A/����rA1�d�VA3��ݒdDA5���&whA7��9k�A:J��A<u�3HA? ĳ��A@�e}VјAB@���<AC��_	AAELy�ZBAF��f|�AH�a��H�AJ�ϡ-<�ALpc-�'�ANyㄖ�APO���AQn(�峥AR��a.j)AS�N�AU���]YAVg�x!RlAW�;��[AY1Jڱ�uAZ��.	A\0k��GnA]�����A_g�V��A`��?Ԩ�Aal̐���AbT�Ƀ[AcD^�Ad;��u�TAe;����|AfD	��ީAgU�v���Ahp��l�Ai���g&�Aj�4���Ak��ԙ��AmE`لu^An�1�!�Ao��(3@;Ap�n���        ?�lx��f?���H�?��%W��@8	�y�A@�1h�~@Nx�!@�@&[k��^!@.d�y@3hX��b�@8J��z<@=��%'@A�ȡ@E0>�O�@H���!�%@L��z\\@P�����r@R�a*��@U�_~O��@XA�|�S�@[,E�:,@^DS�@`�yN>9@b}���L@dOc�qښ@f9���gp@h=�@�#@j[�S��q@l�	�^T�@n��Y00@p�<,�V)@q�]�-�@sK>�TY@t������@v4��V�@wʻ��f@yw8mbf@{9�L��@}���'@~��oIw@��6�X@��{_��@���W�'�@��ݰ$�5@�p}�D@�Ud2��8@���,:�@�]"�|�@��ۦKmT@�*���P�@��oTl@��OJ�*@���U_�@����)�@��h ���@��0k7�@���m�X@�� ʢ��@�ۅk8�5@�Q!5��@�/u�n�@�fx��)@���Ƙ	&@���u�        ?y.�o��?�<]ȏ�?Ѫa���?�6M"_.?���ٝ�@ TYʢ+@�;�Ĭ@˭LnF�@$[��y?�@12�s�U�@<`+����@F��T���@Q�-�-n�@ZW��4@c!�@j�sH�ˑ@r����G�@x�����@�eB�4:�@�+�`�@v@��/�xT@���Ջ��@��Rs+&c@�f�.�R7@��I�k!@�^���z@�ʱvJ��@���mN�@��d�{�@�Y�-���@����ښ@���q@�F�t*@�p|:.=@�����G�@��@����
@�:��
.@ɔe#��@�B�"�Y�@� ���@��ne�@һ���#@�zO��m�@�V-��3�@�P��\B@�k7 S�@ܧI<%��@�d6-�@���?�@�zn@�"g�	o@�4�y�@�J4#��@�@i�b��@����c�@���[�a�@��~�\�@��\ݷ�@�	����Y@�-�h�c:@�_ەkH�@����? �        ?V�zȧ?�I��a5?���~��?ɮoA�F?�B��J�?�)�"�?�f�鶘5@!��D�@�4~'�U@'MA��y@3ymW ��@?(4��.@G��|g'K@Q��2[�@Yx=n�:)@a��-_OB@h6K�n�@p#�rB�@ux���?@{"q�*ɵ@�.���[j@�w��@�|̷��q@�)r��r@����+�@�[v����@���t8^�@�N!�N�@��Q��z@��� @�vR yi�@�)��5@���Y�@��W[V_@�0� ���@��І,�@��W�bp@�|�8�B�@�S��S�P@��ȩ��@�Ͻz���@Ÿ��##�@ǿv�u=�@��d �:�@�+��Du,@Γ�;+��@Џ�ht�@��x���@�U4ܚ(�@�����_@�oK�@�`TQ��@��\ĖT�@��E*��@��Ŭk@��9\&�@�>e��@�5���	7@�n}}}��@�d\���@��E���@�u��dI@��&j`b        @^v�F��e@�
���Zo@�L���@ʵS'&�\@�rQ�.~@��,��bD@�P�?}@�9����Z@�{��n@�'A
I�@�E@�A�㻄
A,%��oAe�����A���/rA{��A=U�,�A�����A�	OKGA�S�7�A���,�A}[��l�A!F�ku�A"�w	�!A$��4�~�A&<�*l�A(c��A)�/�HjA+�B�Ԕ�A-�:xg#&A/�fr�ThA0����A2�U��A33�,�l�A4i�븢OA5��ݦ��A7`�͈A8e��KA9��2�A;^F�kdXA<�"���A>�,��A@7%�DZ�AA)IŏbAB+Rbl�AC=��$"�ADc
���4AE��\_�AF��0�AHH�� �oAI�p!Ҕ�AKE� +B�AL�.A�
9AN�ج[�AP%�er�2AQG�J*AQ�~-�AR��TIG�AS���l�AT��B�AU����AW�y�XAX0.˒�