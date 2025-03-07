CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T115637        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?U�0S�m?�����#?�h�H�??���Xr?�,����Q?�4kK8?�9P��?���t?�\YV�?�r�r��@�;&x�@5.���@�0r�|@��=j�@�*�@�U�Pi�@Y榫N}@$fx�m
@!L]�!@#O@9��5@%��+Q�@(,��~�@*�8Y�q�@-�Sb?�@0[�mW�@1�50B�O@3�̀�*a@5t���@7[v���@9]�W��@;}K�[@=��L0��@@�U�I@AK�k��U@B�Lz�j�@C�5�:�k@Ep�VMd@F�(�r��@H�Q>c��@J*3�c|g@Kܷ��I@M���;�@Oq$�`V|@P���'=A@Q���HC�@R�2�l��@S��453@T�#��>@U����g@W�䣪�@X@�N�K@Y|�����@Z��Q��@\0Y7��@]o���Q@^�	d6�@`'��?��@`�h=�_@a�}}[@b�/����@ck5ͷ��@dT�7�@eIB�e��        ?!k���Kt?`�
�6?�G���6?�4��R�?�v��L~U?���1*
?�'�{IV?�&�_Yg?�Gs#!]?�T&��?��EG>�@���sg@�F���@�0*��@'z���"@1i��-�@92�Y2@AЗ�?;`@H���'y@P���n1�@V8B�+�@]��	@b�����;@g�_��!�@mkۓ� �@r���{�@u��P�_�@zeVVjn�@Y��<a�@�m�S:`�@�w1�O @��-x|A�@�d���@�$ �JT@�:o��n.@�u^�X$�@�����V]@�Y}�!B@��Ǐ}+@����|��@���W,@�n�r�@�v�kx�@��
�±�@���|��@�_��PJ�@�Mm���@�O}��RA@�fDv�ϲ@��Σ�@��T�:@�-d��@�K�*�@��?����@����@�2���@��x���p@�;����@�~k�Iew@��k�@��F�1l@��
�ͳ@�mN/r6�        ?1=$Z�?D?k�i�uTj?����� �?��L�� ?����4��?�wT���?��\��?�b{Vʒ\?����h&?�N��d̸@
u��T�@��h,@"�1�:�@.72pg�@7��V5@A����>[@J�j�VS@R��A�It@Y���v8�@a�2^��f@g����<@o���/�@tE���9@ypb���@�~���@��� �@�tN�m@� ���J�@�mh�4y�@��樜m�@�H
��/�@�O�8a@�b�G��@��3���@���d��J@�v�����@��V�R�@�4�)/�@�l o�*@�o;T~4�@����Gh@�����@�fp��)@�g�
}@��X���@�q�A�5@�f��O@Ľ��{��@Ɗ>{gts@�qu�
�@�t{�[W@̔U<b�@��9�L9@Зn 1�@���i�i�@�%y��E@ԅ�[�= @��9E�7@�}q����@���z@�¢l)�@܃�'�K@�Z�$u{        @�o�e�@F���J�@h�$I	��@��d��@��}h�@��<��@�HVjD�E@���m=��@���f��@�oUk@���_(��@��j�tO=@ŏ�P��@��t�:l�@�z"-?'�@��?F@����]J�@��fE��@�~��xn@�b,+6�O@��f�{\'@�-�93/�@�7�GM@��?��g@�j_��@����1[@��{%�""@���?]@�,�c�X_@����H@�>�H8.�@� �Q��)A ��'�AZWԑz}A8S̚l!A>�Ba�Ak�J���A
�T5���A>6H�A�;���AAV�����A�{�A[��w��A��i�A�\�'!�Ar�z��AH�u��A/��]>A&O���A �^3�1�A!��ӝ;A"����צA#��|nCA$�~�iQ_A%��}�RA'�
���A(_(L�3A);|��A*Z-��n�A+z����A,�5�}�A-��ivA.�$�9q�        ?N���?�76i3�?��%@�?��ͽ9h�?�U�D�!H?����X?��f���?�Z}���f?���q3�@ p{��?�@r���.$@��Ƀ�B@�sʋu�@^~��A@;�\[�@�J`{��@�a�k�<@� ��@ /��0�@!�6A��@#�q1��@%qCU99_@'Mn�HJ@)6N���@++Q�d�@-,
E�{�@/87.��Q@0��~�6�@1����@2Ѭ�O@3��C���@5A���@6F7�G�i@70����@8�U	{u�@:1݆@;s�y��q@<� Λ��@>d���,@?��Q[�@@���)E@A���V��@B����9�@C�� �@D����E@E�}Av?@F�D���c@H �T��7@I:��D��@J��^���@K���a��@M7
^���@N�[[��@P�̣��@P�T��Q�@Q�!�X�@Rtn��@SNi�
��@T0,����@U�2��@V
�#��@W����@XD-���        ?6~�6�-?ziL�(:?� ��F�?����W�?���t�@�?Ҏ�j�i8?��׬<?顭����?�%>' t@db��Yz@G���o�@��Kœ@!�(�і[@*�)�a]@3,S�&@;�QN4O@Cl}��-g@Je��(�@Q�g��G@V�?I� @])c���@bQ�-���@f��z�@k�@ ��@p�>=�~
@s�xb�M@w����@{�x��Љ@��Z�^x@�r�O���@�%9?sG�@�8V��@�RD�+E6@�����	�@�P�Mxz@�_^s�ͩ@��|f� @���h�dK@��+��@�J$��7�@��b�@��W��@�W�j�t�@��"�B@��]�}�@��6s�[@�B\)��@�Le�B�@�����!@�Q���@�YS"�	.@��Mj}�G@�$�u���@��H[z��@�8a'd@�ޢ�c�@���>��@�f�:��@@�J;1B@��T"��@����p�8@»L�D@���ϱ��        ?! �ee[;?\+�mx�5?��+��w?���oo� ?��o�ǣ?�V�)��?�yʾ�R?�h�(�]D?��&���?�i�xI�P@��A@����@��9���@$V�b�G�@-���:D@5u�.�H@=�$���y@DJ��Ρ@J�Q��e@Q����4�@Vm���@\3jT�l�@au�?��@eQ�ۋ�@i��q"N@n�a"���@rtQ$_c@u�Y�f@xsG��g�@|!@|'�C@��C�N�@�F�@��F��!@�Cǰx��@�PDq�@�%�$(@�;n�g~@��4O4F@���t�>�@�1�3R@�R��KPf@��L���@�`�T�@�*�s@����%%@�6a�m�@��D��@���C�l�@����a�@����5@�@�Z�M�@�W���L�@�����@�7Vo��R@������S@�S���@����햇@�1���_@�� ��?@��#� ��@��բ1�@�v�ߵ@��Z�c��        @��Ӝ�@E�6�@i�as�j�@�:1�h��@�>-6�r�@�U�:#�@���m[��@��E���@���TP�@���%��@���rX)�@ċ�g	UM@ț��4U@����tq@�Ɲ'�qp@�0g��9�@մ&�Id@�Oj�*�@���C�:r@��<�>�@�Jy��;P@Ỹ�NL�@�3��`[@䱘�P�@�4��@�v@�j�D�@�J��{�I@��o�IG�@�uͳ?�b@��q��@��Wg�@�M��\�@�a�7tO@�yP��x?@�f\�|�H@�\����
@�^Գ���@�m�lA�E@����40@����-!�@��(f
��@�R6/6O^@��I�Az�@�A�v�@����_�xA ɘ���A�#�W��A�����2A�ʜ�MA��DA�bn?-A��<�=A)U���A	i7�E��A
�����A�*�S�At�dZhA��`} A3���yeA��)"��A�H9��A���[�Aq+ :u        ?}
����6?�2�f�%?ȂN�V�7?�����^V?��⾥�?�5U����?��O�nr@6�&k�@���#e@u�K
m�@��1y�@�g\=�@E�B���@�W����@�He0@!~�5�i@#���Ϝe@&E*m�A@(sʹ�ZG@+B�/��@-�H^;@0@c�"�@1���K|@3@B8�s=@4�-�_5@6�I��D@8;��p�@:��D`-@;���mK�@=����L3@?��b<�a@@ꬵ��M@A�6;�9@CO?4 q@D3�eJ�	@E^+���q@F�s84��@G��@���@I�f�k@Jni'.@K͏[���@M8�y64@N�nٶ2�@P�>�O�@P��e�?�@Q����v�@R~���̒@SV~z]��@T3���L�@Uo�Fg�@U���w@V��q��S@W��ͼ+@X�W�K@Y���:C�@Z��� �d@[�.p��@].ҽ9@^22�{v+@_Z�f�@`F^�N�R@`�[�C@a�����        ?��?�#�N?���@�d�?�K��d��?��ߧǸ?���4u?�y
E�t�@�ޟؒ$@# ���@z�/R@"��N+�v@,9�,3��@5
6����@?<����j@F�w��!E@P��b�k�@W�f�u@`�6��f@gQ޲C>@o����ry@u:��<�@{��׸�@��fs��@����.J@��5�˰@��,H�|@�2��x$@��dj�@�!�@yF@�#���V:@�{I1�^�@�*n�:�e@�1��K�J@�H�F��L@����z�@�-{�-�m@��P[6R@�Ô3j�J@�ѠQ&��@����k�@»jZ�Z6@ć�|��@�l�F�g�@�jc"!�@ʁu1�v�@̲��-�@��L�JP@в�����@��OZ q@�D~���C@ԣ�D�WE@��1���@ג����U@�#�,�	@�Ə4$j@�|i=��%@�E�4T@���^,�@�(}�@�YҢ�@���.8@�9�Ȅ�n@�`�a��@撴/�        ?A�÷ג?{�;��?��陼*?���Oy?�Ps�ˡ?��r��C?��g3�O0?�Q+6U�?�B�l�Z?��1�]��@	�Dv�@@W �k@�ø�@(	غ�}�@1�k{@9�P]4�O@BX2�D@I^�	21�@Q)�p?��@V���ʴ@]��ڍ�@b���&�&@g�DSq#@m�ܷ�v�@r�'��@u̮�i��@z�K;@~�����{@��J�U %@����S�>@��gW[<@� �='@���xZJx@�0��s@�*1B'�@�>K�S�`@�l�o���@��ڶ?�@�y�2o@��Q���a@�����M�@������@�`��K�X@�ۛ���z@�f��8�@�S��w@��f����@�q�$	j�@�D���@�*y��e�@����\r�@���*b�C@��w����@���;Ɵ�@��5����@�!N=@�DN0\�@���5]@@��0�
�y@��=�8@�t�LR�@�כ�:�@�Cȏ�+�        @@�Rb��@q-a���@����]�$@�� "Q�@��d�m�@�o��9�@����W��@ơK�4j@�I��\$�@�\U��M@�u��G|#@��V dO@��Σ�@��)b�@�`N!"m@�l�J�&@밤T~$@�.=�k�@�s���(t@�n�ւP@���d+�@���B�Y@�#�>��g@��R��Qm@�H\)�WA;�J8A~�֘}A�Y�=�A��4?��AU�B�A	P�iQA
��q�kA���V�A���A��#�g�A��,b�A��3u��A
�0&��AS}�#J}A�~��A�B_dSA�::�D�A��ޙA�NOɈ�A,ܐ�}�A�xB���A Ē?:s�A!�t�&�A"���j��A#{K�O`�A$p�z%��A%m�W��"A&rLy��jA'~٫K7`A(�g��o�A)�����dA*�y�i7A, �ޙ��A-4�5G��A.p���A/���U!A0/V�ˍA1(���Y        ?Fʅ�(�&?��[��?���h�>:?�U"Q�X�?�bza;�m?�o�&S�?ۍ����?�E��=N�?鷪0��1?�j�{�?���nQ�?������?�#l�c z@�݋��"@M�!��@
j��0C�@��7�@>)DJ��@N#�n�B@�;�6$@��U�H�@ �|��d\@#@��mO�@&4?���@)�l3��C@-]f��]�@0ԌV���@3>v�gr�@5�`;�M@8��C!��@<D�NT�@?��{gJ@A���/+@D*
�T@F���b@I �0�v@K�M.���@N�o�U41@Q�&�
 @R�`�x�@Tqm|P`�@VH�\�8@X3_6��@Z0�4*�(@\>�*.x�@^\���[@`D�@a_�|�K@b�K� g@c����1@d�Y>=�@e�g�� @g�q�b@hB�$�S�@ig���Y@j��cy|�@k��A��~@l�LXm�x@m�����@n�@��4#@o�;Jҿ�@pmZƂn@p��`��        >���> ?5�d��?c�R��"�?��+��?�T�X�5?�n�w���?��@�q?ދ�!�	?�Po{?��6W�@	(S8WX�@�y}l"}@ �[���/@)�%m�4u@2�]ܒ@;0���@C��i�w@I� ~��@Qd�Ȝ��@V��*��@]�i�%��@b��B��@g��U4@mhM��K�@rO��@u�i��@ze�7��@w�S�@������u@��\���@�bD+�kg@�ZvfeT@���הм@�G8�,'�@��PP�9C@����C4@������Z@�h-�#�~@��W��W@��>��@���W82x@�A���_@�����
�@�_�Ҵ��@�%4�Q��@���:< �@�_q���U@�&���=@��1�@���S��@�3�����@�y'rr�@��`[��@�6�a���@���H@��֭�($@�|q3No@��hp�
@Ȼ0nh� @�{J��@�Q�f�a�@�?H�
�g@�"F��        ?#��?��?^����d�?���f& ?�"?��!?��<�锸?� ��V?�&I��
�?�1�j��?��x���?���rPb@a��:r@������@!]��@'���{1@1�p��*@:1u%~4?@B�JϠX@JV�1Q�@Q�RuǾZ@X$M|�@_��aeݨ@dX�-+ۯ@i�D����@p)	}�g�@s�5����@xd�=�@�@}}Bm��B@��a�x��@��UC*��@����߈�@���sO�@��U���@�:,����@���TU@��p�@�H8�SR�@��&fy�`@�ɓ�97@��4D���@��|Cz	@�6p!*ݴ@��&�]x@�"�r"�@������@�J'�P;@����G8@�F��S�@��l�\7b@����~�@�E̿9�!@�L=�(�@��q�&@����7@�x�K���@��9�]f@��D@ÿ���@��c�@�#uܞ�@�eWm���@Ȳ9��:�@�
P����@�mԽ���        ?�~�I�@1�F�p%�@S��l*x�@k�z=hM@{��t/"@���/�qN@���G��@���G	�@�t�93�@��D�F��@��='*�+@��#^�",@����h@�����|�@�ɖ���F@�-����@�,�G��$@��dUX1@�:�XBx�@Ԃ��#@�`�x@����:G�@�xg���@�<���1#@�ۯ`j.�@���9��@�mo|��@�*�V@�B���@��=��N�@���8l�JA �E&%]AMZ&�G�A�Ul�rA�I�A��@�A��x���A2M"�%~AN?��A�|I0�A��AZ��AU�-�AK$�'D�A�F�'�Aظ���A!"�qA"GE>�k A#x[Wh�A$���Sb�A%ן�"�A'b4D�A()�o2�A)Iʬ�A*bA�mA+qϽ*f	A,wHq_��A-q��� A._[0t��A/?����A0�� �A0ip�T�A0����3CA1�֬gM        ?�[��<?����4_Z@2��[�@1�4P�A@��!-�@')���F�@0����@4���e�T@:h��?a�@@�A9��@C2�(L��@Fp\���@I�(�nx@MT��/.�@P{E�c+=@RZ�
�@TH>�B��@VC�fn\@XM�ֵ@ZdU��@\��-���@^�0�OM�@`�M�B�@a�)N�Lz@b�y�5�U@d��zn@eR[�G�@f�?��R
@g�G���@iSY���@j�ñv(@l< ����@m�-1k��@o`:� �@p�h��lM@qc�@rI8c�.�@s7�	��@t.1��~+@u,��ܧ�@v3?/�S�@wAt��B@xWb���@yu*�J2@z�����@{�[X��@} s�&	�@~@��<��@�MK���@�n��ZhN@���@��#���@������@�C����@��Z���@��iq��@���S	�@�^�}�@�/T�lP�@��L{b@�ކ�j~�@��'L�p@��|�7&o        ?eo�UKm�?�լgG�?��~&�?ֽ��_,i?�R��t?�dnZب@�{n�c@��f1@��s��@ �RJ�|@(���ҳ3@1Ą�"k�@9:�v�@A��-�ǂ@H�C��K�@P�E�!@V���$	@^[�Ej��@d�eηE@j	h6��@p�
�e9�@u27H�3-@z��9�@�h�3˕�@���9wr@�?�%�ty@�,�fP@�3��~�@�8�ѲA�@��S_gD(@�R85���@�qݣ��@��T6S�@�x�g���@�.6!KH�@��I�&@�O��{+�@�`_."W@�:���3�@�7~!�>�@�X�G$n�@��י�0�@��guc@��p7v~@�.��H�@���=y%�@�+@X])�@��(����@�|d����@�EH��@�##)��<@��z�i@� |MK1@� &��94@�;^<�
�@�b!��P�@Ӕ�����@��i�/��@���s>M@�va���S@��>�i�@�Mb���@����        ?j�:s�t6?�~�̸ߟ?ā)`Q�?ڏHc?�n?�Lz�N2�?�.�lڬ�@ ����@@���e�@� R#j@�n��+@�����@#ְ��A@*2�����@1@�.�8�@6����H�@=�
��<@C���8@Huk�Jr�@O��O�@Sv���<�@X(�k-v�@]���X@bE�&�K@e��2�;@iʹ�$Y@nl�qL�@q�O���!@t��l�@w���i�q@{1�����@~����=.@�j�P�@��v=C_Q@�ߚ��	@���D�r@����D@��b#�B�@�j�x�P@�ٹ cd�@��U�_�@�sO��@�[�&�@��� e��@�����ge@��)�l��@�b���V�@��R���@��_kf�@��1y�@��m�Vz�@�'~ ��@���ov4@�����U@����n@�>d�Tz�@���ש�@�N��[,�@��eP�@��e�!�@��GQl�[@��Oj��@��:���@��xF���        @l�	ks�@�*Y��}@�O��@�B̈́2�@��p-Z'0@��󡣄Y@�3��D@�����@@�ۢ�gmBAW�b�A2v��A	��m+)Ak���<A�{A�ApV��2�A uw�@A����+A�=?���Au�4
EA Ħ8��A"_W�6A$k�\SA%ɉ��7�A'��\��IA)�o��QA+yǛ咷A-��=�ܽA/��0[�A0����A2-{�/�A3m܍L��A4�����A6!����A7�����A9 �Q.ChA:�yrm�?A<n/�$�A>2�qx'uA@j��ROA@�xsvAA�!l
ACG9^�ADJ����AE,�̜�3AFOHN�˺AGzv��*AH�}8�A�AI�r�L��AK.���nAL{0��AM��sAO/)���APJ޼�L�AQI��CkAQ�����bAR}��w�ASA����yAT
��(|AT����?AU�S���eAV~�D��AWX"��_�AX6Ne��0        ?Z��^�x?���c��(?��wp�{�?�&/�d?�G��RB�?�8���Y?��p?��~�I!?��m@���@�s���@y_JY�@
����@�f=��3@��Տ��@����ˢ@�N2�#@n���O@��_�w�@!��m��@#�tQ{�@%�����@'����C@)����@,2@-�-Y@.��6� �@0�
��Lv@1���D3@3V���i�@4�&�9�;@6a���D�@8���dh@9��/ _@;�۝ׯz@=��7�̐@?�Jm�g�@@�]EJ�@B�-�q@CPZ��@D�i�g��@F
o�@@G�
�a @I"�{���@J�HGR�@L�VgRw@N��Q�(@PL�T��@Q_��6@R������@S��A�iN@T�1�r@VC��"z @W�-*�54@YuFX\�@Z�wx�J@\ D,�?@]�����@_ms����@`���a_�@a}#���@blDk�G�@ccL��b@db,6�G�@eh׹+Qh        >�;:,�?!��.��?L�}R��c?o9���?�2�b���?�{0��5?�Om��=�?�]D�Ty?��@�W?� �| �@ �y�+7@��rM��@2{�8@$>�w,�@/BV�;L@7L
h���@@��65��@G��j��@P4�� ��@U�c���X@\�7�]��@bwe;��|@g~RdHE@mx�>��@r@:;�[S@vX�YH>@{�8U=�@�A�ʢ�@�Z��<�"@���l�V@���k��@�P����@�*Ϫa��@�����@�����V@�����@�|�|hKr@���YD@�F^�H_@��y|5@���F��\@��d1���@�6�|l��@��2�5@�*JCO�@�f\f���@��o�n�@�m���)�@�<�o��@@��x]9c�@�>��)7@����E*@��j�sl�@��+YK��@��C���
@���G:l@�foD���@�o�8KR�@ѽ��hj@�a���>@ԑ{���]@��U��L@ױ�A���        ?ATz*:S�?w�k<>~�?�x���Ͳ?��2�p?�&� ~Y?̯��l'?�鋝@t-?�>�˚'?�]KU�:�?���-��-@ZT$�@
��#{t%@ȋuH@n���P�@$	��%��@+�_�-q�@2�.�$E@9V)�O�@@��Լ?@E��D�k�@LF���@R#�
@V�O��ۅ@\����>U@a�\��C7@eІ�P�@j���H��@p�OX�@s^�� �@w��uzM@{f6��<�@�"H��@��w3�@���8�G�@�g�Xߴ@�8��%�z@����͜i@�9��9B@���9j�D@�P����@�L{#X@��W�N@���U���@��I`X@��a�8�@���@�/�i���@��L�Mu$@����L@�Zrr��@���9ƴ@�0z��@��'~��0@�J���Y�@��=�FY�@���^"�@�p��َ�@�I'c�,@�2R�G�@����J�@����]7@¨k��@ýq��!        @
8Y�D�@G�d��@ha��O[�@~"Y�9�@�l�?@��*0�@��Ħ�U@�����]@��e����@��ϲ��@��vmT�@���Ffv�@�:�1&@��r�3��@ŵ���Ȯ@ȿD[xQ@���T��@�z��>�s@љ�iW9�@ӗ�A�@շ��Py@��qm�I@�p?y��@�E2f�@��Go�eL@�s��q��@�v�-@��p���@漵_�@��MB]�@��z����@�_��!v�@���\�-%@�]^�d+�@�ݳ��$,@�|k��b@�;}�P�@�Ҟϊ�@�"B��L�@�M�q�JS@�����=�A ��߼sxA�.��AK�h�)�A�Zk�'�Aa����BA>��A	��D��A�1�O��A�9���A�ԃ��A���GA�M��xAEG����A��v��A�R��A4���jA��Ā�TA%���&*A�dmYYA\����~AU: A nFH���        ?�T`���]?�Z�r_?�7�\j�=?۸ir�<^?�J��?�?�:k0�?�Fp���@�pū�}@b���`�@�SHs3�@�U/�e@�[	U��@)�R5O@�>q�T�@Pr؏��@!AzN�H@#9ͷ#�@%B�M��@'��� 9@)��H��h@,���e̽@/=kmr�z@1�gz��@2����UW@4Iv|�0@6��Ь�@7��'���@9�}[`��@<��'�R@>>�K��@@M�ɒH�@A�:�."m@B�O�${�@DD����@E�v�WpE@GM[�y�@H�;sV@J���A�@L��xר�@Nl���M@P8 ���@QGTJ���@Rd�sF��@S�1�!@T�8}@VGI��H@Woҧ�q:@X�@�[�@ZO�!!�@[�#�0@]l4L}h	@_O��y@`d��!��@aH����@b5o\�V�@c+��Te@d+	W��@e4q��@fF�Q&�@gc�h��@h�A;�@i���d&@j�%�n�        ?#^Rq���?b��@"?��]���?�X���K?���{dr?��L��R�?լ�k�l?��p��?� �����?�]�#b
�@;�*~c@�ź�D@U�	$@!�H�m[�@)�эm9G@2B�a�M�@99��}ٙ@Aǟ m@F�1��2@M`��uS@R��(�%@W��2�м@]V�jVf�@a�X'��:@e�R�O��@jѓ: =@n�����@r&�Q�~�@u&�$h��@xt���K3@|T��@���Fe�@�'�'���@�w���@��
���@���&�u@�o���A�@�r��|�@�Q�r�9@�+"��N@�ʅ1��@����L�a@����9��@��N���@���KO��@�<!���@��j�='�@��4�4@�q`�^G�@�كA�H�@�S�c��@��c�6l�@��	���@�9М	@���q(&@���Mqڈ@�s�J3��@�~�&�8?@���D�2J@��Ѱ��:@��]E`&0@�5�"�@��c�7n�        ?�ӕw~�?E۲�2�?eVa4�S?�NUB	?��L��3?��r���?ğ�"�/?��3��?��.��?�î���4@z�Eg�@pex-~�@O�hT��@&	���Y}@0�tN��@8	��_7@@����P@Go~�X�@O�r�@T��rp.@[Qln�9@a�}�S4@f4y���#@k�#3�m�@q0��49�@u܌��@y��Mf^p@~ϐ�)?]@�l|�U�@��܉�@��~�h�q@�Z�S\�@��c8]�t@���9�S�@����"P@�eS�ߊ@�\�h��@���h�=�@�A��vy@�ޭ�-�i@����p�@��Z
c
@�<��@��<H�(@��Lq�4�@��Bw.a@�* �)E�@��p�"�@�(xi�uH@����A�@�nlL�{z@���4R�Y@Ī���*y@�p4�S�@�P��q�@�M,��)�@�f��V��@Ν��e�@�yy;IbY@ѳ���@��)kBʌ@�X�r�C�@��U��;        @0'�-��@^��QdGT@y�l�<��@�ﲾ�M>@����ǻ�@����K�@��,W@�7��-SB@�مb���@� �OH�n@��9JPo@���F(\n@��l�M�@�0���Q7@��CȫO@�t�Z@�'��X@�leu �@�7 ���^@�O��
�0@�)c��\�@�+ȺK~ @�Z��g�@�ٝ�ۘ@�L��t�@�8�;_F@������@�-w]��s@��yw��@��%�΁@��A�k�@����7��@�L@N��@����U(A ���4�A�ŧ�CA��+��YA1�oX�A�msM��AzkD�q�A
P���1A?fa�D�AI���<qA7�	�:AYu�!J�A��z�sOA��٥�VAm�d|Au�.�osA� �AAc�dJ��A����cA�J��BAO4H��A #D�|A �*B�A!�!P$'A"�1����A$ڙ��A%-QS��A&V�U.A'��Em2�A(��Չ�        ?V�no#�?��Ųx��?��0)��?׋���?��%x
�E?�a4$sT?�ѹ��;@�k�r2@��� �\@'�½U$@'Ӑ���@̬�=|u@"M�I�@%��=v�@)x���j�@-�1���w@1E���O�@3�;�ej�@6�O���@:G @=��S�G�@@�s����@Bԏ��s�@E ��<sw@G�M�Y�@JKi�5P�@M+�*�J@P�dD5@QÔ���@S���~ũ@U[�k�#m@WQIvS@Yc��{��@[��o�ٗ@]�J(
l@`&�Q��i@al^���s@b���Da�@d'SW��@e����=T@g"��
��@h��	$�K@ja�uvp@l=���<@m道��M@o�t"1�@p����1@q�Ze��l@r��z�v@t���N@u9Yc��@vm"��$t@w�\��U�@x�H�oQY@zT�(�@{���'�@}.����3@~�V�U�@��a�1^@��ʬsD�@��~��L@����p�@�zd�?�        ?F�yvye?��K�˯?��L��X?�ٴ%`�X?�xLp��w?��i�Q?�!���F?�AZ+z�b@�ah� @	��w�~;@�SL�@E繤�@!�v��:�@(��r?�6@0�=���s@7s�c�@>��J�S@D��>�7F@J�4K10@Q&�g�@U�%Z�@[���J�@`�-�H��@dL�Ig@ht��n�@m+��;9�@q?TCr�o@t;Z��@w�L�ŧ�@{@\+c��@S�O)B�@���B�Ӝ@�Y��J��@�����@���-Ϲ�@��я��@�6%�`4 @�?���@��b�a@����[�@�Llru>@��s,�U�@�6@څ �@��棷h�@�a�La�@��f#�@���	��@�18/ӥ6@����@��nH���@�״�W9�@��J$�@����N@�4�(D)#@�h�h��@������@��i|=�@�_ģ�n@�ш�?��@�S�8�� @��C-�R@@��Gt��@�Cxt�"        ?9Z���:5?v��Qq?�B���?�x����?��I�MX?���pG��?�Di��1�?��o|ǐ?�!ݱ�b[@����1@H��.v@!N�9���@,g�R�@6m�A�@A��6�z@I#r��@Q�Db�t@X�����@`��Ğb.@f��1Ll@lvp�@q�s�_�@vD�~��@{%ˀ`YY@�L�����@�OB���@���v�BZ@�!~%Ap@��۠G\@������@�C��@�Vu��G�@��eL��@�&'���@��0��#�@�i��)N�@�K��@��6�Ț�@���'@��y
��@�X��C@�X��&4@��p��U@���ڈ)@���y�/O@�T�?i}@�`����@�x9�Cq@���[�`p@�̕�]#�@��N�0�@�Zx��Ӛ@�����R@�*�20�@��kl+�@�Gx��,�@��%��6�@�\�z���@�JT�5��@�D:��ap@�J��>Z@�^L5��S@�HCɠ�        @ '��Qj@c�����@���Zb�Q@�)��N@�Gt�S%M@�U�F��@�=܁�'H@�O�PHn@��c���\@���_��]@����Jc)@��IP�@����@�p����P@�<{B~@��G�s"A@�����2�@�6w�}�@���-�<A �?��^�A�ݱ��A�c0�A�,���A
2�C�A�
R�PA˔�Q�A�0��4Aa�Ii�A4��r�A!m�
��A'�/3��AH�IP	,A��w�~�A���c��A!)Xr�oA"s����A#��j[)A%9g N&A&���U�'A(C�u��A)�w�t��A+�!�!&A-_��nK�A/;����A0�����uA1�����A2�3d�A3Ǡ���A4��,M�wA6'0�)��A7k!��-�A8��!�1HA:3a��A;���6��A=��97�A>��	��A@�&�i�A@씿 !AA���f�@AB���滩AC�7eoAD� �`��AE�+V��h        ?Rg&6>��?���$pV�?���;8?��-�R?ϋ���?٩,<?�S�_��?�x^�6?�#���<?���RrTD?�+rwFY@@�����@�H�N�A@�*�@3�Pom�@=/!W�@���X@�!쉹�@菌L@���"Ȕ@ �E���7@"۔p6�@%!�Dh f@'���&�2@*31V�1�@-&��I9@07jx�@1�j�+@3OZ���Z@5�����@7
�ϕ�@9
�Y4X@;9�/�K�@=�����@?��b��J@A6h��@B�K�@C;)@Ec)�
~@F�>�?@H}Y��H@J"A��u�@K׌No�X@M���T�@Or��kv�@P�k"!��@Q��T�	n@R�Ϧ]t�@S�^ ]�h@T͚q|�@U�2YF@WG�@XA���j@Yzuo��@Z�j�G��@\,�_��@]^Q���n@^��nx�@`l�ܦ�@`Ә��@a����(&@bc�4=3@c8as2��        >���Ŧ��??l
^��#?e��&���?���~�q?��]��?�#�	��?��R�_�?����8��?�5�3RƦ?�<c&��?�]B��@�A���@<v�T�@m�犼L@"(�ȗWE@+M���@@3�����k@<y���?S@Cگ��K�@K!�P�J@R2���C�@X{��_�@_7<���@d�����@iYI2M�n@o�����@s��z�V�@x#�	n@}\����@��V�� @�2F�(�@�0h�~@��%\�@�n�ʳ�@�P�	EX@����h@�#�����@���3%@�� �:2@�+����@���*���@���`C@�˞l��@��U\+�@��6�?�@��I��@��ht5�@�!�Ȩ@�|� ~�_@����~`@���>t�F@�4�~��@¬�d��@�7���l�@����?�[@Ǌbc�7�@�R��� @�0bn}SJ@�$�W*@�.xF���@Ш���i@���3訫@��7��C        ?�+��k?<|���?`tc4ۂ�?{(A^�&�?�3�Gm�?����O��?�,3�B�.?�
D �Y?�x��X��?��&�c@?��+��x�@	-d�
@����w
@ Y�2P�2@(�k^@D@2[&���R@:H���@BZX��Kn@I3V�@P՛! ��@V9dWX@\�c��@b��0�%@g�@mo@m�-�h�M@rU��(+@v�z�H@{k�Zr�I@���\��l@���z ��@�q�t�@���@����h�@��ƅ	"y@�"l�I@���X��@��b�>5<@���T��D@��x�Yݬ@��h,��@�'��b��@����#f@��=1��@����s34@�HO�泒@���BK�@�I���@��(�b_@���r*Y�@�H��(iU@����@��	K�d�@��ח���@��0�"�2@���6o�@��ud@���p�+@�8� B^(@�a�h�j@Ɠg�0�@��1���@�g�@�_>PJ
�        ?�쳝��n@5!���rJ@Vt����@k�@pȣg@{����@�z��QB@��W0�@��m���@��#��@����f�@��'M�"{@��	���#@�Is��1S@�MJm~�@�B>j���@��$�*�@kV
@�u>�	@ȣslܬ@�"���V@��C�-@���<�@�[�:.�]@���hL�@ق�X�.@�g@Z�8@߅(z�@�o^rTtI@�;"	f�@�'lc� @�4^��J@�d�T�̘@������@�8�RH �@�p�Ϭ!�@�����ˈ@�\Y�X�@���S���@��a���4@�r�$��J@�WǑ��@�Wƣ� �@�s4�g�A UY��QAj�L~vA�
��A���3�AVjrݚ�A���	��A2��fA	�D-bAL�+�mA��/��A�m��AA4�Nm��A��*A��]��A����An�?Aa�,�A3௴[lATa�CxQA`�~�{        ?U��q ?�t�>��j?����&�?�D<��S?ц���:?ܧ-T��?�-��*�M?�D����<?�G05�:
?��JL�V?�P��X�@Wvb:��@Р��P�@	�I�m$@���.�X@�
@���P��@&�o@'�G\`@%���O@��G�}@!��v:�@#�G��X@%�[�}�@'Ȫ�Րa@*����,@,�F�ts�@/&W�\@0�ԧ�@2O[�&]@3���/�/@5S��8@6�8golJ@8��+2�@:f�X�1�@<A��@>2M��@@D{��@A-3�,@BH�Io�@Cn�;��@D��S��@E��	,h@G���@Hh�L��	@I��΍�`@KrD��@L|.#�:@M�銋��@O[�+�y@Pl��� @Q.�p��S@Q��[P&@R�P�7�@S����!�@Tf�6�gi@U@�ŝ+@Vn_��!@WՎ<A@W�c����@X�ǂ��5@Y��ys=�@Z��1{�        ?yC�{<��?�  �|?ә炔�V?�WmR��?��s�^�@������@Nyꄛ]@�H0�@����@!�'q�^&@&�$z�N@,ˆ5{yL@2(�(4��@6�Χy��@<�N��h@B.����@F�5��+@L�v��@Q�tP<�s@V9�����@[n��g��@`ї͢i�@dz���B@h�7#g%�@m�׍�@q��Y(��@u	�
���@x�??���@}g؊�@���	KsG@��@�,�@��n{OR{@��a��� @��`��1�@��d�;��@�$e�	;7@��)s�p�@�E�,GQ@�,�즄�@�O�r�^'@���m �I@��v���@�����@��(�#�@���X��n@�%����@��R�^�@�P��W@�iyc-T@��ʘE��@�Dۖ�@��7��n�@�Ybg@���e}��@��"���@�Z�{���@��Ʊ�@���#!U�@��?� �u@��U���@��W�@�ȓ�3Q�@��rz�;J        ?(O�>�?b�+b�Z�?�x��`?�A��~k�?��<F��?�▌�?�B��s��?�E��z?��(3?��Pn��?�g�	�*�@{cVr�@:5���!@�x��8�@!��z���@*k��~�@2��޳��@:�����@A�x��'�@H���[@O�ּ:,@T��R��@ZfdiUE�@`�T��'�@d�Q��t�@iW��@n��ϤE@rl�����@u�`q�@y�qZ��W@}���t��@�U�[�>�@��mֵ�@��t���@��c���@��-"j�@�+s�Y#]@� ��4��@��|�d�N@� ���N�@�*����r@�q�J�L�@��f�<�@�S.wS��@���$�x@�Rg�{b�@���/�@�3�葖v@���k]
�@�M�/��t@���19@���Fg�(@�d.�)k@�5j��ӽ@���k�E�@���&j@��m�fH@��u���`@��t�;�@��{�^7@�� �>�@�$�;κ�@�d�6��        @.����@e���@��.u"@���_-w@�@үYT@�L`DB'@�4w� 3@�q!�>/n@�����w@Օ8v���@ڵ�P��@���@����v,@�'�8 �@�q� /'p@��x���@�L���D�@�>?r��%@�J���@�q��݃�@��;�ԩ@���稆@�����{A 
���%A]c ��A�)(?VA"�>]~�A��_��A5�qՉA���Q�A
 iv��A�n]f&Ak\����A)x�IkA|�m��AmGΧ{�Af�`8Ah[	C��Aq�g��gA��'��A�OW9�A�@+t�kA��J�1ZA�:z�A?3{]YAy�8�.A��\g��Aqe��OA .�*�U(A ��\IA!�-���A"K��\A#
��&A#��A���A$�;��J�A%f~�=��A&8�9�
�A'(��S�A'������A(���/3A)� ��*"A*d�)�5A+6>ԁ�        ?���*TA?��D$�b?��@�S�?���@	�^��@Q�6&e@ 
�	��h@&�4~v@.7�$�ݟ@3�毌K@8���:#@>?�Έe@BVf�W�I@E�*��.@I�l�7Q@Np%7�q�@Q��;bnC@Ts�ۛ@W{�&��6@Z����{�@^�@6zJ@aD�?8��@cz&x@e����j@h���[�@kZ���h@nm�%�w�@p޷�>@r�%Qb�@t���~�@v��zY�@x���u	^@{!��@}���
@�,��绐@���DX�l@�2�9��@��C�
��@����qv@��+�Gv@�Ľ�;7�@��F-�R@�H�L���@�ئ¯܁@��:]�@�e�ֹj�@���]&@�%YZ��@��T쟅�@��I�@��Y��%�@�K����@��m}zX@�������@����\��@��z�R�5@��ya�J�@�����$�@���*KM�@����s
�@����E~@���4��?@��&0Qi        ?�U�c�?��b�\�?舺��@ Q����@z��)�@x�g��@&f>0�� @0��~�NX@7����*�@@*��l@E���~1@Llߕ�o@RU=E�s�@WLЃ{d@];��R��@b ��G�@f?Εŏ@kV�K@pE?Yz�g@si8�AE@v���D�0@z�+#y>@U��mm	@��K�f>@����!ت@�����a@�̏�p�@�1��RY�@���뿞@����'�!@��7\0�@�@E����@����a��@�<�@��@���w"(b@��(��Ay@��r�2@�2ƥ��@��?��t�@��d�f@��Q%��K@�W4�I�@�e�0���@�oe��M�@��0�yP:@�)���B@��z��5@�A�F\u@��ˍ�1@���h�c@��Q>7Ú@�����S@�Ȫ!ɱ�@�An@�1�G��@�p���;@����uw@�"1E���@Ǖ�/�� @���B�?@ʵ[�.�7@�b�J!�Q@�$zR��        ?�9s4��?�\˭@�m@ n�m�@'W`1|�@*��P�|@&�y�D]�@/��A@4/�K�M�@9�i!��@@m��|�[@E6
Y�@K��O`1@Rw�/�@X�u��ܟ@`�(%^�$@f)�49�@m �2�@r�f �ԭ@x>UpB@~�ܹ9�@����@��O�u�@�g�e��t@� ���.�@��*�vo�@�h ��1�@�1�qߋu@�r](W�@�� �@�k�A�ߩ@���o%%�@�U����P@����h�{@�>��[@�����z�@�,lHΧ<@���G���@�#4HeN+@��a�h@�$A!#.@�T�Tk��@��Bv�I@������@��+>�j@�q͒�l�@�?"s]X�@��d���@��֭+�@��\߰��@���t}��@�|���@�fPӣE@�V�b��!@�N�mј�@�OY$k+j@�Y-���@�m#��]@��'Z��D@�[�uxK�@���|��{@�����H@�E�`���@��[I䳔        @{Ɉ�D��@�+o��z�@�� ~�@�V�`z@����AcK`���A+Ah��&A!L����A�b��ZUAmm� NA#~��XA&�;�㠱A*���pA/h�C�ȑA2"�jV7A4��W�ܷA7���i�A:���pnA=�Q	Ml�A@�O����AB����3XAD���&AF�T,��{AH��5��AKf�`/�AM��W��APT*��AQ�U�.��ASB���	AT����AV�:"¥�AXL'���AZ-�$��4A\-Բ�h�A^Q@ ��A`M�U��Aa���ej�Ab�2��AdMXDmAe׉����Ag{:�?FAi5R����Ak|2�Al�A�c�An�J�>OApd��H��Aqi�K�,�ArvӠ��VAs��d��At�ٗ� �Au΋�a�"Av�	���Ax4u�2G�Aytډ���Az�.�v,�A|a/~�vA}k^ଡ_A~��O�bA��[g�A��X���A��>� �[A�ZslU��A�!�Jێx        ?O�n\�'?���Y03�?�!X��KE?����IN?����c�?ڝ1��Ii?�"[k��?�u�{��?�V����?��	��q@ l�8��@�wJ�'@	��@@�@����F@$o@��@��$�ْ@:)���@ �A.@"�<�@%����@(��M!L�@,eP<�6@/�c�+�@1��@3��*d(�@6��R
J@8e��6��@:�[;�0@=A���0�@?�&��@A0�k���@B�T$u@C�3ʎ��@E"q�>B�@Fq�7�}c@G��ۦo�@I�Tc�@JIP"�"�@K�#����@L�c���$@N�Iε�@O?5��e�@P?���@P��B�@Q�%z@R-1�dK�@R��r`�@S�ǵl&@TC��0��@U��o<@U�e�q�b@V�*C�d@Ws!2BG@XX���@YK< @ZLp��@[]�Q2ĭ@\����;�@]��bq��@^��P'	�@`-��^Gp@`��hb�@a���3        ?m�|��?DM�i�?kЅ4�-{?��a]f�?�Q<��m�?��bu�?�+��+�$?լ�6�:I?�>����?����@;���s@���8��@�i���@)GcR�}@3�%pM�%@>=�=�+�@F{�Q@PI�����@W3�-�@_�q)�a�@e����@l�]���@s��\��@x���Zu@dF{�g&@��AMٝ@��Я�ZL@�Y{p�s�@������@�`!��<2@�Ш���@��r�@�ϸy�#�@����)@��m�z�T@���lp�q@�8�Z��@����v�o@�D�om*�@�:�'_��@�tF�.�X@��10�_�@�����?@���"�@���@�dל���@�݈(~u�@�{�c�g�@����@ѓ|g4$M@����z�@ԯrq�ux@�V���@�)`3�j@�У�d�@ۢ����@݀�����@�j��]g�@�r�"A�@�"���@���o��@�G�}U�@���)�A        ?!NZ�x֨?]:�[|�?�,ex�f}?����{n?���k��?��x��?�lo�:��?�
�\!��?�4b]$?�ѧ)���?����!�@�|��9�@=L���=@@ҏ �F@&�Q��<@0�'���@8@�A�I@@�6���@G] ��@N�]Uh@T)�(8�@Y��H]�@`w!�p�@d���n��@in;�A�@og+a�c@r�	lrY@vmﰂ
�@z��� ��@@W���{@�86X�Ƙ@���(3m@�:��ȅ@��s{��@�b�]��@@��
��W�@���-@�3F�.k�@���o�@�S�Z-$@�!��t?@������@�킽�@���*��@�{�Y���@�JU�z�@�-���@�%fWɯ@�2�G�@�S?�\��@�Ā�l�@�鞹�)�@��T�@�R?�A�@����h3�@�⏨�r�@�9,갳U@��*����@�T��-�@�tz����@��o�I�@�sL��Q@���@b6        @X)��[!@H�~��n@k#��q�@�����`@�P�`���@���G�@��	�@�x��3�@�v՚#J�@�a;��?@�S�	C�]@�=7S���@��=���@��b ��@��{8��@�ѻ^֏�@�C0�:7@�O���'@�S/3C@�6~+�z�@��(Y��@��jN/�@�Eө��@�=+�q@�\�+�JA��4��As~��w�A�!?��A	�QȚ1cA�k#يAxC#BD2A/GFm��A��6��'A���A�
�j�A�F��AL��Yz�A���AړݶAV����A��SrI=A b\ h�A ,�E�I�A �	|��A!��R�dA"L��y
A#9���A#���||A$�WhՈ�A%��k��wA&m����A'aB�k��A(a�ӆ#A)qI��,AA*�P�ثA+ç���A-	ݪq��A.e6o���A/֫h�!YA0�}d$A1]M�kA2[6됇�A3CC��         ?o�#��?���;��?�!�ɗ�d?չ����?�J̀]y3?�a�F�h_?�˛$��@ �v#�O�@+���@$:��r@�88'�@[��X�@��Cȃ�@JJ�&b�@!��e �j@$�HR��@'��7�@*�e���@.Mi�H��@1W�o�<@3r��$@5 �$R~�@7[���E@9�|�Jd@<,L[��@>�d�+@@�Rs�:@B'�#+w]@C�*z�@E2��/�@F�H����@H����S@JV�%
�%@L9"Q�@N3]���@P#"cO��@Q9��
�@R]�*��@S�ͭy�D@T�#�AX@V"uQ�@W��K��@X�F>���@Zu�@�q�@\�/�G�@]��mw��@_[��u)@`�-J�.�@a|O,�0h@bs��kI@cu��f' @d��3��@e�~X@f�!BZ�}@h����@ic���v�@j���@l9��%�@m��DEX�@oQJ�u�d@py�zJ�d@qR��;�T@r2��        ?�}I�J�?Dq�,�?l����6�?�wS�Y�?��ض�Q?��2ι{3?ʌ2c��?�/�[E�?���Frh�?��v��@
DW�a�@�u_���@"�do_֬@-��;�k@6��e.O@@��u��Q@GĄ�8:@P���ҽ@V�����%@^�*��@c�3�@i5m�7�@o��f�!@@s�cJ��@xA�u�@}]B�T�@���m4�@��o}l�y@�UV�*�{@�9����@�9v5�t�@������@��B�sy*@���Ds@�7��Ļ@��4&��@�~��K@��fV!ʻ@�[��A@���oC��@�^��L#@��HO�"@���Zv-@�}.��t@�>��Zx�@�7Ɵ�T@�i�(�N@�S��S��@�@t&F�i@�0� �{�@�$9-�+�@�l����@�g\�=Z@�Y~<��@�{��K@� J}X�@�,WzS��@�=�g�?�@�T}�/�@�q!��&�@��c���@���zj�@�w6��a        ?@w���?w�H�^?�j�>8g?��2]s$s?�U-ϵ�?�����c?�s�|6{?����yX�?�kgf��@�[�<]@��z[�@;�i�d@ ��(pj�@(=#ڡ}@1]@/�Ł@8Z�'��@@�(�rw@F�/��h�@M�	 z�@Si��@X��X�=�@_N�v]�*@csm*&�@g��Ń��@l��
��@qK �@t{��e�@x����)@{�m&��?@�����@�_����@��0*j�3@�}J��K�@�N�׏�x@�Kr)�M�@�9�e��N@��]qN�@������@�u��M+h@�^x3*�@�Z���@�l���@��p	�6�@��� ��@�Fe�G@�=3��@�xYѝ5@����N�l@�\>��@�i�C�@��N���@�ADz�u@��f��@�JG*�IR@����@�D[ĺ��@��QI�@� �Uۊ@���2�|J@��	� �@���q�0 @��J���@���?���        @e�"�sc@Rp]�x��@r&�*��@�Ia�A@�)Z+05@�B^t��@��� �:@��*�XS@�uc\�L�@��vUq�	@¬�n�4�@��O�0�e@�UHH7d@�/CNPj@���{��J@�����@�c��$�o@�<m��}@����{�@�	B��Y@�
ŏq�@�vh�v@�8��JU[@�o��n�@���}��@�>���@�W���@� ����@�鋲k�@��F�|T@�� ~�@�I�BQ�@���z��A	��wwATf��-A�	�|�<A�y%�\A�����A0�Gٵ~A	ם,�s.A��9�Ab���`�AH(|7:A�B
.��A�;pq�A�7�>AtAڠ@�A�Js�A<�gn��A��j���A��r��AE���A��?q8AfL�ZA�s�A y&�o@�A!ob���A"p��j�A#|Z�S�bA$��ZVY*A%�4F�ŞA&�n]���A'�"Q�I        ?,0��~?f�d�B��?��9�~{�?��'�|3 ?���ӵբ?�����-�?��y1}�?�c�g�?�lg?�ZD�qi?���I+��?�v��<N?�u����?������?��z�݆?�\M�R?���/�?���p�r@�x�!��@؇/�YP@I�s ,@�q��G�@�ijrxW@��y&�@��p�u@�̋��@bI�=�(@Gg(�@IOHߌ@h<۵o@����@w2�[@ ��ވ�[@"��$j�@#n�A�{@$��Z��@&f$���@'�=��q8@)�Տ?7�@+s��3@-Rp��Q@/K��y��@0���$�@1�Vp뽀@2�Wo^^p@4,kf�T�@5v2`5�@6�A��I@8>�E�@9�7����@;N���K�@<���[�@>�{�W�@@;v���@A+"B�N�@B$�
��G@C)*���@D86(��@ER%���z@Fw�,A\^@G�C���@H�Djɩ@J24�!s        >Ц����?��.�-�?C�Ou'4?c��XX?~� ���B?��x�S��?�������?��uo�B?̯��A
;?��	�Jco?���X�W?�cJ�^��@������@9�8wln@��04��@!�_�kaq@*�k@2�M�?f�@9�	�ĝ@A��G@G�8�,DW@Od�coQ�@Tc��1�(@ZOli�@`�Gs(5X@d���d@i~I�&@o0��4s@r�&l߆A@v�pT%S�@{s�{l@��o`�@��>X&R@����b�@�e@l{��@�?+Ք-�@��l���@�@�?�@��S�ƭ@�X���L@�Ps��z�@���[�	@���a�@�ʊ���@��;B�A�@��7��m�@�������@�G�L_r�@�����0�@� F�!@�s��h15@��׷��r@�K<v��@���9��@�`G�8@�lZ�@��0����@�rdV��Y@�B[QK@��b�*�@�Q|ʶO@���;@��e�JW        ?#�샯:�?`'�*4 ?��b�9>�?�����>d?�I�|��>?�[db���?���U媻?�����?��<�5�9?�3��	Rb?���{��v@ (=���>@	aa�o@����@{6-��@$�����J@-�0��@5/'�1w@<�$ԭx<@C��Äշ@I�n��a@P�{�D��@U��ﵨ�@[��
 @a(�rg�@e"b+,�@i��sF�@n��<���@rk�<��+@u�Kw\��@yc�~e�@}m�;�P1@��5<�a@�S�`�7s@��)b��@����2��@��`�M@��i/��@�"�;��@��i�$%@�˫HD�@��<{�|�@�ќ��bH@��Fn�@�0�W�[C@��e5�d�@��q
)��@�.�	��@�u\�W]@���i�;z@� KW�@��2��Q�@��@�^��@�jM|���@��x+ǢJ@�x�V&8a@��B�o�@�X�>G�@�/�(�r@�
��{�@�쩢6�@��X۴=�@��3�W(�        ?�,+���@9��*��@@d/�^��@Wl+J�N6@h��@u����l�@�7P�#@���@�uR�+S@�f_6)%�@��!�� �@�̨P��@���[��@�I���7B@�V��A��@�~��O
@���+y�%@�"s� L@���@v�@��M�æ�@��A@�@�|��ޓ@�@��|�@�@�ȝ�8@΀�n#u@��-I@��aJU�m@����^�:@��H���@�i��mo@��ٮ%�@�{<��{�@���]�j�@��Kڬ@�(���@�)��I�@��ZO�p�@��0H��@�P;�R��@�)kb9X;@��?��@��b��X@� �]B@���P7@�:�d�@�`Mnc/K@��E�~��@��^٦�b@�V��{�@�o�aS�U@���-�|@�J�}���@��@!ͨ@�d8 ��A ���@�A`��̸�AEȍ&}�A3��u$�A+�hjϒA-3R�moA8�t�4JAN�ԁ��Ao���        ?���P\�?���:͕D?��M�k?�*��=��?���40a?��� �<�@������@<PWA�]@��y$N@�
�d�@(�aM%�@!���^��@$�m��]|@(A:U���@,!��*@0�\��@20ݜ]~O@4��O�.@6�I�cn�@9�{��s@<op�+�2@?k�7�4@AJ�IRh�@B������@D�K�^�@F����@H}`/;�@J��T�@L������@N�"!���@P�U).<v@Q���.�@R�R���@TC�j;�@U�xi��@V��}^@Xj*�Ǳ�@Y�h���y@[j4N3@\�Q=�|&@^��!%��@`��k�@`����u�@a�#Vx�`@b�z Uz@c�E��b�@d��ED�@e�����d@f��tn�@g�	}�$@h���;C@i������@j�����@l	)�e��@m5���(@ng��8�@o���G��@ppF��X�@qyA�[�@q�%t�@rc�āX@sl[��@s�wc�q�        ?�l�ӄ�?S �Jb�?�1k�)�?�_	6� ?�����׾?�<~�m�?�+��I�?�Iej�#?�l3Wo�?�p��2�@1��٢@�|U1 @�?�څL@$-���1�@,��M��@3����@;G@c���@BWL�?0@HKrd�Y�@O���_C�@Tx�F2@Z�Es@`nb>z�@dy�/�q@i@hH�@nո����@r�&Ti��@vZ�A�i@z��)��)@Q�#Y�_@�QF����@�E- ��@���K2W
@����Z@� 죴��@�=��d/@�if(���@��B�-I@������@�V۶J�;@�W���2�@�CP�RW@�� ���@���+�.�@��b�Х@����ZB�@�������@���b�&@��*S�WP@��q�ԥp@�̗	c��@���ɐ@�J����@��㈶,�@��]�g;@�M˖�%@������@�&��H��@������@�!��u!@��p�[��@����Q@�k��4�K        ?f�DK$`�?��c��|?���i��?�1���?�������?�H����%?�I�6�WR@L�Rh�@+�aP�W@��u��@#Nɂ壌@,7�VF�|@4@�X��@<�>����@C�M��\C@Jڻ/e�F@Q�V�SyR@W��[H�I@^����@c�3	2�k@h�"�B۲@o)EI8 @sFAx���@w��:� @|��^j��@�2����p@�~��,�@�;^ ���@�p�j���@����PC@�3o��}@���,��@�P�����@�����z@�W�*�Hn@�p�rQD�@��%��K@�-{��i�@��l4��@����L�@��Ttj��@����.��@�G�Ѳ[@�(��ꡟ@�)�?�@�J��3g @���,
D�@����d@�C��5Xw@���e4�@��I���@ĒY�8A�@�,u���@�����TW@ɤ[��f@˃S8@pz@�zd..�@ϊ�R@�����@��͢�<�@�):Ҵr�@�e	��o@ծ{����        @7��^���@p?��P��@�����@�QM�ch@���;v3-@�3f�'@�;\.[ex@�d�!� l@͙�z��@��E�Aie@לM�C7�@��}��.i@�P�7FY�@��D�@��ɜ^�/@�����V�@��nm�1*@�Fz�`A�@�����@�v��0�@�d果(p@��z;���A {��(j�AO<��?�AB�|�AVf@�A�k�drA
�'VdpWAW�QX�A�n;|� AX/�RͯA�=���AL��Z�A��h���A���^�AGU���Ax-��vA��*ڥvA�9H�hA v����$A!�W�E0AA"�.�	lA#�����gA$ݢ���A&�xNlWA'L�[jb�A(���;�A)���3�A+FƼcFA,���v�A.)C�v$A/�+j��@A0��B�$A1meZ=7`A2BF�2�A3z�H.�A3�ϋ��A4��|3�A5�=_ӌ�A6�튴�A7ŉ��Y�A8��W��KA9��J!�        ?Y>��<��?��נ�?��MF�?�(�3n/?ҕ���?ީA=��?�����,?� OP�#�?���S�?���M�h@S�
���@'�h���@	V�C�D@ߔ���@a���@(T���@�͝�	�@��0@(�C�@ ?kr6�Q@"�ft-@$Gx�@&$�Ӽa]@(a��
��@*�����@-T5J�u@0�|�@1|�c1�r@3
^E0@4���@6o���<�@8H���ӟ@::��!@<GB���@>n�Mр~@@Ŷ�&9@A�yTO]i@B�4���@Dj��b�@E�I��5/@F�Յr�@Hz&��@J�_�#�@K�/�J�@MjM���@O1D���@P���`0C@Qy*��I.@Rvc�@S|f�@T�^�A@U�|��@V���Ҧ)@W�����@Y$��<7l@Zc,^�3B@[��>�@\��:ζy@^[�&��@_�����@`������@aZ�qr�@b�3D�1        ?5��*4?v6���?�ܘX%��?�8,郊)?�S؏� ?�9*�<?�ԖU��2?�-#���?�{IU��i@|=��~@
�im @��vª�@��pX@&�Pp ;�@0{X�.�S@7U�.��@@/Teό�@F��3�@Mq_ ]R@S^O��.S@Y�V�@`I��@dU]�2��@ipt�U�@o�;&n��@sR�GR?@w~��b�@|RD�!@��UfXNT@���W@����@�A@�����@�r��h�@��^R��@�g��c@�u���$�@�� 9�u�@�sM�imV@��y�'�@��`Mu @�$jY��a@���-�9@�>@&�Œ@���-��@��;p�7@���ݭ@��)_�r^@�w.&\�Z@�G�ѹ�,@�,n��@�#�ѫ8�@�-ꉢ�$@�I�`�\�@��\V#�>@���n6�@���z��@�- �@�@�`�V
��@ƚ��h��@�ڮB�+|@��l��@�iѠ�Π@˸Y��M�        ?V7�Q��u?��,��J�?�IY�2gd?�ܼ��4?��=���?纚�$/�?� _��?��ŕ�@QB�e�@
P����@���U��@M��P3@ �z7��@&��E�@,�3f�L�@2�4��C@8Rb1`@>ؒ��u/@C��i���@H�o{*͕@N��!p�@R�s��U@W6�bj��@\2q0Ͼ@`�w��@dPľw @hKq5M�@lo�����@p���i�@sc�ޭ�@vo2��@yЕ�<4�@}���u�@��Y���@���0��@���g��@�'��l�@��!�VL@�`m�/�@��	�"e�@��6k:��@�k
E�n�@�v���j�@��hz���@��
�S�x@�v~���3@�9�p��@�tM�|@��Pц�i@���w�2@�0b�E�@�� k��@�Ю!z\@��#�c��@����d�@�,��@�&�RP@�X+~s�@��ܲA��@��kY��@�G-8���@��{�Y@�3���qv        @�0W��@R�&D�N�@t��X�y/@��P~�v�@���t�$@@��No	T�@��rИ@�	�m@�B��9L	@ǡZ�W��@͜Ҽ�Ϻ@���.:@զ�|��@�|�|(w@ݔ1I�@��\p@�D�j��@�3ψ/�@�@*�ie�@���Ȩ@��k�e�@�X!�9��@��ń�@����{@�1h�f@����T�@��qZ�iT@��\b�@��f�Y@��U�A ��4
��A�����A;ɸS�!A�x)M�RA	�deoA���S��A	%����
A
��8�A�]�GAi�)�0�A*T�µA*3a��FA4I�]10AH{��ēAf�AnA��_ A�4���NA��aA_AD@@�IA�g���@A�V�u�aAXhA�W�A��߀�A $���/�A �DIgE�A!�-��,�A"�á��A#bE���A$B����gA%+Â�A&�Lm��A'{��� A(,�k�r        ?�&�l%�?Ŋ�R��?�#�|L�?���?�F8@
?�L��@s�*qm�@���@& l,AV@-`�4@2֬�&:@7�}I*w�@<���HW @AEy;Z�8@Dq�|U��@G�0ѐ|�@K�JQ�K@O�����@Q�&�E@TC4�YO�@V��<Wғ@Y8��*@	@[�[����@^� ���@`��a̲@bT-)�r@c���BK#@e��caP@g����5@i{�H.@k���W@mܶV��o@p$J�'ĺ@qn�.B��@r�t�?1�@t@RaRF@uƍ>�@w_3s��@y	#�{�5@z���p@|��o�y@~az�^<�@�!jI�.V@�Hd�@�݊�� @�8��*@���W�a@��IH{]@��x��@�:}��@�
{�C@��lw��@� D���0@�!�	���@�"6�1˹@� ㊻q�@��&twW@�-X\7@�	vQ4@���d�-�@�E���@�|�'�yY@���-ؑ�@�s ��Y�        ?_:�v$��?�3���N?�jbXq;?�׳cܹ?��y��gx?�(�C?g�?���:�#@�.�^ @	����s@�J 1�x@6_�H@ 2�2j<d@%�j"��G@,�ُ��@3��?o@9R��V@@]jTrE@E+hm��@K*q? �@QI�x�ԩ@U��k�V@[S�в��@`��%g��@d�ݔ5�@i�
q��E@o���m�@r��Q,c @vw�J?dV@z��Oi�@���2�p@���98@�����D@�N��5;l@�H���8�@���0�x@�R�Xt�5@�D3�-@�#��bp@�Y���\"@��u~�@������@�js�[U@�m�!��)@��$����@����cĆ@������@���\g��@��@���@�\Xd���@�G�~���@�R�8n�@�}�q��v@���=@�6�����@���6ۊ@�;ws�@åu'A�@� ߉��R@ƭ�F ��@�L|6��@�����3@˼����f@͎��S��        ?B���`�b?x��M[R�?�1�v]�?�s�TV��?�\�ӵ�?�9����?����X�L?��@��?�4r�e?��J~whu@]�C��@0;���@�OJTW@�T�V@$9���@,#�S}-@3;��`��@9ٕpt�@A4d��@F<����@L� ���@R�^��@V��f��\@[�b��@`��y�Ka@d����]@h�r��u@m:B��
@q=4�юH@t2���@w�R'{�@{9�@��@[W��C	@��b�� �@��a���_@�M��3M@�_�@!�@���_��e@���hM}@��v�Z�@��3|�	@�=�ȫ��@�Ȟ�`�]@�� *Ӄ�@�u.>���@�M4Bi�%@��,Ź^~@��<��_&@��Y�IR@��Q���q@�҈���r@�;��=�@�r�զ�{@���p�<@�HEJ��@������@���%@����Db@�&�6��@��|@�!+@�x��?On@�:^Fu C@��Toܦ        @H��ʨR@��"���@��i/��@���z$�@Λ@>�Ö@�,�PJ�@ⶾ�b�}@�&m�@�9��i@��i��@�[3�ME�A ��
 �A�;�Ɏ�A\�]ճVA&=���A7��F
�A�%n�q�Aڱ��"A��/A��A+�:A�z�bz�A�����A 悐e�A"{}�v��A$&)A%�u����A'�$�3�mA)җ24|A+������A.T?���A0j�Ҭ�/A1��X�MA3/?��A4��p�L[A6K�G�jbA7�*�A9�L���JA;����vA=k��0A?Y�b3�A@��X�bAA��T�uAB�\7#�AC�'U<ӷAD��N�;AE�Q?�ϥAF�r�|EAG�^pY<AH�,OK��AI��L�q�AJ��3���AK�j���ALܪ��AM�E �HAN�񶛊*AO����G AP=���-AP�>q��AQF0Q�AQ|�s�	AQ�5���ARG
���AR�㱔�        ?9�n`p�~?y��ٯ?���;>*@?���١�?�~$mNk�?η`םb�?���;6U?��ut�/b?�,{% �?�lG6i�?��D��i?��I�mH?��g%��?���"9�3@ �Nh�@@v0h�(�@;��}V@	4/wЀ�@a�
Y?y@ſOʴ@��AX�@��>?փ@�E��&�@����W@0W�u��@���\N@RF��,y@!	�t@"�ey�$@$1�ʪ-n@%꒴P�X@'���SL@)�ps���@+Ϸk���@.����u@06���$@1{�=q��@2�xQ!/S@4D�˞@5�M˔��@7i���Y@9!����@:�:]�U�@<���z@>�-=@@�� _�@A���V��@B��Sl�K@D�[(�@Enq=f"�@F�<���L@HC���u@I�Fgl@Ka�G_?@M��U�@N��o ��@PO"�I��@QBL%�@R?�G�&|@SG��FÌ@TZ?�?�!@Ux2����@V��\��        ? �P�몞?b6�:Ɖ?����4 �?�� ���?�N��̗?�x��!�?�ӗ	��?ڥ��cE?�[<Z�?���an@���i\@;wy��O@���y=@#�=��l@-�
;@6Q�Nm>r@@0�%�@F�`�w�n@O�ql�X@Ufb�Y�@\]�s�x?@bt�	v�P@g�qӟ��@m��j�@rtq�D@v���
�a@{V>�3-@�X�����@�X*��@��|�u�@�X
H�d@�];N��@�_@��`@��7^�<'@�O�Č8	@��մ�c@�	�e��@�5���M@�L�r��/@�����@�;>��p@�h��?@�>ä�3@�����.@����Q@�AH�k�@����(/5@�4�4�@�{�_l@�V\��U@��=��#`@�R_��(@����@��f�~�@����i*�@�c\�VH�@�jU�fO�@�{��A��@×���@ľ�o�,@��Gl/��@�/�vC�@�zk�B�        ?��� �?B�A9�/L?f�k��?�(�l�?�M��[��?������?�%���?��}yH2?�
��fG?�j��R�?�3���P?�<mއ��@�n/��@�N�VP@��C���@%C��"�*@.���W]@5~�t��@={�Ҵp@C��䫑�@J
�����@P�N��^@Ua���e�@Z�k���B@`�vb�C�@d 	k��@h?8���@l�>�2u~@q,��@@s�dWu/@w=h�q�@z�LC���@~����+@��S=V��@����k��@�e/���/@�"���5@������@�B�86��@�Tb�¤@�%:��,@�d����@�#]$���@�R�1�@��K_3$@���GvT@�Xy�n.�@���U��@�* ^��@��.�t;D@�M�g���@� Dޞ.5@��GǙ�g@���Қ�X@����Y��@��2�oL8@���Y���@� ��r��@�W���Fq@��eY!e@����\^s@�]��ы�@�קH�^�        ?�zϧ�V@:����@^��L�@tD<59�@���PTx@�V˟~x�@�%	2@����V�@�Ƅ��؍@��{�`Tj@��ڋ]\�@�x
^H�@�K���H�@�tBa̬�@�z��>s�@��P�ߝ�@Ŋb�F@�]\Trk@�eT��(@ΤE�U^G@� �8�V@��ݲ���@����L:@����@@�8x)b�@ۛ�ۙ�@�(M��w@�px����@�䠡��@�r[����@�t
�@���%cy�@�ǆ���@��ٞ��u@��6�k��@�L$ㅯ�@���Y�Q@�6�ʫ@�k�w@�$>��ӹ@���;�G@�xb1�b�@�L\aRy�@�=�cl@�M����5A >h���9Ae��bw�A�À˸A�I�x��A@�{3>A��1��KA)�G�łA	��]��A_�산A��5�A�}�*Ad�%�.A`�וg�Ag��UՋAz��d@�A�B��WxA�-G�H\A��H�        ?��H��MH?�����}{?ҁY~5u�?�fr�U�?�@3���@<���w�@	fPV��A@�s�5�H@5���g@��%a��@"qׄ��"@&s{?�@*ԭ����@/��X��@2S�Xc��@5���E@7ޘH�,@:׹Yos}@=�|����@@���Y�S@B4�k��@C� _8�@E��	��@Gg��|Q.@I:C̶@K�j�@M��@N�~6�	@Px� �D�@Q|!�~1@R��x�0-@S�9�l��@T�ƙZ��@U�7�{@�@VɑV�h�@W���&;@Yt��@Z(I�J@[P}�A@\}
rc@]���)�@^�a�UC@`[��F@`��&pt�@aO~��I@a�PVS��@b�Q$��@cG�&@��@c���:?d@d�k�m@e_Ɗ�.@fk�&�@f���
@g�����@hWGB��@i����C@i�"šN@j��o��@k{���%D@lK�AT@m�7�.@m�m�1�@n��
�v        ?P{�e5?�V�u�?�f����?��Ur�?���4�/?��(o��?��&���?�#�ꦫ�@�yI2��@  1��@�|_�(4@$��)���@.� �4D@6	N6-7@?6��{�@E�P�q�@M�@��@S�6���@Z&�O.V�@`�2���4@e���.�E@k�~e9�+@qN���5@uw����@z`���@�����@�fX
�>Y@�@)
��@��1:�@�VA�v��@�*�f��@�W�fRа@��!��V�@����;�@�/P�@�j���@��E����@���ѷ��@�Ȳ]x��@�	�l�@�;����@������@�ٱ��_@��܀�@�3�9\�@�r"V\s@@�Ǥ��4&@�[�Ώ�@�Xޕ�ӌ@¡���Q@��u��:@�J����@Ʃ�E��@�[���d@�w�>�n@��d�@�U�=4e�@��^�v�@�<�=	(@�YH��7@�qB�W@�ϾlLu�@ҋp�Q�        ?G�@�F�N?y�·� �?�Q;�?-?����2?��*��?̰�í�?�`��`n�?�J����?���&?�}�F#"�@H�wL{C@�����c@���C�@%��9_�@/G��X�@6��,�\@?�y%�%@E�� J��@M��V�@Sz���V@Y$�i�@_�=C<!�@c�A޴xK@h[#��Z@m�u��Y @q�zO�X�@t�J��@x��-ߟ,@|�8Md��@���ӖR@�gQ��@�`��*�!@����39@�y�wmU@����H��@�/���@���ՠ�}@��@Lk��@��@nR`�@�qKvkH�@�����@�ʱJ�7p@��~�>�@����%�@�f&ӽ@�a"t�r�@�����@��j�V(@�g���Z�@�h��Ň�@���`�*/@���|�)@�J�-�
P@������@�T5�6@��hd8�@�X���(;@����!�@Ǹ8&�@ɋ�܎�@�x^�:\�@�~̈́�^@ϟ�Øm        @>&����V@q!�Z:�@�Usk�-@�݋|�B@����!h�@�3����@�#�Uc@�t2gw��@����i@�jE(��y@�hu�:�@��#I�l@������@�Z߶���@�l �	_@�]��(�,@�v�ޣ@��;*GX@��J���@�A҄kw@��
"�WA C��j��A��xg�A(,kP_�A�t�>	A4v��k9A�>�RA	g5�c�A�Z�5#A��_Azfz#�A�M��A�]�fVA��*�h�A༩��	A�o���A�V`A����>�Aэ�e�5A�~z �FA�� ��A��V�?A���A1�$2KAT�ߣrUA}|3zbA��%��A pf4�~�A!ɻ��8A!�:�g�A"Q��)0JA"�-C2��A#����`�A$N����A$�bLCA%����םA&d�a�4�A'_|�7A'�2�X�CA(�R�!'A)Wv��\�A*�aڵA*�z�[�        ?S�?	u��?�^2G�?����&"n?��@tG>?�B� B?���
�l,?ྩ(k5Y?�	�<C7�?�;Jc�F?�'��J?����*�|?����g{�@ ��ˉ�L@�Ha[��@	@{�=�@
q�� �^@^���@	���xz@*��S�L@u|,D\)@첟Q�@����l�@nX��4@ ?�~�1�@!����y@#�ˡ���@%�+�p�M@'���f;�@)�Yg�O/@,*�5��@.��E�d@0�-+Sh@21��w@3�:w�!@5B��>��@6�h�F��@8��l���@:�Ͱ��Q@<�;�@�@>��%^&�@@o͵�V(@A��[��@B�35u��@C�Fxsh�@E1�6	��@F|�F�V�@G�҃*@I0�%�[@J��.'@L
U/u�@M�;��_@O	S�@PKR�@Q�]��@Q�<�P@R�ɓ���@S�[(,@Tz��9�:@Ub.lS@VO�փ]@WC��:!�@X>y��PO@Y@J�[�        ?+@e���5?q�m��]?�Ŀ��Q�?��x�i?�ҋ-X?�?�����?ۼC��w?吕�d?�ioY��?���)��O@�����@��`+s�@�v����@_��bE�@%�:GA�Y@/k7��@5�����@=o��Kr<@C�Oh��E@J����@P��HR@U�'���@[XI�@M�@aR�KKJ@ev���|@i��a�i�@o9E���@r�(0X[�@v]E?��@zx>�I��@H�WQ~@�+:�l\�@�ִ��@�VY&��@��[έ@@��>/v�@�q�*@�}Nv�n@�7�C�@���&���@��KE]@���B�@��B�Rc�@��+���L@������ @��!u�0�@�\6_F�@�~�gz��@�A:Dh@�� q�-@�>Jb�y:@���G�+b@�=��l@��(�RCO@�~�s�+W@�7n�ƙ1@��عW�@��_�t%�@�������@�ՑD�k@�ԯ��@���ӱ5�@����_��        ?0se$��>?c������?�����I�?��6o,�?�D� ?t�?�c��$=?��IV�%?��bL)Ys?����0@?��R��?�e�:�m�@��`h�@Ě	Z)�@�˱E�@#}�yu�@,{��z/	@4L{�24p@<FneX@CHraa)@I���K�d@P���f�'@U�%�/s@[�j��@a�.��@e�j�-�{@j�%�(��@p_�}��@s��8^8�@w� sKG6@{�|��B�@�o���W@�0���TY@�B\ӯf@���Q�b@�e�F޾d@���E`�x@�����'@�h�%�w@�] �a@��c�A�@���є�@���_Á@�GP}�%@�
=��"@��3֛�@��CC>�@�20gO8�@�n��*Z@����T��@��7��Zw@�ޒ��%�@�/Ue��~@��^��@���H�V�@�j�
gΜ@��#��t�@�yj��@��*��@���;��Q@�i^M�p�@��t��`@�xYx&$�@�cjw"a        @�ac�WM@Cx�jl@dǏ�Nl�@z�\5+#a@�c)�k�@�ަ���@�G����@���4��@���$E�@��VB">�@�R��?J"@�2/4�]�@���k�[�@å���@��D�R�@�2;�%@�����s@�� �Try@�+eyjy�@Փ����@�4��$K�@�0���c@�<�[gtL@���6�@ⶸ@�'q@����=@���o%@�W0�?�@��q;T@�=p���@��򉊃@�`qֈ�e@�eMx7@�����E@���mV�@���4��@����ցb@���m��A .�6�ACTy��A}���A���LA�=��rAu2l)��A�0n�{A	W�%�xA
�t�Am��Ȩ�AzVh��A�#|�\A���4&A��0Gl�A���S�A~��ײhA{��9Ai�Lr�A�Pߘ�A����HJA���r�A�c&2�A��C�cATi�Q��A� F [        ?qh')�q?�F�X
�?��ʑ�U
?ܐ��=�?��3@��@?�/���K@��M��@���[�U@�=&��#@g��!��@�X�4У@ �ם�{R@#�[�X�@'���9�@+�Aò%D@0L��@2\tK�6�@4��M�T@7�؛܍�@:f`x�@=i!��@@J�ҠP�@A�����@C�@�+�@E���?@Gh�Vⲏ@I_����@Kg��!59@M���/�@O����@P����@R.�Л@SI��$_�@T�M���@U�Ό�@WW(��6@XT$)���@Y���y_@[]ݿYr@\v�\ �@]�;Y.�@_l�$�)@`|����@aJpH�@bc�3C�@b������@c����F{@d��<�@e�\r��@f�D^R��@g��s�ۘ@i���k@j6��@kw����`@lɗn��M@n,o%u��@o�<��Ջ@p�����@q]�#�]�@r12g�U@sy�ڵ�@s�h�1 $@t�Y0�S        ?%��o:��?e��3�dG?���uǺ?��c��1q?�Bjc��?���Zm��@��8��f@��U1@$����@1��1)@<���l9R@E�*�n�@N����@U>�U�w�@\-FUP�g@b%�˿��@fѯ ��W@l�o���@q���K@t`t% dQ@xP�f��@|-�g�@�Zu?E�@����2F@�����u@��2�C�@�� l @���p�J`@��
��<@��|Q��O@�<�尐�@�ȑh|��@���=��@����@��lZ�@�����?@�u�<�@�rz��`@��$ Ѕ4@�Һ�y��@�8:�#�@��	��w�@�8��["@���Y@�"�@��y���@�[ �5�@�>���@���+�t@��A�g8@��,�B@�gv���S@�ww}�x@ l�Z�@óƢ;^\@��p,x=Z@�����@�O�	)�@ȓ��#��@��$ہ��@�1Ϙ���@̋�BB{@�����        ?T���?��65?�7)1&N�?�N�:n?�e��.-?�0o�4�s?���9�?�?��F�R{@o!���@��.@@�����@ �����q@(�>��ȯ@2K���&@:1��5@BUe�>@I"�rJv�@P�(���O@VU��`��@]	?�t~+@b���<J@g~�#@mP���Xv@r���@vn'�?�@z��v���@��ж�@��@qBl�@�O���C@�<��vw@�K4��@�zE��@��M��@�ܝ��U�@�����j@�H���@�@�tK���;@�iz	\7�@����>@�Ȋ�x_�@�5Ho��@��/�$T�@��1Z�DQ@���_��y@�Ob��CC@��&��5@����-�6@��*2Mv=@���R�q�@���l�i5@���vC��@���H@�8�S�@�z�����@�̻��@�.\��s@ƠC''\�@�"����@ɶXy %�@�[8L��@����@��-Q�Ѡ@�Zi@���        @(W=Q,��@`�7�\�I@���|=�@���.!�h@�s�(�s@��r�G�b@����G�t@����gu@�*�O�,@� �(�@��%kJC�@���ѧ^@ܤ8uO�m@�֟�6x0@��!�B@��4�@馧�Kƨ@� �55��@�G����@�(�s�Cd@�#Beí�@�7�S��@�c接Oe@��]�{@�#>�@�|ߵu�A��<xAWp+|�A�.���AT�*�A���ړA��|�A	���, WA+HÖ��A��OG%Anԙ�~YA�F�{A�?�#AA�C=KA���;UA����RA�<�P��A���KJNA��g�M�Aď�D`GA�����mA�?��!AL�<1�[A��y��^A��Wp�AuBV�pA �J��A!Y+��}UA"<�B�A#.s�rbA$.L�ҜA%<~�ה�A&YA��	A'���A(��'��tA*
'��8aA+de/�iA,��o��k        ?��k<�?��NjLD?܋�M�ӓ?��x$q?����h@	���'��@V����@0���@".�W��@'��AG�@-�+��^�@2������@6������@;��P~�@@?��7b@B�T�3��@FQ��]@I}u�Z]�@M>O�V�;@P�R���@R��w�@U=y�{z@Wȓq�'@Z����@]c����@`:x�	��@a�c;�z@c� }^_M@eb[&m�)@gK����@iOJMv@km��TD@m�iէb�@o��QêP@q8>���@r�p�@sח?�>&@u=�QQ�	@v��8vy�@x9{3�;-@y�I���@{u�6>ع@},��@~��A)@�fȫ��@�[�P���@�Y_u��@�_Y��gI@�m���Ӊ@��U��g�@��A<���@��o���@�������@�1�?q�@�q��no�@���x��<@�
��Ds(@�c�F��9@�b`!GeD@�3��a@��ImƗ@������@�O���R        ?L)üא?P�2Y��?r�J�?��:�Tq�?��C8r��?�>v�pF?��;r|?�a���+?�A��.�?�=g,���?��(�W��@vR���@����6�@x���q@&�f���k@0g,��@7Κ�^@?�\�9�^@Et��Sm(@Lz��4�@R����n@Xj��m@^�n<��C@c<u:�e�@g�<��Y	@m��-�V@q�v�+�C@u��,遙@z�@�!M@ =��v�@�JF
��@�n���z@��_��6%@��W{�G�@���R.�@�
����@��xe�@����Lh@��eM��p@�S�r�%@�����@��ۂz�@����z�@�9���@��X�b��@��ԞK/�@�7�@ E_@��nw�N@�h�O@�#���@��ʎ��@��_%���@���ݩ6@� ���@�4�H�;�@�����Vt@���{�@�4�]h@Ăf����@��A�.�o@�KSǷ��@��1!��@�S]~4�3        ?d@ޅ>�.?��{r�z?����f�?��ֹ�H?ڊ�Mb)"?��'Ϊz?���\k?�����WP@�>*t�@���[`�@�j%#��@"I�b4�;@*��rN@3D�̒�z@;C?A�<M@B�"��W@I��Q��@Q0���@V�9��@\����/�@bN�޹��@f��/�n�@k��kyh@p�P�}V�@t+Tu�}@w�%Uxy@{�6`�$�@�)�;��@����v@�Cn��:x@�)�#@�2@�Q���qV@��b��u3@�<H10�@�A��L1�@�s.�f��@�ԓX��@�iր�d@�7BUt�W@� ����@��tb�:�@��`zm��@�}�1��@���P���@��G���E@�E?�)s@��JQ�^@�����@�^�wfH@���*t��@���Fͼ7@��m��@��P+O�@����K�@��.bF�@�.�[]K�@�t�u�DP@��=k�ޚ@�=�1��@���Q˦o@�[q�˗5@��s��@���CIC�        @?r�]���@r�����@���4M�@��Xy8@��f��8@���[�R�@��ʉ��@�W�4~�[@��%?��@ݝ4b�_@�A��@���M+ @�x˙>\@�j��1N@�_n�Q@��xߧ�@�DM����@�=8-+WDAJ_:��A��+��A4��j8�A�Ŭ��A��B�	A��d��A:/�bI{AY)�ՌA쀤Υ�A�]���RA�?�5AQ�t�$AA�r�SjA �s���A!jE����A"�(�Z�'A$B1*�l�A%��13�A'dר�s�A)�4���A*���4A,�3+z�A.��ۘ�A0Q=��uA1_v�,TA2yɱ�7�A3��h�}A4�4�8�pA6�3,*A7c5��,OA8�=�u�<A:)h@JD�A;����A=)�S]RA>�E���A@3E�mI�AA[��`AA񊬯�AB��;��AC�����cAD��v��AE��_a�AF��*�zAG���tS�AI��*�k        ?A���If?�����u?�oD=�?��7�%�?�|;�$?�� ����?�V���/�?�9JkW�?�[�m�?�(N�`�?�Ϳ�
�u?��Ucx�d@M+�l�3@bz��8@�Z�x�@Ta���@2��(F�@����@�P�Ut_@/张t�@�rmn�\@>tA��@�}�Z�@ o����T@!�aiD�@#�Ӊ`O@%C�FF�P@'��� �@(�n��R@*�E�I�@,�˅2�{@/"���R@0��+�g@1��I2��@3�S��w@4j��-�@5��̜�@7,��S�c@8���L��@:.N�/=@;ɄW;dl@=w��
@?9�h-��@@�*aW�3@A~+�9a@B~�p. @C��	���@D�F~��b@E�t�Z@F躯�vf@HC6���@IY�]���@J��O�#�@K��o1�@ML�|;�l@N�w��@Py���@P�J�e�8@Q���C�@R\7��Ku@S+�z�L@T �n��@T�W+���        ?P�CW�?��͠% q?���D7�?�<�X�?�E��?�����f?��NǗ^�@n�o&�@��yd�@�2�>@ 2Q	Ӏ*@%y��g�@+��K�T�@1����#@6��?���@<x��\>�@A���)�@F�i F@K%t�6H�@P���?@T\�<���@Xµ���@]�
�Ϳ�@bC��\�@e�����@i��Q��w@nt5)�2@q�G��Ǣ@u�i�{�@x����3q@|�_P��^@����H@���=�@@��JA�@��3�8��@�M!
l�@�Է�x@��m �D@�[stf�@��U���@�y��7��@�Y��`N@�r
�L@�b"���@�(�G��@����@�Mќ�\@�4T���@�wO'S�@��Ђ!�@�/�eo8@���!u�@��D�Ɛ@�].X<}0@����m@�D.H��@�,\Дk@��ڑ�H@��N�YoD@��Q���@�T@�W<�@�^@۹�I@�s{���        >��ܜ��?4���x�?[�)��9�?|�{{M�?����p�?�$�Q�aY?��Ɍ�L?�y�E?�u�_f�@ �-���@��]~��@����@%p�'�N{@0v��%i@8,&$3�@A����N@GB�G<P�@N����Gi@S�`ǿ�o@X�J��,�@^lX��r�@bO�db=�@e���+>@iL͎���@m*���W@p��~N�g@rն�l�@u,,�l�-@w��W�=@z^g�7�T@}H)�G�'@�9]V�Ǔ@���e@�� ``@��cR3@�+6A[�~@���Ƃk@�Rqw���@�����@�����@�a�;���@�1����N@� ����@�/Es��@�]S�Y��@���� �@��T��@�R$B���@�����@��y�@���~jF@�wTC6@����L"_@�@>��QF@��r1�@��� �l�@��n��.�@��c�w��@���|�%7@��~���@��\�~��@��j8"�j@���;p?�        @べ1�8@Q;�9��@t�0�(�@��U@�P@���ɂ@��i��@�Fs4��%@���@��v`�#8@�\��A�@�B�z�E@΢�7яW@�<Ǜp�@�bV����@����Y��@�W�i5I@����@���W�@�1jOh@�h.U��n@�n�9x�@�%��@��� �d�@�)u���@��Z�v�@��5Y��M@�z�@�F�@�
=��Sp@��	h�@�WxJ�u@��1ٖ@��9���j@�ÐUbt�A ZT��-�A\^0��Ah��U�A�*�u�EA���7�hA�8�	GA2�\�Ae	�*A	� W�%�A8����A���᳋AW�O$��A|ѵ��A���hA͟I�0�A�̵�ϐA�6�ɻ�A�\<�7�AӲ!���A��$A��T3\A*ǯw�AU1�͠A��tkA��ZN��A��>�UA<���+�A B��U��A �A�^��A!�Ύ��        ?3�P��?l�$r'?'?���
�?����,�Z?����:�?��#m5R5?�iW���?�;r�*�?���00�?�_^�"?���P��0?�áKy?��-�?�b�UR.Y?������?��z�?����g�@ �k1.�Z@���r�@lo84~@'��b9�@QğI@Cҫ\��@�_�^p@������@��xT@��`F}'@�QU(BB@�dsY�@C�gsu@�3k���@!'����n@"����@#���G�@%Z��`@&ݎ0�@(o���˳@*�e��Y@+�tq���@-��.m��@/X�u�@0�J���@1��tߵ�@2�~5F�@3�D�0��@4�;y�@5�X���@74�6@8Y���ث@9�T��0�@:�dYL��@<L��UP|@=�jc�,�@?'dQL@@R��j��@A��r�@A��ܹ{@B�-7��@C��e�[8@Di�t�+�@EN���@F9MʅJb@G+<��H        ?iH	�?D��^pp�?kM�k5�}?��R1> �?�&0�dH?�S���1?�^�?ҍ�3�O?���&(�?�dPG�{@ ��:��@��Z	Ƀ@6�f���@$on$�r@/�ۚas@8=(IJ�V@A�!o:��@I���Z\�@R`���j@X�� }f�@`���K_@fI�9i@lԮ��a�@r�]�gO�@wyP☐�@}a*)O@�,.w�!@�=5L�>@��<�G.@@�*��b1�@�;GM��@��0�/e�@���=4�7@�܎��@�Φ)85@�jiR|��@�C���@�Y~�*�b@����H�@��A셦�@����8u�@��[�.+@���o���@��6�d@�e �!@��r!Na@�B,J 8@����?o@�	i!�H@Ā�ZK�@�����@Ǖx��q>@�1����@��dc~�!@̌5X��@�Ikw���@��[}$:@��B�[��@���8�p@�����k@��x�H��@��K�jܵ@��9b�        ?a¸�R{�?��G-a��?Ƕ��� �?�Ź�Z�?�K��@x����6@ܧa�i�@�M�)l�@$�	M��@+��� 02@2Kb�T@7cރ_lZ@=[q�B��@B,!#�1 @FDWS�l�@K�����@PY�%���@S�7���@W�Tˁ�@\,4b@`���d@c�@�5�u@g$d�l��@k#e���@o��p��@rl(���@uSN.˒�@x���⵷@|3=x`�3@���@�S��t��@��$6=t�@�p��յ�@�\l[6�;@���B���@��;��xp@�b��l�@�l\/��@�� A��V@�5*�h�@���DrmK@�[���-@�����=@�G4��@� ���{K@���� ��@��6f�@������@�=���@��b��ʆ@��t��@���]��@�~C�T@��V�A@����m@��ƙ8�@�bTd��@�a��?�@�~j)hR@�]�r�@��n���R@�Ύl7e@�"��:�        ?���&��n@;���@b;y8K�u@|Z����@����ߑ+@�6&C�&@����*@�mX9£@���z��@��M�*&�@��F�@ȱ:�J��@����>�]@Ѡ).2@ԗ�C:��@������@�<-h��	@��<c�~�@�q�g��@㏫F��@��r5Y�@�8#���@�Ĕ����@�w��XS�@�))AE�@��Dz@�Al�G
�@��-A�@���K'�@���a�ك@�{��=@�����X�@��'�ǵA u
��t�A���rgA���ybA0���MmA�N���A����A�b�r$A
+�l%Y�A�#LHU�A�d��$A��)E��Aͧg�7tAݼ����A����lfA*�� �#Ai$7A�l����A	�jPA���A�kG%A���d#�A5gQ_�A��s}�A ԓ�g��A!�V��A"��*u�yA#�M?V�YA$�袵A%����'hA&ֱs�=�        ?-�(�(C!?j�'�2k?�F��8�G?��9�׾�?��Q�q�?��2HfI�?�$��U?��6�H�?���U��?��lME��?��h�X�Q?�qyyHR?�8I<��?�~��PH?�g�:�B?�������@ ��S"g@���	@w�Z�w@>*�3�@E���F�@��Ʒ�@^�c�@�s�1�@�$��l@^��R9�@Ψ�	�@nW��l@@�|t@!$qb�M@"ë�@$��8*�z@&\`�quv@(XG4eܧ@*u�h�-�@,��K&]@/�&zR�@0шKᖺ@2):�G?@3�����z@5�2\��@6�����@8V�p�<@:�X��@;�
n��@=�|���@@UnX�@A��}~�@BA=j��@Cy;���@D�A�>]f@F�j�@Y@G���M�@I	�y�2@J�t���@LAG�@@M���5��@O��R�2A@Pչ���@Q�p%� �@R׷`s�3@S�^h�@UN��_�        ?	.�~j?JG��މM?p���'�?��j/���?�m�/���?�;��d�?��=R??�@L=�?�����>�?�b�p�:�?���s>1@W5��i@����@�g�-��@$�b��U@-p�����@4�ǆH/�@=>�?dS@C�8��@J� *Ϟ�@Qvu��>�@V�O�.��@\��|�g@a�S�â�@f0�/@k�d�3B@pcO���@s��l�{�@w;�v{D@{K�sR�@�ѦcO@�f��Ba�@�$�bΥ�@�%�P�@�i�A�a�@��m��:@�enN�w�@�vSu=��@����/�@����@��)��մ@�Q��q�@�cJ)n@���h�~�@�Bv>�%�@��&ՙ@��9Xs�@��Z��S�@��oH��@��9�@�
����@����.�@���=D-|@�-~�G��@����[H@��Mt�S@�]�#s@��ҝj�@�{?tHO@�$]���j@��=�gU�@��^���@��8���2        ?@ݠ�z�?|Ǝ�~�?�Y3�I<�?��c�!�B?��gz_ �?�$ˬ{��?�A��)��?�^�9��?��,&���?��S�}�@�޵ N�@,�4��@���h�@w�'t��@$}�M�@,I�?z�q@3XA�a��@:)�|g��@Ay�$spa@Ga�{�@NN�ѡE@SG�9x��@Xx�`�Z�@^�"��9@c�� ޒ@gUI#@lU�?>@q
nP:�@tRAz~B@x	��B�@|9@QXt{@�t�v��Q@��)��V@���2�F@�+g����@���KC�8@�G�
Y�@�d�z�;�@��p���@�2��ރC@���-��@���- C�@����h�@����'E@�y��w@�d��QM@�nyݒ@��"�ɑ%@�����@�D����,@�d�r��@��+]��@��ʂ@���o6@�a�#r@����F�@�2�M�X@�����IZ@��<�m(�@�h�R�@�!����$@�?�Y�R@��,�|�        ?�U���j�@1ia���@U$V4Rd�@m�Z�8y@g�ԯ�@�zS���@�\��׬@���c!��@��af�:�@��#p�D@��`��H@��3A�_A@�s0"h�@���y�@�]?r<�@�܆b�+@��dU��@�C�ֹ��@ʹ+�@9#@в� _u@Ҭ��>�@�ʌC6�@��ן@�u�W�6�@���Z/@޾�?ㄸ@�Р�:*@�W3^I@@���1��@��I|�N@�qX[m �@�T��O�@�O��@�d���@�!��9;@��dP?��@����@�Z�h�b;@��h����@����}
@�_|.$�@��1f��@�Q�XU�@@��.�d4@����@�3��+��A {�heAAea0���AYk)G��AW̸�f=Aa$$�AAu��$cA����zAÙ��'wA��^mr�A
C���A�5%�A����NAb՘F�?A���Q��A�8r��A|eyV��AMq�%�8        ?<�LI��_?t�;�
ŷ?�eBAf��?�2N���?�����6f?��I��?���&�\?�_�/-��?��HfcE?��a@��?뇏�LO?����y�9?�k���@]?�O<w�Z�?���a��@ �����6@N�}4�=@8�@�^F@	t?ρU�@
B"�"�@�z�Q@�#��Z�@���%@��R��@�V:���@�2Ŵ*_@ }d�|�@"Fؙ_��@$1���&@&> ��u@(m�X8�@*��>���@-5�jL�@/���'b@1HWQ��v@2�
��t@4@�
,�@5ٜ8�E�@7����b@9E�7Ͱ�@;k��տ@=BÒ&�@>��1��@@�jV��h@A��vb�@B�C�p�5@C��u.�@E��km@Fe��Z�@G�����@I����@J�����@L�v�4@M����	`@OD��9@Pz��<��@Q[i��mM@RC�� �@S4MۧvP@T,Z�""�@U,��Z�@V3@�9��@WA���4�        >�b+n��P?=4^n�y?g_w�¶�?��M�.�+?�a����)?����ڝK?��h7b�?α��L��?ܩ����?��8���?�d3��<@�_{v�@i�0ӏ�@����W�@"-��
S@*����/�@3r���p@;ok��S@B�c���K@I���@Q:PƊ@VL,���"@\�>��@b9�x�@f�wtZ�+@lB���{@qJ���T@t�!���J@y��^tl@}��K��@��w	
T�@�|�.x>�@���։E�@�G� â@�#�Aӽ@��n�ِ�@����qL@�G/���@��}��@�~9\��@�P8���@���Hi@�/�D��@�ͦ�^ɮ@�}�~�_\@�?o�!�x@�ܼ���@��^��[�@���&X��@���Ft@���mZ�@���wj_�@��M���@�<�I@�Uj�+v�@���\��@���
�@�l�زg�@��_)YO@�lT��G@���(RL@��b��Ea@�������        ?$Z(��?]~�7t�|?�&��?�
?���O��|?�h%s��?�s��4��?���Z�
?�B�ku�??٭�"o�?�����?���%��?���d��L@�`ۄ�@5X�Ӯ@���A��@"c�_H��@)ܢ5�@1�x�W�@7�@�|@?���4��@DvI�b~x@J ��,��@Pq�7F��@Tm�n$i@Y�\RΦ@^o2B��@bHC�@e�O���;@i�E��V@n�N�ǔ@qnr�Q8@tٽ]@w�ڰ��@z>
�o8�@}�㤟�@�ăy[�@��I4�@�7]�x@�q�W���@�0�rH�@��J��B@��V�}O@�x@�22@�*}���@��}
$�b@��a�(&�@��T�raS@��Ƨa@�lB����@���ܜwf@�8��'�@���ج�G@���9�h@�����w@�&D�$@�֫�c�@��
���@�}S{�k�@�u�蒃g@�C���1@�ZaN��s@�غ�@��F��?�        ?�E	����@2�J�2]@Ti�<�B�@kG��f{�@{+�+�=�@��6��u�@��Ǜ3�@��5�k)�@����~xF@��w<+�@��s?�˥@��Ȩ�"@�*�E�Jg@��p���K@���r���@�A���@��0��@ĺO9���@ǧ�3��@�ܛ�n��@�\�}�l)@��v�a�@�$����t@�]=��^@׿As�d�@�K��r�@��]�2^@��hR�Z@��W8��@�"p��DH@�ޗ�昻@�F�c�@觼,�@�F���@��?p4i�@�3z��@�������@���)M_@�sӊ��M@��9�4e@�_�d�@���~@��̰=�@�L�J�?@�����@���.սA t��}Ax�`+LA�O=��UA�"*{�A�w:V81A�V�i�A)�Z�N�Al�'گA	�<�`�fAU��\BAuG��A⟢V%�A[B��AoV���A6�U��OA����kA����h        ?R�&D?%?��Q�Ki?�A�Pe~?���<*��?�u���?ۗA���?�=�+/H?���?�:7�Ů�?���T\�?��ʢ3�@C�ź�@�2�C��@0���@'���g@>�n���@���]��@/:J�Lv@�S+�_@j.���@P�@�-Y@ �X�ԖS@"�1����@$拵�^�@'����@)ml�� @+�ސb�@.��6|�@0���E�@2+��8�@3����8q@5i��	�@7-�
�B@9���@;�)-�@=.D��?.@?v�ٔ�@@�G�YI@BF�ɔ5H@C�5Ӗ�~@E9~�p�%@Fި����@H�~�#@J��c�r@L�1�kظ@N�xdE@P���v�,@Q¶�
�N@S�ٓ�@Tr�)�R@U���h�@Wtn�?��@Y�,ذ@Z�3Y�΋@\���YP@^��f`�*@`B��@aN��'X�@bf�SW�k@c����l�@d�2���@e�9�@g6fe�p        ?D�ܴ�%1?��'�$��?���2��K?�eKm9Q?���?�?�i��GЃ?�> �b[,?��,P&B�@c\軺@0B���@�	���+@#.��11@*�Y��AB@2���F=�@93˱�j�@@����@F$hЛ:�@L��+��@RH
���@V�p���q@\�����%@a�D��@e?�H�@i���Qw�@nRӗ:�@q�n��8@t��t��2@x6+����@{��,�r@���n@�"��F�@��` ��%@��\�I@��T�Ox@���ii+�@����=�@���r�Cm@�{��!�K@�g,��Kk@�q�/�@��8��4[@���$�@�O&����@�n��cu@�����!�@�4`�-@��C�@�H�]��K@��b��Z3@����'�@�������@���l�L@��&э�@��]���@��ϋ_�n@�2�R��@�umw'L@���5�/@�-�|��@���q��@�/m}�@�̑g�#@�~\ 螐        ?&����?`^��/`e?�v�%��R?��L���?�S���n{?�����k?ƱERr�,?Ԛe�!�x?�_����?��s\=3�?��t�@y`�B@g�h�s?@�]���@#���?�@,D+% <1@3�C���-@;/�J�@B&����@G��A�c�@N�'�e�@S��0��@X�KP�@^��`8@b�kaF�I@gwe&%@k��7�(@p���Jj�@s��&�@we��m_@{q7#�@����Q2@��|���A@�m����@��gN�@�4��c1.@�k��3�@�M,���@��s��l�@�wc�.@�w���x�@��4A��@��`g�ei@��z��@���]��@�X�ȧ�@���h@���0�pQ@�s���U@���o`�@��q ��@���=A@���&Ŀ@�2"1-�v@��|0���@���T�0	@�Bڂ��@��{q�g�@ę��X�@�tT�_@�r��Qc@ʔ@���@�ܯ����        @��1��@K:sg;@m�y�i�@���l�@��~I�@�";e�?J@��3Z@�Y%Y���@�2B"q\@���/���@�f	/�}@�Q|Ď�l@�,�{߫�@�JU}��9@ɮ{���@�]�c���@Ю8r��@��W�kk@�,Tо�@ׯ)����@�a��wK�@�EUD�I�@�-c��q)@��Ւ�Bc@㌐�/�@�`��9�u@�M�}��F@�V��^��@�{|g�	@�����?@�Od @�JokJ��@��y�%�@��#Tш�@�d>Q�f@���H @��z��@�=�VX�@�;���@����NA q�h��A&l�r=5AS���p�A��*ݝA�)3��AO��K�8A̶�?�WA	_F6]��A��DA��X��A�e3��AIQ u��AP&��ךAe{~A�N��,A�\���A�����AW٥V�A�Hd.A3䢎xA��9�P�AM�.��A����        ?hY5��?��+�0-?�g�⅒?�'��T
:?����MPK?�N�3O�?�,��t@ �!K���@'L#��@7�w���@vҚz4p@!�<
��@l�7��@^�u2�@ �&PKs�@#d
���w@%�4t.�@(��p��@+�����@.�EL���@0ރ!��[@2��h�@4Kݧp@6#M|w��@8�Pה@:џJB@<BI��]3@>�y�w@@o�Ǌ��@A��Q,@B��-��d@DZSmE�@E�{�$��@GI�K�$�@Hډsw?\@J|�P�@L/���Y@M��]���@Oʏ�Ʌ@P��"1�@Q�)K��@R��<ǽ@S��q�?@T�fJ�@V��*��@W>�)r+@Xkt��s�@Y�hk��@Z�V6�X:@\H�@]a_;�}@^�F5��,@`
N��'@`�#a�}@aaﻱYo@b���@b�N	�
@c�����@dS�Ѝ5@e*�2�@e�I��.@f���TP@g�NO�l        ?:5��r��?{���}��?�W5��]?��h�B�?����_�3?�/4q�� ?�E�A���?�s�_��@Gf%
��@����N@f�o_��@)#�?i¼@3s+����@=Q�<� @EGcq��@Mk'�#�,@S��_��@Z}4��@a&���Q@e�����@k8B��Ӳ@pĝP�PO@tiy[7�@@x��qoY@}Z�I,	�@�`��(��@�l��$�@���fD�	@���|��O@�����@�C%�#td@��/o�@��9ah��@�����>�@��=�mv@����x)/@����[�@��\�eܴ@�����x@��^U�j@�:zo^��@��&BE@��?��@�t�ҥ��@��� �
@�C"�!�:@���l�A@�=<[��@���_qI@�]f��(�@�����-@���}��C@�L��ZW�@���W���@�^P_��@�?��"�@�$�p�n@��Uf@��h@���5��@��;g�P[@�����Y@�ӓVv��        ?Y�M^]ǚ?�ȟ0*1?���H�?��>a$I(?�!�+Y?�P��?��4�@N�.s�@~���1@��5�[.@-���)P@"�%�@)G��:է@1#ک+��@7����#@>�%}ʠ�@Dp^ŗc�@J�r3˻�@QL��R�@V�!qR@[�jr��@ae�ߝ70@es�w�ʆ@j*�\�%�@o������@r㜂k9@vb��B�@zO�!Ԭ�@~����@�ħ�+�D@�q&`��@�`���1�@���S��@��̄4�@���s@�W�s�9@�C X8��@���\�@�MtA2\@�//��@��n�Q�@��Tv@W@�r���@�PA`)�0@�N'j��@�mѤ��/@����O(�@�P��>"@�S(-]�]@��6��a @�C�ST@��R�-@�Az�y<@���e�K@���yc�@�����-�@����zh@��-��H�@��I&j�@�B� �ʾ@Ç�ˋnl@��lo�@�J��I        @"i����@^!�fc]�@�X����@��}nܫ@���I��@�����V@�n��	�@�;�֭!�@�Cv0s��@Ѣ�݆@�1#��@�Ѭ��@�0mX�r^@�ƾ0�|@�+`l���@�v<��*@��#��z@�QMb��@�B�!vu�@�N%T�@�uA�@>@��yr��@���?��@��"���A 0��#/5A��%�O�A0���	�A٨�I��A�����<A�c��F�A
���VYA��afDA�	0{~A�p�+�A�����vA5��4�VA�YX>��A�wu�rA�����A���A�첹��A_�,�ΜA���A�<��(FA ��'s�A!˖s�;A"�uC�A#��2#[qA$��abA%� �Ka�A&�cd8��A'��6�3!A)[����A*.8s�$[A+Va�9��A,��В��A-�b���A.���y[%A0��nPA0����A1b9�5��A2	�>�yA2��D �v        ?D�Ք���?|�!F@��?�=,$���?�&S�E�?��ϒ�{M?��s��?ѝ�� ��?�U�^��X?�0��?�"��?���×Z?ﲛ�m?�#���?��0�-#>?��hۓ�?�Wۮ�@#�G�lQ@�L���@���wN@4�h��@��b�q�@��Z��@��'E!j@T��K�@ ����@6�V�o�@��f P�@!�:��7�@#�L��_M@%�[A���@(Q*�O�.@*��ڷ3@-ù0��@0j�в@2�vS�#@3�V;N�@5���!Q�@7�*�f�@:����@<��IV	5@?#ό@@���af@B���i@D!���=^@E�*�8�?@G��?*b�@I��xS@K�7���\@N�у�@P:��QoG@Q|�B�2@R����M�@T8vw���@U��;��@WC��r��@X����@Z��w��@\p���@^U�c�Һ@`'���f@a/���n@bBI�v��@c_�?�#        ?1ŒY9�%?~�4�?�!���?ß�+N�?�s��� ?����?�8����n?�A��'kk@>"�c�@L��=@�\tT�Y@5���@"��U@(��
>j�@0�FInP@6B�#�@=n�_�"$@C5Q��VM@H�z����@Or�d��@S���y��@Xx<`��N@]���?�@b2! ��<@eۣi�9@jJŶ}@n�?�ߊ@q����3�@t�M{H�}@x3�q�@{�|w�[@�Rg.N�@���Fa�@�ztd�<a@�=\P�q@����Ֆ@����t<@�9R}�8@�O��@���@�+����@�x�G��@��FL�2@�� ���@�5�9\�@���$���@�XB�=-@���2-@��!7">@��#[[
@���0aì@�6T�F8@���or�@�����@�b#GPP�@���d�/�@�Gۻ�U0@�ّL�+d@����yQI@�=���j@��m��#@��!�q�@� 4�#��        >�҅Du�?3
����?]���ʻ?{��
�~u?��ǹ��?�r��J�?�x��G�6?��O���o?ܠV�Qѵ?��
�p�?� k�X�@�C/��@�'e݈�@��`FX@$yQ�J�@.QU^ 9;@5��r6L@>��-�w@D�>�|62@L�p��@R|5���@W�񅶭@^N:Iz�G@b�^���d@g[To���@lk8�3(@q���@tN�aP��@w��)%@{�*��L@�>B:��@�t��3@� �����@��(*��@����m~@��0@�?@��P�3�x@�<��*@�]nWO�@��$���@��r(#�8@����\H@�����@�J,ѹݮ@�I�0�)�@�y[���?@���M>N @��J�(t@�J�k�\@��ZX���@�l8`l�@��$R��@���l�'@���t���@�c�Y�3@��Q�]�@����7@��(���@��2��@���_���@�H؋@�;��.�@�nXwK�        ?���%�@'",�R�@KT����@cA��T�@tWW�˘@�Z�;El@�}R�"[�@��l��O5@���T��j@�2�k<@��2(��@��+�Wˮ@�\���@�"�@WM@���u�N�@�u=��"[@�YA���@Ɠ�K�@�+�=��@�-A����@�Q�ZBr@�ʚ�$��@ֈ�1��@ِ�~���@��3���@�J>h �@�L�vw%�@��,Uy@��"����@�{�5�]@�Ly�)�@�W�'6k@�P\-�;@���L0�@�����k@���X��@�:\�9�@���V�m@�uo���A c�>���A�<�`��A[*�\gA�L�x��A�6��E@A�l�&�CA
||z�A�'X��A����OA|+�<�A�W%�;�A�x��L�AO:�ɖ�A��mЩA:=6�tA��3�ߊAr�J�6A,x��rA��B�(�Aږ.�TA 窳�wNA!�'��A"�n,jqSA$��9�[        ?LK�	`�?����{�?��{�?�]ж�=z?�<�k2�?�B���O?�s	svx?�F����?�3��ɽ?��:�Ό?�E��y?��e8O��?��z~B�@,v h@��X2@	�!֫�@~�E��@�Wj�I�@���5�@�.h~V@����'@"`1��f�@%;�?��c@(^2fF�v@+ʏ�рF@/�+: C@1�,��7@3�-D0��@6Z�ow�A@8��M;��@;��>]>�@>�����@@ޡ��x~@B���.@DRr.���@F5'���A@H3��@��@JN�6���@L����1�@Nܶ�h=�@P���jL@Q�����@SM��19�@T��]+Cs@V7�0̻X@W�B��9@Yl��L� @[&;�}a@\����@^�Q��}�@`m���2&@ayh���@b�)��i3@c�=d�*:@d��.�n@f.��r@g~�g3�#@h�X�ev)@jJ����@k�؝q;�@mO=�Hx @n�U���@pE�w��         ?/ ��D��?l�v;�?�*�Q��?�	 �ˀ@?�9�z�c�?�W����?߃5��ǽ?�"�_2��?�(���@	c�	�@�}��C@"r�OA@-��<�w�@6��7��%@A�~�3�@H�B�y�@QQ�z��#@W�၊/�@_��X\��@dРGG@j�Cڽ�g@qsTB
�@uA[��SQ@z8�A��@�i��NO@�Fy��9@�Ⱥ�[@�8�J�p@���k���@��J)۽N@�wF�?�@���k23A@��NΙ@���̚�3@�������@�,���pR@������`@�]X`==@����<{@��5m(@��ZI�@���6�9@�_���9o@�BO#�Y@�B��V�@�`Ģ1��@���a䷑@��h�Ҁ!@��v���@��c�@�p�M��@��(����@�f�!���@��K�b@ɠd>(�@�U�5�@���Q]h@���fus@�i��>�@�a����i@�`�F @�f����@�r$�y�        ?%���3�?^�y$�/?��r�c?�T�k??�4�\��?���n��?�dn=oș?��;"?��<�f��@��%�}@�o��@%��4�1@$Z��4x�@/�,��^V@8<ݔ� @A��~�@I�[���@Qr ��@W��Hr7@_�����P@d� ���)@jw2I�r	@p��OA�]@t�WcˍO@y�ƃs�@i�Kˣ@����q�@���!�e@��F,���@�=c¥@�")���@����)$@�ݻvF�s@����4@��7B�o@����j�@�D�ob:@��2VL@�,2�?ku@�aJ�L��@��|�ĘD@���g@�8�����@�vl2p��@���jP@�g��@�Ujx��i@���/ֶ�@���0��@�l�s1�c@��K�o�@�O;���@@��"��@�]{���@�|cgS�$@�Q�����@�/�f��@���6m@�fg���@���@�/@�	���c@�F��j@�;�8)�m        @̬7V��@;����@]�k�$�@r����s�@��h�.�@�����@���b��@���Z�@�&!���?@�_-�[� @�NU�j�h@���;��@��8�'�@��2u�6@Ĭ9b
~@ɋ��O@�I���@��0w.o�@ֿ�S��@����j�@��<Z)�@�v?��@�g��	�@���3h�@�[ܪ��[@�"c0-@�D��t@��M��=@�:�E�@��-��@��]�8�@���`�cA��|�,Ap�O� <AZn�xAa|�gA	�e� �"Aɔ���[A+�0N2�AV�bR�A�|F�i�A	�̡-A{�X�#�A l���yA�i$�X�AA��A�4�5#A�.G�>�A�]�j*�A \d���A!g�X�~A"};�eA#�"�2�RA$������A&3�A'K/�o��A(�X1άA)��w��A+`�I7K4A,�;�F��A.UpQ�~7A/���{�aA0�CJM��        ?ShY��F?�T�:��8?���@�?ų<[l�?Ԏ]Σ?��y5܈?��uV�<,?�o��_��?�A����?���nfu@�!'���@���#�@ϻN�@�Hh��@k��1�@�Y<��	@u�L"@�,ؿv_@ ��[/~�@#/SuR<�@%���$@("��Gt@*�9��}[@-��'/N@0pe�]0{@2� �n@3��'A�@5���]�F@7�}A�ab@9�`�oC@;����G�@=�aʴKN@@��@�@AJi�7@B�O��Ӈ@C�s��U@E+�>��5@F��C��@G�����@I|��54�@K�]Z�@L��Ȱ��@N>	t�=�@O�7��Y@Pԛ�J@@Q��W�@R���7��@S�i#ż @T�W�L��@U�ȟ�@V���V�/@W�7	|�@X�0u:C
@Yƣ�*!�@Z刉�W@\
����@]6�+U��@^h��	��@_��%��_@`o�k#�9@a�jCm@a���[�@bb��>�        ?" M
�9q?`����I?�N�� F?��ai��?�5���b?�ц��?ʁmA��U?�a�م��?�p�e.�^?��鰷��@�z$P@����=�@b��lf@& =IB^X@0j�=�td@7��k�0@@�8Ȩ*@F�-$k�@M�z��{@SoZ�6AR@X�~��<U@_-.���@cOZ�rIV@g���G��@l�H��@q"3��i@t\@N���@xd���@|!�'�m@�aW$�i@��r2�v�@��G9��@�Q!�@���o"m@�P���`Q@����tg@��J���@����h�@�v`)��@���п�L@��A���@�jb�%@�rڦ�%�@�����8�@��P�7@�����Q�@�N��e�R@���ko?�@�/a����@�ڞ�0�!@����@��D�ˢ@���mܣ@��'�D�n@���ݺ�@�;m��@�S���@q��r�@���"jQ@�f��@�い}UI@�q5k@�$k'        ?�;=���?P��Ҋ?s���p?�+-B?��̪��3?��W*�?�W�[�'?Ͳ��{֔?���zu��?���~�?�����)@��(��@CT�B0@�=|;i1@#�{� ��@-����.?@5�`�@>�tw@�f@E��'�@L�C ���@R�a��@X���ش�@_^�����@c�I��2@h��Z,@n��E��@r+�إ @u�`�_@y�1��=�@~C����@���d*1@�V�f�H@�O��z�@���9���@��}�@�� ��!�@���H�@��@D�@@�F7~��@��).Y�f@�5�l�D@��Ţ@��4M�{@�TO8�#�@���\@@���'H&�@�;a�s��@�=��)w@��([3��@���c@��殂��@��j�$@�����@��_�$[$@��ӍT9@�l2�f�@�ɝ��=@�7����R@��@���@�H�hi�@�����t@������@�9|�^        ?���Tߺ@9��3�
@Z��z�6@p�P��v�@�	�i�@�Le�.XO@��Ns
c@�W0�-�@�60�f��@�m�{���@�V&�1+@���c�a"@������@����� �@�=�[@���㆒3@�N��M	@�Eae'�@ʁG����@�6��@���FV
Y@��#��@�.�i�[�@׏�9�W�@�-�y!�@�ٔm��<@��3���@�t#��/@�mOӞ@��jP�}^@������@���%�@���#�Q@�(F��u�@�F�՟O@�uVV@U@�R{�oA�@��u&x@�&1�/@���J@�@-?@<@��䉞@@��h[i�@�q5��
1@�RKRa�A ��˷kA�
�RA��}�A�n$K�A��깤�A%Ǌ�A`𚗙yA�.��fSA	�	��A`0fqA�$��Y�AK�TyA�Ϥq!YA���N}�A�� �: Ac�ǿ|AE8; ? A-�u#��        ?cA'A[�f?�)���Z?�� �!�?�����?̷��b�?֦��CL?�k�f�=f?�z��Y�W?�U�F?��l���>?�P��\�?�U�d�@ ��:'N@���OV@ �70�@
�L�)�@D���l@�Vf�@-@9�C�@a�,�W@�4��H{@0H[@@��
�M@���@!E�D�#w@"آ�2��@$���iO@&N��D͟@(5m���o@*;WU�@,a�J��@.���_@0�t��
@1���pZ8@3'����@4��lI��@6�B$��@7������@9<E6� �@:�U�ژ@<�&��e@>��k~͂@@<�����@A<aPC0�@BE�L\�@CXr?`bN@DuB`x@E����Q3@F�?dyD�@H�ë@ILIẂ@J��է�k@K�!����@M[}|�2�@N���1�@P#�fkUS@P�xܶw@Q�K"d�@R��J�w@SV��2�.@T2��8�@U�����@U�[��O:        ?!}����T?d���e�?��d�y�?��� +}"?��a�*?�ȭ�m?�#��K�?�	���?���2?�g����@�"��7,@֬��J�@!߲�<s@+<�(��@5���A�@?���q�@G�v��@Pa�
!]�@V���@^��f �M@d���mG^@kF����@q~�U�@v=N����@{�m��@�I[f��@�/�n�@���.a�C@��7�^K@�i�9 o'@��~�nI@��\u�F@�Ŵ�.@�<6�m�4@��7��O@����M��@�ф���@�9�l @�v2�G��@�u_g�l@��d�7�
@��%~@�^�=�c@����}�@�ő�"b�@�ۨqB*@�i�8�=V@������@�Ō�%�r@Ǔ�~g�@�x&�W��@�ryc�@̓�,FM@ϪX�Y�@��6�q�_@�Ԉ�`@�U,C��@ԗf�C�@��?c(�@�@*>+�O@اW��@�r�`��@ۚ��{��        ?F�r� ?D
Ѧ�?gq=�ɍ�?��]~��D?�x&����?�1! |�?�_bo�d?՘�3���?�U!p��^?�z�P`0@Wo�j��@o7�!J�@�<W�)@$������@.��ɍy.@6����@>��0�@E ©�lN@L=K���@R�U�a�>@Wс>���@^-�>gp�@b��|=�@g<c:���@lO$���@qGZ�N�@t[ƹ��@x;c��@|;u�<��@�l��נ�@�����S2@�Ɩ\*	�@�՟y�t�@�)(x$@�Ú.���@���$�b@���!7�@�,L4�E�@��0���:@�+�b֧�@��J��@�p��1&@�*���@��O�;�h@�o���w@�L���i�@�D�bmo@�V�k.�v@��l	|a6@��-�cP<@�v8�C�@�R��!H@���=i�@���b�@�WN�.)�@�Ƿ�jT�@�D��s�@��I��.@�f�!��@�� z�@����6L/@����X�@��1�_�5        @[Ѻv"�@5WXvO�
@Si#<�@g8zs�C@u�流�@� ��(I@���K`�@��5���{@�� CD@�����C8@������@�� ��v@�p�v���@��y�Z`$@�6�;�@��uh���@��-��bj@��9����@�2OP5�4@ŝ`6��^@�2���N@��6�Z@��-��@Ђ�f$�@�.n��+@��Uld��@��AAcRe@���%�.@� Yn���@�y�q1˱@���M\�@���:g��@�DQ+�@�ʈ`���@�i#%8�t@� ���a@��_���@��yJ�]]@���*�u@��P�+!@�o.$�@��b�Gz@���s�@�Mlc.,�@��q�I�@��ʅ=�@��c�v(@����@��s���@�M�Iθ@�u[8EA jVK"��AYU��D�AQO�:2ARW���A\r�ݞAo���cA���T�A�����A�$t�A
M����A_��B��A��s�T�