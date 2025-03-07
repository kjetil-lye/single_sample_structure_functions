CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T112218        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?�q__�?�<�w[��?���qj�?��a �?���&ٵ�?�0���?댄�N��?�M�?����I?�	bv�x�@,����@7ю	_�@��e\��@:�}��@�3���@�}���@��5a�@Ť�˿@"@���$@!W��/z�@#6y���@%-pf d�@'<��-�@)c�O��@+�i/ӈ@-�`ַ�@04�����@1xG���[@2ǚ���@4"���-5@5�����@6�u32"@8z(:�`�@:�(�y@;�%`gV]@=9�W�#�@>��	��@@N�ܠ�E@A0Evm��@BQ9']�@C��G�@C�w�[@D��*���@E�ޟt��@F�rR~��@G�p����@IөZ@�@J�H9�@K-�
g,�@LK	I:�@Mm��V�V@N���x��@O��I�@Pzj����@Q5��p@Q�Oq��@RUcz��@R�SU��@S��F/�@TFZXV��@T��Z�&@U�MN��@VM���!        ?�J4��S�?�j�nN\�?�l��?ӧZKG�?���cR?���z�?��H/�8?�ɗ��6�@ ���@�~>��2@���)�@@Pz�-�@y��ԡp@ ����[@#�5��@'y.��@+i�����@/���j@20%��v�@4��1�>o@7j#5��@:PQ��@=h"	�@@X�U,�p@B��>�@C�)@E�����@G��%�K@J��N?(@LN�\-�>@N����i@P�O�{��@Q��9��@S'��|=h@T��mg
_@U��jbC�@Wq��H�&@X��O ��@Z�h��@\1�s�@]��2n@_�[=A��@`�K�@a��:�@b����0�@c�a��@d�/�>Q<@e�ǣ��7@f��e ,�@g���eC@hƨ���2@i�O9�sx@kx�L�@l9%9�H!@mlU�g>�@n�
E�Ԉ@o�D9{$�@p��G�T�@q=&[Zz@q�'��@r�=I��a@sD�v�=b@s�l�`        ?��1��e�?�gF��l?����+y?� �p�?�5�H��?�^�j"�?�@O�;�M?��d�s"�@��09Y@v�uCw7@@��)�@�q�%��@)&�݀�@!��|@?@$Y�,��m@( �a|mE@,���@00���D@2�$��1�@5q)�Ih@7�-" �@:����@=���@@�@w2�@Bb��ы@D>�d$W@F3���@HB�1Z�@Jkj�5@L�����@O	�J��g@P�ɘ �b@R�؅A�@S\�q��@T�a���@V-:��f4@W�]q�Q@Y1�dI�@Z��Jv*!@\jܾ� _@^٧euL@_��:���@`�����@a�|b<C@b����@c�
�F�@d�uz�@e��.�	@f��5g�6@g�0���@h��ڈ�@jl�.��@k(B���.@lT���@m�:����@n�Y��t�@o��� ��@p��Ou��@qI��~�@q�u��b@r��5	�@sN�a��	@t����/        ?�Pf����?׎RֿƩ?����Y�@ ' ;�v<@���+=@�+Щ$�@���@%�9{1ye@,�4@2F��\d@6�ų���@;����Δ@@��SS��@CΗ�"~@G)R�A%@Jˎ7@N�����R@Qt���@S��Æ�@V�n+e�@X��α�f@[D�2��@^�Ė?�@`��4��@b�Y�YO@c����@e^L�;�@g �3%��@h��B�h@jۗ�c��@l�;`O�@n���`�O@p}��
�@q�����@r�jwX��@sީ=�;p@u�~�B@vK��M�@w�ʹ�`�@x܆���@z2��@{�DD��@|�>�gW@~f��@�Sk�@��0-7J�@�u�ݵ%@�>'ɺ�@��ҏA)@��*�(]�@����a9�@���tj�@�k-`&qh@�Myَ�@�3��v�@�W����@��K���@��j'�oX@����n�.@���eb;M@���ό@�񖊱�"@��E�s:        ?����?�tV�O�?�<g�K�3?�\w���B?�b\\x��?��,��f?���`%?�Nt���?���4n�?�ςh�@�1�Ѭr@��c&�@	�N>��i@���LŮ@�cC\�@[Cc9[9@/N�-_:@2U;�V@d 	�x@ b:xL�G@")���f�@$�`��@%�4�6��@(	N`\�N@*,�<<@,e����@.��fj��@0���D�u@1�Z�n1�@3�J)J�@4j\m�k�@5����h	@74(
��t@8�I�U�@:)'�'3v@;��v"Ut@=H��IRD@>���@@Iy���X@A#���Sk@Bt�E�9@B�9&�@C�!�x<@D�'$��@E�@��;@F�f��J�@G��:�&@H����3@I���$T�@J��~Y �@K֫"=c�@L�Y���x@N�wc{@O(��Y?�@P&�L�@P���#��@QR�
l5�@Q��W'�@R�� ���@S%���UT@SŜ�dp@Tg��%;f@US�0�        ?�3P�}?�����:?���x��*?ҽH�f?���u�8�?�!��E?���-��?���~��@��A?x@!#ܚ`@vo�?��@���J�@�&gl7@ u����F@#�%��x�@'K�\��@+?*��J@/��P��@2 +�K�,@4��M�G�@7bZ4�4@:M��AF@=kF{�v@@]�MG�@B~�}>@C��/`+@E�\�jnO@G���d�@J)�ʳ��@Lm�J��)@N����@P������@Q�e���@SC��#@T�5��7@V?�[�@W���j�\@Y&�*���@Z�3��*�@\i4�SYo@^���@_�աW2;@`�=5t�]@a�W@�%V@b�8�@c������@d�P��̱@eȅ���@f�|�G�@g�5��\@i���@j4�(`��@k`�R.@l��u��@m�ޫI��@o�A)`@p)�Hec@pЎyl�G@qz��r�@r'�}I��@rآ�C�$@s���ԮO@tC箳��        ?�Λ�G?����?­�_�?�� k��?��m���?����?����
�?��'�Z��@��U;�@���,�@�T�\�@�)��@f?�d�@ cK��@#�_����@'���1�@*Ӽyƚ�@.��wC(�@1�� ��@4$�&F>�@6�,����@9~t��q�@<n����@?�N���@Ak�ƏZ�@C'����n@D��$��@F�4��St@H�C��4@J�R�-n@M-f���@Os��8��@P�W�q�@R"s�[T�@Sh�z�@T�GS�\7@V�ԉgO@W~B%�@X�N��@Zq_Z���@[�5T40 @]��?3�@_4\��g@`pи�s@aM*&��@b/5�i:l@c�<�.m@dQ�M�X@d�XN��@e��'�@f�>p�s�@g�r!\�@h�{�߂�@j
o��7@k�7�i�@l8����@mXq^j��@n}s;��B@o��o��@pk��2��@q�F�x�@q����@rD<��        ?�Ӧj,2?��i~U�?�N\ls�?�y�Q�@	A��n�@�	&��@B�e@#5��d@)9^��@0�f��@3�M��@8@F��@=�z"��@A��6w�@C���f�@F�J��^�@J5�����@M����@P�w��@R�KO�q]@T�(��<@V�{�~��@Y&5�o@[�㤐�g@^��zo@`N-N�;�@a�e���@c�@d��
�DC@f���͆@g��K`w�@i+���ܧ@jӷf'�R@l�~��̥@nJ�-0)@p!�.��@p���V@�@q�Kn�@r�J�bx@s�-g��@t���^@u������@wR���@x&.�|�a@yE�1�G@zj�~�@{����5@|���C]<@}���It�@9
��v�@�=��j*�@��6Q�@���Q��@�2&]9��@�ޗ��C@���-)�x@�?����@��w%
�
@����z*�@�e�����@�"��ԷZ@��7q!!@��Q��\        ?�����?�ϡ���y?�v'B��?ʸik#��?��V��[?ᾁ��@�?鄩���m?�f��5÷?��]T��?��L�rf@��ͪ��@®Fj�O@	��T,�@���t@�E���@qw�0�@O�c���@^a�gT�@���G�B@ ��T��o@"W󒴓@$? �@&>�ϭ��@(VR���@*�I�@,��1���@/'�:fv@0���.�u@2��q@3c�Z�Z@4�ACm@6&��Dd@7���@9�+�w�@:�z��@<.��SE@=�(�$&�@?s�I?��@@�<�6R@Aqv��@BT�F2>�@C=��Nk-@D+By���@E���d@F��[?�@G4m���@H�z��@IW�ΐ@J%&{-@K5���X@LI�'���@Mc0sEL�@N�N�$IR@O���@Pe�k,�.@P��J���@Q�!��S@R.�m
��@Rˬ����@Sj�G^@TY8� �@T���$@UV!>�
        ?�*�G�?���/wG?�=�Z��?�TD��Ó?������?��H��?�U^�w�?�� _{@��Xj@8@
=*⇧-@��/�@7?[S��@+3ޤ�@�����c@"��^�@&t��:�@*B�A��@.j�:�R�@1w?)�1"@3���@6�X�Y�@9X��g@<Y�
� �@?��I=^@Aw�K�~l@CB��վ@E&�gX��@G#�y�*x@I:�����@Kj�_E��@M�y �s�@P�%��@QJ���B*@R�N�G�@S��g�@UT �Wo9@V�l9m@XE�b'��@Y�L��t�@[k�1��@]UuJ�@^����J�@`CQ;Gu@a*5��N@b����@c��m��@d:����@eaN��@f��+�@gp��7a@h2[��}�@iM��u�@jo�ף�v@k��Z�)@l��J��@m��%
ȗ@o:Cx��@p>�V�@p�lǢ��@q�|��I�@r6����4@r�j�,��@s�E���e        ?��4@�j?�@��=}?«#rw�?��}�Q�?�_}u�"?�I$\�I?�g��s�?�ff��d�@l|T:��@C�jG�Q@$[�4��@�Df'�@M��t@ �P�Z@$Op�[P@'��4���@,�y'|�@06�~���@2��c��@52P3��#@7��,�V@:�Qd\��@>%�=7�@@���z8}@B�[��Mg@Du-	�c@Fu}�o�,@H�q/�@J�$�(Eu@M��I��@O�,���F@QS}��@RU�8�E@S�h縠�@UM;�)@V�ɤ�lK@X���C,@Y���]�-@[V���57@]Ӛ/�@^Ķ~.6�@`Hİ�@a4��Έ0@b'���d�@c"Cd��
@d#d�0m�@e+e(M��@f:E%��@gP��I�@hl�ݱ�E@i�)B}A@j��|��@k����_9@m#�%R$�@nb�5aJ@o���a�@pz��)��@q$��cY@qѺ�Q�n@r�W�rq@s6[���@s���8�@t�����        ?�wӽ��|?�7-HH�?�:V�Q�?�yF(
�@+C�*M�@$B�C�@������@%���_�@+�t�e�@1�,HzO@6WF�O@:�\ ��g@@4�LU�@C,˭��@Fh� +�@I�:z��@M�I��@P�03@S�cu�@UN^�W$�@W��%o@ZK��|�@\�,�z�@_�[n��@agAI�@b�O�-mB@d�փ&�P@fE�xO$�@h6���@i��f,�@k��r� @m�{XB�Z@o��w"@p���&�@r �Ѡ��@sh���@tDr�|']@us �#=�@v����@w�c�'�@y1�5^V@z��~��@{���%�t@}<6p��N@~��WS��@���H�.@��+~�m\@������@�P�G@�ёQ��@�綽�4+@�����e�@������@�jw1^�C@�I_Y�,@�+�,A�@��A��@���	�@��y��ɋ@���W�|@���%���@����pJ*@�����#H        ?{�<���?��#E?�/K�:Ʉ?Ǩ_剘?�v�>��#?���u�m?��0M� �?�r:�d/?����ݴ�?�O ^Q�@ U^o�{�@ޠ9>�@����@[�KA�@Q�|�AR@ϰXH,�@|Q�8�@W�q���@b¨�V�@��1�1�@!K �@"���)!�@$���c�@&��l��@(�au�B�@*�L�&R@-5��n`�@/��j�p�@1�I
��@2H���6@3�1�{=Z@4��9�6@6^[�|V�@7�7���@9Q�OBu@:�-�.R@<r+���@>kL�s@?���b�;@@����@A�����@B��S��@CpykJ�@Da�A��@EX�k�?�@FT��=�@GV2f��V@H\�U��@Ihb�Q�z@Jy&2�1@K��� @L�f�YM�@M�􌅑g@N�b$���@PR�^@P�WY��D@Q;�2��s@Q�w�	��@Ru�h �@S�{]7�@S���TC�@T]q����@U�#Gq7        ?�¨�I�#?��^�-��?��\��G1?Ѯ�Z��?��=��ļ?���]<?����>2?���k�[e@5�I�>@	/�m٦@-��Z�@P��/��@�0�U@W]�~c @""=�&�@%i�A��@)�C2�@,��Y��@0�Չ�<@2�+�Ȫ@5d���#"@8_�bU@:��:�@=�`M��.@@�4���@B9�����@D x��g�@E�ͻ!�8@GԫTzo�@I�%`�+�@LL{U�@ND,��E
@PLi����@Q���U��@R�ț٢b@Tڂ�^@Ul��W�/@V��D��@XD�1��@Y�s[F�@[L)�C�$@\��tڨl@^�H�0!�@`T	&5@`��&�/�@a�q���6@b����@c�� ��@d�4���K@e� �8��@f���2~�@g�S��@h��sA˳@i�y����@j�doT@k�\�bA@mA�L�@n9�JzU�@of�ZA��@pL�~9E@p�ğ�@q��.R-�@r)�&��        ?��{q�o�?�0"��M?����P�'?��r���?���C2�?�Tx�	1?��|�p?�h6Sry@.f�k�@
þ�L�@B��ų&@��Q�@�Ə��M@ Z��xT@#��v�!@'8|��|@+3J��B�@/��ӝ�@2&2~g��@4�V�5�@7{�.��@:s��!��@=�P�X|@@�3�R@BL�M�<;@D3�Ă�R@F6:��(@HS�LP��@J�^ �@L����R(@OT+L�^ @P��L]?�@RE�+C>@S��UX�z@Uc��}@V���]��@X'h?D�B@YÃd��@[m�bMFy@]&��5�o@^��q$� @`a�\H�@aS���V�@bL��/G�@cMI~
�@dT��0n@ec���Q@fy�@��@g���#@h�y�oę@i�#y���@k �2�@lTkY4@m�ISA)E@nݰ�@p���5W@p���ͱ�@qp�e��@r#\��pt@r�_���M@s���z_�@tO�U��.@u�AR��        ?�K��@tB?єDg��?��U����?��h���@K����@��>��]@0�Y2^�@ �5�e�1@&t�Q�@,/����@1�w3Bx@5�AQPJ�@9�04p�@>���@A�'�ζ�@D�Jzo4@G�b�w�@J����'@N_�Ҷ�@Q�6ݩ�@R�Na8u@T�[�j��@W$תyU@Yf�O-T�@[��6t��@^<T�>�@`g�V���@a�/	�-�@c#ع @d����_\@fZ+�@g�bLm��@i:���+@j�� �@l�!�ڒ;@nS���3�@p*"�I@p��Y�q�@q�9�%�@r��a0�@s���Yr@t�{4N�@u�l��T�@wy/i@x��̻�@y9��	�@z[�n?�@{���G�@|��x'Jz@}�l�p@�H|(�@�,��u��@��ƴ�@�r"��f�@���A-�@���`I�y@�m\Ϡ��@�_��b�@��ʋ+�	@�~�
��@�3����@��(\o�Y@����I�'        ?u�"�{?�4'��(�?��!-?�N��O?ֱa�E�?���S�?�h���H?�`(���?��ȖOx@?��:�	@���7@����g@
8g�<�;@�ʶ^�@�N5�,�@�I4�L@�P����@�i���;@)�B���@ ��*�˷@"���_�@$���3GB@&��@(�����Y@+2�9-�@-��Ų��@0b��#@1Mu�M�@2�U��=�@4W�R
�@5r�_��@6�=9�@8v���@:
i;�@;�K]�֍@=X�jѵ�@?��30@@l���@AV3��@BE���@C<�C�@D8r�l u@E;'�I�@FD%��c;@GSiZ���@Hh��c�@I��/K��@J���V3@K�Ծ�a�@L�-X�T@N1��k5�@OlI���P@PV� A�@P��q(�p@Q�J��2�@RI��+�=@R� �'@S�jZ�r�@TW��PM@U�!Dq�@U�?���@V��1��@W=���A	        ?�EX�V3M?���>U%?�)�r�?�u��R�?�fb��?�T�|[v?����N@ �f���}@Em���@~��6�@��gRx@��BdA�@H-c���@"Y���p�@%����m�@)�h]]a2@.<w��y�@1}o�9@4 E���@6��"��@9���%�@=ٝZmh@@5e�d@B�����@C����@E�M���I@HS~>{@JQм�@L��}�@O�_�V�@P׫qE$�@R.5C�z�@S����@U�\m�@V�O�>�@X����.@Y��7r�m@[`��l"�@]����@^�$��M@`^�Z�\@aQ���>�@bLO`t�@cN3�z:@dWn-�0�@ehxi /@f��;�7@g�G�,��@h��u��@i���@k)�S��@lf�H��
@m���}��@n���a��@p$�d@p�6ʷ{@q�AgO@r8�i@r����g_@s����>i@tl�����@u0r�x{@u����gU        ?�B^�д?���A���?�D�8ғ?ӎ�V�?��j�?��夕��?������?����@$vD��@�&QȊ�@遜���@z��T�@�12��@ ��8Փ@$7X�@'��P�9�@+�`"0@/���@2E$���@4�ַ3�@7{���d$@:]�����@=o�[hHf@@X�-��@B�~rmw@C�t���@E˃(\��@G̱G�{l@I��S��@Lj/�7�@N`�B ��@Pa?e���@Q�v���@R��@Y!�@T;�B�ܽ@U�x|��@W	@|][l@X�W�!@Z�wU��@[�w��@]4(�X4@^���lYL@`H�S$0@a)N��*@bVj�v�@b��%�!�@c���~�@d��;H@e�Rt�Y/@f���T@g��J�@i�x\Я@j�'>�>@k4�F��0@lW$h��@m\�@n��Yl8@o��2P�@p�]��(�@q-C�&��@q�!l$��@ru�ѡ��@s��T�        ?���L��_?�A���5?�p�V{@ СTe�s@;ɱ��@���?@ �u��~@&�>7��t@.c����@3}�N�c�@8_��]��@=���U@A����� @EM��4�@H�U�L@L擺k�@P�uCf@R�*��a@UM���)�@W�Jd[�@Z��x<,+@]�}�DM�@`N�-���@aꎴ:�@c�t��yZ@e^\$��@g6Fڀ�Z@i"6(b�i@k")_�ݙ@m6.k��@o^��5�@p��m��@q�� ��@s&Ϫi@tb�r�;!@u��� ^Z@v��H��@xR���%/@y��Y�m�@{%!��#�@|��I�@~ k�K�2@�l�$cT@��VO�^@�s��@�H�ެ�@�#�7�o�@��W@��b7�;@��6�C��@��t�{�@���9�o�@����/�@��n䣄�@���/���@��*��|�@�ǂ�
��@�����U@��%^��@���> @��0w�c@�*2���@����:95        ?��(V��]?���q�x�?�爇��?�QݚJ�?�'��XrS?�mک�0Q?��x��B?���[?����!k?������@��G�@���5�@e�;/��@��k�_Q@u����@jB�.T�@��B���@�M�-�%@ J.e@Mj@"3��P,@$9��_@&Z��i�)@(�ިM�@*�M��@-g�@/��).;d@1S�1^\@2���᜺@4*d���@5��o@�E@79y�{jV@8��WȞ�@:��:^@<8i��@=���9��@?�)g��@@��i��@A�Iz֬@B�;V��@C���@D�!���@E��	-�@GoO�7�@H']���@IL���4/@Jx��1#@K��E�@L�n�Ɣ@N!�����@Of���@PX��D@Q�e� H@Q�V�E�u@R\$�L@@S���@S�ߞ�&@Tzł,Β@U5���Т@U󎁐�!@V�i��D�@Wx9��3U@X>���@Y����        ?���ҽ�)?�,S�O\�?�Y*�Q?�t���6E?ߧhr�b�?���C��.?�x����?��_y�@@	>}O�@	/k���@4�h9�@c��.+�@*�4�O@�c���@@"K����>@%�NuG�4@)S=d�A0@-Z��5�8@0�_�Y:@3=x
d�@@5�q��b@8��vw@;v��T1@>�r3dk@@�ZQY�@B���c5!@D���	΢@F��cZ`�@H�Ω"@J�O�LQF@L���s�@ON�l;@P��Q��@R(�1��z@S}P\�b>@T����f�@VM�3���@W�G�_@YS�F�@Z�y,�@\��3��@^@�͍L@` �7��@`�vq��@a�Ɏ�z@b����v@c���u�l@dć���@e�!�8��@fܗU-�@g��pf$k@i B5�@j47$j�J@k_2�z�Z@l���i+@m��Qi@o	�H�@p(��6@p��7i��@qy(��~g@r&�6D��@r�F��Y@s��|Wb        ?��z���w?�k@�*3?�w�ն��?ԿK���?⼼�\��?�e�^�]�?�߳�uX@ I$�� @:8H�#@Va�8��@׾���%@�{u��@,��$��@!��~ty@%+��D�@)3��@-DY{Fz@0�v�3@3{D�#Y@67G��}@9)e	hW�@<R��ӂ7@?��>�^�@A����/@C�p"�@E�}*���@G��.��@I��8���@L^WK@N�
��@P�����@R+��F@S��˾�@U��4��@V��@7@X'�!���@Y�\d�F@[��Α�7@]V��@_0D ��D@`����@a�����@b�^��P}@c���D
@d��t�� @éHy6�@f�H��tB@h��@iS	Գ�#@j�
m8@k�$1F7�@m"Yn���@nw����@o�L�+@p�W4-��@qT0��@r{W]�@r����]@s��`�@tX:��J
@u#g��Q,@u��K@�@v����        ?�T���	?�j�K�H?�r��#:a?����4@��L�"@d�l�V�@��{���@%8����@+�eU��@1�~���@6E�����@;1�7��@@R�f��@CQv�{J@F�,t2{j@J�܊@M�N�R1�@QO	�]@S0�o{w�@U�<<�V�@W�Blu8@Z���U�@]P�1~��@`:�Je+@a�*^��@c0��$@dׂ����@f�2�٧@hZ��Q�2@j7U��@l%���w�@n%�;T�@p��g@q-�7��=@rH%X�P�@skg���c@t�V��I�@u��%|�@w��[ذ@xN��y@y���&��@z���$�@|Q��	�@}�ɒ�G�@'��y�@�O��ӽ@�`���U@����۫@���>.�@�f��+)@�6+�&%@�	��%>@��9�V�@����(u@���&�l@�~���Z@�e�'��@�P��̄@�?9��W�@�1�?\<@�'�	��@�!�/R�@�1TÛ�        ?��0���4?��7��#?���+-�?���ߛ�$?�C�v���?�-�M�m?�� �x?�c��?����s�K@ ,�L�5@�3�2�@-aA4�@����.@���F�y@�&��$M@��uU"@�t��<�@����k@ :���@"��a(z@$
ށ� @&��r�!@(BvlWWZ@*��t��@,�����@/U�C�!�@0�Kj��@2F<=Nj@3��f+rS@5�`�O�@6��Z��@8�9W�@9��l�H@;B��*M@<�'��@�@>��ڢ�@@3K���@A�6��@BB��=@B��J���@C�J`�C?@D��p�p�@E�6�Q��@G�矬�@H�gx
�@I.l�@JK=���@Kn>D�AH@L��"i:@M�͆&t@N�Q�n.d@PP����@P�[��)@Q]F����@RH��@R��!8�@SW/���@T���O@T��ʽ�@Uj���Nb@V!VP"�@V��X��@W��Kr�        ?�4����?�6հpE�?���ۣ?}?��a�Q]?㝋F�z�?>E�T?����@ ��v
ъ@!H@wHwm9@�9�iz@�)s�l@��Oi�@!b��e0@$������@(U];o�@,Q(IJ��@0S,��G�@2��zht�@50B>K�S@7��
(�@:�nOv�n@=��$-ԁ@@���u��@BA�h�7z@D�N��3@E�d��@G�ğ"R�@J���@L9�a�%�@NƉ�^�@Pn����@Q�~���[@R�.1in@TBȔ��@U�L=U�k@W�H� n@X�XҤ�@Z9`�z'@[�Id���@],2^%@�@^��O�1�@`A�8.>}@a a��a�@b��7�{@b�C٥^@c�vM��@d�x�3]@e�C��,@f��d6��@g��E�@h�vz�@i�ϪtQ@k'��v�@l0 k4��@mS�?n@n|ؼ���@o��M�'�@po��~n)@q�=��@q�RN�O@rN��m��@r��LB        ?�SH5�>?�m����?�1z<P	$?�~�h__?�`NU�Y�?�`~���?��y����@ ����_o@�n�$��@m�O(@C!S�2@&
�Pk@��Z�/@!�Uh�iT@%z=�^%�@)W9�T�@-���ߢ@@1�1�
S@3����@6W_A�K�@9C��Y��@<em�y@?���*�@A�W�U�9@C����\@E����i�@G�i�Y*�@I؏G�F_@L,O"Ԣ@N��Q>/*@P�3T��@Q�/� �@SN�bv/`@T�P-|d�@VBދE��@W�L`��g@Yr��^��@[!*��@\�m8'jy@^���5Q�@`CKN��@a8���,�@b5��f@c:l��J@dF���v@eZ����@fvQt�0Q@g���DX�@hĎ�X�@i�-��6�@k1x,��"@lsn����@m�s���@oa*X�@p3���=@p����|@q�2x�e@rP7�F�@s+x��@s��U��@t�`РkG@uV�I��M@v"`�t
        ?�=,g(��?���iK?��"���W@�i�u`@2�&mON@���䨚@#|X#~�@* ��P<�@1�r�|�@5���.@:�-���@@`�&��@C�z���@G:�æl@J�%a�@O
_�l@Q��!�6@T����=@V���"�@YD��`D:@\�I�PT@_�Q�-�@a����@b���V��@dm���@f6����&@h�p�@j��ߎ@la�n�@n׻W�@p!%TF@q>�ېe�@re���?@s��p���@t�{}vO�@vћC�#@w`��O��@x���y�?@z�k�A�@{~n�n�@|�>�A�@~k=����@�`��;�@��N�ŋ�@��s��*�@�Y���@�-=6�@�����5@���ھ�@��Hl�@���e@��@>�@���SZ�D@�u��a�@�l���\@�g���Խ@�g�w��@�kW`���@�sY�r��@���c�@�G�6)�@��0��$@�^}pB�        ?�����?�ںs�L?�7oq��?ϣ�����?�+[|Űw?����֯q?� ��{�?�hn�(�G?��`s3�@ ���CCC@������@	��d��@��7}s@���i�@KYz8�@H(V"=y@y,�B� @�fx���@ �ꏄ��@"��q��@$��|X�o@&��.S[�@(��ߢW�@+B�.�c�@-�t�-T@0�7�n�@1f �:�5@2�?�Bƶ@4)9V��@5������@7�~՚e@8����5@:Ful��F@;��6��@=��� @?]�ޖ�@@�5�@A�>�+@Bq
�<��@Chw6P��@De��c�@Ei2�`J@FrsG,@G����D@H������@I��?��4@J�9�?�@K��x��P@M%2
m7h@NWr~�=)@O���=��@Pf�W�6�@Q���*�@Q����X]@RUk�\�@S 5o���@S��>ެ�@T^�(��@UJW�"@U��;�}$@V�g���@W>�m�j$@W�6�1'        ?��32�?�y3�Wb�?�<]�w1?�Zg���?����'b�?���g��N?�P��U:�?�����@�]���@
$��=�@͸��lp@.��@	��b�@�o�l�@"��8��@&VX,�5@*^.;&@.@�:F�b@1_�L�pJ@3�f��J@6j�2�@983��2D@<6T�0�@?e��C@AcP:᧙@C,�Jg@E�����@G�\��(@I!�KA�@KQ��t@M�^��8�@O��Z�@Q=�R�@R�n�i��@S�l�Z�{@UH��G��@V��q6n@X<��@�@Yʵ��?�@[f��OQ@]�#~@^ĺ�
�@`D�bY@a,� D>�@b���0@c�ַ@d�;#@eo��T�@f� �.@g,\6I�@hC� ��b@ibX���@j��u��,@k�v���@l�62~@n�,���@o` ��@pS��ph@p��h�@@q�	�v�@rR�:si�@s�}z�@s�����        ?��ݬ�3�?�*�t�?K[���?���g?���m��?�����?��%0fJ�?��aO�&-@�f���@��ƇĢ@�2/��@]#��)�@�v��q4@ �&D�^@#��Ws @'��:p�~@+��vD/@/�
��p@2Ge8�c4@4�a�&=@7��YH��@:|���@=��C��`@@x���ބ@B<(��b@D�8H��@F�ʓ�;@H"m�l�#@JN2�*�@L�Ow=@N��X�)@P���"@R�9�s�@SZ�Tv�n@T�$��_�@V2�f��=@W���cy
@Y@#q���@Z�Ĩ�
�@\��D�4W@^7�>:@_�}e-��@`�(I��@aӴ�6y@b��sd��@cį�g��@d�'��@e�'�s�@f߻�a�@g��u{|@i��F-�@j6X1m@k_�}�R@l�LF�g�@m�?$�@o����@p$]�ɧ�@pɡ����@qr)%�S�@r����@r�{E5@sUC�s�@t4�ӳ0        ?����痜?�O>ʣ�?�gf��׽@ ��߭�9@����@[���c@ )M��@&(��WmW@-1�o5
�@2��[���@77S�#@<T~�L��@@�pYf�A@D�g�?i@Gz)u�@K"�Q�@O����@Q��w�{A@S�>#�@VJ�����@X��<ve@[���M6@^TAb@`��3�"^@b3���~@c��r�R@e�W���R@gKF�M��@i"���@k���C@m�|��|@o���y�@p�����@q�)c�-�@r�S�E�<@t���v�@u5�,�R@vr���@w� ���F@yYey��@z`��"i@{���3@},"~ �@~�vʊzF@����s�@�Ч����@���E�t@�c�@tB\@�4"�мs@�	��R�@��Fc�B@������@��uDz%h@���u!%@�v���"@�g8�	r@�\[Q�f�@�V;,�\@�Tu|�q^@�Wm6=@�_�%ir@�k2���!@�> +��        ?��le�C�?��B���?�.�(���?�n*��zV?���Q7d?��Rhg�?��D(F?󑌑��h?���{d�@ ,|*]Ο@��P(@,=J6�@��I_@����*Q@���}@{��,q@�@�ӯ@߆e(�k@ .�+�Z�@"Ux��@#��ņ�G@& �A��@(!���(�@*[�vP��@,��-R�y@/��L�@0̱qC�@2|Șe@3r<��@4�x���n@6F��u�-@7�E���-@9I�ߕ��@:�`D�B�@<z��	�F@>$@�A�@?�5��@@̺W$@A�yo���@B���Y�@C���^�Y@D�L�W@�@E�\Oe�@F�����@G��@H���U)b@I������@J��ؘ��@Kܢj��/@L��f�@N&(.��@OR�w�E@PByGoa�@P�$;Ѣ@Q|q�0Q>@R_����@R���Y�@Sg��@T��4@T� ��2@Ui׳&�@Vs���@V�kB[�        ?��)w�k?�ԼH2%?�t5J�h7?Ғm�'~?��e��?�Fd��J?􎲂�>l?�QK�>:�@�۪��@
yYf_4�@hΘ@f3c��@e����S@ G��=8@#-A�o�@&�mg�h�@*�65� �@.��+�;@1�ā@4&��B��@6�㧫@9�n��
�@<�Cn���@@��@A��Hf�@C���H`@E��GK�Z@G�"�-��@I�=���]@K�!5���@NN����@Pbk���:@Q��YI�P@S$`�Ԉ@Te�]��@U֡3��@WV��G�@X�0�$�2@Z~1󔎕@\'>_�@]��;�K @_�T?��@`�d��j�@a���b(�@b���6�@c��V8K@d���0�%@e��i���@fò
��%@gݔy�)�@h�jK	�i@j&2�4��@kT��;@l����M�@m�1� �@o
��C@p*�ėO�@p�?��V�@q^��M�@r.@r��bi��@s�\Y\�@tR7Jas$        ?�� �Ϯ\?��xp.�?�Z���?ы�aj�?��y�fX?��/�<�?�!-�h?���"��P@!�?���@	J"��w@B��N+J@p1}Ά�@44Bl�?@�3w�9@"J��[��@%�	��R�@)FZ5:?�@-Er�I�@0�~Y���@3':��y�@5�����K@8b.���@;E�ٹ�@>X�f#@@�'�"~[@B�I�4�@DW����{@FAM�u@HC{��@J^J��@L����a@N�5���U@P��K��@Q�� �`@S,�ͻ�@T�ѫ���@U�G���@W[�s?�@X�!���@Zc�!QC�@[�6b�sk@]�C&M�@_P 4��@`����|s@akɑ4�@bW5���@cH�ɵs�@dA���J@e?��G @fDf~x�@gO�N��@ha8�v@ix�Q3OL@j��^��m@k�k��_ @l�&C;�W@n)22�@oNqB�P:@pE��\'�@p��i��@q������@r4��&��@r�5	<�        ?��:�	�H?��A D��?��F�?��~�{`@	Ѷ�6@qBL��@��J0�@#�j�&@*)���
@0��S��@4�K���@9V2���z@>_)��C�@A�k\�@D��+�9�@H.'�2�f@K�d�U�@Ob�C�=@Q��X��@Sǣ�ŷ@V7���i@XY����@Zмr2P@]ff8��@`9�=q�@av\�-2@b��@du��P�S@f���j�@g�O@eI�@ic��T|a@k%�(�^@l�`f\g@n�k[v�,@pak=���@q_F荷G@rd? K�@spJA��@t�_�_+V@u�w���+@v��	 C@w拥8I�@yv�w�p@zKC&�3�@{��Z��@|�i}*؛@~���-�@f��m[�@�_R
R��@��{U�@��@x@�w?H81�@�0���"@��B:�UT@��B<�5�@�p��¶u@�74�#߹@�"l�ߒ@��Y�Z�@��ׁ���@�r���%@�I��0�@�#�~)��        ?�q�BW?���u$�?�x���?��-�9U�?����`�?�¿�Ko�?�Xs>Pm?�i�E��?�ѷ[�C1?���Wk�2@��;�[B@���F��@
l^r�@�wR��#@��l��Z@�%%��@r� d�@�u6ƅ@�V���@ �=�_�@"�PfP_@${�`i�@&����\@(�*��P�@*�h���@-Lb���@/�� ��@1'��y�@2{�A�dI@3�R�+r{@5I���*1@6��7�g�@8JiU{&@9�y�L@;|�VŬA@=(���@>�[2~�p@@R![��@A:�3}$@B(�p�M@C�v,�@D��Ȧ@Et���@F2��`@G&z䇟a@H7��B�Z@INδȁ%@Jk����{@K�C��]@L�����@M䯜�5U@Os��|@P(��@P�{}�P:@Qj��A�@R�k3�&@R��*R@Sb�����@T�	��@T��2ʚ@Ur�|�x�@V(�p �j@V����        ?�H���^H?��{�%xO?­�uY��?��\��2?��.�ձ?�?�{iv?�!^J?�z)i�#g@�,��!@r��3��@K����@A�}�@a�6feT@!9�đ�m@$�YH�� @(a�(�R@,���ק�@0��>��@2�|4o�@5�IDI@8�\8wbT@;��Mt�@>��U�X@A0���a@C�=�i@E���@@G���h@IDc0�I@K�^B�ɾ@M��f3F-@P=4��%�@Q�V���@R�� ̰@TX�NnM2@UӘQ0E1@W]���@X��0aD~@Z����M�@\O{X��@^U5\D@_�'�U@`��ek@a�gV:`�@b�ohѦ�@cۖ�*�@d��[	o�@e�3V��@g�8�P}@h7g��@i_�'O�@j�)�Kt@kųCZPU@m8 ~K!@nG��z�|@o�!G��@pr�K\R@q`���/@q�u~1�W@r���I�@s9����@s�Om���@t�����@usN� �        ?�ӨU[i�?�����H?���k^?Ҫ3�T<	?��ð��?�]���?���?�*t?�S�q�:'@.h)��@
ev[+�M@�4�+b�@C&ɬ�R@.��%y1@�Ͼ77�@"�^%���@&^PX��@*&h��@.7��*$@1T~�o�@3�`�.{�@6M����M@9���6�@< A�4�@?��s9�@A7@l�4�@B�s�.��@D͔�OZ�@F���s�@H�	?
��@J�N��Z@MCc*t�@OkI�=�;@P���	��@R*#��Q�@Sv��F�@T�HU��@V4�F&�@W�	#K�@Y"4F��@Z�U2�.�@\@��hL@]���@_���@`��c�@a�gZN�@bp?PNF�@c_��^@dS����&@eN�5l@fO����@gV��I��@hcml�
#@iv>U鎮@j�p
�@k��r���@l�r���T@m��p�@o-��U�@p2	J�!�@p�6�%�H@qqTr�ݦ@r`�D@r�Y���        ?�BX���?�a�� _�?�-�f]c ?��FԠ��@
y)��A@���!@Ϗ#0�@$w�>b@*��$���@1A{����@5�v;%�3@:F����@?�.`�L@B��W^�'@E��~���@I?LF )�@L��T\@PqT�7�@R���~�@T�Ť;X�@W.��q��@Y�3<@��@\ZƖ��@_%S�)z�@a	ow��@b����~T@d+i(�,@e֐�Y7�@g�f<��@ia
��@k@F��o!@m0��(>�@o2o	�U+@p��69@q�{�4�@r��5�/Z@s�T	 �@u��-@vP%���@w��>cKB@x��ؖ��@z��T�@{pMh�@�@|̹=L�@~19.*y@�����@��(�ڞ�@�Gk���T@�	��eK�@��Ԯ�w@����i1�@�g�0L,�@�9ߧ�@��c�L@��K�q܄@���E��@���1�@��(#��@�v	���@�b���@�S�B�,@�G?���:@�?�        ?|��e��	?���z� ??��C�Q�?ȓ:�W7?�9�,�)�?�x8���?�;[џ?�0ֹ�y?�6����>?��S�;@ ���P
:@4�#q�u@iwH��@Q|���@q��S�^@�)G��@���I@@R�I�ɘ@J�Ĳ�)@n�m��H@ ����@"�D'���@$o=@���@&Wę&@(U���u@*i"�=\@,��c�E&@.ύ�?@0�0NڽO@1��eZ�@3V󟛉@4K�$�g�@5���)��@6�\�u@8cd�3�@9��f�:=@;P\ɉT@<��E6>@>eq���"@?����X@@�9+L�*@A��)A@B��}��v@Cd3eL#@DI�O�@E4�P��@F#<"V@G2��*@H�GX6�@IG/Dה@JOj[�r@K�(�V@L!%JK��@M0�{�W�@NEl`<�@O]�Ɩ�R@P=t�Qn@P�: �]E@Qa0P@@Q�S�N-@R���6"@S'A^�_@S¤4���        ?�`�[��\?�tLx4J?³���Yz?�
�0�*�?�;&�#N�?��S�;1?���uHt@ "Ϥ�K�@O�{!@LL`�8�@�_��
@���E��@XB�V��@!����~@%X�Y�EX@)@e�)5@-��-K@1�N�o�@3�Ѩ���@6m�#�)�@9d�i��@<�)U��@?�1�6@Aȼ���@C�0���@E����D�@G�AYlq�@J+k�_ @Lq�M���@N�a��Kq@P��1���@R+��@S|�n?4k@T�~~���@Vt�ۅ3�@X̹�
�@Y�;��@[V8�맑@]���@^�����@`]ke���@aR,\ĵu@bNEL�S�@cQ�W�l�@d\�$J;@en�钮K@f�<�=eb@g�$��a@h�l?&�@jQ��@k8i ��@lv��e�@m�I� 4@o	q�hh @p.�ͱ@p��+q�@q���	x�@rC���S@r����Ǥ@s��N��A@ty�'vs@u=���}@v��`�s        ?�J�Ѻ9?��v��U?�� �,�?�`�C	?�Z��XY6?����?��X�?�`âf˩@V��V,@	y�9y� @T$��I@v֩�[�@*H�9>\@s$"^V�@"*���@%j�N��@(�s7 i@,��kPu�@0��z!@2����-"@59�ǵ�0@7�]P+��@:��l�E@=�';*@@N�1ͳU@A�M�Ո�@C�j�7�i@Ew9�PE?@GZ��9Va@IS�:�я@Kb�΂?�@M�>�@�@O�N�:@Qt���@R:���@Sx=����@T�*zѐ�@V���ߞ@Wo��q�@Xמ�G�Z@ZIݰ(��@[Ɨ��M@]M�9"��@^�R�i�@`=�|�,>@a�^�Y@a��+C@b�X�gS�@c�Ʉ3�@d�H�5�@e|�J���@fnXpw(�@gd�X�'@h`N�+�@i`��m-�@je���@kp�	@lv�4�@m��K9�@n�S+���@oș,�ϼ@puJ��t�@q��|        ?�&HKN��?��ZE��?� �|�I?��A�+@D7[";�@9�s�@�H�Sv@#���_�@)8{V�-f@0(�Ƅi`@4.R�
�@8��ץ>�@=���LǪ@A��`\@D��4�;@G�vf]�@K: \�7�@N��՚'�@Qs�TP8@S����>�@Uɴ3���@X$��G�@Z��!RO@];�(��@_�*&Г@ai��l�@b�Z�@du�����@f׉�@g�6N��@i�M4X��@kN�G���@m,�,��@oЌ�@p�f3.d�@q�O����@r� 9�p*@s����y�@t�c��B@u��]�h@w,	����@xb���F@y��Zޤ�@z�v��y@|2��R�@}��мwt@~�3��
@�$(v:��@������@���3L�@�P�X�@�����@��8۰ {@��b ��@�j a��M@�9l�L�>@�?��@��� ڰ@��[��P�@���{�T�@�z7�{@�^8u�@�E�:�        ?�B��u\?�P���LY?� ,ME�}?�Ԩ ��*?����K?�!����?�[>�:�?��-8d!?��N��@ C�)��@��\�@$���,@���k��@�^[���@c(�%�|@2D*Vq@/�l� �@\w
��\@�vÃ��@!�S1f��@#{���@%n.�l@'w$�)@)�����@+�{XY�@.���J�@0=�H��@1yʡr�r@2����$@4V)N�@5py3	��@6�k�-9@8K��t@9�f3?�Z@;PD4�+g@<�^,%�@>T�-3�@@*hV( @@�i�1l@A�U'�@B�ܦ�E�@C�C�=�:@Dy�]	@Epn��@@Ff���1@G`\H!�!@H_<�!s@Ib�����@Jj�ٝ�@Kv�)��#@L��D��@M��G3�1@N�sN�̇@O�/ ��@P{�F��@Q#�J?9@Q�H�;@R:|O<��@RӸk�z�@Sn���.{@T4V��@T�h�U��@UL��<��        ?�/`���?��D��n�?���&el?���Qv?��~���?�x��}?��c���Q?�O\HC=�@���؆"@
O[&n?@�J��:@&��G@�@*#Ȫ�@�q|�^Y@"���nO@&1ݸʚ�@)肚�k@-���f�8@1-��e`�@3�T��k@6���5@8��m}S@;����� @>�TE[��@A:%N�3@B��mȦ0@D��Yy@F�w.�٢@H��%��@J���!�@L�IkN@O?��}P@P�s����@RÎ���@Sf�-=��@T�.���@V,5#`H�@W�k�]�M@Y%��g)@Z�RdPb�@\TgsB@]�:ES��@_���ދ�@`��$�/@a�k�Uy@b��I���@c����ޱ@d���8�S@e��0�@f�\��@g�e>��@hɇ0��@i�|�/x@kH=6�@l=�҃�$@mrm^�(\@n��{D�Y@o�t���@p����(�@qD���6@q�Bܐ@r��a�T$@sQV��O        ?�u�Ca�?�vo�_?�{��J?���d �?�:g
��I?�A��*?�)�5�?����X�@�(%@	/S�a�@Ҝ���@.8=��@щ��Ҷ@	&�j�/@!�e�6@%"��I��@(�K�-�@,6G��B@0TO̏*@2�ԍ�Q@4����{@7�C�g��@:M�w�&@=8)_)�@@'	Rgd�@A����D@Cm,�K@ELAP@�@G/���@I)�N5"@K9�
@M`n��+�@O�����@P��ӊW�@R-�>��]@Sn	�Q@T���T{�@V�թ�@Wr�5��@X�^ic/@ZY+I�K@[�?&F�@]l���t@_2�]@`V�;�j@a/ԡ�@b7�H
@b����@c�L�Ek@d�6UJ�@e��]si@f�����R@g�H����@h�_���>@i��u�m@j��W@k����@m�]M�@n(uğJ@oM�@���@p<�M�nu@p��KC�@qo�u�[�        ?��|�-��?�/m�A�?�/�S;
@ו0�>@
�hl@I��x@��:
@%�ǲ�ְ@,Y��M�K@1�t��)@6B��#��@;�Z��@@�qc�3@B�}�o�V@FmQ��4@I\s2��M@L�e��_�@PY	ɋ�y@R[!IoP@Tz�3�-^@V�u
L�@Y���@[�<�.$k@^���8x@`hLMmfi@a�{�6�0@cD� G4@dȲ
��@fZ�Fd@g����%�@i�k��9�@kd4��@m-�(v�t@o��Zl�@ptܵ���@qm���_@rm�E�~�@ss����@t���mo0@u��3~V>@v�$UK g@w���>4�@x�m|�I@z��w�@{P��r�@|��d��<@}ƒ�b"�@
��V�@�*(̔�/@����@Q�@�|��zB@�*F��]�@�ڰ:�w@���Y�ә@�C�E{�@����%�@��-�K��@�vd���O@�7K��0@���m?@���E��@���=1z@�U��        ?�����V�?������?����=��?ЧH�_�?�qJ��S?��?'��#?�[���?�PD��?��I��U�@�P�D@̼�6��@
i	����@x0�j@}S�F�@x�y}q@�ur�7�@Vs���@˓�5m�@!٨�(�@#�I;4�E@&�F���@(g��*�@*ҵ��]@-[r�DM@0 �Eys@1c'�9��@2�&�1�@4S�[�z@5�\qf"�@7f86�@9*��+�@:��+�&@<�E�f@>��μ;�@@4e�Yv�@A-��%��@B.d~ �@C5�0'�@DD���l@EY4zs�@Fu#?_�@G��FQ��@H���\@I�u��h@K&��-�D@Lcˍ�E@M�XBZ��@N�x97}�@P!u;�@P̮�2�@Q{�{�Y@R-�O���@R����@S�zP+�@TW6'��@U%b�@U�Em-z�@V��a��h@Wf�C�@X1��u��@Y ��1��@Y�}����@Z���P:        ?�I�ۅ�X?�&�,w�?�R��;�G?�yRsSM?�H�\�e?�'����?�\&s�F�@ ����fH@�Gz:��@��ɩ�H@d4@�n��{3@I����a@!�ơ�9@%")'�@(�Be�0@-��o�@0�*��@3;�=�#&@5�HN�{=@8�c�E@;�v�#�@>����6�@A0z��n@B��|���@D��ZD(@F뷶��@I"}Ѷ�@K>R®j�@M�R��SX@O�(���#@Q=��H@R���M�g@S�`{�&@UP��>�@V�u9��h@XH�q��@Y�qџ@[t
e��@]ڪA�0@^�n)�l@`J_;@a1�ȋ@b�:��@c��%@ddD�4@e,�r@f;�

@g#��32T@h7!�c�@iP� .�\@jp��Æ�@k�-r�U/@lÕ$�|�@m�'7���@o.�	��@p6��S�&@p�V��R@q~���@r'l��o�@r����O@s��D�~@t39��M�        ?�<���'?��d,W�O?�#���?�v��My�?⇬#׀q?��u��?����~Ӯ@ -�Pg!@�UD��@&�l�X@�f�bx0@{���X@��4�@!���f@$�ڶ��@(���x�@,�}@�ӎ@0�]����@3��ux�@5�Hɩ��@8���@;�=念>@>����@A��*��@B���?&@D���$*\@F�8r��a@H֜>���@K*�Rgj@MP���l@O�����1@Q�c5�@Rb@� r@S�1��,@U�hk~�@V�`3@�x@X���R�@Y�	wgJ@[%ѯ6��@\��Af��@^tm���@`�0 @`�|��Pt@a�I�/g@b���[�@c���#@d��gA�@e��9�@f�f���@g�#��@h�����@j j���E@k�n��@lCU���@mm���{X@n��K�k�@o�ˡ{�@p��(���@q(�p_j@q�i�^[�@rs�G��@s�~bHT@s�$[5        ?��,ޭ��?��E[��?�Aq!�]Q@[�W*ҍ@y���5?@Yo�uor@!���a�@'���c�B@/��/�@4Jc��@8��>��@>t�"�(�@B>O^]p@E��{�.�@I#۴�&�@M�N�a�@P��D�L@R�?�@U;��ֻJ@W�P,/�@Zt�#F|�@]JZʌ@`"�-�H�@a������@cW(j�6@e��5Z�@f���-«@h��}�@@j�y2�g�@l�|�խ�@n�͚Ls6@pm�D��@q�e���K@r��I��@s۵	�@u!'�!�@vQN@1��@w�*�72i@x�� @zB�nQ�V@{�&H��@} Ls
@~�i�Q+!@�b1j@����ub@������@�N�XL��@���b@��|K�@���"�kj@��+�1@�}��i�7@�`��j�@�F�V��@�1�2@����/�@�{^s�@�����@�� �e@�v����@����'z@����&�@��/{#        ?~�>���?����N�??�.ge�?ɂSJg�K?���P1�?��e��?�ɇ��?���%�ʾ?�_��8?�w ��z@[��9��@ ��x�@	(�2(%@����_�@5v�N�J@�I�~�@�Μ�o;@�����@��r*�<@��{*V@!�=ԫ��@#��c�*�@%���(�@'�?ܛ��@)�'y��@+�.>S�@.�FQ�@07c��õ@1o����Y@2�1�s@4 ��߳Z@5Y)��
@6���:�h@8(w;G��@9�\F+Q�@; F��@<���h7@>?���+�@?�IV@@���l�m@A��Mo#@By4W�@C[U��@DA��1<�@E,���@F\q� @GS���>@H��&�}@I.#lp@J��'܀@K
��R��@L���.l@M �h�@N1���@OF��V�]@P/�.��K@P�44P9�@QNs��>�@Q������@Rt�o���@S
t���@S�'j"�]@T;��i*        ?���ې�?�m��ɳ9?�G����?ҁ�S��?��=�u�?�x�;|��?���O���?��t��3�@d����1@t&|ʕ@gCVQ@���@84+4@ s���@#���\d@'T�ׁ��@+Q,�$��@/��+ЭH@26��PG@4�,�|$@7��$#@:�2Cea@=�V�L�N@@�y�t@BP��/U@D5�`K�$@F5c����@HPn��@J�Օ$?�@L��ќ��@OB��v@P�4�l	@R6��؇I@S���a��@U���4�@V}�<��@XA�C@@Y�$���N@[>�Ů�@\��M�[@^���Tq@`=�r!H�@a*� �R@b<s"Ȩ@c��ߤ{@d���$@e!�%E@=@f0q{ʤ@gE�Ya��@ha�Q��@i�E4;U�@j����@k�V��H�@m���$@nP��&@o�ng���@poMc���@q����@q�J�5�@rr.��!{@s$S�b�n@sٷI�CH@t�Wڵ�        ?�Rh��%m?�^�ȉ5?����?�7w `�?�`�r�?�8~v�M�?�A�G7Z?�Kן@�H�p^@O���M@�l���j@	�-H
o@)��c�@ w�36* @#������@'D.�5�@+1��I�@/|P}�R�@2�P�x�@4��`���@7M-��%@:4,�1��@=M�`@@L*=rd�@B$����@C�m��@Eո��@G�!���@J3�9@LF��轺@N�ɱ��T@P�u=�ȳ@Q��,�qu@S#dn(@T��O�ف@U���*x@Wk6�G�H@X�I�|(@Z�;����@\'��@]Ԩ��y@_�C��@`�$q<X@a�M��B@b�o\V1�@c|��@dy�@e|_5��@f��5Ȇ@g�����@h��3�@i�:�Q>@j�Ɯ45�@l���G�@mBo��&�@nw��+G@o��Th�@pz�	 x@q�˳Rj@q�{�^��@rnA:=3@s�k��@s��ط��        ?�QO+���?��f;su�?��!y�?��['.��@�z�Af�@���p)@+QJL�@"���D��@(���]�%@/��,f��@3�>��Ȩ@8��[}@<�޵���@Ap�+�@C���We[@G���@Jnω#N@Nָ!y�@P�b�=@R�)���@U����v@WV���f@Y�����C@\2,��E@^˛?OS@`�穃b�@b*C��X @c��&�a@e'9LY�@f���]�@h[��@2@j
&2�Ki@k�&��@m�n����@oe�]�n�@p��H*��@q��tAJ@r�A��a@s��,jg@t���G9@u�*q���@v�d]BC�@w�[��@yΑ�U�@z<ض*�Y@{k�{s�s@|�7/�V@}�f���@)O+�@�/�^��@���y @�}.	�@�'ѼU�@��%Q�7�@��T�K2@�7����@�����@�� v�@�^&����@��I�8�@�ه���@���@��T@�^ut�        ?��f�Q�;?�%d���?�U9�d[?�o�:e�?�&L���?�]�K�Ǔ?��&���?��DʝkP?����|]?�8I��52@J'V3�@\����@���Z`@V�=���@����@���c�@ɉ� G�@�'��@d��F@!~����@#c�,�'@%a�F�M@'x|Cl�@)���0}@+����@.Pufh�@0d�NrRr@1� ����@3m㋓a@4a���S�@5��/�{@7FE]oͧ@8�Jnh��@:Z"[V|@;�����@=�0w�QU@?P]Atmb@@��3�*�@Al�?�0�@BX4Zq�Q@CIMs�qX@D@Fm�2@E=��t@F?�-r�@GHQ�J5�@HV���M�@Ij�a��@J��+;��@K���:�@L�LK�t@M�j��,@O$����@P-?��@P�����@Qkz/|ó@R� �"@R��	�v�@S]fǖ�@T����@T����A@Ug�Z�@Vy��@V��V��@        ?�����9u?����˹�?�*���?�O��S�?�U#��?�.* �Q?�H�{�@@��N @�i��u@�����@��l�]@�2`\%+@�6r(�@"�L��@&7ꪐ'[@*=D�27@.���8�@1����@4a(���e@79��R@:J��x�@=��Ȍ�@@��̝��@Blf�� O@Dj_�8o@F��~���@H�+�՚�@KOJd�@M��V[��@P���~�@Qp��f�@RۜK��@TW+�G�@U��<�1'@W~�q�l@Y+uc��4@Z�Ke>�@\�3A�?X@^��
���@`B}�L@aB-��@bJ�3�@c\%��\a@dv�V��@e��9 ,
@f��e� �@g����@i4��/�D@jz^���@k��±Ԙ@m M��=@n��	:2�@o���oq.@p�&�_�J@qk�Y��8@r.mR5\@r����d�@s��B%o@t�ރ��@udF��K@v=C
��@wֆ�G�@w�d5	�        ?��Y
��?�Ql�i��?Ē����?ռ�0{�?�y��ަL?�Z�\e�i?�j��ք)@ ��:��@m��n��@e����U@����d�@gG���B@����kz@!Hm*��@$����@()ł�Q@,���e_@02�ǧE�@2��͢�^@5����@@7��q�(@:��1�?@=����x|@@g�-b�@B�zz��@C� ���@E�ݏ':@G�]�'ػ@IՂYo��@K�JN�@�@N@�5L@PL�.E�@Q��Sc�@R�)�]L�@T��e@Utn��<Q@Vۜz>�@XNr�>�i@Y���$0�@[V�)��L@\얻"@^���C��@`(��@`�*�|-]@a������@b�7z���@c�4	�@d��A��}@e��~�܎@f���b7@g��^,P�@h����K'@i������@j�A��Ɂ@k�,ڻb�@l�p��@n U(��@oH���pe@p;}W�#�@p�'u��?@qqi����@r?���0@r������        ?����V7?��0>���?����?G�@�g��;@8	�Pd@�#�'{@#IS)�M�@*p�8a_e@1kA�}C@6@-od��@;�Bc7*@@�B����@DO��ć@H�	��$@L���@P=�x@R�	Q� �@U&B�0��@W���0�J@Z��M�A@]�b&���@`����@b>�+(�@d^
	�E@e�ؐ�/�@g�G@i���hx�@l)Lj�\�@nkNQF��@pbg�9�t@q��ѵt@r�?�(�@t/dVr�@u�c,�ĩ@v�E��@xg6~ݓ@y���ے@{r�C�@}
q!#Ѵ@~�\2�i
@�/4���S@�P�Hx�@���H@������m@��Lˉ D@���ݼ-�@���Vx#@�(��@�ˤ�6o�@���o��@��_�8�@�;��@�-�Dj.b@�U��@����7�.@��K�]�@�yav��K@���hq�@�����b@�c����v@�p��D@������@�iB�t��        ?�g�D�)�?�5��Q�?�$�8�R�?�u}}��7?ך�);?�E-���7?�L�lYV\?����%?��N�Ch�?��{��J@�d�vd�@���@
��
Lt@�x:��?@p��tk�@;Kq@8���-�@i���o@�hn��@!3F�%@# :�r�@%��T�@'2$d�J�@)eC��>@+�m�X�@.�y̧@0LW�t�_@1�.`3�@2�Ƃ��@4YS��@5�8A�@7K˨9�1@8� jw	�@:q�s�@<�[m@=ȑ��bn@?���;@@���b_1@A���X�@B�f�� 0@C~_!mL@D|{M؋�@E��.��k@F�	׭&%@G�o�#�@H��:�ռ@I�W�?��@J�̲�:@L;��N�@MG���@N{�e�j@O�K�Q�@P{F;u��@Q^r �@Q�m��U@Rmp�J�@Sgn�\�@S�P�:A@Tz)
��(@U.�:�3�@U槰2�@V�K�e��@W^�pV1�        ?�ᩁ��8?��/�5,=?� ^�/�?�3���̍?��l�0z?��9�?oG?�:��@ �e;���@�VhM@���%�@���(@ٸG6B@YuG�<@!�%B��$@%8�
��@)
���4@-<��I��@0�q�reS@3d�k'�@6e-W2@8�Gv�x@<y,`�@?[��p�@Aod]��@CL�36@ED��'@GW�@I��-�z�@KӞ��cs@N;�q[�@P`f_c@Q�5�a��@S|Q*��@T~O,��*@U�ËV��@W��7�Q@Y���g�@ZȮ�Y�u@\�i���a@^G �Lh�@`q�30@a ݵH��@a��!��K@b�qå��@d����*@ev��@f.�x3��@gOy�C�@hvٰ��@i�Uz��@j݃�]ז@lg�
��@mc��@n�X��
.@p�YLq@p��C�ə@qe[枻*@r����@r�w���@s��� �+@tW�:f�@uD?@u����1        ?��F;��?����]n?�~�%sp�?���y5�?��H�(�?�2$V�?�����?�],�<?�@h��O@@��@I�@"l���@��}�_#@ԉDt�@ �|n�E@$E�2s�@'�R�@�@+�i��e@0&�d�@2�j.2�@5B�@7�CIeF�@:ƐT&�@=��m��@@�u3�j-@Bcb ଶ@D@ñC��@F7�RB=�@HHzjU��@Js��X@L���4@OB4$h@Pǈ���@RF�)}@Sgȴ�g@T˺�/ܢ@V<�m�a�@W��	�@YGt���@Z���M��@\��n�@^<-�|S@_�=nt�p@`�����@aմB�ȳ@b�M�Ǯ�@c��&K�)@d�9\쉮@eՓ�f w@f�ຈ�]@g�#y��8@i^����@jD�Xx��@kq�˱��@l����U@m�(�n��@o#Z�͡�@p6G��t%@p�c5��@q� �X��@r9�W��@r����;�@s����@t[�	���        ?��d�?����wa�?�����@�#���@�%�!>�@Ĵ���@ ��Øfc@'u�
Cn@.h"��c@3w���@8NY6,��@=��"	m@Aݮ��XH@E*l]N��@Hûr��n@L�5M��@Po0f���@R�X�8@U�*�Y�@W��L��@Z`ԍ�@]?�}@`"���]�@a�Xv�#�@ce��>@e$���,�@f�K��+@hߠO��a@j����h@l�Q���@o�b�ƪ@p���4��@q�,4�*@r�ֱ��@t1.���@uu$�@v��v_�j@xe��s@y{��+�)@z琽J�{@|])��?@}ܔ����@f �ҿ�@�|��:tZ@�KM���@�ߓq�@��arA�@���0�@��(����@��iC��v@���s��@�{��[�@�q�I�a@�lJՠ��@�k��պ�@�pb��N@�y�j�@h@����:�h@���م@@��?��@�gS�$�c@���Ĭ@���u=d_        ?}e���?��0�r�?�=mMKy?Ȫ�JW
�?�J�@��?��ks��?�ժs���?�Kd�?�f��xn?�;�8ms@ ��$t@��J˷@�ʚ%i�@����E @�}R� @v6�+��@;7I�@0�u��@W�q�IS@�J�&vR@!���/K�@#xϣ�&�@%n��S	@'{�n���@)�~�~�@+߁�(��@.5��M�@0QǤD[�@1��_�
@2�ken�C@4=���@5�}7�@7���"�@8�%Y|�0@:�\��o@;���`��@=Oa��.@>��(��@@W�0%>�@A7�����@B����@C�m�@C�����@D��4�@E��y��@F닭��@G�j�{6@H�y�k�@J�D/�b@K!�/R �@L<0?�@M[h��
@N���^�@O�t�@Pk��$@QG�W��@Q���v�<@R=�'���@R���7��@S�rtԉ@T$���&�@Tˀ����@Utym��        ?���z�g?�l�
+.�?��cYT��?��xZ?�$F��@?�Y�$L?j?��|J}�?���Ov*@��;R@	爇��@���x�@'w��@�2��\3@�l�<�|@"��_�lB@&c��>b@*8<1�K@.i�D���@1}A���@@3�"�T�@6�l����@9|��Q@<�k�J��@?ϋ��N@A�u�Ώ@Cy��V��@EjR
��"@Gu�aS6@I���Ϸ�@K��ѧ!�@N<`fS.@PZƾvr@Q�@��@R��?(�@Td;���@UؗcN;#@W[/�� &@X��yz�@Z��u��A@\7�K錃@]�Qx2�p@_���T�@`�]`>ۂ@a�fm�:@b��>�yN@c�ӫ*y�@d�4����@eЯ5��@f�?Q�@h��Q��@i)��C��@jUN�h<N@k��Hyq@l��X��@n�Q�q@oJVu-}y@pL��z�e@p�Z����@q��8<@rWjm�#@s���.@s�M�.s|@t�k	��        ?� �dH,?���~Y�?��r���?���'gz?�CZ���?�p Pp?�jϳ�`?��8c�$�@��I@	W=�=�@X�;x�@�>s�Jd@y:��@�H�}V=@"�a@@%�����@)ŝKbZ@-�=k�eJ@139�3�5@3���j�@6B7��l@9&��@<�M	��@?J���@AY5S�ۘ@C&�k�m@E
X�,�@G^����@I*ܥV�G@K`�-I�3@M�壷�!@P��89�@QP�`�a�@R���D��@S�.�@Ui%ſ��@V�Qve�@Xg�!�D @Y�
3;�@[����@]J���@_�NRؐ@`hOz��@aS�&��:@bFub.��@c?�Q;�%@d?�]�h@eF��Ϩ�@fT]�s
@gh�"$��@h�"���@i�9�hq-@j���/J@k��& h @m5I�Y�@nr�ngB�@o����T�@p��� %/@q)�k��@qսX�q�@r�S�\67@s8L��`i@s�z�q�        ?�cN��/0?ѣ�?;J?�ɇ��t?�����`@j1��N�@�O|e@^�7��`@ ��5|�1@&7�ۤ@,ye5XJ@1�+� kW@5�nk��@:)x]�1�@>�/�_�8@B"/��@D��߉\@H�h�`�@K[V��@N�}��$�@QN, !2&@SH�Oʜ�@U`�0�?@W�{�)J@Y�(a�qP@\O���@^�:��@`��]��@b��tN@c�p���@e74�g@f���@h(��F9@i�G��@k�b_F&@m?��\C�@o��o��@ps�Fu��@qg��ͭ;@rb�� �@sc�$�UA@tkƚ\�@uz$��:K@v��%�@w�Bu#�@x�잖e�@y��q���@{":�װ@|V�'�9�@}�x���+@~�J�z�@��/��6@���3w�L@�\\�sŋ@��D�[@���@�@�i�9ނ@�����@��˾�z@��C�9c;@�M3H1�@��]f��@��l'L@���إ�        ?~��р?���C%x?����W(?�)T�-�?ւMW2*?�h\	�ZY?���%A?�	�2���?�K���V�?�H}�G�@�>@9מѸ�@	Q�3?@�T��@Nm�Rqd@�(D�R9@�9[3�@��|��L@ш�*�L@ p70�@!��A��@#��BOw@%�QB`�@'���-"�@)�\k�7@,����@._��Ҵ�@0d��5@1�R89��@2���@4I�5�x�@5��{�w�@7�] !7@8��H�}p@:��3�s@;��Di�@=N^���\@>���֭�@@V@A6�)j�@B�i+�@C1ʖ��@C�2��@D�����@E�	J�g@F��l���@G�>�
@I:2�)@J�J=�C@K+��<�<@LI��SM@Mmk�R�@N��~���@O�}�m�@P|D�.ON@Q���@Q�����h@RZ��sП@R���$@S��	���@TR�ٽ�@T�*�X >@U� `S��        ?��ᓟ�=?��ǌ�X?��%�b~?��D���$?�;�ue�=?�X(�9/�?�ԆA��<?�=�U�r�@D�Q��@	k�5*r�@Q��(�@y�|N��@6��i�@��!/?@"=�n[9�@%���kU2@)"�*��@-͍)fW@0�?a-7&@2�&�=�@5o�r^�@8�${h@:��`*̺@=�[v��.@@�d���@B2/�_@C��B�˱@E�ٳ~aL@G��l�:�@Iĭ2,&�@K�_�T,@N�v1�!@P1:4'�T@Qbm�v�G@R�y�@S�3\wh�@U:�UZ��@V�ě[b�@X4��q�@Yz�I��@Z�W�2�c@\��k�@^ ='W�@_�~߀8�@`�"�T'�@a�0�x�@bx惁�V@caB)��@dO@Źk @eB��.@f<T�v�@g:�#�&�@h?]�T��@iI]���@jX�%�'@knD���@l���ڇ�@m���(,�@n�rcC>�@o��c�9@p����@q0	�e��@qͺ��         ?�B�T���?��5�`�?��E��,?�$�*%??�i{4�9�?�j�7P�H?�}u�Λs?�����@e��@ڻ��H�@tP@��cg�s@�m���*@ �'����@$@���Z�@'���,@,Ӧw~I@0<t�=x@2�r	cQ@5D��_��@8]8x�@;9נ��@>Q�F_>@@ߢH[o@B�%�<W^@D��/=-@F�d{ �@HȈ����@KEh�[�@Ma�p�E@O�#�u?L@Q5E�	1*@R��H4�l@S���)��@Ue~����@V�A�@Xw@"�!@Z�~%R�@[���%Z@]|մ��@_E��B�@`������@a�y�Q62@b{m����@c|V���@d���6Q�@e����@f�Eg��W@gǨ�P�@h�k�@jz�9q@kI�d�h#@l�0�16�@m�m)*�@o
�s/��@p,>`�@p֞��m@q�a�n�@r5�� ��@r���*��@s��7Uc�@t\�[W�1@uG2H:        ?�r�>v"s?�ɦy��-?�;�/7�?���jL%@�&�;�@dEyk�'@K���O@#El_��@)i+����@0;�4�M@49�KP��@8�0�ƣ�@=��(z�@A��(���@Dq��ѫ@G�m)�R
@K1,��x@N��G��@QI~��m@SZ
Z�i�@U�!���@Wֹ�|�y@ZBȖ�C:@\�>�S��@_v�{�9@a��*=a@b�+��@d�Qq��@e�\�Y��@gB�84_�@h�9�T�@j�����Z@ly����9@nS��)�@p-;��#@q��oE�@rd���@s&n�k�>@t7�?Go@uO����@vo�;� @w�aD�@x��s��@y�*1E�@{2�t͛�@|t�^Z�g@}� %w@FV��@�2�6��]@���5��@�����+@�I�7o�Q@�.'���@����	5j@��Z5W@�Cۧ?+@�
nA��;@���\�N@�����@�s��
�"@�H(kTW\@� �p_a@��Yo��        ?~ؓ�?�Jl?��?��kXZ�?�x���A?��Ђ�X�?៌�$�?�Wy�
��?�FJU1�?���[e�K?�������@�`֦��@��=n�@	���E�u@H��G@�J��@@�]�@���q@u�A�@T�}�"@ ^�&jri@"+ ��6@$䯳h8@&C��k^@(#$8C�X@*Q���{5@,��5�|@.��'/�@0�&�u@2 ���@3Un�\�@4�����Y@6$)�@7�­�@9$p���k@:�.+\�L@<VPk�`3@>�0��h@?����@@��K��@A�.���@B��&�1@C���5J@D��ɼM@E�Z��Y@F�%��3@G��R�\@H�4@I����@J�Iԥ!�@L	�����@M5!��#@Nf�_Q�.@O��{FZ�@Pn=0U;@QJ�M�@Q�j�H��@R]�����@S���9@S�%��Hu@Th{���s@U��k�N@U�0�ZbB@V��Em��        ?�G���;?�1�2��?�� �?�-v�(�?�}_��R?�߾�u2S?�N{���?�7�Y@�Y�ǭ�@
I ��@��,<4�@H����@E~c�@��s@#�v��@&�W�N�@*j;�0@.��Ɔ�u@1�8+�@4�CY<I@6�C}��@9��t�;@<��`q�@?�d�i"@A���~@CkG��;6@ES�Wdb5@GU�'@Iq@��+�@K�b���@M�9v��@P.�\��@Qp!ѺN@R�GI�@T^36�@U�iK���@V�i/��@Xx]�rR:@ZD�/��@[���L@]K䴆E@_�eH��@`b]�@aI�f��@b8a�@c,�B�-@d'��&�@e)�>@f0��b�B@g?Y��z@hS�uDcD@inw�Z��@j���-\@k�"��$X@l���,�@n�.'@oS+�P�@pI�&��@p�'/"�@q��L�+@r=�$:k@r韰@D�@s�<n�j        ?��m)1?��ᯃ�q?��k�W�?�0OM8��?�}L* �?��kO+��?�=άip�?���k)b@�E�h�@
c��e�@{�S@�<��@��8m�@Э,��@"�� ��@&B��w��@*X�scs@."݆�z�@1Mp�Y @3����@6O�;�S�@9��ӽ@<����@?7�w���@AH^^�r3@C[��V@D��ݚ�+@F�b�,~�@H�Q]��@K�w��@MZϸ@�@O�A�F�@Q�)6� @RZTy�@S���צ�@U@�B�@VxB��d@W�ݝC
@Yv�2�@[�J8{@\�P� ��@^QUȕ�B@`y�vl�@`�*�@a����~@b��\>A�@c���?��@d��פ��@e���<
�@f���`o�@gſ�I��@h�J���G@i�&�}��@kT~�iO@l=�M��@mk���_@n�ɷ��@o�@�-�@p��R���@q1���@@q��Q��@r����u@s.�|y�u        ?�GZ	���?�q|1�&�?��_��[?�X�>��@�J�;�@%��W*@�~��9@#v��@)*��z:�@0��vI@4�l�)@8��[��@=nO���@Aj@�a��@D[._�@G�XŬ]0@J�L�~@N��Ģes@QHO��I-@S]�Z�E]@U�{�y;@W���N@Z^���`%@\��@_�����@a@�?RC�@b���Q�@dG��{�@e�e�+e@g��i{�@iL0WU=@k�Ƿ��@l��I��@n�-)f�@ppR~CB@qw$7;�=@r�(nP�@s��!]g�@t��F�@u�򼀧@w��I@xH��s�@y� V�X@z�w1+@|Z��@@}uG_@�@~�]���@��
[M@����"�@����p�V@�P,��>@��"���@��]���3@�����@�v��e�r@�JB�ʬ�@�!��߉�@��p���@����t�@��fcK@���� @������@��#�lD        ?����EJ]?�� o�_a?�K���-?ͮ���F?ف_W��?��JW?�A�1�tw?�3��q�?�5�\/�?��[����@��_ܶ@�,��I�@�m�@m�G�@�7
�@�{�I�'@�B�w_@�r"��@8K� 	@!\�CҲH@#4A�L.@%"��1�%@'(L1�2@)D=
,b@+v�-�u�@-����@0��;�@1J�G�6�@2��3�3�@3����@5>}�k?@6��s�-;@8<P���@9�u�]G�@;v�w��@<�%�D(�@>MhS\� @?�%�]�@@ӣ�F�q@A��@�F@B�0_sue@C}�q;|@Dk�@E]�|&a�@FT�Vl��@GQR> �@HR�f�}�@IX|���@Jc4�,2�@Kr���@L��d�r�@M�\���@N���@e@O�o62�@P�c\&��@Q�NA@Q�w�I@RIY�uN@R�q��u�@S��Cj@T$5�;2,@T��<u(�@Uk�?o<        ?�8<pt�?�����W?�T���?ց��1/?�1&��*�?�J�6��?�g�s�@Ml�q@��SA�@�	�y�@�a��H@ǽP�$�@s���F�@"j���Z5@%�s�u7t@)�����@.;���d�@1y�e��@4	Ћ�1�@6�{�:�@9���|�@<�jEԼ+@@0�t]l6@B C�]�@C�����@E�5-�Ȭ@H����@JZX�(�7@L�����@O4S�y�@P�Zy��[@RAN֭�|@S��@I9T@U#b��)@V���@X@���@Y儑r:�@[�H�^@][��@_-}���W@`��?t��@a~����@b}�00>�@c�e�	*@d�opb @e��a��@f�ч�K�@g�%��T�@i�[��@jH2S-@k���;4z@l�}>��B@nȱ���@o^qԁ��@p[;I��a@q
�j��@q�E1%l?@ruJyy�;@s/��g@s�O�/N@t�M�j�"@uu��ޖ�@v?8��{�        ?�S�<�VT?��qB���?��4��<U?���s�T�?�4����?�<"�J?󱐜�û?��q*Y��@	,���6@	����@����[@t��ʓ@������@ޅ��@!�B�G7�@$�	�'@(zd*kxE@,F�x�Eh@01�?5)@2i�ʛ=�@4�.�鋡@7V��ݣ�@:�p3j@<�ѡ)@?��@��@A��.�H�@CH�{��@E|f��b@F�	1-@H�x����@J���@M�O�CB@O8��2�n@P�^�⭪@Q�<�f�k@S,�?�@Tq��>[�@U�[''�@W�6��1@X�@���@Y��p�R�@[q��E�M@\���tm@^�al�<N@`~׬0�@`�1���@a�EK�;�@b���b@c�{��@dk�@M|@eY��}�@fM��U{@gF�lfA@hD�+b�@iH�s/�@jP�n��@k^M�y�@lqY)<@m� <Tj�@n��Si�@o�짗4K@pwqd�NE@qfYPw�        ?�g����t?אo�e��?���>@ �o��@��7��@�g0�mv@&ͤD�@%X���~h@,�����@1완
�^@6L'<�/�@;,S��x8@@F��u��@C8��D1@Fk~O�Ф@I��ۃfq@M��8���@P�ʚ�
@R�5�9�@U!j
�&�@W�<��D6@Z �)�B@\� ��BJ@_b�Eb[n@a"ﱽֱ@b����s@d7>�~]�@e��P5�V@g�aѡ?@iPgh�G@k#�U�ñ@m��a�@n�8���@pket��@q�)�i�@r��j6��@s�?����@tՀ���@u�����@w/1�M��@xg�V�@y�����k@z���#@|>���@}���J�@~�:��d@�+��@�O@��0<��S@��[���@�Y��i�@���aV�@��$`~[�@��9�	o@�r�(���@�A�Ӽ�@�P:f�@��6���^@�Á�Ǣ@��*���@��)g�c�@�cx�L�o@�J��q�@�3�.O�        ?���v+?�XU}z�?������?� ���jw?����`<?�F���?���??��T���?�Ġ��s?�v��k�h@~�X8�@��/���@Ht$��@��:��@b6V��@S�v�S@|o%���@��Wv܍@ :�S4}@"#4e���@$'��s@&I�?9?@(��CS��@*����@-W�m���@/�O�;@1N*?t�d@2�����@4*�"@5�����I@7?���@8� ��y@:����@<K�i�x@>h(�Y�@?�%�*m@@쐼���@A���|�@B��9�E@C�_{�@ER��_�@F�@5�@G8�9.*M@H^P���A@I��P9��@J�� ~0@K�v�_t@M9�U���@N�f���@O�C���H@P��J���@QB�8�@Q�����i@R��g�P@SaM��j5@T	-��|@T�G��B@U�g�L�@Vd����@W,�NъX@W��4��@Xȅ����@Y�)|�ef        ?��W���?�E��}�?�,���?�M���?�P�ʘ��?����	!3?�Z���B?���w��@��ak*p@�k����@h��}@��Ki@z�"��@!Cj��@$�l?A��@(b�@ॾ@,����@0��湜/@2�+��Y@5����a�@8r/����@;��>�I�@>�n�2~@AN{���@B��P%��@D�!�1@F�g}AX�@I(�!?�@Kq��k��@M�`s��y@P,�)���@Q|tr�B"@Rڔj}�@TGE,��;@U�A�@WL�s*�&@X�!���$@Z�rc��c@\Bz�;G5@^=����@_ڿ���@`ހ�<b:@a�A�b@b��!ʪ@c�.�Xm@d��(
�F@f�$[�t@g Q�nh�@hE�6��@iqLd��@j��ї!X@k߹���@m!��N��@nk�zud@o�m��NH@p�R��A@q:�t�@q�~y�@r����EM@s_?Q���@t��cD�@tߌH�K'@u�#�b\�        ?�(�G��?���E+j?�ء��F�?�W�hh3?�)x��?�y�z�e?�/H�N�?���ɳ��@�~<�_y@o��@AX� �,@�p���"@9��x�@!��ͧ@$r6�Q��@($�@��@,5���@0S!�w�Q@2�Z"�q�@5WU�D��@8$��=O@;%�v*�u@>ZFF8{�@@���ɬ@B�����@D�{�PC?@F�'���@H��"O�@J��H40@MPX���@O�@0�S}@Q'�H�&�@R|wI�|@S���X��@UOJK�@V͑{@XYȝ]f@Y��	/�	@[�H���@]R���@_��}�@`s����v@acʧeC�@bZ�Y�ե@cXC}$�^@d\���'�@ehD���Z@fz��_n�@g��^��@h�xM|]@i��T�B@kaN}@l;\ܫ�
@mu�ʕ�5@n�1��~@o��~�*b@p���9��@qP��j�@q���W�@r�cԍ�Z@sc\h�@t}A*W�@t��M7�K        ?��@9�s�?���-��?��w�R=?���jc@�@L<dIx�@D$LY�@�T#M@%-�2��.@+��<χ @1��e�z@6S~��k@;J}�D�@@e~Ajc*@Ck�̑!�@F���+*`@JL�2�B�@N)Xy@Q'8�3�f@S^e=?@o@U�o�%�@X;����'@Z����@]�̅�4N@`O�u���@a�3A�3�@cy��͜�@e+��~@f�Wg@h�֦��X@j���_@l�I����@n�Q&}�@pp�t��@q�VM4��@r�m�� e@s��!�J�@uo.s�@vSH��*@w�TVV��@xsF�@zI�Pp@{�^Q)��@}����@~�����@�	i�h�@��k\�T@��6<��W@�cu#y�@�5!�F�@�5���@�媗Uz�@��y��|Q@����m̯@��	�4?n@�z��b@�j�g�Q#@�^�Y�$:@�W-�X�@�S��3�@�TT���@�Y�ᔞ@�a�Xӭ@�7jԞ��        ?��ȝ&��?���)8v?��ф�Q�?ζ?;��~?�+mX��?�:��B�?��x> ?�vK@8�}?�^�c��@ 	��b�V@�W�Iaq@���n�@}����@�m�LT@e[��J�@E���@Yï*��@����Y�@ =hw<@!����Ϝ@#��J�a@%��y��@(�ª @*U{��@,��f,I@/-'��3d@0�
���@295B�I@3�$���@5�5��@6���j�@8#�ǯ�@9�_x��@;l�^/
@=& �v�@>�Vr9M�@@a^.׺(@AS (�Z@BK�=р@CK�ð�@DR��B�@E`�b`�V@Fu���@G�1mXS@H�i�p�@I���s�@K;�;U)@LI�%�J@M��	@N�Tq�@PH�� 7@P�\�4/@Qe�� �@R�i�#@R�ON!Tc@S�1`<0�@T>�����@T�IO
3{@U�x],@V�ga4v@WN{���@XQ����@X��="N-        ?�GW7?�?�O�7��?�� ���?���hi�[?��C���?�a�� ?���zBy�?�N6���t@��ۭg3@
a6D��@���2	@D2���e@3�Ȱf@�4�ݜ�@"���}$ @&p}�٬�@*:uY{>e@.^�8�@1oIg�kJ@3��8c�@6|{�E�@9Kg�:@<J��u��@?{`���@Aoj�m@C9��"��@E�}Q�i@G��ln@I3a��f@Ke8�x�Q@M�c*�8l@P
k���@QL�� w8@R��?�@S���m�@U_�ʔ|@V���~@X[�av�@Y��\��@[�"�V_�@]=��`�#@^�g��@`b���@aOG��O@bB�=$��@c=J���@d?�2@eHP�3�@fX;���@go��M�@h�[ �l@i��|���@j��z�&@l�J}-@mP��QK@n�E�n��@o�I��h�@p�J�ޮ@qC� v�P@q�l�h@r� v���@s^b	��@tM�Y?*        ?��Ր�x?�n�,�
?����k?����5�?��4���?� {u�&?�H� �?��C���@���N�;@	}ު9@��H�@ 蒂T0@ƌ/j*@ٚ�pD@!�0��.@%%�)fl@(��&`�,@,���%Z@0_�_�Q�@2��&�@5p��XU@7�O�� K@:t��'��@=hߝ�\�@@E>�]@A���yt@C����3X@E��q��k@Go#b�se@It �6�c@K����(@M�Y���@P���G@Q;4o,��@Ry���e�@S�=>Ֆ@U��z�@V}�'��@W��2��s@Yh�F�*q@Z�u4���@\��/��@^%~�BOh@_ҮQhb@`�,)�p@a�@|��-@b�����@c�-���@dx	_q@et)�S@fv�30dz@g8��}�@h�(CT�@i�\���@j��]�@k���=b�@m��k�@n6М��@okO���[@pS���@p�=�ol@q�,�2d@r=�E�1�        ?�����M?ץ'z�?�9l�9Q?��J���@RZ3i�\@b&�J@f�\akp@$ļ]e�@+F�%���@1^�#�@5��U�6�@:E*�W@?s���1B@B�嵄�L@E�\b4Y@H��~��C@L��T��@P2�N�k@R>|�w�U@Tj��m�d@V�"��P�@Y&i	�%@[�ǲ�QR@^fa�&I�@`�.��q�@b�Y5s@c����@e<�C��@f���O2@h�7�-�/@jt�%�`�@lT�wǟ�@nE�?�$@p$3��@q-���1P@r@#+�@s[0����@t~�"J�Q@u�Z	���@v�~|ҙ�@x^���@ye yud@z�g.Z�@|�<��@}m�W���@~�.�e�@�$�@�j�@��H ��-@���I�@�j2�"�@�4�u㔽@�5"3@��t�F@��/��u@����}_@�h��@�K��t�@�3��o�y@������@����@����^@��%�'<@��qd���        ?��(wϽ?�� ] �>?�S�6lH?ʲ!�"�?��E���?Ḳ���?�nĀ*.?�L�(r��?��=�%"�?�����L@�r�A�:@i.��VP@	}�d?�@��Hp�@[`��p�@�]����@�UC#M�@��im@��w��@�XC#�J@!�2��$@#���u/H@%f8NKh�@'`�m
�T@)p�^k`�@+�/�g�@-�B�V��@0μB?�@1C�s��s@2����7"@3�Z�z�@5Qg���@6v�ZP�@7��d�F@9M�u[�w@:ȋ���-@<Ml����@=�X'}�@?uE�.e�@@�k��@Ab��r�@B=�]zJ@CR�d@D��J+�@D���aJ�@E�,ʦ$@F�Q��w�@G�[�<ң@H�D�-`�@I��j6@JҘ�w.@K�� #QN@L�#��@N��W��@O ��ޤb@P�e�r@P�����@QF5�l�@Q��&!�b@Ru�>(�z@S��6@S�%���@TM��K>        ?��^uR�?�I%~<�?�c/s7�?�F�5��?��]r>{9?�
���]S?�r��\k�?�@�=ˌ@
��4�@
��ȖW:@ @���@��kc�@�NX���@ ,�W%A@#av�u�@&�)euߪ@*݊�mT�@/(���@1�l^���@4q�A5[�@7+)�aҖ@:\��1�@=6���2@@EF$�U�@B	I�L�@C��$��@E��\�K@G����_@J#�����@Lm]�@N�bp#�j@P�T�/0@Q�$��Ŗ@SR�[Q@T����R(@V2�~���@W��3� @YJ��;+)@Z�7<�@\���c|-@^U�����@`��,�@`�7�
7@a�RL.@b�mpvf@c�ETC@d��!�@fק�,z@g
�x�7@h5H\�n�@iY�?<�A@j��W��,@k�Ng$>@l���IW�@n1C��[@ox�?�z1@pc�<>��@q���tn@q�ꩁo@rn���@s$2}��@s��X��@t���6��        ?��Az�J?���?��'7�ml?��׫#�?ޭJ���?��J����?�ձ?�Ò?��L/^��@]L��g�@CCl�1$@/���I@�q��@@@&W��5�@I�!��@!��Es$�@$������@(,yIz@+�H��3v@0�~~8�@2I�@�	�@4��_@7A��L�@9��<���@<�@S�-@?�����n@A���4�@CT��Qˡ@E"J!Gt�@G4C#S@I tx�d@Kk��q�@M9òR@OwJ!.g@P�wز�@R�Q=��@S\���@T�fٽH5@VfQ��@Wd\��@X�/�M�@ZK�f�N@[�8��@]_�I}f}@^��bW�b@`P1�4��@a(�1�J�@b�9,"�@b���@c����k(@d�?M��@e���{�@f�1&�*8@g��+��@h���j�@i����@jȘ�K�@k܄�6~@l��U���@n7Q��L@o7�����@p0v ��@pǎ,��7@qa?�l�        ?��@m��?��]��
?��S5"?�#j�HH@��1�U=@����@�{2��@!���_�}@'/�8;�g@-�oݣ�f@2u��A�@6����@;��_#=@?��:@B��ֱ{@E��,H@H����|c@K�7��׼@O�.���@Q��1;/@S�ӏ��.@U�lj�b�@W�[H���@Z6{k"��@\���N�@_#��/�y@`�,�J�@b=Ū�R�@c��0g�B@egL%��@f�LA{��@h3)�/�u@i��A��@k{��:@m3垷�@n�nY�,�@pdF���7@qS9�R�[@rH�� �@sD@VY��@tFNw�,F@uN�ۂ��@v]t�5a)@wr���9�@x��H��.@y���&q�@z׸� @|	T0�k@}:�r�N�@~uf�q=�@�a�G�@�~����3@�%aE��@��	�jSY@�{�U�c@�+b
{/@���u'c@������@�L.�ޞ@�� �@��
��@��R��,�@�K{�D&N        ?� ��Ώo?�^�Z54�?���Cu)?Ї	�[�?��hkP�?�ǔ���?&��?��	-;�?�)� �@v@-�	�m@5�{�@	��&VX@������@�1=iD�@̼$��+@��¯M?@-/iF@�ȗ�{@!3-U}l@#)�I%��@%;,5��l@'gx� @)�yNX@,&Oe��@.���B�@0��e�z@1�W��X�@3J�����@4���B��@69��w�N@7�5@>�@9[rk>�@:�?�r�@<����Vn@>l4��@@��ߘ$@A0�♽@A��O\K@B�ٍt3@C�'ߨ{�@D�+�U4@E�-����@G�0�3�@H��=H@I0�^�6@JP��)�@KvG}�8@L���,1@M�
�6�@O
Ay|g@P#��y�@P��1�@Qi#��!�@R1 ���@R���bs@Sf�9!J`@T<����@TȁA���@U}��3!>@V5\=�@V��SRp"@W�6trK�@Xm8���        ?���V��?��7���?�ˊ��?Թ��ab?��X��?��Q��߀?�U��~��?����3�@�t<0@U �h@%<�̠�@�r���X@�}� L�@ ��H��@$/�<�l=@'Τ���@+�N�0g�@0I�c'@2i��~��@4�{e	@7�)H8@:�a�s@=���8�@@�E9�#{@BB����[@D�6Y�>@Fv�3%@H]9��Q@J?�	�T@L~J�L�@N�cak�@P��I��*@Q�t���#@S;���E@T���3m�@V��!@W~Ye��@Y;���@Z��Z��@\2�v�[@]ݟD� �@_����@`�l� ��@a���w�Z@b�%�i2y@cw�k�[�@dr�F�Y@et��9@f{����w@g�0��%@h� �xDD@i��h7<�@j��ك�@k�P"� @m)�m�¡@n\�{j�@o�v�P@piv"�:@q��
(�@q��#� �@rY��9�@s;S@s�Q���        ?�u��75�?�BO�Z��?��U)��?�����?�W	!�<?�oC �.?�Vy��@6.4#�@	�&L�@��o�[+@�ۄ��L@Ӊ#��V@ g �Jq,@#��H���@'v��"@+��["��@0����@2r��04@5B�m�@7��U�@:��.��@>,�v�@@��z(@B�z`82@D��"��@F����@H�%�b�@J��Û�?@MX�Z/j@O�납�@Q0fn��{@R�%^�J{@S���E6@U^.��/�@Vކ���.@Xl�J�v@Z���@[�|�?@]k4E&�@_1@,�͗@`�����@as� Ƕ@bk���>@cj~+X%}@dpb5Ӛ@e}:�?�	@f�����@g��$���@h�c
0G@i���*�@k%a�wh6@l[��V̍@m���7zA@n��nK�@p�	�G�@p��C���@qi�<�4@r����6@r��l�Q7@s�a~H�@t<J>7=�@t��ޜ�@u�L�T��        ?�=d���?�����?�����7@�z��!�@M�`edT@���Ɲ@%&IG!�9@,���@2�(�U0�@7�2}�@=�r$�e�@A��N�@EmYز�@I=����~@M`�D���@P���ѣ@SP�jO&K@U�-$^M@X�m���@[xy�1dh@^�%�3�@`�s�,@b�ե��h@dL�#�@f#�_RqY@hKΠKt@j�e	��@l"�. @nJ�1>�d@pCRQ�"@qkA�l/�@r�#��@s��V���@u��0bh@vm��*�c@w���®@y)���(@z�Zw�d@|fH#��@}����uE@���9�@�S��
N^@�!��H�~@��2�)�@��i,ԙ@��?ݔ��@����$�@�l�B"�@�VTϺ�{@�D}��9@�7.nJ*|@�.d6*/�@�*,��%@�*G�Xn@�.�P�4@�7�W`$\@�Eu�)�@�WU|���@�6ʚl$�@���sj�@�S�|��C@��.߱]@�x�4�h        ?�I�k�s?�cI��}>?�����7?�|���?�5Rl��?�k���?�ﰔ1L�?�Z1��z~?�ܽ��)?�w�Y�y�@ٙb��A@���q*@C����@ai�]�@���qM@o>,��@o�H&@@���-N�@TӜv|@!U8�m@#>ƀ��@%ASu&�@'_K$�F@)�G����@+�
���@.WTT��F@0o�}"�@1��g&�@3,��.=@4���9+�@6���W�@7�,N[Ѱ@9���B�@:��s��m@<l���E@>'��1U�@?�dPQ�@@�Gq�R@A�򈴐�@Bˬ��s)@C��3�Q@DΈ�x�L@EٟWpD�@F�!d�}@Hp��@I!b��n@JF ��@KqE��֮@L����%@M��FSR�@O,�<��@P.�yE@�@Pԓ�<&I@Q}]G��@R)TXa�@R�u49�8@S���.�@T@$�$�@T����@`@U�MF�@VsN�f�@W4�*XD@W��휦�        ?�,���?�<�v��?������?��ɉsq�?����{�h?��7s?�Է���?��/���6@M�
�1@
�c^��@>'mB�@�ol026@�aObR@ 5�ɭ�@#cj�d�@&��+�@*ɜ��tf@/�m?+@1Ϭ�\�y@4L;�m�@6�<��X0@9�_�4oW@<�IlҘ�@@���4@A�_9�xV@C��I�@E��U���@G�YY���@I�*iG�s@K��r(�@NR�\��y@Pb��ҏ@Q�'�(i@R���m�`@Ta�s�DN@U��2y_a@WPNp0@�@Xܙ� ,�@Zv�����@\eL�!@]�<j�
@_����@`�?���@a��2v�@b���C�L@c���vFu@d�C�%@e��l�:@f��'\0g@g�"�D�@i�P�qW@j2V}@��@kd|Z�@l��y���@m��>b@o'�5J�@p;S�P�m@p��PnX�@q����@rH�8�7J@r��A�@s��G>{!@tw���{        ?�R�뛡y?�$�G+�.?�����/.?���1?i)?�)+��J?�T)#�?��қ=9?�]����@cB����@	�g���j@u�O��\@�R^ơ@{!e[�@�c���@"v�h��!@%͙C���@)x9�^�!@-xR�ދ>@0�$�
@3?)*���@5�@��@8t^�Z�@;R�Y���@>_9rV�
@@���`ؔ@B�H��V@DL�C�p@F/��#2�@H*"_]@J;�Rk+@LeO[�q�@N�_��ӵ@P��G�.@Q�ɎZ��@R��U>�z@TK�j��P@U��C�j@W��*��@X�C^gR�@Zݦ\,�@[�_�Ғ@]%�z�D�@^��@`<f���@a�'�c#@a��nV@b�w�j�@c��yC��@d��'?�@e�����@f��*G�@g��Q�>@hښ;�v@i�3�\@k�=!��@l#���WP@mH���7@nr���Q@o��_}l�@pk�JAr�@q	sD,��@q�8�Ō@rM��5�O        ?��ٲ A?����o��?�}_Jp7?���kz�@	<:J�@�����@
��O@#�dQݴ@)ʩu��]@0x�O|�a@4����@9T��DI@>�@�)�@A�W�ȳ@D����S@G�;�:@K`3����@O�5��@Q��J�^@S��7M��@U���v�@X#Pm���@Z��Dv�A@]+-+LV@_���n@aW��ni�@b�
�ph@dW���:@e�HM��^@g���m�@iLZ�G�@kˀ	�@l�,��S-@n˲b�!@p_���@qam�N
@rj���6�@s{����@t�.�LA�@u�O�R8�@v� ��"o@x<*�R@yA�� 8L@z�C��@%@{�[��U@}YG���@~h&Dtx�@�qЮi�@��!%2@�I�]iY�@��jp.@��1Z@��ի���@�E;�Fܠ@�H���@���g�@��>�>#@�{T�@�Q�Ē 4@�+��i�w@�	[�v�@��n��@�Ρ�n�        ?{�h���?�))oM�!?�E+���?ǻa�x\D?ԂD�L�?���ճp�?�����u?�T�S���?�V�-?�n�.��@ (�ek��@����6@jc�U@��-�r�@��ǌ$@r�`�-@��)��@ф����@�eV�@�Uu��@ ��(@"U�"�@$(���@&�X�D�@(�e؅@*)N΃o�@,Uܑ��U@.�x��/@0x�n��W@1��~�l�@2��?b*@4>Qˮ�@5���p2�@6��z�/U@8c�k�ކ@9ڥ��.�@;[�ה��@<�7���@>|�Ov2@@]6�
@@�T��!@A�MZڠ@B�;�φ@C�J��@Dhɻ�&�@EVN��?@FH��&�#@G?�g)@H;<*v��@I;�wv��@J@p)�b@KI���@LW�.5̈́@MjtB$�@N�o�!0�@O���.k�@P^O�'�@P�\���@Q���7)G@R��]��@R�D9��@SM�@��[@S�<���        ?�Z�&Tg�?��h&42�?�"v��?�?bX��?�O��?�-�s�?�N\]���?��@�4�@��z�:Z@	_��)g@!g���@OQ!$F/@Ym�b@{�#���@"C`��@%�ߗ-a@)M��9�@-W���:�@0�& PX@3>�����@5�Oۇ�@8��/�c@;|#�ʨ�@>��R��@@�o"<��@B���>��@D��2s��@F�Fq��@H���l�@J���%��@L��Z�@OPʸ2�R@P��r$��@R(/=� R@S{m�R�#@TۚU9{�@VH�{«@W��z6`�@YI��z&�@Z�����@\~��/@^,��k�Y@_���8V@`����"@a�hb�@b�]2�`@c�����@d��dw�@e�OZu@f�١;�@g��ߍ@h��ی�@i���Ɔ@k#-M��i@lM��$p0@mQN��@n���_71@o�P�uo�@p�/���@qAY_9x�@q�ⁿ@r�	�_0@sC��X��        ?�h։V��?���@G^?��.��?а�n~�?�TL2#��?蹌9�M?�M'�?e?��C��3@B�ZA��@'4�y�@���!@�ý�@���u@E|g��o@!���*��@$�k��1@(:�e_J@,���,�@0$tϫ@2`�G7@4��h�"@7iI �s@:1T�9@=&��m�(@@%@���y@AΎ#�m�@C�p�'�@Eh�v@GX��7}�@Iaz��dx@K��aך@M���g�h@P���8@Q<R�{^@R~Z؄�@S�F)�g�@U&��ɯ@V�L� �@X:�<r@Y�׉�ȯ@[/���@\�P�dV@^QF4�y@`�Lc��@`��°~A@a��'�#9@b�+���@c�6��@d�����@e�����@f��z��@g�D��@h�9���@i�vѼ��@k��XsU@l720��@mf�G�9@n��@�Q_@o�9֖��@p�J/��>@q3NhT*@q۩�P�X@r�\җ��        ?�A7�f�?�Op��?�s�^D?��,޽@��k�`�@\��w6@���,M�@ S����@%�8%��@+��I��
@1,��xv�@4�N��4�@9*��#Q�@=��L�r�@Ac����@D�`��@G�6Rcg@J#'hWE@Mv��[C�@P�L���@R]�ee�@TVV;n�V@Vh�ԩ�4@X��{�8�@Z����@]:_�Ⲉ@_�]��@a"�WbW)@bx|��,�@cڛ+�k@eI�"[)@f��N%UN@hJ�����@i�x�(�m@k|Ar���@m&��r�@n�"g;�@pO���0�@q6-�D��@r"��śG@s��x�@t�@u	%D���@v�^�F@@w�+㾖@x �,G�@y3I=�w=@zJ�\�@{g��`@|��� ��@}�b1�y�@~�#~?ѭ@�a	�ԛ@���.t%@�>*i��@�ݔ�Й�@�N���@�#O�-F@�ɐPm��@�r
_�ֵ@��܊N@�ɋ�7�@�x��~�        ?�I�RFm�?���6=��?��;z��)?��C"¿p?���F��-?�e�I��?�U�E�!?���x�%;?�V��5�+?���av� @;rQ�.@����@
B=lm�@ћg~�;@���(@��ԣ�@V�"�Z@X�?��@���0;@ r���@"8�'��@$l �խ@&	?j�@(��U��@*5�V3�J@,m�q��5@.��e��@0�K7�J�@1�[K��@3��8(@4m��"@5̈ �0�@77@б�@8���ԁ0@:-�&�@;�YQ0��@=Nl<[��@>�3|�o@@ML�z�<@A(D��0�@Bv-#�V@B��S�]�@C�V^w5@D�쉏Ƨ@E���M��@F�0��)@G��H��n@H�P��=�@I���3�@J�O:�0@K�v5�@L����$�@N�$�`M@O2�Q9��@P+�#7��@P������@QW�����@Q�cI�@R�I!�@S)���'@S�FG��N@Tk�\�@U�q�8�        ?��I]��?�í�%P�?� ��G?�K���pY?�{�2�� ?�zSy\�1?��	Vd��?���3:�@
G~x�@���m�@�7f�	�@�A��~@�[��@ ��t���@$=�s�e�@'�Қ�o@,���r@0>U�?@2���DI(@5Lۧ�G@8"�ǃ�@;,?甮�@>lb�$�9@@���9!@BȚp�a�@D��P�i@F��}���@H��qO�@K>��y�f@M�a:#�@Pu���Y@Qcd5�;@R�NG'�@T/����@U��a%_@W7$6%@X�_��^@Zz����@\2��@]�B&1@_и��/@`�&�G4@aՃQ�[9@b�t�-\�@c���n@d�XV�&@f
ؐ8�3@g+/��,<@hS#�d�@i���"J�@j��o2@k����7�@m?j���@n��ԏ3@o�+�'�@p��Gv;�@qRb2��@r��W�@rɶ�@s�Up켩@tA�Z��@u1v�`�@u�F?
�f        ?���W�'?�����#?��.�{t�?�<�d0�?�M�Q�iN?�� �m�?��C�[?�cf�6��@L����@�嵐x�@8�=�@P�8�ԝ@��0�U@C����Z@ E<��-E@#/���u�@&b1�Ҏz@)ޙ����@-���a*@0ܪ��z�@3�M�*�@5c�j��u@7�A�ui@:�-'� @=U�j��@@%橋�)@A���	��@CX@���?@E�'m��@F۹ 2 @H������@J����<C@L��峑�@N�+����@P���M�@Q��biڎ@R������@T^� z|@UM��)@V���xT�@W�}&��@YO]b�}�@Z�F��@\-0��
E@]�`Y�)@_2���t@`bJ��%�@a0���@b�o��@b�P���5@c���;@d����O@e~���@fh��3�n@gX����o@hL�.�@iFV�ԅ@jC�����@kF`暴�@lM�:�5@mY?��P"@ni�q�@o~y_�X�        ?�>=�@�R?�
���N4?�pϡ�-Q?��bG��@	��ǆ>|@�[�ds@�_�,��@#� ��'�@)�V+���@0W<��PA@4O�]p`d@8��mN�@=�+z�@A{��F��@Dc"�<z�@G���T�@J�=�c��@N~,��!.@Q)ڠ�tw@S2a^7A0@UX�q�U@W�co�@Y��pջ:@\|Ao�c�@_
�F�@`�l��V=@bS?7fQ@c�eS"��@eSƖ�Cg@f�K"�:@h��=r}@j>`�@k��.��@m����@o���OW@p��7u@q���?�@rÔ%t�F@s���*�@tڅIm��@u���;m2@wke��@x-v���@yU�caO�@z�~6P\�@{�blr6n@|�w��Uh@~5�m?Y@}?��@�e;�M�@��z�*@�����`@�kQ1�qZ@�矊s�@��bȬ�M@�����e@�F��}-�@����'�@�ōY���@������@�OzT�&@��цW�@��W��*�        ?��+�S?��TK\�?�BB捎�?��	�ӊ�?��I�6s?�C���?�9_�T�h?�?��`Z?�4c�r��@�S��@s�c���@S&��w8@ԌeTuf@��~i�j@��oc�@::�(X@�3UGC�@ �څ�3�@"����ٞ@%y�)@'D�"��@)�M�*E�@,#5�6C@.�;��.0@0�<�S�@2%y���@3�!>�Ԭ@5$�#HL�@6���u��@8\�g[G@:��Xu�@;�3X���@=���oe@?r��^9�@@�E��@A���p�]@B����=@C��= @D���d.u@E�iJu�@F��;A�&@HT�2@I<@lyq�@Jk��c
@K�r�ЮV@Lݦ4K�@N 2w��@OiE���@P\`r_`@Q�¶�O@Q��5�Jm@ReS�P��@S4�@S��UtA@T�6�6@UF���M@V��܎�@V�hY� �@W�ز��@XW~k��T@Y"�UuQd@Y��#��@Z���<�        ?��T��:?����̹W?� ��$�T?��q���A?�4|�Ջ�?h?���,���?������,@s�|ޜ@�:�99@�:�NN\@0qx@;�@!ee���@ T���NZ@#f(��C@&Ƹ�!@*w���O�@.z�$s�/@1h]cx��@3�B�<��@6<����@8�onz�"@;�X��	0@>�{|q��@@�q<9T@B�*v�@D`�����@F7�FX�D@H%?�;4U@J(�WVB�@LA�c\�+@Np��3QB@PZ�n��l@Q�hn��@R��B��@T��@UQ�Y�uc@V��o�@X&g3�@Y|X��5@Z�11��C@\x���J�@^�A2�3@_� %@�0@`�	���7@aw� g@bS��"�S@c4���@d�ڶ@e �[e@e�\��/�@f�̶A��@g�Lm�R@h��j✼@i�mno�@j�zs�@l��=�@mE8��T@n.�=
!@@oLw�r�@p7�)�]@p�D�F�@qa�T]        ?��I�K]�?�j���?�m��M�?ԧWp-}�?�9�|�?� �e�?��w�i�@ ���|�@��F�AQ@�>����@y���D%@'����@z}t��@!<$[�Y3@$�8)��O@(D�<x�@,S�r~�n@0`����d@2����@5`�ˀ�@8+���d@;(n�dXa@>Y�f@@��:T@B�E����@D�(M�I�@F��L6��@H�紥@J�d���h@M9��n��@O��DV@Q�x��@Rk?��}@S�®Z�o@U:G��¬@V��y�N@XA��S�@Yڜ�~�_@[��>T	@]7r-���@^�h���@`f��k�l@aWP���@bN�̿�o@cM��i�@dTS"1�@ea���@fvf:�t@g� ?K�@h��D���@i�f�@k>�$@lL5��W@m��p�i@n�8ŗ�@pf�s��@p���A@qm0�n	@r�$��@r֓F[��@s��:�2@tN��Zظ@u���q        ?��\᪷?��$�5�?������D@B��Z�x@����@<}�9^@%s�8a��@-Ի'��@3c�u�@8��O��@=�C����@B���@E�A<X�T@Ie��^�@M����`m@P�[�A�q@ScY<�e@U�o:���@X��Q�ER@[��j�o@^��ܛ @`�#��@b��,�.@dLo�D9�@f!AC�+)@h
 �|��@j�#�)�@l��I��@n:@H;��@p8��yl@q]���^@r��KH3@s��XP�@uA��O@vO�沴@w��Ms��@y ��|�O@zf�¾�@{�$(�	�@}N[BR�@~�mq"�@�,����@��$��D@�����A@����n�<@�lO��x2@�F��.`b@�%�t�@��`'��@��&�.�@���-�U�@����P�@�����2@��'l��@��.T�A<@���>�@��ݔ3\g@��u�K@���8wǦ@�h��7@����h��@�{��T@�yHg�        ?�����Yp?��Z�2�?�ڹ8+X1?�"��v�?��9?I
�?�@*Jж?�󯑜X?��4+V\O?��'�.��?�;>[�_@R|���@nr$�X�@�iU�f@m巄)�@�+j��@�${t�@O�_�A@G4�� @��=�c@!��溜@#��ؓ��@%�ߙo�U@'������@*�dͅ@,dmܙݙ@.��.g�@0�bj�9�@23��$?@3_����N@4� �W^�@6C%?S+�@7��է3�@9Y쑥�@:���}@<��J*�@>W��gQ�@@7>#@@��@V�@A�y���3@B�>m�x@C�����@D���П�@E��;�Q+@F�
>BJ�@G�.�|ø@Ij<ò�@J*��A�@KO2�$�@Ly���:@M�|�!��@N�X$@P,��[@P���b8H@QUa��5^@Q�H�?@R��⡣x@SU����@TUu*�:@T�d�VL@Up�3}�A@V*�9��@V�c�F��@W�a�d        ?��~Ki��?�y�o��X?ĜΞ�?�П���?�G��Ig?��Zg�?����F�@ �A��n�@��	�I@@E�E�@`+?���@E4�fi�@ն(S��@"��n	@%�ߠr2T@)a��"P}@-��oj?@1���
@3���e�@6KÎ�a@9/mL��@<G^f�l�@?���*JG@A�4�ȵ�@CeB�y�P@E[$Ҝ�@Gl�x��@I�&$^�@Kߛ�X��@NB��xn�@P`�V#˙@Q����)M@S��I�D@Tq�ꖨ�@U���n�@Wn'(Ys@Y\�s�@Z����,@\RoG��7@^Q���@_�}�`�@`��YX^@a��q�@b˗�S|@c�zd���@d؞3�J@e�y*�@g�l�)�@h"�)|m9@iJ!��� @jx�zԦ@k����P@l�f�c}�@n1Es�l@o}����@ph���f�@q40m��@q���k�@r|��y@s5Fɖ�@s�ģ��@t� ���@uu���g        ?��j&e�?���o��?���Z�ٵ?�� {]C?��3�Ӆf?��5x�?��d).�??�k
��%@�I/j]@
rp]&�C@��h��@I�d��@5@q��)@��xW��@"���v��@&a�s�A_@*"S	֪�@.:���/@1U�
�@3������@6O�=0�@9F�k@<�S{@? ?�J'@A7gvpt�@B�}�`@D̈́V�@F�����@H�ղF��@J�Q[q7�@M�Ӯ�@OkQ����@P���A3�@R*��b@SweY�4�@TІ�:d�@V5�r:J@W��ޠq1@Y%��x�c@Z�)��dz@\F��>@]��%('�@_�Ty���@`��~�)�@a��Pt'@bx��*ء@ci9��-@d_��!qE@e\O�P@f_(�K�@gh+Z��@hwU�`�S@i��`%��@j�!��9�@k��!�@l��3�@nh�ȷ@oSo��Fq@pF�����@p��Y �@q�"ȸ0f@r0d�^��@rٵU�m        ?�w�⸏�?�>K:��?��i|@����V@���1:@�Њ8>�@!��X@'q����.@.��D��@3��d\��@8�	N*��@=��+k^�@A��ƴ�@EG4��,)@Hܖ4��z@L�y��1@Pu�>@6@R�kk�}@U�D@W�p=x/t@ZK9�,�?@] @��@`����I@a������@cBz�н8@d��-�P�@fú,�@D@h�Y�^�@j�Xq�.�@l����v@n�X�I@pj*����@q�A�J�@r��!@s�4}��@u���m@v^����@w����T@yz�,��@zbb&�?�@{˯m��@}>g��Gl@~��R/P2@� '%BJ@��9��	@����(�@����D@�Z�g-i@�5��޿;@�� @��`^��<@��x��:�@��^j���@��ަ�o@���s�k.@���t�K@����C61@��o�^ �@���<B��@���L�W?@��Ϩж�@����e�@�=O�^�        ?�]h�n�?�`�X΋�?��lC��R?�'��
�?�Ix��U?�����?�-����?��;��?�j��[0?�,�@3�@O�jf�@��¢�@ L�@�f����@VF��8@L�f�@m@z���@�fEHC@ >���_@"(�D+��@$.t��@&O�aߏ@(��
:8�@*�u,Vg@-V�$��@/�g�i��@1G��ʴ�@2��8��@4�5�8@5�G�c@7!�R�]@8���F@:^���'@<��ݣ@=�J?w�8@?���i#�@@���ܥ�@A��1�|�@B�z��&>@C�\��l�@D�����@E�
LT5@F��A�@G�˷0�1@I��3��@J)�� p�@KU_��@L�7=�R�@M�78�oZ@N��p(@PW�u�@PN�&|@Qi��P]/@RNBf8�@R���p�O@So6��s�@T!H�2��@T�MoP�@U��O��@VG��.�
@W�/��@W�6��5@X�$�f        ?�#8K��?�c��	��?Ĝ�,��?��M�b?�?�a��wn?����?��?E|/�@ �~��>@�����@w�b.�@�Y�6�@��E��@5�O;�h@"NN��O�@%��YEq@)�v�v�@.2���/3@1z�ϊ�@4S&%�J@6���)�@9�Qlp�@=����@@G�2h�/@B"���m@Dc�W�@F!ڠ�3K@HO���@J�v{{@M`�O�@O�ͥv 7@Qj�,�*@R{��>�@S�*W��@Un++��@V�8�%h�@X��m}RI@ZL�P75�@\d�� c@]�[7�V>@_��6xX@@`������@a��Q��@b��d�L@c�~�{>�@d��R��<@f��$4@g:`<�rV@hf�A�Ճ@i��4F@j��C�@l)�U�@mc��iAw@n�j3�@p����@p���p��@ql��MP@r$��J�2@r�ʧ���@s�M(Oj@tc�O��@u*_�u�e@u�荴~�@v��d�        ?���XѬ�?���M�!5?�Tc`Y?ӟ���2�?��1�I
Z?���(?��K/��u?�]fAӎ@B��ޮ@�\'�\@�b�z@�UЊ`@�%�.o@ ��_��C@$1�d_�@'Ԫ3��@+��w@��@00�0i@2o�>�7 @4��?�.�@7��2���@:��6Nd�@=�tH1��@@z1�?�@B4Ⰻ�c@DN�B�@E�p��xG@G�AT6BB@J��}ǅ@L=Ŏ$��@N�a�;<@Ps?S�V@Q��G�@R��&�Ѐ@TI�|n~@U�}��@W��f�H@X��?xb�@Z
����@[�����{@]0C?�ۋ@^�T��^@`A����@aVe&�=@bm�'~�@b�()��H@c�~X�P@d�h�|*@e��¿�'@f�����@g�Kc~�@h�/W��@i�z(�U�@j�!˟]�@l��*	@m1^�_�@nU݃nJ@o��= @pW3ΌZ�@p�-���@q��@�q�@r,����p@r�1l'�A        ?��uM?���`�J?�e9��Y'@ �5�5XW@�! �>6@���@h@ O����@&hP6�>�@-�A#��7@2���^��@7����+�@<�k7�@AMS���M@Dz���@G��A��@K���t��@O�r��k@R h]w7@TJ��˘P@V��7��@YI�+}��@[��
�@^�^��*@`�-��g@bv ���s@dy\<��@e��?F@g�zϓE�@iY�}�S@k<�=7@m07̦/@o4%��d@p�18J@q�h�m�<@rЪYfk#@s������@uNZ�@vO�a��@w�ڐ�Z@x�[��{�@z�H�`!@{d7�C�@|�kd���@~	��F@���a��@�x���N�@�3P@�0@���ڶ'@��Vl�@�x���?D@�A7/�}@�:0@�܍�,�y@��&�4��@���<,�@�]��C�@�:+>*@�PX���@���eg#.@����>��@�� ���@��H��.@��Wk��[        ?}u�-�M�?�����j?����46?Ʌ��?�?���?�?�]w�߆?�=��?�Ԙ�h�>?��:��?�|����@pk>=�>@2��K�@	U����@ٕ�\�@^���xu@=eR!�@����>�@�V�wI�@���>@ 5��;8@!�ʝ<E@#��:���@%س����@'�lD1�@*�e���@,R$1F��@.��Iɭ@0����>@1��C5"@3��O�@4y����8@5�z4J0@7P��@8�jإ8H@:U5�{@;���!�@=��aX��@?.�/�>@@q�>E@AP���g@B4>d'@C�`q�o@D�(�@D���y�<@E�-{a�@F��}G�4@G�&�<H�@H���w�@Jۗ���@K����@L3.i+�z@MN+���p@Nn	<�jP@O��nOM@P^.-�@P�hz��@Q��O�3@R+$#�(@Rɤ�ecp@Sj�Ӝ�.@T�B۝@T�����@U[�_~�{        ?��v���?�9�����?��oS?�ן�"o?�_�W'b?�l�ՙ?�B��I$?��Bh��@�᭬q�@�Βխ8@���B�@h��
@�v�fk@!�L�Z�@%zp�6U@(�]���@-@(l�@0�4��f@3WSp�V@6�s�N�@8�����v@<:��r�@?gB
�FZ@Ax����~@CY'׌ �@EU�b!@Gl�5��t@I��<�"@K�@�>�L@NZ�t2��@Pp��e`�@Q�����@S"��+J]@T��l�jw@V��6�@W�up�-~@Y0#n�}�@Z�h�IF@\�5�M��@^O����@`�����@a �P���@a���q�\@b��G��@c�;���"@e�2��@f? �Ur@g5�H��@hW��=�2@i��f[@j�u�@�@k�t�7�@m%~��Y�@nj���4�@o��.��@p��+��@q1�YI'E@q�m��q
@r�k)\��@sM� ULl@t�bJ,�@t�!�t��@u��̌        ?�vH|�\?�\oV?���6�?�`��?��kU#�?�]�F�r�?�0	s~�I?�pr j�~@��C��@ݽ�] �@ ���p@!��GQ@�D2�D@&�]n)�@"
����@%R#!z3C@(�����@,܌�._�@0���Ld@2��Z��@5X���A@7��?�/S@:ќ��0@=�'0�zb@@~�-��"@B+�����@C�@.�:@E�sD���@G�Y�F0@I��3�@K�A�4vm@N9�8?u@P0j#h��@Qa���#;@R���nt/@S�|+TK�@U8NXm{�@V�OT@W�w.��$@Ys����@Z���g�@\}��G�@^�Ŭ��@_�b�*_c@`�a��U@a��P��x@bk���@cQ /�m#@d<���D@e-VM�9+@f#�na��@gvË�@h�ib�@i& .�ί@j1o��(�@kB#����@lX�3��@msC�@n���/:�@o�7+ANN@pq�?���@q	�0i@q�h����        ?���q
1?��bO�x?��ߴ�?��f�-��@����@ŧ�'��@Hn���]@"��=�>@(�yx-�a@/�MBǱ|@3�׃|@8SH�s/�@=<Ĉ���@AP@1{@D?l�`�@Gl q �@J��t|�@N}Z���@Q0��!q�@SA�;@UqF$�~�@W���%)@Z+�lL@\�UNX �@_]�gd�:@aŕ��@b��P<�&@d]+�@e�0�dO@g0�c�v@hܢY��@j����o�@l^��w�@n4�P_,@p;[Q��@q��8�@r1�9�J@s
%����@t����@u)�[/{?@vB�k]	@wb�Q���@x��5��@y������@z���O@|I��@}]�{s�<@~�Fc��"@��E�M@����ne2@�I�=P~@��4����@��n�mG@�]��_�L@�ɧ,~B@����q�@�����@�L,)5�@���PA@����H�@���3��@�i��jz@�8k�{G        ?z4��O ?�0�ok�?��Fh�^?�x;�6�?�u9"l^�?�GW�YE"?��T�}?��{�?�PJ���?���op-?�L0b��@���n/@��u��@
�gH���@� q�U@���Ӭ@iʭj�&@$B�@���"a�@@��V�@ ���{@!�}-�i�@#��Ov�@%o�y��@'`��SwR@)f����@+����N@-�4�b0�@/��y�u@1(��vs@2`vn���@3�r`O�@4�Ȧ�+�@6EfJ�\Y@7�5��� @9 |X��@:�J�)�@<�9��E@=�eSx/&@?���@@]�Wh�@A0TŰ�7@B�{� �@B㹄C-G@C�j�9D@D��b�v�@E���p�@F���M@GuEkh�@Hl�^��@Ih{V��R@Jhؿn��@Km��b��@Lv�lKs"@M�F��
@N�IAç@O�EiB��@PcZ���@P��:�c@Q�-W��@R�p���@R�k%�4�@SE)
'�T        ?�h��"�H?�"���A?�7[�?�_�J�?��K���"?�l��:zF?���L7#?��� @|!ЫJ@-w.�G�@�;���@���|�@T���@ �Ю7� @#탖��>@'�1]\&@+�N���&@0�F7�@2p��K%�@5�p׫@7�U_��@:�C�9@>;���@@�pJX'@B�c�5@D���'h<@F���M#@H������@J�lV�.@ML�b��@O�'E�2@Q.*���@R���vqo@SyD�@Ue���U�@V������@X~��ϛ@Z ��[��@[���rZ�@]���.@_`�ja�@`�\~n�@a�J8a\{@b�NZ�H@c�8��>@d����@e�1��2@f����4d@g�Nn��`@i#2����@jU�4P��@k��Q�e�@l�]I�(`@n��i@ok���h@pb ����@qb}=@q��ݟ��@r}�s���@s9H��@s���v��@t����@u��L��        ?�
��
?�׳�u�D?����{��?� >���9?�W��)�,?�:$=?�P�?�	"�@< =Ώ�@	����.�@v� vߺ@�Q�m@�yJ�@2� �[@"�ӌ���@&"ƺ�p@)�r�]@.��$��@1G3ّI@3��L(�@6TO�<��@9"�6�p�@<"�n�l@?Rz�x�{@AZ2u���@C$���.@E.��@G&�(;�@I�0LN�@KGJ�g�@M�o���@O��Q�@Q6��@R�T�v��@S�Z�y�E@U;���w@V���x@�@X(΀�`�@Y����E@[IFP�U@\쀵���@^�^[%8�@`,me���@a� ���@a��C��v@b���4�@c�\�Nټ@d���|�@e�
ԲȮ@f�M��s@h ��Pf@i�<%�@j4�nB�V@kX.�~��@l�࿪��@m��d�@n�,��3�@pd����@p���-�@qX'}H�@r L���6@r�G�:`m@sYp���s        ?�E�IA�9?�[ ��y?�rc3%?��Ɔ@K*��=�@LL�J@��� @���.@$5.�W�G@)�Ү�@05x�\ͫ@3ׂ��c3@7݀� +d@<G�)��@@���1�@C%� ��@E�M�Ë@H���0�@L#g	?��@O��4	��@Q�H��4@SsӼ���@Uqp':@W�
Iur@Y�����@[���y��@^a[���@`m{��@a��F�(@cK=(�@dn��:�@e�+�S�@gVk�}!`@h�͐+�/@jo?�7P@l��>F�@m�	E���@on4x�Y@p�[��@q~�3�h@rkd�h@s]�v��@tU�^���@uS�2-�@vW��5=@w`@7w�`@xox��@y�w^@z�xr�LI@{�	�p#�@|�$��{O@~�liх@<����@�9:�)�n@�ֿ��l�@�v���;�@��R?AE@����3�`@�g�!�@� ���)@�����Q@�q%��l�@�$9~���