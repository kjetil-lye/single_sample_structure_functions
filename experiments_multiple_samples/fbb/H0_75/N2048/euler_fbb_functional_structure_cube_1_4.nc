CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            h/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_75/N2048       alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-030          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190901T135255        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080       ,alsvinn_report.cudaProperties.totalGlobalMem          
8513978368         /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1733500        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             20         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_75_dash_N2048_dash_euler_fbb_DOT_py            �import scipy.stats

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



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_75_dash_N2048_dash_euler_fbb_DOT_xml           �<?xml version="1.0" ?>
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
          <value>0.75</value>
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
       alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            @               ?�dxy���?�#��v�0?��U3���?��!f�?�1��28�?�Z�щr?�����r?��
�A|@ �E��do@�|�zv@��<q�@���@�&�?��@;w���@ԭ5�Ձ@��*1@n�l�5�@mFݴ*@ ���c@"e
{N��@$Q�K� @%І�"�@'�V��T�@)vuF�{�@+^�d��@-T~_���@/W�vB��@0�E��k2@1�s��@2�RܙV@3��__[@5z*���@6=5����@7j���"@8�|�i�O@9���)4@;��|�@<[��@l�@=��,���@>�i���~@@%=��@@�r���@A�L�͜�@B4���|@B��b�R�@C�xl8�@D[���@EY��6�@E׊��u{@F�3o���@G]N�it@H#Խk�~@H���2+�@I�"�\@J�����@KU�ã9[@L(�+��@L����4d@MөL��M@N���I�@O�X]��s@P3�Τ�@P��Уs        ?������l?L��^?Ӎ�	#�?໖P*5?�yb��x�?���P�	�?�	��ꓝ?���^Ѫ@E��p�@t�r��9@���k�s@p����@��j@����@�>���z@���k@�%y=@!/8$�%�@"�E�(�@$���{��@&���֚@(��>��@*����W�@,�̷�F�@.ĉ='@0z;qY@1��Ԯ?�@2�r���@3�w0`�R@5#����@6_��N��@7��6�3�@8컀�?�@:=f� ܶ@;��-�l�@<�G�@>W�q�@?�؉C�@@�v��@AUt��@B��]�@B՚��8+@C�a:S�@Db#�	g@E,�,�`@E��*��;@F�!̄��@G���5[@Hu_�X�@INih` @J*��`Ҩ@K	�:O��@K�[�,@L��8�Ɖ@M�?ch-@N�QF�"�@O�DrC�@P>ξ|r	@P���=Ҝ@Q2Q'�@Q��봾@R+�@�@R�r�a0)        ?��aBCd?���g�V?�	=eCA�?�	  e�?�}M%�2?�iU6!Wi?���¡��@ �4e�S�@�RŎ��@	l�K�f�@`?*��@�d�#a�@��s�]e@� d��`@�ԁ�L�@M���=@ 놑kvS@"���sյ@$�>z��7@&�|#�@(���w�@*�Ę�a�@-* uo`@/vۄK�@0�֑;�F@2#$��@3d5o@4����@6 (E��@7Z�_�*�@8���r�C@:(�8��@;��:�~�@=Ԩy�N@>��es�@@Z;���@@ۢ�7�@A��S}
@By�����@CNU�+!4@D&��W��@E��!H@E⧉>��@F��]�;@G�+�e@H��e��8@I�Ѯ���@Jwp���@Kl��I��@Le���F@M`ퟑ��@N`0=@L@Ob�{�G_@P4S��O@P��m�'@Q?ʟIx@Q��Mr��@RP>;X�r@R�0��@Sg��J��@S���pw�@T�Va�:�@UqJ���        ?��# p�?�3D�٘e?�'���?�k�\Ơ�?�	ϋ�j�@��!L�@��@��@�"rֈ@X��@:�����@�]oY�@ S��N��@"�B@�&�@%���0)J@(�VBNC�@+�0K��&@.�%p��@1+�_<@2�;G/�@4�鎤@6�m|��@8����]@:��({U@<���j�@>�n;P�@@���xE�@A��<�~6@B�M�=@D���f@E=��c��@F|���uh@G�5G���@I�����@JawX��@K��|P�@M�E$s�@N��O�l4@O�$w���@P�����@Ql�;�@R+8��k�@R�_7Ǒ�@S�m�Kz@Tz]E��@UE%�J%�@V�1�"@V�&E?�@W�P�Wa@X�9F==*@Yd�F��7@Z@&ҟ�P@[)c��@[��Q��q@\��⫢:@]ǶZɾ�@^�:a��@_��i�%�@`D2*d'�@`�)E���@a5]���a@a��U �@b+r2��D@b�L�OC$        ?�qDf��?�0���i?�	)�/?�0�A*?�<~iZ�?�c�;IA)?����@X�?������@ �d<��@|)Q@p�m�0�@�d��@�)�<��@��M�C@���� �@'�  C+@�pKW@�K=��a@ bYq�b@!�����@#�P��u�@%+ףd�@&�� �ٸ@(�O���Z@*f�k��@,<�� !@.'1��@0ji�4@1>�M�@@2us���@3�\RO@4��&��@5%`ܴ�z@6;$�nO@7U�M��>@8u`�f�@9���#��@:©���@;�;d�,�@="K��B@>X�t��R@?��:$�@@iJ���@A
�Yk[N@A����@BT�_w�@B��;{��@C�5�S@DP�_-"@D��4�U@E���i�@F^�Z��@G�q9>�@G�W�s[B@H{�_��@I3�g�@I�fԥ]�@J��e���@Ke��0�@L$��A�J@L��a_g@M��"[=@Nj}v�r�        ?�-u��b�?�(5��?��2��?�9g�E��?�;^i�?�F�i#q?�ń&��`?��9|��;@ߢ��[�@3hC,a`@��r_�@��؂D@�O��@��ӽ�>@�.��@��!��@ 
#0L7@!���ڴ@#�����@%z3�l�Y@'nI�
�@)sE�\G@+�[ݽ�-@-�/��@/��t]�@1�;�YP@2B)C}�?@3ul:~n@4��(;�@5񌩜1�@7:�?ҵ@8�O���@9���3@;A�t"@<���y@>��!Ff@?��8��V@@�2���@A@[p�E@B��Z�@B�Z���@C� D��'@Da��@E1���@F4}�k�@F�d���@G��v�k@H��L�G�@Iop��5@JQԔ@�@K6 9�@L��K��@M���1�@M����@N�	�@O�׏� y@Pg'�%� @P�4����@Q`�o��@Q�6#�@R_#/���@R�S*ɺ:@Sb�Ɵ��        ?�L�����?²4O�]\?ӳ"�#�.?��@`_�?���z��?�(���??�L�����?�@Q�:�=@}�j�K
@��̜��@UYO���@����
@G�v͖d@U��/�@
����@&��8�@hs�#̩@!gi����@#,sQ��Y@%��;@&�e�q�@(�F�jA@*�I�5�@-�hq@/+�쏺�@0��Jb��@1��S�?@2��a�;u@42C<D@5k}V��@6�5��9@7��I��@9By�U@:�y�_�z@;�ٌ�s@=Vm�`F@>��բ��@@�̵?@@�)0q�@A��>ү@BS6��Y�@C�~4�@C���Rx@D��1���@Ex�;�·@FJ�<��@G/�x�@G�ZMф@Hτi�6�@I��	5�@J���@KoĽ�i�@LU�����@M>}B��P@N*$ME�(@O�!78�@P�'�v@P�|�$@P�p��e�@Qw?�l�@Q�kg@�@Rt��Km,@R�ɵ[��        ?��o�%Fs?���T"�?��fK��?�3u�/7~?��XǞ�@l����@P{�e3�@�x1s{@��	�f�@��S��@#��6=@�d Nzo@"oQ��@%`.L@'���@*уzQ��@-�N�0��@0���!�@20h �A@3��kEB@5��VЅ+@7b�*ɞ@9`�D�9�@;O�Q��4@=K�Ք��@?T��G�@@���4@A�
�H�_@B�\v�G@C�þ �@E̥�J#@FERy�>�@Gs|[R|p@H�3cO[X@I�ak��@K�qQ��@Lb��N�[@M��ЋL�@N�� ��@P&����@PҴ�E�a@Q�1"D@R2�a�@R�8x�.�@S���6l@TR^�c�@UD���@U�T)�"�@V��:�N�@WF�w5ja@X	2Y\��@X͟�2@Y�^r5@Z\�X-�@[&�_��@[�M���@\����B�@]��S��@^cų�K<@_7����B@`�BSc@`rk���@`�P+�        ?�AR�j4?���A��?�鎉2N/?����:�?���$4?�,���J?��R��?��&��@ ��ahe@g_nŲ�@^���@�7�f�@���F�M@�լ7@��"��@A.R��@�C�>@ Z>��@ �9Ƀ��@"@a�u@#����Sk@%t�y,�@'5���	�@)Tx���@*�S���W@,�v����@.�}¨�K@0a�q?@1h��	�W@2vFS�7(@3�����r@4�kHƛ~@5·��X�@6絖�
@@8N��'@9Bo��z�@:x2�>@;�����@<�M'p�5@>8�v���@?����؝@@iξ �	@AU�0N�@A�cn�/�@Bp�:!�R@C"���N@C�qpK�@D�T�h-e@EG�+���@F?���@F�8{A��@G��ti�@HD]���@I�%��A@I�	�@@J�_�M�^@Kd�]�^@L2����@M��a�@MԦ4x�w@N����ɠ@O3��7_@P+�V��        ?�"�	ڧ�?�Z�h�!?�Ga���F?�y釩?��(O�&?�W���?��~C�=?�q��:&@�U��x�@V D�t@�pևv@-�.�B�@��rÆh@sf,�]@PYnU�@RP<���@x%��y@ �fKM� @"���FJ,@$[[Ker@&1bAb[@(�x"�@*D7;@,�C���@.!(���n@0 �]�@18k|D.@2V5C��@3{�>N�@4�`Y�>�@5�,�(@7D�]�v@8N�J���@9�ᾬ"y@:�,�1ׄ@<-R�ⱙ@=�8k@@>��4x�@@�5'�@@�6��@A�*^W$�@BA��.h@B��f�t@C����r@Dz�a��@E={ܤV�@F�#�{�@F�	�1�@G������@H_��|p�@I.Zb�?@I������@J��ai�o@K�̶:yw@L}�.�{:@MW'�:��@N2sKL��@O�2*�f@O�[�C
@Ph8�0�@P�ۜ�"�@QLt���'@Q� w��        ?������?�#��cx?�30pZ!�?�S�M��4?�j��Bc?�S�*�?��N��p<@ <?ɪ@^��Z@s@q��@6S �^�@+sJƟ@���N�@�AVpe�@��ژ~@#+�L��@ DA��+�@"
�AX_@#�.�@%�E���@'�丂�C@)ߌ�5��@,�"��@.5�I(_,@0=l�4a|@1hr9~�@2��O�F[@3ׂ��X@5WQ�
0@6g=%�~�@7�8שk@9�?�:I@:zi}�M @;嫯���@=X�z���@>������@@*s��@@�Ӏxf@A�`�p�@B�F؟7@CR��u��@D%�`fq�@D�?h��@E�6��jD@F��T�N9@G�hD��@Hx�����@I`z��o@JJ�^��D@K9�^ژ@L*tv�M�@M��L@N���@O�܂q�@PVX@P��|j�@Q
����@Q����g@R��&^@R���P]@S#?��@S�z@T8y��^        ?���.��?����w?���OA�w?�H���U�?��9C�@���0/@x� B>�@5/P�+�@ڢ���@��0A�@q��l��@  ���@"��܉=�@%m&w�@(N��~N�@+V1�B��@.��4� @0�H
�#k@2���=��@4m%u;޺@6H)) �@83fV�M@:.�wE�@<9.c�/@>SteN@@=�ƃ�@AY� ���@B|�+�>@C�y�#��@D�P��CQ@F�t�ʔ@GM4s�o@H�e���@I�I���{@K.��ᣗ@L���~@M��wGޭ@OH���R'@PY�W��q@Q���t`@Q̵��h�@R��	LF!@SKui�x�@Tւ�e@TՎRT_@U���w%�@Vj����@W9fq��@X
�_^U@X޳��@Y�H5�]@Z�q��Wr@[j)���e@\Hi�`3@]),w�,}@^li�~]@^�$ܙ:@_�N`�K@`bs���@`���W��@aP�I���@aɒE�4@bC��8�)        ?��|��8?���|� ?а��W&?ܚc�/?���G�J�?���1O�?�Ms��q?�j@�qn@ u@t;�*@f�)V@ۑ$g@���E<}@-��u�@}�Y��@�tG�$o@w�2*��@7E��@�#3��f@�ʒ	�P@!X�4ʑ�@"�ns|r@$q���e@&�Wtb�@'���#@)jO5��c@+(�G��@,� �� @.�#�{��@0N�I�h@1A�K�,@28�V��@34�#��@44�:�^�@59�t�%w@6B��js@7O��=j@8a3��L@9v���_}@:�.���@;����@<�B�j@=�enw�F@?��qt�@@%0���@@�~�>@AW�X:?@A�h�2@B�\Ӓ1G@C0���](@C�,EiKc@Du,�j�y@E��~^7@E�Aili@FhH���@G��b�@G�2��o�@Hj���
@Il�Ut@I�X���F@Jy��(b@K,���@K��"#@L��=3��        ?�d��|8i?SFF\�?�~��w*?௹�z�?�g"�x�/?���	�x?���f��?��+_��@2g8.��@[�s���@�E��@\!X+@���{�@������@�����@�����`@˧Q�b @!tg�4@"�A\��@$�ʈ�@&m�s��@(Xz���@*R�hO�	@,\�Ϛ��@.u��w@0N#~�_i@1h�(f�@2���|`p@3�)hxH@4�w��@6`L@7T�^�W@8���u�=@9࣯�Q@;/�n�;@<�2m �@=�|V�u@?A�{��@@TL;��@A
�a�jP@Aø\�,@B�<P�@C>'Ɍ@C�hI�Q@D�N���@E���K��@FR����@G���@G찶�	@H�L��?@I�Yib�@Je��O2@K=�g��4@L����@L�ka�B@M�G)�]�@N�m\��@O�آ�@P>�>ʾn@P��Q�`�@Q'���^�@Q���3�@R�3b�        ?���k;�?����=�:?ҍ}�ZP?�Șk�gY?�2���e?�<�M?��QN��?�Qui O@D�u��~@8	�t �@
bIA �@�	8b@���U?�@�Gb�@Ph��@.XN��@-.�tp@ &gUY�@!��\�2@#u�o��@%3*�Io�@&��_�3@(����@*�I.�>B@,�@t���@.���g�W@0h����H@1x�\<�@2����-@3��N��@4˽�N��@5��w�3�@7!��&��@8U�H�]@9���psD@:��8�1�@<А��5@=^&o8�@>�׈T�@@f�[��@@�z��3�@A^���@BGM�f@B���Y� @C|z� @D5�q�Y4@D�m�9@E��d�'u@Fp��h�@@G3��D@G��T	@H��Rj��@I��P}@JV�
D@K$���@K�Vڇ��@L�񵦹�@M���� @Ns��ׄ�@OL�5���@P�b��@P�gఢU@P�SI��        ?���ؚ��?ь�BU##?�|�!)�?���r��?�"b��@F�h�\@��6r߆@CԻ��6@;�/C$�@,,�Q��@ns���h@�{�?-@!�,��>@$|7�
��@'-���-@)�4�j�3@,�T�3L4@/��7֦@1�g�1�;@36�D��@4�	���@6��"T�(@8lC��q@:A��۟@<#42h�@>!��@@%�\�\@A�JrW@B���]<@C�:rq�@D)�h�w @E@<<�c@F[`���f@G{U�
�@H�rĤ@I�ZjB�5@J�A]�@L)���f�@M`��PA�@N��W�@O�H��T@P������@Q3�'��@Q٨��@R������@S+�˗�P@S�,��Ǐ@T�[�"�t@U6�`�6�@U�$���@V���DUO@WR��C@X
D��W@X��ٔ��@Y>|�me@Z<kO�g�@Z�YzR��@[��d�J@\~aL<�P@]Bo2֨�@^%���}@^�|���z@_�n�<k        ?�	K�;2�?�����k?я�&sU�?����M�?��T�#?�7�Q��?��>u��?����̥�@y2�_?�@NkT+@	y���ҡ@��\��@c�n��@�;�]�@��UU @}�tcgT@yú�<:@��5��@!l�Q2i@#�ш @$ސ����@&�i�l7@(����׉@*W��=\@,}�
�;�@.�A53 @0Skcu�<@1hh���@2�k���@3�Y[zF�@4����@6�Z�@78�J4��@8vg%ؕ@9��7<$@;'��@<VuO�@=�:'� @?
�5�Q@@7x@�r@@��%W@A��*T>&@B^|�j�R@CGL��@C� ��@D���A?@EgA�5W�@F0���@F��ߊ�@G�p�.@H��.�q@Ir��g{�@JJ�_&�@K$?��|V@Ls���@L��5͐%@M¯��@N�n-�/_@O��MZt@P<V</��@P�����@Q*���@Q���1x        ?�$�?��x?��G�;['?���#	��?���_Б?�D����?�>����?���p�+@ ��Ǚ��@��|�[@	0�[��@iO*�_@�
�J�@����L$@�8��@@�Ǜ�@�Xg�@ ���M�@"���I�@$wi�d��@&qdhJ�@(}J�{bl@*���$�;@,�f8���@/�Y��@0���`.@1�&�TҼ@3��_r�@4`x�V�r@5�Z�Ch�@6�<4q0+@8Y (,2@9��\���@;%ļ#�@<�� g۶@>�VC]6@?��"�F�@@���3�@ATn8��@B����@B�gx9�?@C��a��@D�m�y�i@Eo�	��^@FLC8,?@G,J(B��@H�=v��@H�j���@I�uM� @J�Ʌ�*v@K�b3a�@L�:6���@M�M��4�@N���H�@O���%@PP�Qg�J@P��9Wi@QVZ}Hw�@Q�r�R�@Rb\���@R�TB��K@St�Bc@S�d���@T�5V���        ?�� }-�`?�1fc=�?�9��8��?�U�-윴?�j���^?�q}���?��p�>c@ �B�1+@	��}eD@h��+@'в�0;@!�-�Ԫ@�v&{@Ù��~U@�zCCec@t���@ 89�Kv>@!������@#�Q�w)�@%��GӃV@'��})�@)�?nN��@+�W�@.��[�@0-�&X�k@1V�(�?@2�A��4�@3�|�U��@5��K�@6KP�}�@7��̅�@8�sk7;|@:R�
P=@;���"� @=&y	��~@>����@@8(o@@�W�ZЙ@A������@BX����@C#��ס�@C��d�@D���#�@E���^_�@Fn����@GIp���@H&��- @I/O+�@I�c�Ȇi@J�n~��a@K�G']�)@L��17�;@M�@ J�@N�P]�@Ox�V�@P7:Rg��@P�����@Q1���F�@Q����x�@R1L�U�@R��%�;@S5����@S��>K�|        ?��^8���?���m=4?���QZ?��JS)o?�Lp���@d.:�p@���Qn�@��z��"@�����@-�y�o�@����`@!�)��@#����R@&��<��w@)��g�q@,�1\�@0*��N��@1�Dy�z@3�<����@5��2Hbl@7��<!F@9�;��]@;��s��@>q�~@@.�)��@AXj�õ�@B���@CŻ��E�@Ei1�_�@FR�S��@G�7ң{/@H�#w�Sv@J`��0�@KɉAq�?@M9����@N�o�� �@P z���@P���*@Q���p�@Rk�^=�n@S95�]��@T
5%bΌ@Tޣ�`b@U�z���@V��$=�@WpBVk��@XR#O$�@Y7L5^�T@Z�i��@[Y���@[�.���@\�->u��@]�M�(c�@^و����@_�ՙ._@`i���+�@`�@�#�@alh���@a�	r��C@bu�S��@b���Y�$@c���j�@d G���        ?��ކ�?�Yt�XWh?�}�Ou�,?�B��~�Z?�����?�i�e��?�[�:�H?�1��=@ Xk��p@��튵�@�4HC)�@�.�{�@0yp�P�@�f���@�?�2@��4D@_����@9]o���@ =3f��@!��2��@#9���@$�7�D.�@&��Ѱ�@(Q�<5@*:�5m@+�$���@-܆0�C]@/���@0����b@1�a����@2��Q*@4���@�@5ѝM�@66>��S @7W5]�_@8}�*��@9�����@:����@<W�bO@=M/����@>�@r��[@?�|�YQ@@��h�z�@A8.z�@A���O'@B��ay@C?�!�@C��D`�@D�cH\�@E]S��X�@F��f@F�N;j@G�L�Bb@HP�y-@I3�/@I���'@J�/��^�@Kh�W�@L4���@M��~�@M���Z5E@N�����@Ox4
�=        ?�R+�Z�?�nF	�W�?�Y��h�?��V.�?�6�F=?��qi��?��"��?����x�@.B���@;z5V��@��`ZN@I��0A[@�J��"@�F�&��@�\׋��@�Te���@���"�@!D0~�@"�f{��@$���-@&l)%��@(Y1�<�@*U����@,a���u�@.}<��@0S�ՏE�@1p)�}ܨ@2�����E@3�[���@4���Fd@6(4dc��@7g6�9s�@8��SH��@9��C��@;KLR�s@<�Zܾ@>�j�r�@?g�Ȼ��@@isx�@A!�v�@A�M��e�@B�����@C\��^�[@D �t-M�@D�`�r�@E��O�#�@F}3�9@GK�:(�@Hvȡ��@H��ah]@I�R7��@J��P��@K}l�2@L[��Wz@M<�:)<
@N���@O��̞�@O���g@PlBE2K�@P��k�^�@QZ�Ř�@Q�~U�i#@RM���        ?�E��c�?¡���}�?ӟ(��LQ?��j��D?�p��Er?�� ��?�3���?�!�Ų�@k��Q�O@���\�D@>�x�IN@��-6@;W?�%@�T X@�r�zH@�ܺ��@]W�kW@!bo�9@#(%T�U�@$�S���@&��?s�@(�gE��@*醱��@-���L@/+#Um�d@0�uO#I@1��Ӽ�#@2�`��μ@41�_F�@5iϬU�M@6�a�׿@7�3A!�@9<�$��.@:�t�yq@;�ь���@=I��#�@>����@@8�@l@@�^�6 #@A�w<�#@BBvi���@CQ�	,�@C��Y.�@D�t����@EZ�9�c@F'�h\0@F�)����@G�f1Z�@H�>{���@Iu����@JO�n3��@K,[l�^@L��X@L��e�@M�_Fo@N���Y��@O�R�0m�@PE,t��0@P����v@Q3���uO@Q���ܭ@R&�Vi@R��;SK@        ?�	��&t�?�!�W9�?�h�)���?�]tM�?���aIa@ �hx�p�@�z�E��@E'h�GN@DoT��k@Ab�^@��3�(@<���ж@"L[ZN@$�µ��@'�EeK�<@*q�Q��@-��0�Q`@0X��KK@2��@3�;��TY@5��-.)@7\;R���@9C`���x@;95 �}R@==q���@?Oҥ�N�@@�7Z|�@A�@�&@B���I\@D
�$�A@E;����@Fm7T]��@G���ILp@H��:���@J'�8t@Kqy����@L��� ^R@N�/��@OuF̏�@Pk�)h��@Q��b!�@Q�	5>F�@R����l=@SM�c8�C@Tb���L@T��/�dP@U��3j@V\�G4>@W'}��@W�ˍ��v@X��B��@Y�W�ߺ@Zl��W��@[DI|�3@\�v��h@\�pXղ@]�Ȕy��@^���ݳ@_�脍�|@`C�~\I@`�j0s��@a.6c��@a�6 �WU        ?������ ?�C��"�?�U5��0?��Qv&�7?�Vˁ��?�!ޯM�q?�+0�ϪJ?���T�@ 0�k#�
@�Z�g@����]@��6/D�@�4�@\o�Ib@���<@g;����@I��+�@�)+OK�@��2%�@!s���A�@#ԡ`/k@$����@&Uw��M�@(B=���@)׳��Ĵ@+���T��@-�����@/w����?@0���)�@1��d��@2�j$���@3μL�*�@4�jBU�@5�,��q@7)�J�@8;�}�*#@9dX��@:�k5��@;Ÿ���@<�0�|&@>;�o���@?~\jƤE@@b��y��@A	9��@A�� ��f@B]����@C
{���?@C�M�:�@Dlp6���@E ��@E׎�u��@F�{�ٌ�@GK�$�M�@H�`�6@H�o3�(@I��c.�@JM�l8�@K�',h�@K�v�!-c@L�Z�EG�@Mq?z��(@N?���A@O��i��        ?��6���?�����A?��j�*��?��`�g��?�Ā�-?�0]n�<?�V�յ(�?�Nд�@����#�@ȶ]b��@ftE>Ȭ@��8��V@UKf�M@%X���z@��?�D@<�U<×@�?[i�@!uF�KϦ@#;����@%��1�{@&�Mu��g@(��Û@@*�_�zM@-z�ʕ@/A_l%)-@0���3;�@1�@��] @3��O�@4=Z��@@5v�k�@6�����@7�ԡ���@9JO���@:�b��h@;���E�h@=Y�Y��\@>�.�/p@@P}t��@@�*aS>@A��;�͢@BM�9S�@CKt��@C��y"}.@D�Uҙ��@Ei�my��@F7��N�@G�M&�@G�jW@H�`�:j�@I�T�"\@Jf�w�@KE%��@L%�"��C@M	@�&y�@M��a��@N�^^S�N@O�;�%j@PW�ZS�Y@P�`~&��@QHS��Gc@Q�t�~�@R=���@R�;Z��\        ?�3z.�hN?®���}?ӳR��ER?���c�2?�f����?�(4#��?�JNO}�?�;#lۊ@y.�1�@�����@J9���	@�4:�f�@=�G5�(@�o�}@���vT@)�I@O�X�х@!X��S��@#?�U�s@$� ��i@&ӏ���B@(ȇYl$@*͋|�|�@,�H��hh@/l^��@0�Ԃ���@1��x(�@2�#�t�Y@4��ݰ�@5K��&_�@6�<�'�@7�B�Қ@9�A��@:i*��@;��E�T|@=����@>�� �4@?��g�@@����v@Ai����|@B'�?)o�@B�ؗ@C�Rk��1@Dr�r�{@E<5n8��@FG��@F��}�k@G�{a�Dd@H|�p: @IS0��(@J,e�	�@K ��#�@K�Y^\�@L��@M�����@N��dfN@Owj��1e@P0�Xѕ�@P�`�B@Q]3��@Q�ٙ�r�@RrI���@R�$�H$�        ?�
CF貙?ю�Ϗ��?�~y�s?ﶦщ�?�-Bۮ�@��,]@޼0=f�@o+�5��@^�P�6-@aO.+[�@�\�v�@i���Q@"4L�{Nw@$���4t@'����:�@*�~z�E@-��访l@0p\u��@2\��R@3�ˤ���@5��	�@7|x���@9f��5@;^Mh�c@=e
%�<@?y��7@@�o綡^@A����ɺ@C�+rp@D+�z� @EW�m%�@F�s��@G�}z�@I�Jl�@JHK%^ s@K��w��@L�B�^j@N=	=Y@O�w���@P~���zz@Q3Q���@Q�`���@R��>P�,@Sa�@��#@T!5+��R@T����@U�~EvG@VpQ��@W:Wm�a@X(F� �@Xֆ�E��@Y�j5;��@Z|�Һ�@[S���Ƅ@\,�)1@]�{@]�w��0@^��=xM}@_����@`G@�1�@`�֛���@a/����/@a�R��K�        ?�l�_�}2?���ٍ?��>����?�ϧJ�4�?�}A5%W�?�{'�!?�;��8?������@�r����@ϡ͆��@
�7ߟ�@��@3U�@ЗG���@p�z�2B@8�z��@'%��Q�@:���.@ 9��Z�h@!��-�wX@#�l!�x@%x&;_S@'Y��6d@)K��l@+M�:�)�@-_K0�@/�~�)kO@0�k���]@1�uŵ"@3�@4M�6S�@5�'�F�@6�=��S�@8+"�@9J�/��]@:�/ߔ@;��u�@=O���`�@>�^2��@@�+���@@�S�e�@A�\�{�@B@��B0@C3;x�@CƟ1U�@D��U;5z@EXGFp��@F%pá�)@F�p�{,@G�=���G@H���ZW@Ivp��@JQ�|mV@K.�*�,�@L G��0@L��vn��@M�L�n��@N�CRN/@O��2��Q@PKW��c@P�P~@Q;���@Q�!+$��@R1{h�        ?�P~c�Z�?�B{�+�?�QMȯ]?�B���f�?��4Z^?�O�j�?�LԊ�g�@ �%QC3�@��=�@	�'"�@��<�$@;}N�@�Ev��@��,�@NGB(J�@�O4�o{@!)�=.]�@#
�ly�@% �A�W�@'
��#��@)(x��=@+Y��{�D@-��-#�@/�����Y@1.��%I@2l��w�^@3�g��Ǧ@5�M��@6[8�C�+@7�$��T8@9%��-�9@:���mw�@<�WIA@=�M��@?�j��@@X�.}�@A&` ��@A�ʈLF@B�%�*p@C�ho�u@D��@)��@Ed~u���@FI>q*��@G1��2M@H�CY�@I�Z�C�@JdǷ	�@J��=���@K�5���9@L�lG6��@M����W@N�G!Y��@P m�1H@P�g�uy@Qj�@Q�b�|p�@R"\Y/�@R��H�o@S=9A).@S�B3�7@T^���(@T��C�@U�G����        ?���<��?��1��Q�?��u���q?��s�)[>?�m%b!%!?�_�2'?��c��y@ �k�CS�@�U��./@	f6�:�@Z�W+��@�~�Z0@�>��0@��m^�@�tp)4@R�R��@ �E�Y��@"��ʾƸ@$���Σ�@&�,�M8@(���@*��­�@-5���@/��6Y�9@0�ܨT�@2*�ݐ	�@3l�@�M�@4��?�i@6	����v@7e��z@8ȳ�=��@:4�-~��@;�g�� \@=$I��B@>�"��o@@�,��@@�l�۵@A��X�z�@B��v��%@CV��>�@D/g+��@E�I��+@E�^�B�@Fλ@���@G���E}�@H��.�@I��1��Y@J-���@Ks��͐s@Lk�f��@Mg>�`�@Ne�InOp@Og��:�@P6u3�n�@P���b@Q@X���@Qǥ:xj�@RP~��@R���ڴ�@Sf��7~ @S�2���C@T� gN�@U�
K        ?�������?��	&Ƿ?�����?�&,�#��?�+�&i@���Z�@θ�Y�-@��fGӺ@�����@b��Q<@.B�Dٯ@!-n�
��@#��ƫk@&�Z
�p�@*a����@-Q�P{R@0c�ws'�@23����?@4acl
�@6d�d@8��K@:7��g!�@<hv����@>�#yЕ�@@Т4R@A��Iyi�@B�WɅ@D2L)Q0@E~�1�@F��Ij/�@H/1��z�@I�a����@J�O���J@Lr���Zy@M��BطR@Op����8@P}:�dcC@QE�Qڢ@R
��{�@R��]�H�@S�!�$�@T����*P@Uf,�� �@VC�X/@W$�Z�A@X	$����@X�0��@Yۇ�_Q@Zɂt��@[�����_@\���Ɠ"@]��&�@^�Xp�@_��H�H]@`N�����@`�q�mV@aSo7GR�@a���1@b]��~@b�����@cm�����@c���{��@d��w-�        ?���V�P?���_�S?�J;���|?��?�2�?�H�2��2?���;6|?�%oYQB�?��b�@ 4"��\"@���~S@�p;
��@��o�IO@mr��M@}�lZ@��	��@�
��V3@g��Cc�@LpAW�@ (Z���@!���o@#Zu�J��@%	у��@&Ǭ�@@(�ĲF'�@*m�A��@,UƳ�X�@.KCI�0@0'���u@1/� �@2=�vS�/@3R��"�@4nC
C�@5��;��j@6�hR;e@7�O7i�4@9@����@:S)��t�@;��0��@<ؗr��k@>#���-@?u��@@e��5��@A��A7g@A���[
p@Bx\�eY0@C.�~�d�@C�{?Y@D��"���@Ea����@F!��2��@F�ύ�<�@G�q�C@Hr��W��@I=���8@J
;�[�@J�U�^V�@K��w�t@L
h[�@MU`���@N.VVa@O���y-@O���w@Pb�2�7�        ?����?�Z�eZ�?��׍2x?�cF�2�?�M��?�]��f?��� X�?��ky�t~@����6�@ �Y���@��	F�+@֍NE�@�^���@[�V��3@\�-Hw@�1H�K5@Ԇ�c�@!�ǌ&;@#q�� `@%P}��ȱ@'@���@)BE+���@+Tt+"��@-w��}f@/����
@0�
dv@2����"@3Oz��Mr@4�m�8�H@5ƮƑ�)@7��y@8Z��)Q#@9�򁇲�@;
,D@<k�[L�@=�G	2��@?C��@@\�[9�@A���a@Aژ"fH�@B�d���@Ce,�r�@D.徒��@D��0Gc@E� ߉"@F�Qh@�q@Gro���@HJU�Xr@I$�e�L�@J\R�@@J�m��}@K�+(�@L����G�@M��m"�6@N}3���@OjgF�^�@P-���@P�:%�"j@Q �N'(�@Q�D�N%@R#����@R�:ILK@S�)_n�        ?���x3�v?� 
*Y[
?�:�\?�_��Nݥ?���oG`<?�8`Z&?��`�S��?�W���@�,6�^�@�����@�;%�Է@0�2�2�@�%�n��@��r-B�@g�Ї~v@sP���@�h:7ح@ ��q`X�@"��K��,@$�[-h6�@&f���@(UjAQ�l@*T�:}}@,d7�F��@.����&@0X���dr@1w8�BqK@2�-�A�I@3�cOSh@4���N�@6:�ʍ�@7|`�+6�@8�~�A9�@:Z\��4@;k�l�B�@<��[�@>,s�ހ�@?�[���@@�G֩�@A>}�}I@A��(1��@B�8v��@C�d��=�@DI���N�@E��d�$@E���"R@F�����@G��c1��@HY@㡜	@I1��:�(@J���҅@J�V��@Kʻ�c@L��r��@M�a�0w�@N{�V/�W@OfT⌕9@P)�`@L�@P��w�C�@Q��Nw�@Q�\q�@R�D��e@R�KqI��        ?�ǵ��;l?�L���?�4h��?�7)�Z��?�Ϳ����@ ��p��@��iVss@G$��@%T�t7�@!�A�'@w�rz��@$�
���@"Ʋ���@$����@'�1��0�@*���n d@-���:j�@0o�����@2!d�
@3�fX&@5�����@7�|C��@9����A�@;����%�@=��F�n@?�7�~�@AZ**d�@B#����@CL�Pk�A@D|�V�q@E��G��w@F�nW��H@H7�8$@I�P|u�{@Jב��j�@L1�j�b�@M�J��(@N��l꽆@P3�?bQ�@P�߮��@Q�6�KS*@Rk�0���@S/Q+��@S��E-h@T���}�X@U�|*n�@V\4����@W.�i��d@XrtX��@X��	`@Y�./�LO@Z�Ev@[w!k^�w@\Z�0�D�@]A	�U�$@^*��c�@_�C�q@`�4�@`z\��$@`�N.��@ao	�@a�C�w@bh��Y��        ?��4Te�)?�Mx	�g?�&A1��?�b�㥅�?�c�N:�?^�<�?�(�i�v?�9
@�A @ ���[w@�X��ޘ@�#���@^Mv�@Ϝ7�i@@�U�n@�X �~{@�	4�̘@]��N(_@Q��(�@ ��Ԕ��@"I�؜��@#��&a�@%����m@'e }Z`H@)4��O@+�C)�@,�Ӽ��1@.�2��r+@0w���=b@1~�mு@2����Q�@3����t�@4��릀@5�C�u�4@6��a�@8"]2�\@9Q�T�K@:�'�t�&@;�~_9�E@<�����@>@��za�@?�n��ZD@@k�S��@A��YA@A��{�n�@Bn��A~�@Cj�;��@C�P��ܓ@D��-/S�@E?
1}:@E�ϛ"*�@F�����F@Gs;��@H3t�y��@H�
�=@I����b@J��Xt&�@KJ��0K�@L�n���@L�ޕ!�U@M� h���@N�t���@OV��w��@P$�5.�        ?�ul�H�?�S1�Z?�G�O�p?�Z�'"h?�l<	���?��Fe�?��Ty?�M@ 	��<5z@+"�,�@[A���@��Ep@t"�c@�L��h@���9�^@�b'�b@�ܶ�)@ P�{�;@!ރ��Y@#�*�.=@%��QT�s@'�"�2��@)��^�%@+�G�g@-�
݁�@0�~c@@1'�JVeD@2S�f��@3�Zq$��@4§(q�a@6t��@7O����@8�-�%�@9��\l�@;Y��[{ @<��}�i�@>.���@?�d�k8@@�|X�|1@AP�zu�|@B)O�~@B��(��t@C����Tl@Du�R�)_@EGA5ٖ4@F��F�U@F�%w�@GͩO<��@H�,`��@I���@Jo?�9C@KUW���@L>�P� @M*{`'�@NA�@O
��(��@O���0@P{ZL��@P��	U�@Qv���@Q�{���@RvB��z�@R�T�\�6@S{�A��        ?�؁��B�?�9@�?K�?�,��7'?�l2�I-?��`��?�P?��@���?�Y*��vR@���@��q0@|�$/E�@#Um��7@�r�t}�@g;b�6@Cdm$�@D��m*�@j6F\��@ �h�˴@"��C8O4@$T��Ž:@&+\����@(�I���@*�[���@,�2?@.!m|��Y@0"A�g@1;��@2Z�q�I�@3��ͷ@4�Y�Q[@5㮶�2�@7�	�^@@8_��8��@9��+og�@:��8�\i@<I��2�+@=����@?��Bo�@@4�?�@@�g�n܅@A���W2&@B^J~�{�@CYٟ��@C�U/�@D�|�V�@Efz��@F/���@F��#B�@GǞYxx�@H��5�~@Ii�#��@J>��t�@K�C�;S@K�M,�ZX@L���|@M��+�e*@N�!-+�@OkxP���@P'���C�@P�E���{@Q����	@Q���M�@Q�Y=�B        ?�݁5�9?�.=�}�c?� o\�"�?�c���}�?��=Ѻ�@�Z��>@���W�@a���L8@�0"΍r@T���@��+9�1@ 2|��C^@"���{��@%2)�P�@(_��{?k@+e��k�@.���I�@0���Y�@2��1F�t@4lu�;�@6C���#@8*}��(�@: �t-��@<%�Y2��@>9�T=;�@@-�}`@AE��(
3@Bd�� c@C��~v`�@D�<�|�@E�AF�!�@G#����@Hc�uPރ@I�����@J��>Dܥ@LH��"�@M�K�:+@N�l[�:$@P1-i��@P� r�.9@Q��>���@RX��d@S<Vs�8@S�'���@T��b�EU@U\�G�@V$�+vM�@V��d�<@W���~{@X�*�E��@Y]9��@Z1H���@[��Y� @[��F�@\��\�c@]�\o g@^z�����@_]
y�Հ@` �-�{@`��?"t@a	4���@ac��@a�<�	*        ?��ݑ�r^?�z����?�XS-��p?ݹ�@>��?榪��j�?��nq??�i��:�?��O|�4@2"�U�@�{�Hpj@	�$�20@f[j��@	��<r@��_P�@#.ۻ�@�~��Ł@ĸ��߬@��F[@ ����l3@"�%>�V�@$?�n1�@%�"iȮ�@'�G� �@)��$:�@+�TO�d�@-u�u�Wz@/t�:;��@0�[e2�*@1�wF�@2ަt��@3��w�#@5�mqo@68���6\@7b"�*�@8�>�y��@9���@�N@:��~r�.@<?o͙�[@=�3�2��@>�.�P��@@��+N@@��X�b@AeT���@Bb���@B����S@Cy��k:C@D08�:�@D��^�h@E��V��@F`�[�0j@G p�H!�@G�M��_@H�p�@IlԛVhV@J5xK��I@K X@<p@K�q`�X@L������@MnB��9�@NA�n�|@O�{�%�@O��<�:@PeX�+        ?��R>pxv?®L�<�?Ӟ��H\?��*���?�����?���d�g?������?��cB�Rn@L��*�v@{��{!@$�P@ps����@����@�z��.O@��9�o7@���e�.@臻v@!�A<�@"֙z�5O@$���cT@&ziv�6@(c��ީm@*\fU`@,cН���@.y��^R@0N�� 2$@1g�T�=�@2��#�� @3�o��@4ۛil+�@6E�1@	@7ISe�
�@8��(G+@9�(.�ݤ@;�䕘1@<oF+�:�@=ǷUq��@?%���`�@@D��O34@@�ę�6�@A�W�IB�@Bk��a1@C(��P$@C�YC�}�@D��O��!@Eo��f� @F7�@G#���@G͝2�v�@H��sJ@In+)O�@JB��	5@KvQ`�@K�1n�I@L�H:�r>@M���@N�p�g�@Oku�I^�@P'���,@P�"8�@Q�̬��@Q���ț�@Q��:�hG        ?����?�&�7�"?�.�
��6?�K��?�j?�Z�ҝ9�?�n�&M�?��B��w�@ �І�@�b$�.@TSl���@����@	��BA@ɘ灑G@�Vt�Tb@����[@�[�Ԉ�@ %�1���@!��c@#�B~�@%�l��X�@'��"S{@)��}ji@+��)B��@-�2&ZE@0�2���@1>�z��N@2n$�`�@3�W��@4�I��w�@6*�i��#@7xܓ��@8�8�T� @:*�����@;�x�K0@<�"{���@>j���N@?����m#@@���67�@As���@B9�YNq�@C��*@C�r�zn@D�8��@Eq�]��@FGkO� :@G 41X#@G� �7�@H��l�A�@I����m<@J�)����@K���o[�@Ls��k@M`Q�*@NP[9R�7@OC/)8�H@Pd�*�@P���;,@Q�W�@Q��,@G�@R0�ԏ@R��\��@S��5�@S�ĈK�        ?��S��?�H��H?�>U��7�?�}�^7?�"��&�N@���w@����ie@���� @_�c@?�1@��f/\�@ O�eP7�@"�ӽF�U@%�/���@(�{��t@+�dl�>�@.ͭ�	ݾ@1�wy@2�~U�G@4��x�@6t���&�@8`�B�i�@:\7�%@<f�Fʊ@@>���@@SկS�@An�6S@B���\0@C�;hӜ�@D臂�VO@F^c�b�@GZ���@H�<�#�;@I�9��@@K5
����@L����@M����b@OE�q��@PVF�gi@Qr��u�@Q�o���#@R�2���@S?��SQ�@T ܑ�8�@Tįq�R9@U���@VT$ٟ1k@W�C7�3@W�Ԋ�@X�uF�i�@Y��I��@Zg3�]C@[?Jh�e@\�%S�@\�ִ�V�@]�F�Kex@^�#ǟ�@_�k)Mu�@`A���A@`���@a+Ҹ���@a����n@b��>d�        ?��^��?������N?ђ �|�?����?���j���?�3]*���?�����K ?���Cf@g�e5=�@2c�I@	OHWK
@� ��%e@9g,�#@��b���@]3���@"����I@����@.q�|,@!3{�@"��ك�@$l\��[@&+1����@'�kBp�@)���+�V@+��)!�i@-�@A�к@/����$�@0�ѝ5F@1�rC5�@3�X��.@4��E�@5<�/eP@6bq��@@7�*�&&U@8��/��@9��?�"+@;3��o��@<u��^@=��A���@?
��KI�@@.��C��@@ڱ�M��@A�Cr��@B:m����@B�,��@C�yu�@D]P�~/�@E�d�@E֐&`��@F���ʽ�@GY�ol�@H�Q'@H��<R�@I���M�@J}�ow�@KLb�+3@L�:�@L�$�5�@M���d��@N�ԩ��e@OyG��@P*����?@P�,Z�D        ?�e�)g?�ZIT��3?�S.J�E*?�e)��g?�{�]�^W?����?����'@ ���P!@��t��@_�e��@�?�@���@�˭��@���!@�G^^\=@�5DB!@ 7���@!��=�Kp@#���	��@%�����}@'u����@)yn�܌@+�l�)]@-�R�=(@/����`@1�#�E@2>�B''�@3pj%���@4�x��BD@5��3YC@71��N-@8���@9֥A��w@;3���xj@<��V�2�@>-ڛ^�@?s��R+@@u�����@A5G
f�@A���LY@B�B�ip�@C�.3�p@DRB��m<@E!y>�	3@E���}��@F�9��s?@G��#�@H}RĴZm@I[��#@J=���@K"Mw�:;@L	��e@L��w�@M�	6B;�@N�g�[h�@OŠ
���@P]�W䛭@P�D\%KN@QX�$͔@Q�Mۖ1Y@RW�t�6@R��\�@S],��y�        ?���+od?�A;���K?�Hs�"7?�a�R-?�{B:�=?��'`ٟ?�� s"�@ 2��.@��@m���8@+}[�@"#��@�%���(@��T�@̼T2,�@��d@;@ 0���@!���'@#ƍuBn�@%�n/���@'�5���~@)���r�@+��z�@-���i@ @0�/M6"@1Ai��q�@2p��@3��."@4��V�o�@6*˱�}�@7xFk�g,@8�1٠�K@:)un���@;���?�@<���7�@>iqٚ�=@?�6�*6-@@��}\@At4P�m@B:�#�;g@C�M��@C�'��l�@D��D4�@Ev�A+y�@FMΟ K@G(&��p@H��D�A@H�Ud�Q�@I�����@J���HI�@K��h��o@L��it&@MwϞs�)@Nj�v�V�@O`�6��@P,�կcz@P�{�`�I@Q)�ihy@Q�Z���@R,b�:@R��K*غ@S4��Ƒ�@S���L        ?�^��ݗ�?қ_F��?㔬��w"?��#k�x�?�����@�$q�@/�ۧr�@pψ�@k��6w�@�lg�V@?[�\j7@ ���G��@#:k����@&�HSm�@(���p��@,���	%@/O2��@1XM��:�@3`�@\S@4�_K/}>@6������@8�z!�l�@:��w8@.@<ڥ�.}z@>��;�[@@���Ζ@A�7��@B��A �@D
���/$@E?H��8@Fz��õ@G����tD@Ij��!�@JT�xZi�@K�4����@M%ن��@NhW�)��@Oе���'@P��4��@QY�I�`�@RdC@@R�HBI��@S�g%�f�@T`l6*��@U)R�y�@U�^+_k@Vê�!�@W�N0i@XiG��N�@Y@C��a@Z\
5@Z�{�"S�@[խhB��@\��rӢs@]�����@^�?��dH@_m����@`,���3@`�=��s@a�ճ#X@a��T�@b�\�X@b�L�|��        ?��&�#�Q?����Z�?Ф��~�?܅��D�?���*�n?�5j�8�?�_;M?�n���-@ ~�P@�A��@�Uv�,�@/ZY���@T��Y@�ɡ� �@6J��~�@�6��$@@���V<_@yHb=��@ ;P$�q�@!�`Q~<@#cv��W]@%=@�kd@&�c:��@(��V���@*U�`8=�@,2K5��(@.:�@�@0!z AP@1�r1v�@2��i@3鞅KZ@4,�-���@5C��(8@6`��#g�@7��8#�@8���{�@9֚����@;aw�^�@<?Al��@={)�ͼ@>�Bt��@@ �o���@@�DO��d@ANt��@A�'1��?@B��� �@CSzr�_V@D���@D�	���@Em�}��@F%�X���@F��O�d@G�!��*�@HZ���@IZ�X�@I�0-�T�@J�'ǐg@Kj:_J��@L3e��x@L��8��@M��1�@N�Q򅌰@Ol��t+        ?�R�͘��?�ӽ{#Ac?��sE �?�P�Ċ�?����*?�!��6�?��^�>�@W���F�@�O�r&@
c��lO�@��~Yr�@�
�;�@���n9h@���I@azx��@���@!�����{@#��<�@%�$:�r@'�����@)�C��@,:��(k@.q]w�0@0n0�WO@1��v	��@2����@4I��_�@5�%�*z�@7
����@8yB1 �i@9�$"�4@;r#�wR@<�.�#�@>�2�w`@@�r3�@@���Z�@A��+�1Q@B�Ï�1�@Cy+[u�p@D\ى%��@ED�KE\�@F0�Ƅx�@G!1�[kE@H�V_Z@I$��3�@J
�Ҏ0?@KSB��@L���~C@Mz� ��@N$��OK�@O5^��r@P$�;��@P��c�ֺ@Q>Ѽ#a�@QΦ�M�Q@R`X�m�&@R���F �@S�@�R�@T ky�B�@T�`+�W9@UT��%�@U���|@V��	���        ?�Mqv��?����4�N?Ҥ6��{�?���Oa�?�K�j��?�#d�d�F?��诰??�t�&�9�@\dn�s@W����e@
�/[�)�@J�k���@Vafrw@�9x=� @���/��@g��"I@qaX'@ Nk1�c@!�����@#�2�?6P@%n��	5@'A�@�M@)$B��Ǐ@+���?@-��c�z@/�h��@0�����@1�CxU�@2�4\?�@3�;� [S@5�'+@6<�t)8@7oD�dNY@8�yƙ��@9�s)\��@;)$;ĳ@<r]y�na@=�&@T*�@?`n��-@@7{���@@����@A��*�OI@BM�E:�@C�jjK@C�_C�X @Dzzz��,@E9z�6@E��u�N@F�#ˠ�@G��[v�@HJw&��@Iz5�@I�Y@J�!��@Ky��@LR�j��@M&��g�{@M�B�N�@N�����@O���J��@PF��Y@P���~�@Q&R6��        ?�jQ��}?�ؐ5~�/?��`�u��?���8J?���.��@T��%�@4���t�@�*�\��@�? �QQ@��C&�@�D;Xj@�?�z��@"w�G��@%(`�\@'����8@*�JKO�m@.]X/r�@0��v��@2_0l��=@4!7�5@5�4�.�@7���hK�@9Ř\�1@;�P`�nJ@=ӥ���t@?�N��pE@A��ϖ�@B)�y�<@CL���ZV@Dvm�7.3@E����b�@F�B��"@H:qP�@I]o����@J�ˆ�ܬ@K�8n�M�@MK��d`�@N��3O�C@PB&�o@P��c��,@Qm��}9@R&���@R����@S�� ��@Tb����M@U'�3��@U����o@V�.s`�)@W�2���I@XQϳ7[@Y"�v.j3@Y���$��@Z�pݽ�@[��{`�@\�$Gq�@]^߷��,@^?�6m@@_!�.�L�@`eH��@`wojz�@`��Z�@abYd4R@a�\%�{        ?��c}K� ?�`\�3 ?Ѐ �!?�C�q��}?����c?�b����?�S��b�?�"�:�E@ K���D@���!�@��)�ʑ@�le8�@%Oz�Y@f"�Y�@�ܻ�sj@h G�@؇1��@���Z�@��e r5@!cH���@"�ijQ�@$��;d�@&1v����@'�=Mh��@)����~@+m7$�@�@-B��dB@/#�>wI�@0�·s@1�=\�}@2���"��@3���@4��TY@5���
��@6���"�@7�k��@8�$$@�@:��Ӧ@;=��\��@<j~�9|^@=���;��@>�{D�@@ΰtז@@��c�W@AFs�K�@A���e@B��) ��@C7MP<@C�u��@D���(8�@E:�G��@E�\<}�,@F����?@GO�n-�D@HF�)��@H��{�~k@Iv����@J1/%��7@J�)�$1 @K����@Lm�uh�@M/��~�@M��Y�;�        ?�
C���?�9v�|�2?�#�.oA ?�a�iB\?���Nb��?���e��?����4�?�F�E��@��`2 @��6�9�@qI
Ύ@ݎ�Y5@��M�@cj�r�@A�}8�@D����2@lͯ0�0@ �j����@"���5�O@$\oF�w�@&5��dn@($���@*�_���@,!���@�@.:M�r*�@00���o�@1L9��U�@2n�y��V@3�}Jo\@4�AX�@6 �O�5�@7?vmU�@8��=a\�@9Ѓ��(@;"�ba�(@<{�Vy��@=ڻnj�@?@�6@@U�p��@A�Q]�#@A�\�sh?@B���5@CJ�1��a@DP7'�5@Dָ���w@E��m�f@Fm�s��@G=�y��q@H+�j�H@H�Q��0�@I�5A��@J�����@Kt����@LT�*�@M68�TO@N�G�B|@O��o@O�^�.@Pk����@P�����@Q[j^Y6�@Q��i�@RO���        ?�R)�ܳ?���+���?���^1Č?�+�w�@?艪�Q�E?�O��,?�$�$���?����B�@����Z@�+�@
�5�s�@���g@C�^WB{@�Q�@���B*@�/��ɨ@����S�@ f�xM��@"��/R@#F�@%�*�ܾ@'ZfG�J�@);�@��@++p�D3<@-(���\@/3,�1�@0�V!��"@1����\[@2��e��@3�W.@5>f~S @6=��j�p@7n�hk@8��
�'@9�yX�w@; G���@<fR�wC@=�{�w5@?���)J@@+Z��5@@�Iy��N@A���7Y@B9(�8S�@B�^~�@C�>W�(@D[W����@E�'e�@E�>ӫ2@F���/@GQ`��V�@H�Un��@H�l���@I�λe�N@Jg��	@K1�; @K�� 8c|@Lʞ�EE�@M�&�l@Nk&��@O> -��@P	FN���@Ptc��c�@P�U�ąh        ?�����&�?�n�	7 ?�U:2��W?�hLId%o?��U��N�@ �2x�@��1bd?@��Z@m��:@�<~��@N4���x@� I�}c@!�Hp�m�@$t��i@',��#1@*���;@-:(魝@0ˉ�Ws@1�[��Jx@3Uߧf@5��|`�@6�:��@8�_����@:��d��@<��(�@>��U�d@@E����h@AQF/���@Bb�"@Cz�u�@D�	rd�Z@E�ZEQ@@F�_���c@H^��@IG-W<F�@J��C�cq@K��&D3@M�o@NMZ�=@O��]��;@Pw�q�p@Q#�H(��@QҢbg��@R���dQf@S7;�@�@S�b�@T�?%|oW@U_��3 @Vvh�@V�s��v�@W��6��@X`���"@Y%�`��;@Y�G~;��@Z�}��@[��nc1u@\P�bz��@] ��B8@]��q���@^��@׼h@_��3�@`:s�`��@`�f���        ?���Vz�?�GDv��?�vų�8�?�8'fj��?�Z�G�?�^�J��-?�T1'�H�?�(�Y2�@ SF܍�@�.�h�@���|*@�c ;��@.��e�@�7m�e@	b��Ȥ@�Y�X��@g�O��@D���<�@  I��F�@!�� �� @#G��|L@$��@&�L���"@(kb�g�@*<��쩦@,�2`(@.�p�U@/�|��-�@1 ���85@2Ô��@3�q1�@4*��u@5D�����@6dM�Ք@7���R�d@8��2ŝ@9���[�@;ق^��@<V���q@=���Ɗ7@>܉�;��@@�ܹfX@@��L���@Afd��XQ@Br@��X@B��Z��@Ct�� �@D)(�uW@D߷���@E�����@FS�‖�@G6^��@G���p@H����j�@IV��x��@J��@J�KJ;�@K��r�L@L|`k#��@MK�I��@N�I�h4@N�)�@OÌz?��        ?���DN��?�΃VZ�-?��z��M@?���ŐqI?���K���?�5��B?�_�0z�?�[�����@�
7�@����/�@yX�&@��ۛ��@f���V@<]�y�E@;��c��@c��k@����@!�PB	@#`g�%@�@%?��#/�@'0�ܴ�@)3+Ǆ�Q@+F���@-j�R�PX@/�j��@0�1��@2�2�@3M]>���@4��l��@5�;��!@7&�>l�@8^9��) @9�V)L�R@;`H@<u>(Me@=�؂^�7@?Q�嶛@@doSa�@A#�I�,[@A��@#�k@B�>���@@Cs�x�~�@D?H[`�Y@E��<��@E�]Ŏ�@F�Ռ܄�@G�7���@He|I�Y9@IB��}n�@J"��[�o@KZ�u��@K���@L�7ǩ��@M�@���|@N��웑i@O�b�'��@PG���Z@PB���@Q>�9��@Q��e� @R:�Ⱥ6�@R�����@S;�R���        ?���{���?�+%�	P?�9[D�[?�X!P/�?�pb�jq�?�y:��t?��$v|"6@ �j@��.n�@q���E�@2��e��@(�1���@��繨W@�����@߅p�bv@sK�=p@ ?�A#@"�)�2@#��s��
@%���"�@'�t��*@)�$2��@+��ǡ7}@.0�{�7�@0:�5_��@1e��l(@2�_	H_	@3��Y�@5�ui@6d4[ N�@7��Y�B�@9��P�@:u��Mj�@;��\�@=Q����@>�wF�@@%���ٿ@@��G@A����@B{����4@CJ HR�@D���ۯ@D����/@E�arA�a@F�Tzy�@G�9V�@HfH�0N�@IK�e���@J4/a���@K�K<1@L����^@M E5�(@M��0i�@N���|(@O�6��@Pr�H��-@P���\�@Qt���4@Q��l��@R|�ʭ��@S��"xL@S�1qoY@T#��u        ?� IW .)?ѡ�"?6�?�=gM�?��Tx@x�?�H�� =@(2b�Q@��T�@��d0�*@x6�?�l@���v@@�����L@�r25�@"T6�i$@%z��ٛ@'�+���o@*�I��2@-��ɲ�i@0�k�%�@2Fne�N@4ِ}@5������@7����CC@9��U�a@;��zc��@=�3��+�@?�l�	B�@A5r��@B!{?xrL@CE��<"@Dq>�pK@E�\t��@F�*҉�@H�|��@Iar�3@@J���x�@L JSBh@MY��n@N����@Pi��È@P�ԏ#�$@Q|-&��7@R7i�%�m@R�~��g�@S�bS	4x@Tz	$Z��@U@hu��f@V	ue�U@V�$�Q�E@W�l�щ+@XtB	�@YG��A�j@ZxeM8�@Z�ʵ� n@[Ў*/@\���f�@]�Q0�@^oE��/@_S�)K@`���S@`����@@a21�[@a}�		��@a���A�*        ?���v�#?�|���W�?Г��Hб?�k�g��?�y�i��?�X}�?�|qɚfu?�]vB�a�@ t�k;J@9#��@�D�@@$�-V@P�a0�@���R�4@36�50$@�we�,�@�e+��@{�I6:@ =;� \�@!�mEp�@#g��xw[@%�ba��@&�4��(@(����lj@*_E�u��@,=]^9d@.'�7Jn�@0B��\�@1�M�b@2�O���@3$ӡ���@47���#d@5O�0�b^@6m�^���@7�h��3�@8�Y�]R@9謐�@;T8`n�@<UAW�T@=�dgr��@>ְ����@@����@@�G�뫙@A_�����@B=��@B�k�h�@CjJ���@D_^�A@D҉X��>@E�X0�@FD~P�@G �zc��@G����!#@H��='�G@ID	�a�5@J	���dT@J�F���@K�,�_�@Lg;�7b@M5mҾrU@N�+�4�@N�$Ք�Z@O��F�].        ?��m_O�?±�3L�)?Ӥ�'	k�?���<V�@?���8�?��:A+�?�0HT�%?��/�!@gX�0f�@��*��d@5��!@��`�R@4 �'^B@�Q��t@�����@����@L�����@!X��Y��@#����@$�)˼�@&ثYr@(�����@*�%�$�b@,�nԮJ@@/S���@0��e�ǯ@1�a����@2�]��4�@4#��P�
@5[��K�^@6�>��/�@7�s��@9.q��n@:�g��@;�`7�@==%���@>�Z�pMZ@@�(z�|@@��I��@A�USU@B@�3�F@C@ة��@C�in �}@D��d�5�@E^�O��@F-���9v@F�N�UN�@G��[�/$@H�U'Y�K@I��_2�@Jbi'Q/�@KB2��@L$K�h@M	7'��@@M��&�Gi@N��J��@Oǚ�ރ@P[m���U@P�Q�G�@QNv���%@Q��ZGjy@RFv7"I!@R�I���        ?�K��&��?»(*�\?ӿ�|�4?��O�.�?����4?�6�<
�&?�`k#���?�Z�;�d@�3�1��@ќ�>P@q�4c@���8�@\���5�@.���6@(�s9�@J<�Tݲ@��A���@!r2߃�@#H�ǯ�@%"b�E�@'�͢@)
�;�|@+��;�T@-5����_@/c�څ@0�#��G@1�sz��@3$S��@4Y���@5�:8��@6��/Wu�@8$̑n0@9v�����@:� ��@<.V>?߂@=�6zP��@? �w Ӟ@@9�.R��@@�\�yq@A�cE#@Bx�}�S�@C>���@D����E@D���U�$@E��gg@Ft�?�@GI�S�;@H!�+ˣ>@H�$�Q
@Iٞ�*d*@J��+O�@K��8���@L��[/{@Mkd'	��@NV�"�qQ@OD�ƨs@P���g�@P�?�=M!@Q2:� @Q�s�S	@R��\D�@R��G��@S�����        ?�\�r�z?�Ԝমh?��Q�{X�?��a�Y�?����<7�@W�a �J@:aF)ʸ@�|���@�J@��{@��5˼�@,�<0�V@��+Y[p@"�zb�@%7�ZL�@(��Xٓ@+�M{��@.5?��l@0���3(@2rT��Z@475M��@6+���@7��UllE@9����؃@;���]4@=�p�:��@@�d�+d@A#�6�)V@BA� T1�@Cf��8b�@D�[��(@EĘ�-2�@F�]�R��@H<���ɀ@I�(g0��@J���]@L !e:�>@Mx]z���@N֩�c	@Pz~I?@PҖ��|�@Q���/��@RE�?	
�@Sk��x@S��+�H@T����x@UM�/r�@V�{�@V���h�@W��fե(@X��'ϿN@YV�E�#�@Z-wf��X@[�Y��l@[�n��G@\�Q�@]���V@^���2>�@_k�7t/�@`)�H�B�@`�u3��Q@a!W�o�@a��E@b��G�        ?��̒|L?���k���?ЗP��E�?�lȟmNe?�~Two?� �d�?�p�?��?�GW�Q�W@ aň�8�@�Ӈ��@�S�P�@�$��@%ѹ��@x�8�T�@�'�.�@{���S�@)%��x@����@�_�F�|@!k/7)�+@"�x�K�@$�5�,͎@&51��D@'�ΨK4@)��8M,@+i��X��@-<JHN@/���;@0��+�*(@1z'-��@2x���3@3{�!��@4�5�)o�@5�Z
�\�@6�;�VC@7��W<ܾ@8�۲��X@9�q���@;p*�:D@<@��}~=@=md��u�@>�;ɨʹ@?�>T�?�@@�/li�U@A$��L�u@A�bo�X@Bg�i���@C�̑�-@C� ��[�@D[f�%�@E��|μ@E�؂�Æ@F_�ɴGd@G�/|�@G�\��z�@Htз��b@I*
Ծ�@I�IuB@J��_��p@KT.iI��@LQ�@#�@L�#���@M����p        ?����L�j?��`���K?��8��J)?�/y=��?�=@O?�`U;�G�?�;���Z)?���G3	@�@)D@�hհ�8@
��!���@�0�mS�@V�6<_v@���R*@���|*@����@�b���z@ yd��`@"!����@#ٓ>���@%���J4@'v�m/X�@)[�j@+M�����@-M�<�ȅ@/[��k@0�B��2@1�*��q@2�eDǂ�@4	�m|�K@50V���[@6\ңe��@7�,a39 @8�K�� @:����@;H�r�l@<�nu:@=��m�l)@?3�p'S�@@FM6R�z@@�r�|�@A�-��k�@B[t+�X�@C;��Dm@C�x�w�G@D� @��@EE(@��@F��Q�@F�5�B��@G�+�6@HTb1��T@I�o��@I�nsuF@J�4F�r@K�m�X�@LY��@M-"2y��@N6�LtQ@N�K\��@O�V;{7@PH��GL@P���lt@Q'p�*�T        ?�y��z�?�����?����M�?�W]�`?��u�{�M?�w��B?� ?%E?�4�+�@��c�k@�8���y@Y��wA@8�v�@�Tg{�-@I����@ �xh@���j@;�U�fF@ �� ��@"pp5��0@$2a�l�@&4�2�s@'����@)��f�@+���*��@-ₒ�@/�PP3�@1Ƶ��@@2/C��4@3Qe�?f@4z�nH�@5��@6�yIy�@8Zә@9[���i9@:�4ML��@;��)@=C��(�@>��D�3@?�_���@@��Ï@AdmjN�X@B����@B��-'\�@C�|�]q|@DQ����@Ek¡�i@Eק~��@F�X�ZD|@Ggv!��h@H2�ގ:@I τ`2@I����Q�@J�pNbK�@Kx(�Q3@LO�W`�@M(G]��@N��@t@N�ߍ��@O����'�@PQ1�s<�@P���2�@Q5�����@Q���c�        ?�������?�z�6`��?�d���`C?�#88�?����uA@ �89��@�Z� hP@#��R�@*Do��@0�C�@]w�� �@�4M�h�@!�b��!@$z�'O @'11�X@*�����@- ��̾}@0����@1�)~=��@3O,w�!@5ZX]x�@6�SZ͐-@8��<2�;@:}E�S4@<i���X@>bi��^�@@3�(|�@A<8:)ȗ@BJ�l�
�@C^����@DxuSi|Z@E�����@F����k�@G���@I�Pq(#@JJ`0�@K��U�
@L�Sxk��@N�����@OM��H�@PMB�;�@P��X�@Q��^��@RN?@R��ɿ@S�a.��
@Tc2�1~@U#בO�@U�/+KF�@V�M7E�@WGxD�@X�����@X�ߛi�S@Y����2@ZL7��q[@[N�0Z@[�Q pCI@\�9\d�>@]p&�~@^=�-�7@_ �0ޕ@_�lb���@`X��F��        ?�1�ۙ�~?�J^��3#?���ۤ>I?�M�	�<?���%'�?�e��LE?��O;?�X����?���'��@Lߜ��@K�*(@%�'�@�66>O@�L=�@���[�@����@����X@��K1�%@�3	%R@!S�933�@"�L�##�@$������@&F7pG��@(�֙B�@)�I�l?`@+�S��K�@-�ş,�@/�o�B_%@0Б���5@1��ӹ@2逊*��@3�n��d@5��	�M@6=���p�@7f9�u�@8��+܇�@9��y��@;2����@<CGf���@=�#���@>Ը=���@@���l�@@�l�~��@Al�fŘ�@B� #�N@B�U^��@C��ŭ�.@D@�	���@D��f�ma@E��E.�@F{���}@G?�� Դ@H�G���@H�a��"0@I��9�o@JgZ�`�@K7�흼�@L
MPm�@L�u��~�@M�Qiz@N��&��@OmqT�f�@P&�	��        ?�:KΫ(?�h���?�W.=]��?��[4V'/?�6%�/�?��k�d.?�ͣ��8?���ޙ@D����@@�0�;@â�'�@O)�^ @�_m�+@�!8�@���޿m@�ޓe�@�l��@!�&A[�@"�Y�@$��m�Y@&FB�΀@(n���@*n���א@,~ñ �@.���'��@0e#���K@1�GΘ[�@2��SM�!@3���޲@5;��u@6BB8@7���8C1@8���&p@:��@�@;k����@<Œ�h��@>%�q��@?�Ç�b�@@{�;��@A4�@��@A�L�'@B�9�{�@Cp���{@D4��F�@D��5}�@EŨ��W�@F��U�@Ga'8g&w@H2�Vq?,@I-H9|@I�=��p@J�yR�K@K�g�t�+@Lq�(k��@MR�s�@N5�p��@O�*�ϣ@P�V��*@Pw-2@P�v����@Qd�8�D@Qݬ�}�@RW{�ǧ�        ?�R��&�?�ш��R?��.�Y4s?���1�l?��+��$?�U���?���q?��t>�{?@��k�@GTl�@��h*��@܊�\Z@����@g�����@l���6@�z��@@�B�3E@!��J��;@#�iד�@%eM���@'X�;��@)]��c�I@+s��@-�yiO0�@/ј�&�@1on/�@28���<@3km����@4����)"@5�F���@73����@8�$���V@9��@;>2�_:�@<�eW���@>�mbK�@?��~��V@@�.A�i@ACe����@B���)�@BϤp���@C���p�@Dh�����@E9�D=��@F<Hc;@F嘿!@G���+@H�U)5��@I}�v��@J`��FF�@KG�T��@L0��/r@M�%9o�@N
�� ��@N��I�	@O��/��@Ps|�[O�@P�F���@Qnf>��@Q�ٞ���@Rn�ܣ��@R�{�@St`��        ?�G��<r�?��s�U��?�Ś+�?�y(��,�?�<�����@ l�b["A@=��{�@[����@�9���@�c"��O@�k���_@lq^�s@!�b5O		@$Bq���O@'<b�W@)����w@,���h��@0٘K�@1���Rk@3t�Ȋ�O@5?�I��@7��{�@9�|�@;i9Ć@=� t�@?%��@@����o@Aç!���@B���ƨ@D�V�d@EC�ޕ�@F|�f@@G��W�3@I�2��@JQ�u�{@K�X����@Mȫ��@Nc实l3@O̞`Ծ@P���iw@QX��)�@R޻B�H@R�b�j-@S�x��߀@Tc�w��@U.|w��@U�>���@V̬6��(@W�CƔ/�@XvҴ"q @YPSgU�(@Z,����@[O��@[�C鉟�@\�O+a��@]�.zd�@^�ۮr�@@_�P7JO@`A��ng[@`�;O�ʭ@a6ԅ��@a�;=���@b/�M�c        ?�����a�?�L��m`M?�$O��e�?�^)o�^�?�_5nԲ|?������?�"�_��k?�/��L=:@ ���.��@�d,���@�n =��@���L��@Ü�"�@1w��PO@�f%B@qU˞�@A �8,@/;�:�p@ �~�!sh@"1�����@#��I3�@%��G��`@'@�]�I0@)
��"4.@*���@,����_8@.�a:6�0@0WߗcAS@1[m*�Q�@2d���t@3s�aL�@4�V͑�@5�l�!��@6���ȕ@7�lF@9�P�@:@ ^��@;t��hk@<��K�%@=�D����@?/��A!�@@;�h5��@@�0��h�@A��V�L@B6��@B�_�B|F@C�����@DDμ�T@D�ԛ&�@E��}�@Fg\+���@G!�7�C@G�b�,y@H�ݖ��@I]�r��"@J ��J�@J�VT�cH@K�-��@LuD�}5@M?�,�0@N�|X�@Nۍ�	$@O�Xb�|        ?�8�{�?�9� �H$?�3o��?�Ld��k9?�ZF��?����?��]k$��@ �L$4Q@��z��|@^*�d;@n:c�@/zٵ@��67�@�ש��J@�o�vP@�<n+@ :;~F'n@" t3@#��g@%Ɯ2��@'Ž��)@)�m0� @+�M�
��@./���@0:��J�N@1f�c@2�֛m�@3���$�@5����|@6fU��@7��d%x_@9�ʗ�@:x�$dF@;㻜O�@=V:�@>��W��@@(x�&�8@@���@A�i�a(+@B��B�c@CN�=:r�@D �y�@D��{�2n@E��`�^@F�nf¹@G�WIJ��@Ho� ��@IV�Y/�@J?�6�4�@K,��QL�@L+,��u@M��.=B@N5�a�y@O ���R@O�Ȣ�l@P~٩L��@Q U���@Q�U�c@R��P@R�ԑP��@SO�'�@S�Ct$]�@T(��t`�        ?�ep�}?�Nj�t\?�W��9��?�n����Q?���?�u�.?�Ǉ�x@ f#&��@jV��@y�����@6f��A#@&�.^@�+��*�@��P��@�θ��&@����)T@ )υ=M@!�ǽ�@#�qh�@%���@'�#�R@)�$�b�@+��Jz��@-Ш�r˗@0A�dB�@1&�ĥ�@2Pp���@3�j�x�@4�рQ�@5���_�@7Do�:��@8�q۴!c@9�vH��@;Ff�v�4@<�.�I@>��X��@?���(vL@@~����u@A>�(�@B u���w@B�?n��@C��f��@DZ�L�*P@E)��#�@E��}��@F�% �G�@G�`��`@H���Ɋ@Ib���\\@JD/��@K(0n��@L;�5`@L�(�vtM@M��o_�@NՄ��s@O���*�@P^~���@P�e)f�@QW�'�6@Q�0�<~U@RVX��h@R�0E`g@SY���ձ        ?��e����?�G�;5$?�:q<�W�?�yn!�?��Ԕ�]@���?.�@��(�@��Q��x@
��AB@/�K�!@��%��@ A�ٱD0@"Ռ!�Z�@%��9Dc�@(r0^�@+xP��N@.����:�@0�����@2��*��%@4t�أ�@6Kpe`B�@81���@:&�Ɓ��@<*��8�@><�D��@@.�\�@AE����@Bc|�5p�@C��C@D���H�@E�!���@Gd<ih@HZn�6�@I��4?� @J��BGJ�@L8�&�
@M��z-�@Nꧻ/�@P&
���I@Pٍ���8@Q��wc�@RH��?�@S�Oa��@S����4@T�����@UGm!o��@V�����@V�5:E_@W�Y4-��@Xn�e� @Y>��s�@Zi�5q�@Z�<U���@[�l�M@\����q@]r����9@^QZF@_1��L��@`
%]��@`|��E{@`�S��W@ae�ZM@a�"@+y        ?��{?�?�$y�?�X5ٯ�?��Y~Q?�Y����,?�(x��?�1��}�?���s �@ 8�]���@ĉy��@�X�W\@�pS*@���8�@rc��U@�Bt��@���,�@F�'!q@"6�I�@ �*F�V@!���bs�@#2��('�@$�+�H9�@&�{R+��@(R=�
<�@*"4`#�@+�#���u@-�ֹ�V5@/�藮�@0�ࢼs�@1�Nɉ�@3�e�9<@41�>\V@52�AOvP@6Q���
@7v�<,��@8�z,G��@9���ܞ@;{���@<C���@=�����@>�暩l@@�3e@@����#�@A`�&p�@B�^�(�@B��j/f@Cs����@D)7�qf@D��Zy�@E�O��@FZܧ55{@G$2�"@G���Zn�@H�`z�@Ijò�Lu@J4޸���@Kcg�b�@K�M1춾@L��+�r�@Mu<�Q��@NK9`��@O#����3@O�-P�        ?�E�nC!*?�6���jf?�+��할?�D*~�?�Kiӑ��?���0[!?��!'�Ԣ?��m�ue�@�L�xl@H�r9�b@Ս�i�@�"�s�@�7�uG@�7�@��a�0@�E�!S�@ "�q���@!䎺�$k@#�?�m�)@%�V���F@'�j�4�@)����@+��=�-@-��f|9@0NOH�@1;����@2j�΍��@3�^7�+@4��~X@6%���F@7s7�R&�@8�K��S@:$#3;7�@;�[�zbj@<�h�d@>b�R�l<@?�ʘo��@@��I֦�@Ao{�Ǥ�@B5z �vL@B������@C�"����@D������@Emg?�0@FC*˱>�@G�Xc%�@G��"Qs�@Hւ,�Gx@I�0,���@J��x9��@K�0����@Lnr�8��@M[-SL�@NKN'�@O=�Bv@P�Ѳ�9@P�zݙ.@Q��W1�@Q�E��W@R�*F@R�,\^�@S�:�G@S��.�u        ?���|�R�?��6���?�4Ywh�?�-��q�?�0���sI?��))��?���v�O?����~�@��]:k@?Q�¨�@��H�z�@�T��@�C�,@�M&e@���#�@�Z#ϔ�@ %���L@!���g @#�P`"#@%���<^l@'���z�?@)�N��|@+ѬhF��@.Tqi�/@0!���$@1K'��q>@2|�+�i`@3����d@4�U�e�@6@��D4@7�`^�@8���{^@:I����@;��'P1�@=2��̍@>��#�Z(@@����>@@�iU��_@A���rW�@BX8� ��@C$0;g�@C�y����@D��xɮ@E�ܑ�?O@Ft�y� @GQ߲�a@H0V&��@I��YM@I��>7�@J�d�B/�@Kˮ���@L��V�c@M����j@N��'��!@O�ƫi�@PG��S��@P�����@QE���W|@QƇg~�@RH��uw@R̓��A@SQ��Y��@S��V.�s        ?���#�5?јkE^��?�SI�'7?��Ni��?�3�ne�@p(���@�> @��@y[�z�@fD�u0y@lDͣ�@�-@7@Z�0�@"C q��@$���~|@'��@S_�@*�=Ж\q@-����:@0�]��n@27GWe@3��(�9y@5Ȅ�r�@7���D;@9�-�ͧ�@;�w�61�@=����@?Æ�=�@@�c|Q��@BO���@C7���
8@Dbb����@E��N;#�@F����@H
�f�^@IP7Y@�@J���w$�@K�8\��9@MF�d�9�@N�� �@P��~@P�^"���@Qt*����@R/�H�Qg@R���.�=@S���c�@TuTZ���@U<� _�@V{5E*}@V�٠�t�@W�z�՗@Xx
�z��@YM�dp9s@Z&Z�&FT@[��[@[ߞ����@\�N0�}�@]���#��@^���m`�@_rO;t�.@`.Ǔru-@`���˂�@a�vq8�@a�cA�0"@b$�\�        ?�AF`[l?�f6�25�?���l?�a���?�ڛ+7Zn?�n�V.	�?����?�O��ŏ�?��g0�@3��
l@�j��@
�a7��@s�� �@��Zf��@(��i�"@��t1x,@6����@���i�@�'�l�j@ �wS~_@"H�����@#�B0*<@%i3�-�@'
�+��q@(��h�X�@*o���qF@,2
y/@-��K�u@/��4�H�@0�#� �@1�Q�4ϸ@2·� ss@3ΫCsy_@4Ӫ���@5�tp�u�@6����m�@7�%RYާ@9���@:3GRg�@;T�.�-@<yi�K^@=�򾎭@>�W��{@@����@@��x�3@A:;܃��@A٘D�Z�@Bz���@CL�s�@CÑo�@Dj�KZ@Eʙr~�@E��qsW@FkiهY	@G��T�@G�B����@H|X��
@I0.�S@I����LZ@J�b%:�@KVuH9@L�&2�@L� �
��        ?�w���?�i	r�?�s	�C��?�B���?�Xܟ-��?��̗�Q?���xqf@?��O��ն@3��^5B@b-�5j@�.Uٍ@g'?�@���B�@�v�+BC@�
���@�R��5b@ =�uH�@!.��l�@"�����@$��h,@&����@(����r�@*�-�ᕣ@,���48+@.Ք6���@0��T�K�@1��0���@2ίf��.@3����)@568*u�D@6t��L8@7�EP@9�_4|�@:Z
[_��@;��q��@=�m6�@>{�M�xI@?�x�1�Y@@��=@Ak�JwD�@B+����@B�����@C�E���@D~c��5@EJkN�@FRGjyc@F�=4��@G��m�;�@H�����t@Iqט�C@JM�Vv@K-�yc)@L�a6s@L��7ko�@M܏���W@N��� }�@O��)��O@PQ�X�P@Pʬ`OIT@QD�ƍ�@Q����\@R=`�ߜ@R�o�a+u        ?��:�Z�T?��=���?�����?�^�/c��?��j�)�?�͔|�?����>�?�J�ݛ�@㔘P��@��5e6@r�:��@.�Ұ@�"�{�@ąt�@=�,�u&@?����@duq��@ �x�}aG@"��?��@$Q�Am�D@&(W�-�@(���8@*���E@,	��z�@.8�'�@0 �
T�@199��;�@2X�B�^@3�D��@4�ܒ��@5�F��O=@7���@8]i��|`@9�"���"@:�&�׵@<G[}W�@=����@?W@@4&�A@@�=1��@A�;��@B_(%,�@C���@C�Smi}�@D��b��@Ej�����@F4Z ��@G �p��@G���N��@H�^`^/@Iu���?@JLF�}�f@K%��� @L8��ػ@L�doQ�'@M����@N�����y@O�a�
�@P8��z�@P�W�|M@Q#N?$;�@Q��z�a?@R20�        ?�`2�#6$?��>�\��?����)��?�&)�1�?�D��@ l2��v�@��d�=@@��
�6@�|�G�@o�1,�@���*<�@5;9ˑ@!`W��6@#�}R@&����L@)Haf���@,+��+G@/-'*ND@1&O�s@2�ړ��	@4o���%2@6(�C)��@7�*��M@9�&�@;�~W��=@=���~@?�U1�C�@@��dia�@A���ȣ@B��}��@C�F��؂@E_N���@F&�3T<�@GK�۸�@Hte���@I��BΡ@J��\3�@L�;{.@MN	56@N�%��Y6@O�7��`s@P�e�"�@Q;���qE@Q�C�uh@R��K��@SD����t@S����@T�d-}&H@Ua����@V�)�[~@VՍ�Ɔ@W�z�U�@XQu�2IE@YxU6%@Y�|���@Z�|����@[atq+x�@\*_j/@�@\�8�842@]�� A�@^�����@_a2�r�@`���        ?��-��?��gļ�y?�{Aʠ�?��n��?�Ԍ&g�*?�_W�?���<_n?�Ǖ�{�d@Vy�F@@��R�g@	<6�`.@���!�@1z����@��O^��@ZElA�@#�[��@��c @t?<��@!$B: v@"����+�@$N� �@&C��_��@(���^y@)�)���@+��B��@-�N6F�@/���U�&@1��^�@2��-�r@31J>%8@4P�^@5w/��<�@6��dL�@7�p%R5o@9BGl�@:N�X�-@;�ܮ��@<�|���@>-��A++@?���Ò�@@o��'�`@A c,xU@Aӫ��*S@B���(�"@CB,�/`}@C�N�;�z@D��pY�A@E{3�^@F=���@G��te@G�z��@H���b�1@I_�'�y @J.1?N�@J��HI��@KѦt�3@L��E��@M~=`��@NW���ѧ@O3C枃@P�c���@Px���z]@P�{G��        ?�N$��?�Gpw�-�?�?�@ũX?�UT��&H?�e �f��?�Er���?���H��@ ��f  @�1�髅@X��=�N@��Yi@!��C@�BN� �@�3���@��tj�@�(6�ն@ #_1�5Y@!㤵!�@#�eu'L]@%�*�Q�@'��W�ہ@)�Љ�@+�lN%X@-�9�رe@0	���e@1-��@2Z
/��@3����p@4��>�@6i�l��@7U���C@8��f�@9��g�6s@;\9�w�@<��s"�Q@>-�ݢ�@?�%� \%@@��@$:A@AL)�6��@B��d[@Bԓp�@C�A�`6@Dh��>��@E7Lx;�@F�e��@Fܜ�@G�c����@H��V	˙@Ih�ՍV�@JG�y@��@K)"��9@L�r=|�@L�<&��7@M���a@N�Tz`��@O�#}{@PR���.@P˽a�-@QF]�@Q��M�+�@R>?�;$@R��U�I@S:Վ�4�        ?����Wd�?����^�?����&?��y�(�?��3؅?�f���M?���af?������@��BWv@kԦp@��Q��@��;ݱ@�U�L7�@e�'�@f�G<r>@�a~��@�j�I�@!�mf�;�@#u�\���@%T$�(@'Cˑ|ɖ@)Ds�E]�@+U����@-w[e��@/�����%@0�$�K63@2�ڗ�@3Mr��6�@4��㖂�@5Âv�+h@7	`�-�'@8VM6jj�@9�)ڳ-�@;�ˡ5@<fC�+�@=�N5�@�@?<�=��6@@X���|I@A��i�@A׋Y��0@B��[>W@Cb���:�@D,�XPݥ@D����@E�ʳ��"@F���ǧ�@Gr�oW��@HK��u@I'4��i�@J�����@J�3���@K�#��t�@L���@M����R�@N���K �@OwL�O@P4\gϥ]@P��j ��@Q*D��@Q����$�@R$�<CS6@R�e�?��@S%���        ?��~R�?�h�'bX�?�a �Y?𜀡H
?�S���@�~��@���@�E/�oF@?�m��@u|{]�@
=s��@ y'Y�z�@#� H@%�$��'�@(֣��m�@+���MI@//i�^D%@1I��,�@3�7���@4�B�lƂ@6���3w@8�D�d��@:�\���@<�����8@?��S;�@@��	T�@A�����@B�Ήdr�@D����@EYC�y0�@F��B��P@G�b��lo@I/�����@J�[ȯk�@K�BS}�@MDcy�j@N��Ey@P�`�:@P��q]@Q�K�6�@RI��⡅@S��Y@SՀ�@T��-3��@Um._��@V=#��
�@W��;�@W�Mƀ�@X��H���@Y���s�V@ZvPq� �@[Vl�{`@\9���@]D'e[@^��)h
@^�R�J@_ܲ��@`eܨێ@`ޔe��@aX}��y*@aӔ�ٻ@bO�7�s]@b�A@�<;        ?�5æT4�?�૦:SP?�ŝ�A�D?�wۚ�lN?�9�:Qe3?�h?���?��)�O�?�L8m��@� ��@�����*@	�/��@L\�|-�@���) �@(砝��@�[47@�aԟ�@�ϻ@+@�|���@!�L�%��@#S3\ӟ7@%�cW4@&�/9�z6@(֥�j�@*̳L�^�@,��}�O@.����3@0�����@1��4	m@2� �R�@3�8k���@5k���@6H�Pd�@@7�]�W��@8����ܵ@:��Y@;_�;k�#@<��>@>o΢��@?uB�ұ�@@o)���+@A&��|>@A�t�-��@B�(�~�@C_�]y@D#��Lَ@D�,���Y@E�� 
��@F�/�"�'@GO�vM"�@H!�&l�]@H��kJ��@IΦ]:�@J�U/�MY@K�͋?L@Lg
qh�@MJ����@N/�,�u{@O(�=%"@P��;a6@Px����@P��r@QjL�]C@Q�((d��        ?����-�?����cR*?�ؠ�f��?��%���?�.��l�?�.�:a[?���13��@ �;��@�!�Ӛ�@	�c�H'@�3M��@��R�d@c&3�@[��B�@~�V��@˶pj��@ ���g(@"n�ݗ�@$PU���@&D|�pu�@(Jܓ�P�@*cp��O@,��̜�@.�'���@0�.kn@1��
��6@2���.�@4*@��$@5o��_\ @6�K�B�f@8t�J�t@9k��Y@�@:�\8'��@<7�	��;@=�6	"g�@?RJWɰ@@N�߿�@A��"�U@A��4>@B�����
@Cj`�Y�@D99(b�@E$�+>�@E��9@F�[��a@G��)<@Hp��<�n@IQ��^'�@J5<�\@K~�8�8@L�u	\�@L��
'�@M�=�q�@NИ�l5@OĠ�[��@P]���@P�O�·�@QXE�R��@Qׅ���@RX��@R���j�@S\���y@S�5���
        ?�W��o{.?Û�2<v�?ԫk$���?᷃ܟ��?���Q�=?��{`��?����_�@ f�
�;d@vN�R�i@�	�Rnj@��c�(@z`�;��@Ac�%մ@4jyNM@P���b@�hOGE�@ ��Y���@"K�DY]G@$(?؍^E@&SH0+@(�h�@*)�-J�@,M�u��@.��9�^�@0b�^x�k@1����yU@2��vl7p@3�D����@59w���@6�h�m^@7�텪	�@9(���^b@:��Ҷ��@;�P��V@=WK,�Rv@>�r��k�@@!g��@@��//��@A�4���*@Bh�8��@C1���,@C�}M~d/@D�4�F��@E��J��@FrR#?@GI���@H#�@t�U@I ���O�@I�-/�B�@J�n��@K�S���@L�ӕw�@Mx�!�@Ne{��@OT��Ͽ@P#*@P�^Q�@Q8�8�@Q���K�@R+��<v@R��f!-�@SʯɃ�@S��[���        ?�k����?Һ���?㺸�*�?��f�	��?��\��)@<�v�a�@p?B�BG@z F}@M@��y`?�@���@�?�*�@ �����@#�Ht��@&qa�u�@){�)�@,��ّ@0�\X	�@1��P�@3���F�@5�� ac@7|/Sc�@9����%�@;�i�K4@=ҍ:xE[@@�S<�@A0��Ч@B`��B��@C�כ�p�@D�ۻ�@F ��x��@Gp%���b@H�/%��l@J%�|j�@K�{!��@L��۟�@Nl��)5@O��$L��@P�0�]@Qy��sU@RA����@S��>�@S���oAD@T�՗EA�@U�&`��@V[�,:H�@W7�wT��@X{��:�@X����f�@Y��^	�@Z�\$�@[��Lx�@\�}R i@]�%J��@^�Ճ�>�@_~�}0i�@`<�M��^@`�p��@a;���-�@a��,�L@b@��;�@b�`x�w@cKz�T�0@c���D<        ?��ƽq��?�W�� ?�Y���w~?�
���j?�[�wO(�?�,9=z�t?�4A��i?�/�F@@ <�``0�@�xj�I@��1j@σ�K�H@ �'���@}L����@�4g�K@�rcd@]$_V@=F�[B�@ �lk`@!����Z@#I���@$�M�{�v@&��߿�>@(v[(r�@*K\w��@,-����@..�Չ@0�꘹@1a0:P�@2?���@3-R=�?@4D����@5a�����@6��f1�E@7�
���,@8��X�_@:�ұ_u@;K�t؜@<��Ő��@=�m �@?n��~U@@6o3��.@@�V�+\@A��V��{@B?�.5$@B��y�@C�2/�%C@D_�\P@E{SN�@E�_�;��@F����|@GW�	p�@H�C�L	@H�W�L��@I�PN2@Jv�)��@KDF�'@L9��N�@L�v�&��@M��ٙ+@N����E@Oj�H�<�@P"�K` �        ?���]�*'?�$����?�g�O��?�OFtdc�?��%�X�?�`�:B�?�v����T?�/�	%�@���O@��c�)s@d����@Ca�:Y@��w?��@`/�`��@?����@E'���r@o�A�@ �?q�M@"�<n�9�@$bn~��N@&=s1��@((�h�D�@*$���p@,0���=@.J����r@0:�2E#@1W9	�1M@2{0��)@3�a"2�p@4ج�SZ	@6�:ѧ�@7R$L�_�@8�����@9����c�@;;����@<�����@=�J+\@?_��X@@f����@A �N�ښ@A����Fm@B�O�
�@CaS���@D'�����@D�F!	@E��3��p@F�h?0j�@G]	�$#@H1r5힊@I��J�s@I�t��I�@J��GP�*@K�*9y�y@L���Oj@MdRl�3�@NK=K��E@O4�L�q�@PK_��@P�z�y�@P��'oVB@QytJj�@Q�8��@Rp) Y��        ?�!�R�=�?�:D���9?�R/�V?�He~��??��CuLP�?�CWs!T?�`_�?�@ �b��x@3�g&;@	��a�@��"�@+�k�q+@��H��@/.NIm�@v��{�-@�M(T0@!F@��`@#,C�z�"@%'k7��@'7Nܽ��@)[��sO�@+��O�@-ߺ��Du@0{�^�1@1X����>@2�>�@3枾��@5;>m;�D@6��6 o@7��@9m�| �A@:�G��@<e�.@=�+B׸�@?}v�$�@@���:��@A["���b@B/N���@CgS ��@C�`ں�@D�24I�W@E�Ҩ�5�@F�9�_0�@Gy^� |@Hh9'��?@IZ��NU�@JP���@KJ�y�{@LH�@MH�2���@NM:4�re@OU
����@P0#T6S@P�q�}j;@Q@l�7U@Q�)'��@RWX�6�@R�B�

@St�+ˎ@T�{��@T��zR�m@U,�LĤ@U²i�"�        ?�*y��U?љ�O6��?��;CBG?�0��y?�7�r�0:@4/�#\@�8���@�	ӉHa@q�gA�@}O3�vB@���x@�����@"XH�>�@%	bMg}�@'��RrJ@*�Ip��@.���~4@0�Z��=Q@2\s�Z@4#�[,G@5������@7�Y?�?@9���_@@;�_�sk�@=�v�9n�@@�,�;�@A-EA�@BP��@Cz(����@D���]�@E�f�a�@G#�:�C�@HjB�Z�@I��z���@K�J�V�@Lf��>E�@M�o�q�d@O0���.@PO���&@Q
�ai	@Q��,��y@R���@�@SL�7^�@T��\+@Tݏr�T�@U��9�0@Vz���s@WM�4$m@X#t�I�@X�9�$�y@Y��Dsr@Z�R��@�@[��	�K@\{��9��@]b{	�%�@^L�-�@_8IlJF@`��hv�@`�iu�+7@a��W�@a���qH�@a��7���@b|���3�        ?��h��|�?�ZF�Cn?Ёۀ��j?�NT��@�?�ߏ+�V?���Tt�?�m�&�?�O--k=@ n�T�@	�[�-i@�j��Pd@/e/��0@Z�zۑ@�zmm@MA�	R&@�K�+k@�v*�z�@��;o5�@ e� 5$�@!�vK>o�@#�����=@%[�X��@' ;]��i@(���p@*���I�@,�$[o�@.�2�H2�@0g�N�5.@1t��)%�@2���]��@3�����l@4�9���@5�k�Bb@7�q���@8I0��@9�u�~�X@:��w�@<��0L�@=S)iج�@>��:.Q@?���x�i@@��y�w@A]�ʪ~�@B2*�/@B�>��J�@C���i�@D?��)=@D��4>��@E���L��@F����/4@GL�!a�@H�n�F@H�T���@I�vH!�>@J�)6�;@KXhe�%@L//7�f@Mx`[A@M�=JY�@N�xԗ,�@O�$��5.@PC�b@P���N�        ?��+��D�?m� �?���?�� ��`?�hĥ�4�?��p�%?��:0�4�?�����-�@=��
�@m�໳@��y���@m�_�E�@	.�A�@�gB�� @���=�u@ʾ�RY7@�&�Z@!.3w��@"�4}���@$�`\�C�@&�T�p�@(��	O�(@*�&���@,�c
��@.��@0y���_<@1�7�>@2�۲<�*@3���@5#;��)I@6_���n�@7�ˬ���@8����v5@:=��#�!@;�4�kc�@<�H�e
M@>W߂.>!@?��C�̲@@� a�#@AU��/@B��~ʜ@B����@C��P�%@Dc�{0	@E.��b��@E��-7��@F����;�@G�Ό~KL@Hx��!�0@IR)�/p�@J.�̿�@K����@K��oϿ�@Lԏ���@M��H�@N�0�X�i@O���i@PAAKq'�@P�O"y@Q4�Li�@Q�L��m�@R-5�A�@R�^�y��        ?�%�A�>�?x��/I?ӕ��ӏ?��6����?�gg��.?��k��?�*��C�?��AB��@d&�"B@�>��!=@2���)�@�daY�@2\��D@�ē�^@�D((�e@���x/@K���@!XB��@#���@$�?Q��:@&���d�@(�NC{�@*��eӜl@,�z���@/���Zs@0����]@1�g���
@2�$� �@4%	tA\@5]��E�m@6�:��G�@7��*@919���@:���=.@;߃&d*@=@�T�|P@>����7@@
��@@����v�@A�懷�5@BB +|Z	@C��Þ@C�,����@D�-����@E`��$�@F.��L��@G _f�@G���d@H�.h���@I�,�@Jb�Uh�@KBJ���B@L$Y�[F�@M	N�}@M�L�l�H@N��L�@O�w�Xܿ@PZ�?��@P�I�_�@QM#~NX�@Q�/����@RDjǾ��@R��*|�P        ?���(��?�fLt'??�T=�V��?�qݤ" �?����4C\@ ��}�/�@�y~O@HjRH3@L( �(�@Q�7��K@�2W/@j8�b�1@";���s�@$�,B&�@'³o\2�@*�
�b�@-�+����@0��� b@2M��@J�@4��:D@5��˴��@7�3Hw%@9�<,�@;�m�(D@=�?%�^�@@�x~S@A/μ&��@BT��q�@C���К@D����@E�/x;V�@G2�mGF�@H|.�:�w@I��ƱN�@K$bRNw�@L��8���@M�#�G��@OT)�:�X@Pcm��-�@Q �7�$@Q��ɶtY@R�&ϵ��@Si���f�@T3 Lv@T����s�@Uϊ Ehc@V�kj^@WxY���@XQL��S�@Y->���9@Z(3M�@Z�����@[��5��-@\�u�$YY@]� �p�"@^�e���@_��

��@`:�%��I@`���pb�@a2ǥ�@a���\��@b.�ָ��@b��&n�        ?��ٓ��?�B$���R?�v1��?�9		O��?�n��Y�?�`�����?�U'?@�?�(1��+@ QhA���@���'2L@�c����@ݓz�y*@$H��a�@{�N4�|@�<����@�_�lM�@C;��xU@� ?�@ �ӗB�@!�̆�P@# �mʥ�@$��
���@&r+PR<X@(.i3�@)�=ڸޤ@+�f[��@-��
�@/��$D�@0ɰ�~@1˹��cl@2�]���@3�����L@4��>�4@6-7�2@7(H��j@8J���*F@9rG5��G@:��;��<@;ЕYm�b@=;!W(g@>B��,�9@?�X���a@@da�-�@A	���]�@A����@B[*��@CS�ɨ�@C��a�R@Df���®@EOu8�	@E�螮�@F���3��@GA�"p7@G�>@WZD@H�̟f��@I}��%@J@tM_e@K�|��&@Ḵ���@L���	�@MaY}b8@N.�Ȳ��@N�=hƂc        ?�Ӎ�v�N?��l?�Pu?��q$~�?���4��B?��=@�?�:ʹv�?�c�pk?�[KF�	$@���p�@�mfo�@i2��>@���F}@SQ�;@ ��7Y@=s�Q}@1�~�А@r�w�a�@!k�v��@#/����@%;�:}@&���/�@(��%�@*��C�&�@,�H�% �@/ ��o[@0�*V1��@1�)�Ŷ@2�G���@4"c��s�@5X[j�@6�VX7@7�hӟ-"@9"G�tF�@:r�i-K@;�8�It,@=&��v�@>�+
@�9@?�T`7��@@��?cs@AkS��S?@B(ԕ�S�@B�;.gT�@C���6�@Dr��t�@E;�&��@F9�nM�@Fծ;<)�@G��鈓[@Hz����@IQ=��o@J*d���@K&���@K�}��@L�_�QG@M�ư�L�@N���&ܼ@Ow�)�@P0�$\�@P�{cY1@QAd�;#@Q�4 "!@RP0l�e@R��@ �        ?��:�6�?�x�=ef�?�t��HX?�9��z?�g��G�#?������]?��T[r��?��{.M��@@�:�?@q�eʼ�@��ѻ�H@q^t/ @�Gp΂@ӈ���@�e3@�D��G@��ׂ@!6�{�"*@"�Ҹ�h@$�R���@&����@(��6Sf@*�F��@,�(��V@.ݥ�]M7@0�*y �@1���],�@2з�T�{@3��?4>�@55�k�\�@6r�SS��@7���o�@9 $���@:P�y8^�@;��.���@=�P��@>h�~6�;@?�#�o�^@@��p��@A[�Nch,@B3�V�?@Bٯ���@C�� ,`y@Dc
���@E+ӸtI�@E�L��Z�@F�l����@G�*�t��@Hi~�Q>�@I?b�S�@J��.O@J���Jm@K�$pO��@L��GV��@M�?i��H@Nv�P��:@O]�^Q�@P#�o��(@P�j�� @Q[��̾@Q�j�Δ @R���^@R{�I�j<        ?��t��?�_���A?�K�} �!?�_K��W�?�顸��o@ �I���@�ȃ��x@��:~}@%ˀ��{@�c�y@b�\t�@�]꺭E@!�A#�A�@$�2�:�@'N���>�@*1pTu!�@-6dv4��@0.C����@1�x����@3�d���@5F�@��@7Ԝ���@8��r�hY@:�힇@<��U��@>�X�$@@�2M�@A�H%�Sg@B��2@Ey@Cʭ0|��@D�Þ���@F�ؕ�@GL9Sm^�@H�lͽB�@I�~)�k�@KX�5�@LK���V�@M� �i"�@N��V��@P#����@P�2�Db@Q�:���@R:���@R�QηG@S��Q�5@Th�T`�@U(<��!�@U�T*�A@V��4��W@Wv8(/�V@X?�S���@Y=�9�@Y���3�@Z�7��X@[����@\U�r�@].t��@^	Qh`�l@^�O:@_�W���@`S�&Yv�@`����@a96"%��        ?�����~�?�n��%�?�I;_)$A?ݜ�B�&p?��f1?��f�Ü�?�L{���O?�cU��@��V@ɭ�y��@���|�@ K��@�V,�&�@M�[�4�@�b\Y#�@��=�"4@c#��RR@Rܒ�O�@ ���M��@"D��t @#�&�"@%� ёQ�@'T9����@)"���#@*����|�@,�G����@.����#�@0`<�4@1c@��@2k�WG6@3z.���@4��NXen@5�-�a�@6�v1ݨ�@7�+,�@9����@:?��G"@;r�����@<���Zn@=�p����@?)�qPI@@7�V��u@@�i�i ,@A�b��@B/�*��@B�JPd�P@C�)9+��@D<DQ�Ǡ@D��X�@E��7�]@F\�!R;@G�C<�S@G�ls�k�@H�t�Z�@IP���L�@J�+6�V@J�!(�?r@K��w�xu@Le�:8�h@M0t5b-U@M��1A�
@N˕P��<@O�4���        ?�-���s�?� ��О�?�l`��?�,�cB�b?�$|���f?�p��o�?���ѕ�?��f߬:y@Ñ����@3s�^@��kx��@ێ�W3�@�gp�0@]0}@[;���@��i��@̤��n�@!��rY�{@#i�.3�:@%FAp�@'48]��@)39�_�@+B�@�?@-cX�E�@/�("�@0�QHIm@2?l饉@3@�͎*�@4w]��^�@5��\v�#@6����U@8G�����@9�3[
�@:��`��@<W&Y�2�@=�e1�` @?.YS@@Q��H@Ay�@A�S�J�l@B�ѽ��]@C]vg��@D(6���@D��Ǔ@E��]7@F���+@Gqma��q@HK��S@I'���C@J�o�F-@J�	'g@K�����@L���m@M��OYx@N��#P�{@O|r��n@P7K'l(�@P�����@Q->�5�@Q�?�+@R(,i���@R�v��^@S'�*�3K        ?���K��?�N1���?�D�;0K?���'y��?�!��"?�Jo?��_⸙�?�z�!�l�@ "���@L<.��@�9��MI@2@E��C@�^�A�@y|6puI@Wbf<�T@Z���D@��$i @ �J�\4@"��tC�U@$d���@&;��[�@(#�AnK@*�|�$�@,!�9Q��@.7`R8�@0-ꛗi�@1G]��01@2g瓠�@3�i�*o@4��U*�/@5��U���@7.�x��@8p�@9���u��@;���>�@<^�4Z�@=��*��@?/�3�@@A^�K<-@@�c��@A����.@BnB�	ރ@C-��u#�@C��TO�9@D��9?	@E|W��@FF���@G�
���@G�@'��@H�m���@I�%<ip@Ja]���@K;Hx�@L-лF�@L��F)��@M֙���=@N��g���@O�_����@PC��q�_@P������@Q.��]�C@Q��\�@R7u�@4        ?��"�[��?�6L~�VY?�(ĥ�py?�iȓ��?���D�@���V�@����@`����@�>��L�@͐zh�@���E�@ 'w����@"��`D�@%iooEm@(C�5��@+@�d���@.`��lq@0���"@2�n���@4B��KW�@6��:�7@7�F��6�@9�z�t�D@;�νg) @=��ʵ@?��8+�b@A�^ls3@B'�S_w@CE�
!J�@Dj��82@E��x�G�@F��u���@G��t�WQ@I:����F@J}8p;�B@K�[{���@M
�5vO@Nf4X�IS@O��4�ң@P�\��jv@Q?�[t�@Q�2�C��@R� ̀�C@Sd\�Y�@T @�g@Tޣ�M�V@U��z��@Vb�"#��@W(�f��1@W�L��u@X�� F@Y���ۑK@ZV�B� �@[(E5��<@[�숑�-@\�����@]���aT�@^�c�ڜ4@_`����@`��e;N@`�k�uOQ@a��v@at���C#        ?�����?����?ϟM���?�0��?�z猑�?�<��ɫ�?�t~>0�?�==�Nff?��',���@<WZ��@�Vt�5@���t�@l�]��@ɢ�R�@y��Q��@����1@­�G��@�2�!�t@�����@!NF7�H"@"��@��@$�eD��@&Aֶ$5@(��a.Z@)�u�J��@+����f�@-��W��@/��R��@0�����@1ظ�(>R@2��	EAo@3�?V�5@5�N�O�@6>ڮ,�@7g��s�@8���>Qx@9�nc�@;!{I�@<H�V�@=��ۜ��@>�Z�T0�@@�b=\�@@��Rxq[@Aq�\f(@B#?Q�O@Bר�;z@C��v�X�@DH�hp]-@Et�;��@E���<�<@F���/5W@GK���+E@H7��U0@H�Vo��R@I��Yk_@Jyw/�i�@KKq�&�@L  ��m\@L�!{�	@M��>]�@N����@O�����@P6~J�x:        ?���́��?���=p� ?��!�R$?�	�7م�?�����y�?�T1m�?���7��?��m����@���>�@\�[o@��09h@�`�@��Q�?]@k\##(9@q�s�K@��5	��@�V8f%@!�:�>_�@#��,.��@%on��bt@'eH���@)l� j_�@+��I�P�@-��LC�I@/�8�q�@1�999�@2H4?B��@3}�>���@4� �`�@5��G���@7LwV�̈@8�hk��a@9�����[@;^34���@<�ע��\@>8�v�0@?��@@�BZ�}�@AY�2�@B�C- @B���`3@C�IUY%4@D��Z��@EW�w�#@F-���~>@G�(0=@G���&G@H��0ēR@I��X|��@J��8^��@Kp�9m	r@L[e1.��@MIARpR@N9�5�0@O,���L�@P��B�@P�Vƪ�@Q�R<�X@Q��N>�@R�ۣ�#@R���Y�@S�|�*@S�59�"        ?��	
.��?øYQAS�?��Ͳ��?��#@I�?�/��g7?�5'}b �?���:^�@ �e�ۈ@����@	8Ņ'��@&�;=�`@���7σ@����	@��KYi@̕���x@+n��Y@ ڎ���:@"�_��^�@$�¿��`@&�W��U�@(�F��@*�4�G@-"â{f@/r�M@,Q@0ꮗKx@2%*ih�	@3h����a@4�)�%�@6
q��M�@7hq
�=@8�	:�,@:>�<��@;��|ޛ�@=5B�JZ@>�&���@@&���D�@@��HcW@A8�o]@B�]��"@Cn�@K�@DI����@E)��2�@F9k��@F�a���@Gݴ�)��@H��lJ!(@I���	�@J�r�g��@K����ϗ@L�C找@M�w���@N�)�0d@O�Q.��@P_r�^��@P�o��Y@Qo��@Q�k�+��@R�c� @S����@S�4�*�@T3�E,c@T�s�$x�@UYu�9z~        ?��7�<?�7��]�?�!�x�Ʊ?��0ޖ%?��eG�w7@ ǣ�.�@~���I�@�����@�u�ȣ@Z��,a@p�fs K@���
c@"a�Y,=@$�N����@'��6��@*����@-�Տ�)G@0r�pf@2%5ڵ@3���ul@5��J�Y�@7�Lmz�@9���,^@;�E�@@=���G�@?�Jl��@A�[	@~@B0�0��@C[z	�/�@D��C��^@E�_^�@GM~O}@HPm�V*�@I��z�D�@J���&��@LS"T��Q@M�47���@O"�,B�@PI���v@Q�D?$�@Q�Z�q�j@R�
=�TG@SM��[c@T���@T�n���&@U���4�@V����V@W[J��� @X4#�@Y�ı@Y��MwL@Z�۴�[�@[�Ɖ{�v@\��_7�-@]�{�[]@^v;m���@_f���[�@`-4�$��@`�fI?�@a%��@@a�
Ir-@b"xN��@b�K,Q        ?��l̎�%?�S˕��1?�|&��y?�>�EdH?�y�F~�?�`�ۺFB?�S�f�n?�$z�n�C@ N�4U
@ٟ�E�@����%@��$��f@%�פ�@r�t�\@�rds@}�Ԍ�@1�S���@�PM�(@�e��@!}R9u=@#iX�c�@$��Lc�@&[rr��?@(���M@)�1#��@+��P�C@-����@/sS8,��@0�=��m-@1�����@2�m̯�t@3��_7�@4ֵ>5~@5��l�m�@7^c�R@8)�A�@9N�V�H�@:y�I��@;�HZ6Ah@<���d΍@>i�K��@?U���`@@LK9�%�@@�V��*@A� �m|8@B>n�rb�@B��S)0�@C���Ã@DD��@D�{B_@E����G&@F]����=@G�kKBC@G�#��[@H�_p뮖@IF�M4��@J�0�I�@J����j�@K���Uf@LN�gVh@M��EM@M�P��Ӷ@N��z��        ?��h$%m?�p�L��9?�kd�s?�{���O?�8��d?��.��}?�(��.@@ /��k�@2�f4@��މL�@a��n��@C��h��@a
�B�@�^�?#@��n�?@BL&�~5@ T84,�u@"�tA �@#��}�-@%���4�@'��Qo`@)����j@,��wy@.A6��4n@0B|��X@1k�!{&�@2����2@3י�H�@5TZJF�@6b��<�@7��Ǒ�@9v%�o}@:lp���I@;Ӵ��w@=B)���@>���ER@@!�R;@@��;�b�@A�����'@Bit"�t@C5:P��p@DB.y�,@Dր)k_@E��?�a>@F�s�R@@G`�kR�@H>ϓ�,@I �
��`@JP���L@J���JC@Kקڔ�-@L�*�f��@M���* @N���}V@O����@PK�k�W/@P�m˒�@QH�s�@(@Q��6���@RJ�s+mN@R��ᆼ�@SR(�\L@S�؏P��        ?��2�l�?�,Ę	��?�!���&g?�c8�-K"?���V��?�+<��?��`�[�?�Lr�\�_@�y8�@���`@s5_8��@w �@��
��@`�0�?@<=�)�@<���[@a0����@ �JF��B@"�����@$N8��?@&#����@(��	��@)�_1��@,���f@.�L+�@0J���@11��G�@2P��jp�@3u�=b�@4�%<��6@5�� ��d@79��@8M��.�5@9�Ͼm�{@:��L�4@<2���r@=�PĐ��@>�lJ�^>@@&,L "@@�����g@A����@BM��i@C
6�N�@C��<)*@D����z�@EQ�ɢ\�@F�����@F����@G���W@H�Cɢ|�@IR*���@J&�
��@J�Q����@KօV�N�@L�/c�{@M���@NpSY��t@OR��n�@P����s@P�j��R@Q֞�H@Qy�\]ԥ@Q��:-        ?�uI�?њ��=�?��!Q��?����c��?�2���.@�ܓS�@��>K�@jC��,@Y+��@W0o�W�@�yH�SH@Rb��R�@"$I|��@$�zb��G@'�\�0G�@*t��ԼU@-�5�ά@0V{l@U	@1��RX�@3�)ˢ�@5x�\���@7L�(�h@9/辆��@;! ]�N#@= VhUТ@?-F�b19@@�آPV@A������@B�
`�0]@C�Ѝ]vh@E栶T�@FG1�~̥@Gz��Sh�@H���#H�@I�H6��C@K8c<^�R@L�6�M�	@MӬ({]@O)�|E\1@PB�r��=@P�gE�@Q�}!�@R[�4��F@S��W@S��L6	O@T�.�fW@UK�nj�@V&ˑl@V����s@W�����"@XcԆ��@Y.�Zҫs@Y�|^I��@Z̛�=� @[��v �r@\s}�3�@]J5�9�W@^#T�Y@^���*�@_�/<:�@`]0S�5y@`��w�?@a?w�8Dc        ?���З�j?������?Е�Ox8�?�m�4�l�?�����?���Zm�?�y�m�?�W	o�E?@ n|5��U@$��(=@�A�@��ď@?��Y�N@����p�@�o);@�;
��@l@����@C��q�@ ��Wz@!�H���@#:-��q@$�&~�@&�6�/F�@(I�2v��@*7U,�@+討aϛ@-�\��@/�MM�j�@0�ޒ�@@1�#�1�@2��icc�@3���\�@5��<��@6��e�@77zBt�@8Y���x@9��n��@:����a\@;�ge��@=�ܿ�@>QSIЩ!@?�}R��@@k/��s@A�=N@A�G��@B`Y���Y@C�$ �@C��1�=�@Di����@E�u�?@E���܋@F�j!��@G>�B�W�@G�T��@H��eH�@It[��#W@J4�k�'�@J�V�gO@K�����@L� 4�@MJf�5�C@N�X#�@Nय�        ?��u��2�?Ì���?ԅ����?�{�<?�����?�ߧ��?�@��B�@ =��ح@A�w!@��j;@tu"�F@M\τ��@F8,7�@�u�U�t@�R@�D@KR��8@ XMRY	�@"+��9@#��!\´@%᳘��@'ކ֓d@)����g@,h��@x@.<ͧq�@0>�m�;@1g�b]Ɲ@2�+�B8�@3з�q[�@5
�fZ@6Y�ѩ@7��ɽ'@8�v]g �@:]��Q�@;�&X;��@=/���'�@>�6�w8>@@�pm�E@@�o u|�@A�i�7�@BZ�֦�n@C%NS@LB@C�#8ԮC@D�-p��n@E�dJF`@Fo���@GJ4-��(@H'��:?@II����@I����@J�]^[IL@K��Q^X@L�'`�{�@M�X�te�@N�[�y�@O~'�O�}@P:�7�~�@P��8�}X@Q6y��]B@Q�LDEP9@R7r���u@R���ůk@S=�,%-D@S¿��wI        ?��SmL�?��a�џ�?Ҍ	����?��3�?�,�gv�?�9��?I?�ɲ���?�F,pg��@<����@,����c@
p�0��@y{�y�@�=!�!@�;v�t@<V����@Mn�L@�)u�@ #�v�f@!�"����@#[�-�3@%h���@&���߰@(��D@*��]}�x@,�K�F��@.�%�/�@0DK���@1N�D��@2_ps�U@3u��n0�@4� �7_�@5�����@6�a�h��@8*�B�@9:9�v�&@:quZ�-@;��kq��@<�k_�@>5(��%�@?��pX@@gڗ�B@A�N�I�@A�^���@Bl���@C�s��@Cк���@D��,Wb�@E<�.�.@E�U��*@F�D�@�@Gno�ߍ%@H-�BS@H�pO�b@I�}��*@JvA��2�@K<�wf+�@L@��*@L�l��&�@M�T� ��@Nh�ϣ�@O8=a��@P�߃��@Pm�K��=        ?�^!�w�?ї��s��?↿���?��YG�GA?�3�v\��@#Q'i�@�����@n#Zc�@[�����@Z�ru�@�9E��@Xe��@"'���"@$����@'�-1�g@*x��"�@-�7�@0XA�*�@1��ڟ��@3�]�8@5yc��6}@7M9�R)�@9/����@; w�L'@=^��+W@?*X��@@���M�d@A� -�@B�Ӗo��@C���+T6@E@r��@FA��ha%@GtQ~��>@H��ߣ��@I�F�cp�@K/~r���@Lym<OT@M��(&��@O �+_5@P<_7��@P�bW�Ѩ@Q���@RT^�[u�@SD�鰼@SƸ+Ѝ@T��;]4@UC(m7�@VA/�@V�r��{�@W�6r�S�@XYX}O�@Y$�]��@Y��(y@Z¬T��@[����@\i����K@]@fb�8]@^i���?@^��ȅ�h@_���Cu>@`X��%��@`ɓɲ��@a;wf	        ?�5m?G?� �Ί��?��Nl�?��mY��?��:ܿ�z?��Е�?��Z<-�?���\��@ ��G�g@9F�J�@ 2�!,�@PA9���@c�Ʌ@����@<9�oU�@׾��rw@���g�@g'����@ ,����@!��6Z@#F��H�@$����)@&��y,mh@(L��+�@*W`ug@+�/l�@-��j��@/��I �]@0ʀCܢ@1�s���1@2˔�6�@3�ǔ\� @4�����@5��5�L@7	ٛ�}@8%b��X�@9E��LT�@:j@s�@;�n6�~1@<����@=��m�@?)��P�@@1����@@����D�@ArFW��@B���*�@B��s5O@Cbm�)�@DG,�@D�\��gn@EcVYv.r@F/d3�@F��!ڌ@GukBi@H)�j�h@H��C�w@I��At[�@JQ�|w��@K�B	�f@K���SM@L��	V@MI�|yT@N��"<T        ?�-i�� �?����j?��.��?�,�({�s?�%C2��?�q��$?���yeγ?��a���@�t]X�@�l�"@���O=@ނ
j~@��A�1d@`�Db@_V��bw@��8�p�@б �Y@!���@#k.zl�@%G=�X��@'4��*��@)2���TR@+A1�Hx@-_�#[��@/��w�bz@0�UR��@2��V@3;B����@4pת�nV@5���1T�@6�{�cN@8<��D��@9�l���@:�c�3e@<Fw���@=�q��G@?ﺦ`q@@E쵄�@A�Q�@A�Ob���@B�+/�s@CK�ӗ"@Df58@D�@��@E���w�@F��#@GU�Q�]@H-�����@I���P@I�x6�m@Jşz�lk@K��{]��@L����@Mvi�g� @NaZd��0@ON��%�%@P��Cg$@P���%Ɣ@Qu���.@Q�L3�@R]��ܳ@R��K�^@S
&C��}        ?�������?�(�^��f?�"�fw#?�e����Q?���\)��?�d/���?��5i�o]?�MU��B@��	�P�@��4���@n/�G:@�x���@�Y���;@W�bmI@0%�p�@,߄��(@L���@�@ ǹ�N��@"y�B<�<@$<�?4�@&Y��"@'�J�$�@)�#i='@+���+�p@-����@0/�a6@1ǅǒ@29�ϲ4@3]�D���@4�*��*@5�,F�U^@6��S��@8.�(Vn�@9s�z�@:��V�'!@<8>Ŝ@=d�<%*�@>�K֬8@@�o]�@@��`V|>@A|����@B65D�؜@B�V@�@C��I1z@Ds&ީ�@E7j�0��@E�G`��@FǶP���@G���)�@Hb3�I�@I35r"�L@J����M@Jܝ�� �@K��bO�@L������@Ml͊>�4@NL@؝b@O.���@P	m�,@P|C	;��@P�!��@Qf�U"�@QܮQP�        ?�g�h	�?��y:	D$?�� d�I?��'Be?�}�T��~@I<Mn@���Z@�"WL��@��7��@��^v��@�L
R@���E�@"F��]�8@$�>��ݑ@'�^�d@*��)q�@-�����@0e�cf�@2
,���@3��5�}>@5�֒�@7O�Ob@9.�l@;��5�@=gǗa�@?
��@@� ��G@A�K�<%@B���Q A@CԔ),�@D�g�Y�@F�pHz@GG�2�Z@Hy=	Z3E@I��A�dg@J��d*�@L,�&i�@Mr���R�@N���$#p@P����	@P�T���j@Q^����@R$埚@R���$U@Sr%�[�,@T({��@T��qO@U�a��;�@VV��n��@W_����@W�L>]@X�ϩ��z@Y]��+e@Z$�M4z@Z�r��@[�_��'@\�K��s�@]T1����@^%�bD@^��5HNW@_̙�$@`Q���Wc@`�����        ?�R���?�RËW�?����s�?�������?� ~�P�?�#��ф?��  )O�?���U���@ �3-5@OF�x[�@9�,��-@mv&�ͳ@sH&�Tj@�
V:V@N��!�\@ꉀ��@������@yz�d�@ 4�^��{@!�Exku�@#Lxrg@$��8g@&�����@(L*�@*
��~�@+���p�@-����@/���w�@0�Q��@1��(�)�@2�k=��@3�����@4���(@5���0�@6�:ga�|@8-RKX@9#����v@:DaF��@;i�p(d@<��?�g�@=���;z�@>�k"�^)@@0�ٰg@@�6���%@APALy�@A�HC]ȼ@B�D����@C9/�|�X@C�Hʿ�@D�����@E3I']@E߮l�^f@F���2��@G=����@G�$��@H��Z�;�@IW���C�@J���$�@J��@G:�@K���D*�@L<G����@L�?�4x�@M���v��        ?����>��?��̊W?ӆ8����?ബ�S$?�nA@�?��u���?��K�O0d?��)U?�@9"�pi@d��V��@�d���@b��g��@��J�B@����k@��dS�@�WK��q@���h�@!C~P+e@"�'��@$�n��\1@&r�g�*@(]8 Td@*V��/�@,_>�e��@.v�12�@0N�!��@1g��)��@2����ǝ@3�s;���@4�Ǯ2�@6��0��@7Oʼi�@8���+q@9���:��@;'DT�&@<{���h@=�l  @?6xy�@@NYI�x�@AYGKJP@A�2���@Bx���Z@C7HWX�@C�s��`@D�S]�D@E��3�u@FL��G�@G�V��@G�[$�X�@H�ao�@I��U��@Ja!��@K9��'o�@L���.@L�K0;4�@M�:h-})@N���`�x@O�6G�d�@P@X�[@P���LP~@Q*��=�@Q�x@n�<@R��W�c        ?���p��?�NulU�?�H��Ew?���'���?�(*��?�)-��?��p� �?��5U�s@2�A�@#o�'I�@��_��o@3��d�@�P.@x�7��@T��ÿ�@UF�l״@ydp_�@ �� I}Y@"��Rۇ@$X0>��@&,H�ǝl@(ج�; @*��o�@,�/o@.� xz@0�?�g@1.� ��@2K�Ř�@3oM7徳@4�edH�_@5��cc~�@7 �"��v@8=��u�t@9�6:��@:�JrkK�@<XQ��@=n+���@>Ȫ�?�t@@^�ǎ�@@�&DU@A|�_S@B4��$�@B�ri��@C�����@Dl�N/q�@E.�!�@E�}%+�@F����m�@G�-��@HO���@I$�	,@I�k�[�@J�j_��@K��dr�D@Ll�k���@MFcT}@N!U��W@N��V�e@O�5s� 0@P_ߣGyA@Pѩ�I%�@QDu}LU�@Q�?���         ?�d4I���?��vfqA?�|'-�?�	)bD/j?�m�0	�@=p��Z@T}��P@��@�c@@|���@}�����@�����j@{%ԕD�@"7����@$փ4}j�@'����`@*|D����@-�^�D@0Q�󃂓@1��\@3��u�S�@5_&���@7*E�UEE@9�e� @:�@KuJa@<�n���@>���C�-@@q�����@A}W���@B����6�@C����@D���G;4@E��
5�@G���@H4�.��@Ie��}�@J��!&��@K�威d�@M�ɱƜ@N[����@O��E�@Py���JY@Q#	�1{�@Q���X
@R|�>�R�@S-�[&@S�z���@T� =��@UJ�;�K�@V�ac�8@V��K"˥@W{�@q�@X;�G1@X�7�M@Y�M�B�@Z�R��Q@[K:�@\�#+�*@\ޗ�;��@]���� @^y* ���@_IQ
�s@`_�N@`w�t-