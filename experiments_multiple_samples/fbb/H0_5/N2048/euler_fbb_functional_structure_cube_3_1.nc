CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T101318        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?�hʭ���?�+�����?�_����C?�\�-�P?�����n?�)!�?�C�џ�?�g�K[gV@^3uOE@!5�MW1@}Ա=f�@�x�"��@���`�@�Zeh�@�ET @��4d;X@"���@$����D@'5�A, @)х�Q�>@,��Ӯ�@/���Y�@1vO�7�@3"�uI@4�.��@6���?��@8��� @:����s@<�ɽ��@>яH/d�@@��@A�Aj���@Bہ�Ŏ�@D�5�WZ@EZ/S�Q@F�Z����@H ��9l	@Ic#+	&@J�t?�l@LE�}@M�l���@OP��w�@PrĨ�P@QBcJ��@R,��uC@R�9!֣�@S�+���@T��J�q@U�����@V�
O�J@Wsua�,�@XhHJ5��@Yau{��@Z^�|ʯ@[`�E �@\f�����@]q-cwr�@^�ǲ[b@_���&��@`T���:�@`����@arn�WHw@bH��x        ?c-�
&m%?�p��>�?���N>�?�{Ѓ�_?�����I?�@t���?�Y���*?��츶�{?���2�?����
#@ �<6c@@���(@	vxڠ�@��ZY@@Sɘ��e@����@n����@�C�d��@ �ϝ�E,@#Y,_p�@%���Vѣ@(�:��=@+��xpw�@.�8[,!@1�_���@2Ą�{�@4�}!���@6�����u@8�,*��X@:����eg@<�/̇�@??Bb
`@@���@Bn��3@C_�"&�@D�����@F$�`�@G�B#T�@I���@J�z=v:�@L�bE��@M���'��@Oe@#��G@P�w��;�@QnY�9��@RUV��@SB�+l�@T5��j��@U/����g@V/�h��@W6��yu�@XC�5$�@YW�̈́�N@Zrhs�D'@[��|Wf�@\���՝@]��Κ��@_ ��
A�@`.��eHU@`Я�g،@av��t@b����?@b�y@8�        ?l"qhW�?���D��R?�2`(��)?Ó�Ol,U?�c)V"?ޏ�w��?�\58��5?��G��`?���矶?���0UDv@�8i�@��.��@��)7@Ǝ��E�@�����j@�A��-O@Je��@"+I� A@$�*QU@'��O�@+(-si^�@.���x�@12��Y�U@34����@5YH<��@7�vV�t@:�	��!@<�q��R�@?V��N5�@AR'|.�@B�����O@D3��Vh@E��o��@G��܂�@Is�w;	@K^;�U�J@M^9���@Ot�T�@P���EH�@Q��
R%@S:�]��@TT���]@U���]?�@V�x(���@X@��t|@Y����@[r�ay�@\�&�jj8@^�c�zZ@_��9�>_@`��E�2X@a��aF�@b`
q�&�@cCn+���@d-�i7@e�n�>@f-Y��
@g���@x@h� ��@iZ q��@j,ls��@kC�ID@l`r
j��        ?�jCQ쐼?�=d��?����k@����P:@I�i��@&D+��@02p�#�i@6E��aFG@=^�`_�f@B���u�y@GR���@Lk�P[�@QL]K{w@T<k�[�@Wo�@?5@[
(K\Ӵ@^��5'f{@a� ��%�@c��~�@f�B�@h���@k)\���v@m�`'�q�@pd�Y)�@q��&G@sz��S�~@u,#�`�@v����@x�%V!T
@zt^�)3�@|]���@~X@��/;@�1��5�N@�@n���@�W�yf7�@�w4���|@���o�8V@�����@�
w_�@�LKӱ�m@���>@��szB@�F}BE @���\��@��&E03@�F��D-k@�TgMb@��/@gs@��?OH�@�Y�.@�(�\��@��!��n�@��o�`�Q@��z�d�@��;���@�j��	�@�OІ�u�@�8��;I�@�%+���@�c�@�ĿY��@���'kT�@���:�d�        ?m���@?�M��x��?�	��1(�?�	*�P!?���(�?ސ=�'�p?惄\�Y�?�>����?��r�v�=?���f�4[@ ���b_!@Oƭ�Ğ@bF:}@�TW"E@�$L%%t@rD��%�@?�i��@>ɵ:�@o�΀e|@�ev���@!���X��@#��B�@%���sy�@'����.?@)ܢ�eX�@,'(p�p@.��r�?�@0���Z}@1���@3)���.{@4��_�{�@69�V@7�Wȸ�6@9��={@:���yY@<IY�3�l@=���A�V@?��2�x�@@��U�L�@A�]Q��@B��ic�@C����@D���]�y@E��U��$@F����z@G��Cw�@H�IDT|G@I��@��[@J���3�@L$_�-}*@MRo�I��@N��U�_@O�C�͓y@P�݀�@Q$��%)@Q�/��2@Rt���_�@S!Ͷ���@S�Ƹ��X@T���h@U;at��@U�h��!Q@V��g%�        ?Z���.by?��=A���?�j�z�?���p�Z$?�Ҍ��G?�M9AF��?��x�Ǝ?��I���?��O���?� �?�Ò��3F@
�g��0@E>A�@
aD��f@�i�,@�W�)�W@2"�\$�@����?@�&�@!;.[�S>@#��W.	;@&?��Z�=@):W�P�@,~� ��@/>CuW�@1R�C �@3 �[Z�@5	bg\�@7>esC@9,w/'�B@;gL��_#@=��{�ɹ@@V�T�@A_�ؐ
E@B�s3�Q@D\$���@E��~�!�@G;���,@H�R��_@J8�D �@K����@M��>LP@Oi>Bq>@P��{pYv@Q�V��@R��vi�0@S��7��@T�t�m.>@U�hp���@V��=�B$@W�l�@Yf��@Z9�t�M�@[pI�1�@\�5DA@]�c/@_@�_Î�@`J�w1~�@`�����@a����@b`E�-K�@c�2k��@c�eG��        ?a藇�K?�ơ�� �?�`���a9?���=`�?ȝ~Ij{/?Ը�iL�<?�Z�I��?�M��_�G?�,Hy�"y?��>e��s?��Uϴ�@���i�@)�s
�{@{ m�@L�9@^Mal_>@�,��$@|��3%S@��!��@!{�Y	̴@#�a�N@&o��U��@)0E�=��@,!T� q-@/C�j�+@1K���@3p�f�<@4�4�ff@6��T�Z@8�����+@;"Z-m�E@=jr1�~@?� ���@A&堞Z@Bs�X+l�@C�?��t�@E9P���]@F�ɳDe�@H8�cݑx@I��$A@Kq�l��@M$���T@N䳗S�y@PYԿcB&@QHv��p@R>:B�f@S;hSi@T?2Σ!@UJ7�@c�@V\q���@Wu�}~>@X�@�ɟQ@Y��O��@Z�{*u.@\"7e]�h@]_vT�@^����@_���Q�@`��e~��@aL9�q�@a�*��pV@b��0��[@cf��ٯ        ?�`O0�L�?ӿ&�!?��"�G��@Ftx��@��'��@Ȑ3��@">w� �@)M�m�b�@0���dn;@5�����@:㑉
	@@m��+�@C�ftg�'@GR,ŝ�;@K;[�g��@OtD�u}�@Q��Ӳ�\@Tk�`��@V��]�@Y��2���@\�����@_�X�FR@arɜ >�@c"E���0@d�0���@f��O���@h�uזk�@j��j_AQ@l¡l�@n�ƞ=�R@p���p@q��f*6Q@r��(�@t.�s0N^@uu��oX<@v�Ì�@x��ݟ�@y�ȍW�$@z�~Q�[�@|e�&Q�:@}�F��d�@n\<԰@��u�n�;@�N|{Z@�!C���@���u=+�@��p���@��*sd@�� �-`S@���Øޟ@�v	Ǆ�
@�jF}��@�cX �^@�a?s���@�c�V˒<@�k���#�@�w�ޭ(�@��N�y]@��\/n�@�\�����@��.9Ѧ@�~��d�^@�x�άw        ?�Az���?���qO|^?�F��]x?֐�ڔ�6?��E���?����giz?�d�v?��J"?�@c|d��@	~�eg@�o��@*�V�b�@��L]Yh@�Gn���@PET�B?@"#�@$�mk�@'AO��M�@* ���@-+�z�8x@01' 2$E@1�J��m>@3�>�DS
@5��8)�@7xNYF�W@9�:�J
�@;�����@=�i|��k@@?QVd@A:���@Bt�#�@C�ޙw]r@E/��@F_/l�@Gy��"@I0�#�c@J�8	>�d@L,|ߥ�/@M�`.�CF@OR�8#Z@P{;ho@QQ���bY@R./���@S����@S�ȸ~j�@T�)�ى@U����@V�)ۆ�?@W��	8��@X��X̕*@Y�x�"��@Z߀�}��@[�SJ_l@]
 �6(@^'��k�@_J�p���@`9���Lf@`Ѓ���%@aj7���.@b����@b��B܁�@cGhȂj@c���BE�        ?h��Jd?�������?�&�C���?�I���#�?��!ʤt?�|�U�QR?�fB�u*?���v'4?��A�L?�&��F0c@�Ŏ��@��A��@2�X:@����@@��m@&y�;�@q���"@!)o�b@#�1fLe@&dW!@)^hN��@,�&�O�@/��|ܡ@1�&�7O�@3��kq�@5�m���@7��dp�h@:2}��޷@<�W�`�~@?�җ�0@@�8Z웰@B5y�4��@C��p��B@E�:X4@F����b�@H@ ��@I�Aι��@K���\��@Mf�>z@O;�Tn��@P�4~t� @Q�#���@R���L@S��<�vG@T�^jr��@U����a�@V�d�R�X@X�+�&8@Y3��}�.@Zjm�_�@[����Z@\�;�Ŋ�@^:#>�G@_�?����@`t����Z@a&{���R@a۹�݀@b���ã�@cQN>y��@d��?��@dՄ@q@e�L�� @fh��V        ?z|�|^�F?��s"?������?���#���?ڼ{;�z?�dF��Z,?��Ȓ��?�13�F�?��8H��	@g��2�@�)��#g@�~���@��
��@Z���m@��X��@��Z��@"
9D��@$���%�@'�0�1�@*�(���@.J�$N�@0�%ng�@2�I��(@4�}5U�n@7(�_*��@9w��Sn�@;挜�]@>u[�G��@@�IŚJx@A�A�Go@Cr�i;YQ@D�א���@F���#�@H@jf�M@I�AVE[@K�ͦcn�@M��ޢ��@O��Ȯ��@P�+�*�@Q�/7��W@R�'E�P@T ���P�@U$c\�U@VQxr��@W�����@XŚ�u�@Z�Wqg@[^�[��S@\�NA�GG@^y�i@_�5]���@`�Yж6@a@L�
Q@b�n�_@b�a-@m�@c��\ʈn@do��h�@eG@���}@f#�a�@gB�>�h@g��V��@hֽ+�y�@i��ol�        ?�v(�.j?�G��o�S@�V�Ru�@ֱظ�@#R�8@.H�N�	@5�nKa��@=~�l7*�@CG����@Hm�����@N0�ç@RI:S��@U�w,IU@Y��u�d@]��	.YS@a9#O��@cwlҹ�k@f�V��@h�Eb5�@k����-]@n�y���@p���P^@r��G�'>@tF��9q@vZ�a#a@w��+���@y���%�6@|'^�Uz@~)IAN��@�/�8��@�T��5��@��z�`�5@��U�R�@��.�|D@�L�BX�@����#�@���ۃ�@�o6�@��C�`��@�c���3@���z�@�@-c���@��A��@�����_�@������8@���`r{@�|���L@�e�].,@�R��M��@�E+5�@�= ��@�:4��D�@�<�Z]{�@�Da��#n@�Qpn�v@�c�y~S"@�{���I$@����'��@�]o�`�C@��8~8��@���	��@� ��Q#�@��Ad�#         ?gG��>�?��o��?�R� ��?�]C�i?ύP"L>?�N�%���?�+2Ǟ0?���oٽ?�<�_��?�#���-?��ߖ��"@ ����E�@\M���@��w�'@/��@K~��a@��(>Ч@2�""Sc@�F��@�����@�X��c�@ �I��m@"0�Z�@#����s�@%���R�@'�Y:��d@)��'T@+�T�߶�@.����@0'~����@1S�v�))@2����@3ʕ��_^@5�����@6j�:B9�@7�D��� @93�XwC@:���K�@<%%�^'h@=�����@?=�2��@@lwj4��@A>���r@B�u��H@B���Y@C� �_@D�[��Ѩ@E�K^p�^@F��yG�@G�C��@H{Hs�@Iw���/@JyL��h�@K?���j@L��jJ�@M��:pa1@N��O���@O�����M@Pp� r�D@Qs�>>@Q�_qK�)@R)�7��Q@R��K�L\        ?T�^��Y?�A^�[l�?�98��?�$8z�i?����/�?ς����?؛ݩ��Q?�N�#��?�9i�9= ?���T�?�.v���?�C����@��9�ݬ@��x�v@
˸-F@ ۻ�@V���V�@cg��$@�����@X	f�@ !��Y�@">NO�2@$�����@&�K��O@)��/��@,Cu6R@/-Yp��4@1!,�i�P@2�����@4w�k�"@6D���@8(���@:"=��@<3_2��@>[���7�@@M�KN@�@AyӏN@B�j���f@C�B��$@EB�8��H@F����N@H�O=@Iw��b�@J�_���@L�%`5�@N����@O�4��,W@P��~ ;�@Q�y/��@R{?y�:�@SfF3��;@TW�g�@UO'rHd@VM	N/��@WQ9�u�@X[�I�@Yl}P���@Z���Q0@[�ժ��u@\�Y�7�@]�T-@_�؄}b@`* �uu�        ?U���l	.?���U5�?�KT��?�)5���?��	�ϯ�?�J����?��X��ׂ?�`�Aa�?���;��?���_[�;?���$5|?�G����@��>sg@���
b�@
e3z���@�v�y"8@��*�@�}X�@2��r6@"D@ }do���@"�;gV@%d��*@'���_@**FnwE@,���|O6@/���@�@1��2q��@3<ͫ2ó@4��n��@6ҟ?�;@8�a��k@:� o��@<�嶥O�@?���)@@�Т$'@A����E@C	�.  @DL�!m@E��R`M@F�:-�xx@HXb�=Z;@IǇ"�.@KA�5�q@LƢ��>�@NV�ܰDV@O�Dwl
�@P�f�R��@Q��{�a@R��0��@Sc�)=�@TK� ��&@U9c@�/@V,����@W#�b�]@X �WN�@Y"�
��J@Z*42g�R@[6��j^�@\G�n�I�@]^7&^{@^y�%�`@_�ݻ���        ?��S�	?ΪN�G�?�H���XQ?�� ��l�@|C��3E@��a�@�1�w�-@$߰�_@*�����@1$�B�>@5lkythZ@:3�����@?z-�!H@B�z l@E�9V�5�@I(��4�h@LͶ���@PY�8mͧ@Rmgqĩ�@T�k!y�@V��C�Wi@Yj�e���@[��IK�@^�\l�	@`�geU�y@b@Ib��@cʞ�U�@ed���*�@g����@h���@j�M���N@lkT��Z�@nS�X��I@p%����@q)�	���@r5��#{@sG�;�@tblm�iF@u�W�Q@v��Z@�@w�8�=(2@y|8kD@zU
ao��@{�)���@|�aW�ä@~<��/oU@�
?;@�}<<8@�1���@��D=�?@���@@�egWK�c@�(:�o�@��v�v@��J�ݟ@��y�d�z@�V� @�*���@�pj9@t@��.���@��Gx�@��� �_@��}K��$        ?�|����S?���$~��?�G��$9�?�Y}l؈�?���KmX?�!���,?�H����:?�nJ���@a�nmY@%ݼ���@�H�U�@�#Ѕp@
����@�5�
�@���|3@�dC��5@",/r
�g@$���zR0@'3騊qa@)�)/P�@,�J/2@/�R]��@1�-����@3I��Y��@5��@6��u=@8ݥQ��@:���	��@<���R��@?+p�s��@@�@T���@A��I�i@C8�F�}@DY��W�a@E���"-@F�A\@Q@HZn���@I�\`�=@K; ���[@L�Ϥ5�w@NG|�<r@O�<r+�@P�����@Q��h@�@Rr�P>��@SUod�@T<��"�!@U*�z(�@V�;ID�@W�}O{@X���K�@Y��P��@Z+G�!)@[>
:i��@\WS�S$@]v����@^�K�9��@_�w�w6_@`}����@a�ɖ�@a���}�@b\���� @c�2�$X        ?o��T�?��S��V�?�20Ԅ��?ǭ��Y?��J-+ʟ?��;1AK#?�
�1`�?�C��k�	?�E��б@N�D�V@.�Gʕ@��� @� �)�@���@Y@��5�@�@��H��@ �*���@#��@&S%;@�@)\hB�BU@,�O���@0�:�-@1�g\�[@3�uE��<@5鮉��X@8�� �@:bi�n��@<ʓ�9R@?Pm�ZI@@�+p��1@B[Vn�d@C��2@EK�G}7@F۶'n��@H{G�eH�@J*�O�'_@K�ixؙ@M�?Nl��@O�r�8l�@PŔi�`�@Q�D3@�@R�[���@S���昙@T�D���@VԷ-m#@WIF�:�B@X}w]��@Y�s�@[ F�/�1@\N����@]����X@_}y�@`8��j@`�j�c�v@a�ҥ��@bt�!�`@c<Y�	@d	��\�@d�)��7@e�92�O�@f�}�n�@go�yK,@hV�XŊ�        ?im��Z^?����#�?��17]�?�����)?�!=��I!?��n��6�?��~�f{?�9D�?��]�??�m3i#@!hFF)@�C���<@
���5@p�݁��@�RD近@�o�|�W@�, �@ �i=fZ@"����@%5�4�T�@(�b�@+5[��c�@.��c��@1-CUN�@2��Oh@4���Z,�@7B�e��@9Q��g�@;�4t�@>+q��<�@@ct����@A��S
&5@C.H��1@D����f@F8����c@G։�{�@I�Jq�ڣ@KBM�@M��e��@N�<	�l@Poi�kK@Qn��O��@Rv�N��3@S��JEE�@T��<�"V@U���?|@V��qug@XR`�Ў@YO�z�V@Z���v`@[��j�M@]'�xpӐ@^�����@_ߪ�$�@`�����(@a[{O��'@b<�h @b�����D@c������@db\fb��@e.�p��@e��1�w�@fѝT��        ?���Q�?���`���@ [1U�5�@g�p�f@��R"
�@(��|@1#�F��@8�p��@?�b?��@D+�y���@I=Oa�b@N��	u��@RK^q<=@U��m<�A@Y/���@]�C,�@`�2��Yw@b�>�=�@e9o�_�@g��&�Hr@jhy���@m6���4�@p
?%�@q��� HF@s>�t�F@t�Fs�)@v��voZ�@x�Wq2@zl�DZ�^@|eD��@~o@Gz@�EPD5r�@�[�0@�{go���@���H"��@����\�@�^7b@�R����B@��IqAĔ@��"z�@�T���k@��V�ݳ@�.���@��m��X(@��9�l�@�^�N �C@�+|���@�����{@��j�n@��q9T�B@���qt��@�w��К�@�d/H�E�@�VJt\��@�N��� @�K��E�L@�O0<�e�@�X��+f.@�g����@�}V���@����؈J@�]4K��@��cW[�        ?o۞���?��J贸]?���>̪K?�Z"�'P?�f�EW�c?�n�{��?��n��?�	Z�a?��ʱf?��ぺK�?��u�/@~͘r�@d],�O9@��7!9@!�oZ��@�>&�aC@K�T�C@%�}��@/uA�@h䳺4�@ �:��Tg@"�Wl��@$�	�&cT@&������@(�:��-@*�J¤I@-.#��/@/����I�@1�7��@2U��Լ�@3��
��0@5�S��p@6�u�;�@8i��+s@9������@;96m��@<⁌eU@>����@@-�1կ>@A͋Ƅ@B�@W��@B�:�HPf@C�-��T@D�QY�\@E�*٪N@G���]�@Hy1V�@I2,�m�z@JP��:Z�@KuK�/�@L��jұ)@M���i�@O���B�@P ��U$1@P�C�r��@Qd���@R���Z@R�o�^G@S_��{˺@T�|�@T��h�@Usć��@V*_�q��        ?Q���Q��?��#�,?���(P$?�:���?��cț�?��J�?��'�V%�?�͘0�L�?�jFI$?��<�p��?��5�=?��j��@ �Yq�
u@�@��@�v��\@� �0�
@�����@{ه�U�@��'��A@8���V6@X�h��@!��i�h�@#Å{�@&e1B��@(�,�|h@+L`^��@. z�Aʊ@0���\4�@2"�p<�n@3�N5J��@5�P&2/�@7\�}��Z@9E�7My@;D�l6@=Y�Uh�i@?�X_� @@⧂� o@BF)s��@CExH�(@D�*Y$̺@EԌ��@G-K�%#�@H�r�8/@J
e�@K|x-E�@M�;|R�@N�ᷱ�@PR@u�@P�s�EL@QȊ��nx@R��B�@S���G@T{)}�E+@Umr@��@VdԨ��i@WbtgAL@Xe�U��@YoI�,8�@Z~�DVp@[��l�c,@\�~�B@]�B��w@^��Q�        ?h%0���?�@�񴤯?��(�N\??�v�͍'?��B1k�?ٴA�`H�?�A@�l�?�@[���Q?�h�Q��?�����@ ��\���@�&l��u@	�w���@N{T�j@���ۧ@)ɨ]�@@�u��X�@
���5@!A�71�@#����_P@&F�	���@)H�Z.@,i]̒�@/9��&@1K�;��@3�i��m@4��C��@6�}�`U�@9
����@;;�x�Z@=���!�@?��`��+@A7-�z��@B�yf�3[@C�}�@EKVW�u�@F�!��m@HH��1@I��,�F�@KvdR@M/�[��^@N�W\Y��@P]��v3�@QK��P�@R@��C��@S=J5B@T@�a��@UK��e�@V]��f̉@Ww��A-�@X��N�@Y���B��@Z𲘙��@\'Ӗ�U@]fd�t@^�p�9@_��줏@`��� �@aU�&���@b"9V�@b�.[���@cx3C*z@d5���|:        ?�Ge!�U�?ӌP�!�?�TItd�@ �fgh@?�<Ć@5LQ� @!Ѵ<>�P@(��5�G@0d�@5���0@::��3F�@@�F�/�@C3<&N�@F��^��@Jr10T5@N�	H��@Qm���R@S���3�@V5��.@X�q��1@[��>H��@^|�G�^@`Ű#��@b`(|��P@d'_F@e�w_�@g���ȩ�@i���o�i@k��2At1@m��H�Y2@o�I�n�n@p�c+���@r$6=��@sU�$��@t��D���@u԰�%�@w#0-�3A@x{ML��@y��4ᒠ@{G����w@|�!���@~9��S�&@�$���D@���@�t0�U�@�D�`ח@�)�sS@��¨I�x@�Ѷ8m�#@�����ä@�����v@��N���@�tLR�Z[@�gv��@�^�k��@�Z3��Q@�Y���@�]C�g�}@�d��|�%@�pd�7�c@�?�g;�n@�ɢ
t�@�U=�h.�        ?�=1S�?����9�K?�Ç���?Ѷ�h&^?�.�O�?�I�b^��?�n��a?��B��a?�fZ�M�@�զ,+\@�?��G@���f	@̆a��9@�?dv��@E=��_@���H��@��y���@!�,���@$'6��@&Sj��#5@(���.�@+44�]W�@-���a�@0B��@0�@1������@3"!/�1@4�%��$@67��yy@7�x�C�@9���ϫ@;<}�[�@=���'@>�(k�D@@]g�2�@AT��p�@BS��ĩ@CX��xw@Dc��f��@Eu���@F��k�8q@G���r@HӱfK�@I��'ên@K2tƪ�'@Lkb��@M���Ƒ�@N��M<>@P�S|C@Pư@�"1@Qr�PV<@R!q||�@R�G�G[@S�	U��z@T?�|JR�@T�ZP$^@U�V�)�p@VwOc��@W9�&��o@W�[��@X�a�R�g@Y��[�@Z_F�Lo@[/�Q        ?r=Rø?�a��-|�?�_2y�7�?ɆF��e�?����A�?�b��A�?�}QQ�:?�3I��?�a^Gu�V@:����@�CXR2@A��X	c@��8�&@�H%�@�
x)�J@�E��w�@ 5Ն�@"�)_�@%Sy�p)�@(2�mo�@+G���@.�9�>J@1�ѵ�@2�C�ŗ�@4� �b�@6�Z��@93�Z@;����b@=�b�̧�@@D�V�'@A��[�?@C���*�@Dx}�V2�@E��$NY*@G����i@I77Q\U@J�"=�H@L��"Q��@N��V�s�@P1��f�@Q*��k��@R+�H��@S4B�,1@TD=�%�@U\:{F@V{����T@W���epo@Xё-�G@Z��9%@[F֚.�@\���4ړ@]��>)�@_-��҇@`E<�	¨@`�Gb>o�@a��I�>@bf��Q8@c$%Lk�@c�U%�ɳ@d�IԒ��@es H���@f?u"E@g�G        ?z�c4Cş?��üu��?���#��?��u=7?���jO�?�U���K�?�Q���?�N>V�+�@ Zy�k��@L��c�@4�vY�@�b��7@s�a@�@��%�@��D��@!\�(�@#�ñ�@&��Z�Z�@*KƯ�L@-��ָϗ@0����@2�"��t�@4� �{U�@7��>��@9�h��K@< �}��@>�d��l4@@�Ě��i@B]�V:r�@C�귚��@E�A�s��@GV�Yb#@I&�D@K��u��@L����@O����@P�a���R@Q�:���@R�q�к@S��C�Y�@U2�V6"@Vs�0�҂@W�l_�?�@YU�}T@ZrG��G@[�A�K�@]N@p�}�@^�@O2w�@`)��@`񕷚U @a���@b�k��i�@chϕ�j@dE;�=��@e&��h|B@f\�!�@f� ��!�@g�Jȣ@h�%(�h@i�e��]@j����@k�e#�@l�&�y�        ?�Y[��A?�O��@�E��Y�@�T���
@ ��ʳk@)�@4P�@2�Fd~�:@9s�IF�X@@��a�5�@Eb��@I�OiO�@Og~��@R���a�@U���X��@Y\;2�@]s�4�@`�?�@b�����@d��M�D@g($�N�@i����&9@l'��I1@n�!��@p��T�@r<�E8�6@s��`�#@uG���sQ@v��K�@x��!ʼ@z<稏�@{��v�L.@}�\'���@�V"�/@�Ƚm���@���Ss
�@�ŀ7Fh�@�͙9��C@����|@����cΌ@�M��@�-b�i��@�Tע�Q@��\�)��@�����-@��Pd��_@�.��ff5@�s�~�m�@�_A)e�@���s@���E)�@�`l����@�	���1@��[͆�@�zR���@�2߅�@P@��󙎘�@����5�@�k�����@�-�8�%I@��ζ��(@�����@������@�O|L��2        ?����7?�?F��?��WK���?��s�B?�Q��$CX?���/2V�@��)4<@����@@qU��@pݻ���@`�:�@!��� �@%ar˾@(֝�@�@,��0��/@0�=��@�@2�=	��n@5��O£@8-K�4	�@;(
	�@@=�M��X,@@�� 俇@B6��I=�@C�Q��c7@E��_�RT@G��M�I@I�;��g�@K�SI*c�@M�܇P�@O�ܻ��@Q���Ww@R>�9���@Sr�}�$@T������@U��[���@WH��hWi@X�ڷ���@Z�Y�e@[td��@\�Խ��@^k��k�@_�����@`�榢�@a��)(�@bg�N��b@c?��d)^@d(�zz@d�%p�@e����@f�#e�X�@g�-��@h����@i�9��@j�4��@k�����@l��}�@m��)�
�@n�~�_��@o蹅�x.@p�U�W�k@q��N�@q�m0�c@r6��c��        ?z�!��$h?�7����?��O��$N?�LA��I�?�{�e���?�t��2�?��C�?��k�5�"@��C�@+��kA�@��F{��@KW���@;w���@�����@ ��kp^6@#_h(�D
@&x1D�+@)�Fm�=@-u2@#��@0���	�@2�ɚ�,c@4�q7J�f@7^L�@9᝖�6@<���R̰@?VJ�9=�@A#��2@B��v|@DL�����@E�����@G�D�
�@I�H��@K{��w@Mv!G+p!@O�*&B�M@PэV	a6@Q�	��^@S���@T:Ѐ�Y@Uq<�E�@V�m�q�#@W�uU���@YOc.��@Z�F�xgS@\02��%@]�/�k�@_UEDr�@`D�w�7@a(ǘ��@aڣ��:�@b�R	���@c�=�8�@dbpm�H2@eD�BG*�@f,ͻ���@g���@h����@i���b@j�y��@k���+@lƅ��@m(�f�C@n,���        ?��L�y?�]���?��$�	)�?�8ֈ�2?�kL�M�u?���,(??����v4Z@!�;T?@��(��7@R�!k��@g���2@�tmĪ�@Y�_�!@ J=��\B@#*~]2�@&Nj%��@)�sA,��@-g���@0��\�ՙ@2�g���3@51T_�@7��ݵ�@:��/@<ͬ�*�@?�=a�@A\����@B���\@D���,;�@FjGTHA�@HD����@J5&\
}�@L;�"o�@NY`���@PF����@Ql-t�g�@R����@S�~Z��*@U!i�g��@Vt�B�9@W��!�S@Y>g^�O@Z�����@\6B奖m@]ß�O�A@_\����)@`��z�v@aX� ��@b7+5r�@cNv��@dk�ؠv@d���Ÿ�@e��ОF@f�Ә5l�@g�Orqu@h�W�R�@j ��"�@kR�%�@l0�/��@mQ ��@nxRp�@o�絪�H@pl����@q
��^�        ?�p涤0�?�P�([1
@�ۙ���@%��x;@2�+��@=4��x�]@D��kJ�@L�ج���@R�N���@W��)���@]?��Qx@a�����@e�x��@h������@lʯsx�@p��p\`@r�s��@uG�U�%�@w�b3M� @z����@}�Az$@�D��u@�ڪ:{Tm@������5@�>�z͎@�ȃPT|@��^�o�@��O�N�@��z��8x@��x1��@������
@����D�	@����Ek
@�������@�3h��'@�r눤V�@��H�D˿@��k��r@�f�Y`�l@�ɻ�ˌm@�5�*��U@���Du)h@�e�c��@����fg~@���i�ʑ@�l�t샿@�=�Ż�@��g`@��	�jNb@��{V�+[@��ae[c�@����AN�@�����V@�q�
9�@�f�L��T@�_���G�@�]}�ާ@�_�R�e�@�f�rO�N@�q�`�@�@��A�@��(`A�}@�W�%lc�        ?�G\3�ӓ?�"�T��T?�uq�r?�� �`�8?�ڏI	?�{�D1K?��(����@A� �@�E��5�@v.ٝ��@�8Q��@���\~@n4��@ )w����@"э�20@%��r6Nl@(ļ�	��@,��ݹ@/���4A}@1�$����@3�fLQ&�@5���%��@7�"����@:4��¦�@<����� @?$�";@@�c2.ŭ@BB��@��@C��l�@E+/T8Ӣ@F�� Q�@HLwԣ�@I�i��;@K�0��g@Mf��b��@O6���Q<@P�>�`��@Q�=�(Bj@R}L6
�@S�g�ns@T���*5\@U���)@V����?@W�`ʛ@X�O��[@Z-�Eٛ�@[bÕWk@\���U�p@]�9�#+@_,met<@`>��V��@`���N�@a�g5h;@bMn[�bp@c�k��p@c���8�@d{w�~�@e<};A��@fS�@�@f�*p�Y�@g�ݡw��@hd*���V@i7��        ?o����w?�:i���?�c��@~�?����FG?��3��|?���?��,m~�?�����Z�?�inU|4@��}�s�@�Cj�ȷ@N��6y�@[���!�@�[		��@�wVL�@^����@!�Cc��@#���B/@&�kz1��@)�@<�@,�?�c3�@0C�4>Z@2&/�&-2@4&�U�g @6EoR��@8�^��|J@:ݭtr��@=Ws�9f@?��U�7�@ASUB|�@B�8�Z3@D80���:@E��ס�<@GZeXA�?@I�Rv��@J�+O�d@L�(B'�@NW���d�@P�e��@Q��ѯ-@R�>��j@S'�
f�@T:dV��{@UUJ�/@VxQ�fƠ@W��/3@X��~�@Z֤���@[Wŋ�l@\���i�@]��H��@_V~�s@`^
�5Z�@aG��@a��A���@b��u��@cT�~>�@dҴ��@d�b5/x @e�8�x!_@f�V�M�@gh���q@hFm���1        ?up�����?�����#U?�T"m?�7b��z?���}��?�2����?�o����?�Vpq�?�K�r��@ ��˄<@!����@
[Ng���@"s[)�@ph���q@�b�,@"ۆx��@�]����@")We�@$��Tx,y@'�N8o�U@*~u��F@-�Cx���@0��S���@2L�@4.���@@6)�[I,T@8>�	�@:m����@<�9�nV@?#��~@@ɻ#�e@BI�b
@Ck��S@Dά-I�o@F>�QA��@G���ϥ@IE|w��@J���r)@L~����o@N.�q�U @O��"p�@P�~b�@QƢ�"��@R���%@S��sY,@T��٫��@U�2�^	@VŐm�@W�Ă;X@X��;C�@Z�s� �@[?hr[�@\n�y:DB@]�@
��@^�X_UQ@`f�D�@`�aͣr\@aa����@b���#+@b�ED� @cn�f\�@d$� s��@d��*��        ?Ê^Ldj�?��<O޼ @JH�n�@���\!@$�5L�\M@0:��H�T@7pA`
Ň@@p"��@D��G�@J��5A$@P�H�Ӆ�@T�.ܗ@W�jRkI]@\-����H@`d<�3)@b��lQs�@e��=@hcHQWT@kk�����@n�h���j@qXh���@r�Βp@t��F��@v�F�u�#@x�=��&}@z��O6�z@}/[�3��@�_|ʎ@��x���@�A�[��@��4�H/�@��Q+`�@�U�ev@�ȕxu�@�G*1�w@��B���B@�f�D��j@��@��@��^n]�c@��j~S@���\�-�@�~�>�l@@�k�L׈@�^n�4��@�V��Od�@�T\�7��@�W�
k�@�`�z+��@�oU��@����W�&@��@����@���a!i@��Ee�X@���԰@�o�N�@����gx@�V�zg�S@��=�0�@���[Ca�@�@��dVq@��#|X@��#�l(�@�E��l        ?zw x�b?��h�O?���Y�#"?�
�+�y�?�C�>"�?��]e֊�?�\1��?�ݖ�X�M?�s����@�f9{�@��u��h@]�JJ��@+��&�@n�jnMy@���u�c@��Z<@ p@9��@"������@$򲕤�4@'i�P}g�@*K�}@,«ĩ�)@/���ؠF@1T�Ĺ'=@2�J�y�@4����@6FSj�Td@8�7��J@9�N'�@;ү�<��@=������@?�{ή�9@@��C�X�@BA�Ԫ4@C/�}g��@DV��D @E��Ys)�@F��K�@G�xCԡ�@ID�Bz�@J����}�@K����J@MLI�fK�@N��U�[@P���=�@P�b���@Q�]X
�@RT��W@S����@S��*��@T�u��+@U���2;�@Vk�tT:O@WIx���@X+x�j�@Y�ó��@Y��F�ˉ@Z�V7� �@[�شg�c@\�fp��	@]���D�@^�er�6@_ηT���        ?f�{��^`?���G�_�?������}?��9^�4�?Ё�v���?���Y!k?�{�c�-?�7��^�A?�� �}�?�HM~�G@ �}��;z@��w@	�`	k0�@j����@��>&�-@_Nu8�@�-a���@�e	ؼ*@!w�c]�@#s·4~3@%��ˊW@(�W_8V�@+�۴S@.��̻J@0����	3@2���ׇ@4����G@6z1A�ȝ@8\��@:�H��U�@<�M���@?#̉Nx@@�D�c�@B-3\h@CT�gT)�@D��A`=�@F\A�N�@G���s0#@Is<���@J�����@L-�ڝ��@M�|�$�@O�����@P�;H�I@Q��8���@Rs���z@SfEep�`@T^�%�{@U]��n}@Vc9��c@Wn� O�a@X��z8@Y�$��;�@Z�� ��^@[ܪ�L�@]�;��@^9R�M4-@_qϤ�@`WvttGr@`��\��@a��ɺYg@bF�}�]@b�`6&�        ?h����;?�������?��d�ɍ�?�0��3�]?�	y����?��Yo?��#p�U?��S��?��o�qA?������?���a!@�'�9�@���ս�@����A@���_ε@OT���@��6~/@��)�|@ ��U��{@#�ٽbc@%���PPc@(L����@+;=��@�@.\F?W@0�?���@2�AV?�@4zmf��e@6s	N�ٞ@8�^ uM�@:����@<�]�J!@?c����@@�O[ښ�@B@߯uz�@C���S.@E�ů� @F� ���$@H
&��e@I��]1/@KFXg F@L��5�$�@N�/�m��@PHc3�@Q9P��[o@R1�ı�@S2F��	�@T:gқ�@UJZ����@Vb(H��]@W����R�@X�oȋ�K@Y����@[nܰaw@\O�4�W�@]�V���&@^�Ӎ�q@`0��e3@`�0M@a��ܛ\�@b:ꂒ>�@b��k�c@c�I�z)�@d{�G�$|        ?��I�,�?�)�;jg�?��"a��@������@FH�Prg@$��w��l@.��O��@4������@;%#�?of@AJRx��@Ew����@J��ah@O5u�J$@Rb��4��@Uf��3@X�j��iG@\�33�@_�^,c�k@a�D`�yc@c��Os��@f-�>�M@h~�z��@j����)�@my�T�@pH ��u@qt,=V@r��ja�@td:&ɝ@u�90���@w���L'@y41.-�e@z��J�@|�e��@~}w����@�-��	7�@�#D��@�$	D�@�!ϕ�r�@�+F�G.@�:�qi@�QP�W4@�nS�\�i@���HP]�@��')ԛ@����^�E@�$h)��C@�bs͚�0@����F�@��g͒��@��)hq�@�Np%:�@��	�Pb@���n�J@�g68��@� �:L�@�ݷƝ�@���i�ɕ@�a�,�@�(nݫ\@��|��*@����[tO@������@�dA�i        ?p�f5�~�?�:̍�%?�4�~[_?�Kbk���?�뛝I?����X?�V��}�?���6�k?��ĩ�?�3=�C�@D���q@_e�`@
�3��$�@��U%�@�c�J@��C��@�Zs�<"@J��0`�@�C�r�H@!�fw!��@$��[�@&5j���@(�����@*�,T P@-�Hq��@0�<��@1��<�v@3���[@4�1��M�@6(D��o�@7��4�@9�OY�{;@;]c�N�@=;A��J@?)��E��@@�ڑCr=@A�D��@B�U��ъ@C�&�T�@D��ƛ�@FodF�'@GK�+�D@H���]�@I�g��S�@K'.6��@Lw��pC @MٶDy\�@OD{"�y�@P\n\�d@Qr^���@Q�Az�g(@R���dKc@SpS"��d@T@���O@Up�K@U�����@V̯�N�@W�$B��@X�-L�;U@Y��'��@Zr�C"�@[g	N�e�@\`�9�f1        ?[~Ԑ�6!?�������?�f*^\��?�&�-�?�(l<6?�|<ߑ��?��ݹ�p?�N���:?�@uL׏?��hOW�?��6^IG@%��-C@�)�Z@�����@ú�n��@����,@��y���@���F�8@� <�#@"B蝭�@$Ώz	^P@'��,��@*�j�]@�@-���F�h@0�_�G&@2Qr^S$J@49���
@6>����@8a\б�@:�ːө#@<�q(��m@?zH���@A
NUy;�@Bfۧ�K@C��
�@EN�<wU@F�-$��:@Hu�]��z@J!˰�@K��TvN�@M��� ��@O�.r>L�@P���[	@Q��c<�@R� �jz@S��N
J�@T��=�@V�Zc�@W1�·A@Xc�`�9@Y�����@Zဍ�5@\-��-�@]�q�1� @^��اk�@`$����@`�^�Ev@a��E0�@b[��^��@c!�!��.@c�n��@d�z��@e�NR5&~        ?_�2��?�;u�b�?��p�zb?�x�2W��?ǧJ�8��?�)���)�?߃�����?����?�(�,c?���-��?�h�|@�@���{�@�~�ZW@���EU@����1@�M4��U@f�#)'@Gͼ�S@�i^��@"X����@$�C�,E@@'9֠}�@*玛*�@-*@h�߼@07Pi���@1�`��ʎ@3ɫ<�ű@5����յ@7�R߈�G@9�ZhC��@</�{3�@>�\��_�@@�s-���@A�����@C)��Ÿ[@D��ϼ�}@F{�HSf@G��kƅ@I!��N�@J���g�@Lwͣ�@N8u;��&@P��{�@P�����@Q�]f��@R�]6x�@S�B��5@U�V��A@V>Y/X�@W:�f�3l@Xb����y@Y�G��@Z�!r=[F@\
�Ve6@]R2Y�9@^�m�ze@_��Mq�@`���'�>@aa�(L��@bD��8@b֟�f�b@c���N�D@d[Q�l��        ?�]g�9k�?��!A�J?�{h�ճ@<�7L&@�x�d�)@�fb��[@#���@mH@+9��hb.@2���@7Ov�h��@=5�B8��@A鎙�v�@E���͉@I�[IeV@N
�G�:@Qk#M�d{@T�| [J@Vɱ6[�!@YÏ�i��@\��h�@`'�#��b@a�5p���@c��b���@e���/@g����@j�����@lnw��j�@n�qU��@p�����g@q�����@s]�LR@t����@vB.�nx@w�c�7�@y^m6�'@{_��e@|�V��8@~qr.(]�@�n1!�@�^C�[f@��D�B@��.kݯ�@�!�N�@�vr�@�!)���@�;8��%�@�\�m2��@��Tw��@��T�y�@��m�ɰ@�+���@�p�+n�)@��ж	�7@��<�]=@�6�Չ�@���W��@�����@�U�#���@��'��{@���8��@���+\�@�\̟���@�'�5L�        ?�~1���?���}?�R��=�H?԰е�[�?�I����?�{ر+�?�Ǫ�b�?�p^��v�@�N�?K@�4�]�p@_���|@�M��|�@E�X>�@2��'�@~��YP@ ��IR<@#��6(K@%�M��`@(*Q���@*��@�@-�, ��@0z��x�	@2��`@3�6e�@5���6<I@7`s]jZ9@9H���D�@;C]�s;�@=P�F���@?pm��L@@�O�i/@A󘦘�T@C1��_@DS�_�,o@E�|��͊@F�[����@H(H��C�@I�9���o@J�&�}m@LN	_�Fz@M��I�YI@O>����@Pbm�5Q@Q)<�{�@Q��hz��@Rī�,��@S����@Tq_����@UN(��:�@V/9b��b@W��g�H@W�0��+a@X��alZ@Y�6Q��@Zԓ4�@[�"ܰ'?@\��Q��z@]оX�@^׼�'@_��:K��@`yAa_�@a�Z�r�@a�U=h��        ?i�lu�?��Cǋ"?��j��?�B�f�?�YU�W�?ߓ����`?�ú�*�~?��'����?��:�B�q?�/w�_@O	�L�j@(T��{�@�P�&@�*h~�@_Y�t��@.j����@\��x��@ �����@#p���.s@&<��i@(��(٨�@,ӌ� �@/c�{Т�@1s�ߵ��@3Q�9H�h@5KZ�O#@7a����@9�=�o�@;㾀�0�@>P2&BC@@l�lVO~@A�H�}v@C"e��G�@D�H��$@FÕ�3@G��1L��@I?K��`@J���s�$@L�ϖ�@Nr���-@P&�Ri��@Qt�;�K@RhH��@Sr	=�'@T(�����@U<��0s�@VX踄�A@W}�3�@X�A}�7@YݥYY��@[F��K�@\_88_"�@]���d��@_M�"�@`0G�ζ,@`��~�@a�]w���@bW[�ZS�@c��"p@c�R�6w@d�T'�>�@er����@fDu���z        ?k����w?��L.��?�R��dh�?�u]�"�?�J:F��t?ܽ���B?�j�ň?�������?���3��~?�Q�?�S@��*��@�َk�@�>�>A�@K��nC&@yS|��@3�vJ�@�Zq[fe@!� �h�@$���ƕ�@'��Z�b�@*���N��@.~�mc|@1 w�l�@3"v�U��@5E��'�J@7�/�?�|@9���E�Y@<x�OX�@?#��VTa@@�}�D!@Bp�/���@C�@}5|"@E�����@GB�[�-@I9�/��@J��8a�@L�1�|�@N����V@PW\��&�@Qci��@Rxdd%&@S�K�Y�@T��h��@U��w�&�@W%a4�Ƽ@Xf��_[@Y����@[�1d@\_�I�o@]�qc{"@_1����X@`S��\�@a��կ @a�F{�e�@b��%���@ci�ń�@d9�1,�@e�Kb7`@e�O8q^@f�[��@g��3�2�@h�$���@io�Sz\R        ?��d�V
�?���@ 
��"�j@9T�m�@{���a~@'�_���@1Q��B��@7�PثXK@?��hGY@C���V�@Hi١�u>@M���΋9@Q��܉�@T��\��@X0���@[�!��"@_��@a�y����@c�ƙ��@fB���%@h��ɏrk@k3���o@m�rY*@pO�S�g8@q��k;�k@sB��K[X@t� �@�@vr<'hU�@x |�e��@yݷ��@{�����T@}� ���@o
�4+�@�� R���@����|@��CK� @�������@�� ��f@���~��@�:e3�)�@�j���2h@�����xu@�୘�7�@�&�!z�|@�s��Z>@��ȁ�Y!@�|�B-�@��i��@�w+�'q@�/:>�N�@�����@���~��@�l#�	@�1�4�@��7��|�@���qb5@��ܱk�.@�k9�i@�A�GG @��OկH@��=\�W�@��сd�@����/�        ?u��<��?��j!F"?��`x?\�?˯�N�d|?ش���;?㋵`[�
?�$�:t�?���&?����$t@ ��𞘁@���V��@		ޢ,�@��� T�@��&X�d@�_sN@���K��@�@Q`�@��&k.@!@�-O��@#G�N�V{@%l�ymv�@'�I��@*�v��@,�/Fb��@/,����@0��z��@2a�q�@3�E��9@5h���6@7#͚a@8��)�3�@:e�9�
�@<-��ѕz@>�p:@?����X@@�#Q��@A�?���@B���� @D�܆0p@E$���;�@FDs�X4H@Gk�q@H������@I�O\�@K�G��\@LKm��;@M���-��@N�(��X�@P-��@P�9X$@Q����@R5��ׇW@R�FST�y@S�V�P��@Tl���@U1!<�| @U��\=�@V���=@W��^�w�@Xeac�O@Y:����@Zy���@Z�U�C        ?\{���?���J�Ѡ?���N�*1?�)��t�?ɉ^��SP?��%��{?�?p��D?�s���1D?��G��[V?�8It�c2?��`Z��@\ޓ� �@	����@u6�RUK@!�}7�@�fr\�o@oDo�@���Y@"^�U�j@%%IE��@()�Y��@+l��A�@.�����@1Z�7ĕ@3_��u��@5�.�[�@7�Y��4@:@���N@<�\�.5T@?���Ū@A5Վ�F�@B�NWL��@DN>��ra@E�����@G��PA�@I���d@Km����@Mi#���@Oy>a�fb@P�<�WB@Q�~��0@Sv�O�O@TG3�ߋ@U��&P�@V�-�`��@X ����!@Y~�naމ@Z�x�ä@\\Cѹ6&@]ۑo��d@_e��A\@`}���n@aNq(w�@b#��_�o@b�v����@c����^�@d�O�\.8@e����1@f�����<@g�V�1��@h���9>@i���Ə�@j�o�`�        ?iZh23�;?�<��^K�?���@p�?���fv��?���v��G?�x�w�ͳ?�N��B�V?�����?��Nr���?����d@  �ua��@s7-�x@����@������@�DS�@����@��͢jV@{2W��@ R�<��@"�-��3@$��)��@'�A�)@*O���@-;!���@0)�U_�@1ʣ�=@3�Q+��y@5P1��L!@74Q�Hě@9.�P�q-@;?�.���@=f���	@?�3&�`�@@�%���@B1K�;F�@Cq���@D�o�8�@Fje���@Gv�v |@H�P���5@J]F��E@K�0�@MqC�a_ @OJ����@PYU�C4@Q22{���@R����O@R��=eO�@S�ɞe�@T�N��k�@U�{O#j;@V�NBg�@W��pY?G@X�����@YФ��@Z�
 H @[�dl�@]�DO3�@^85A��@_`K����@`G	���@`���h@a}V�ˊ�        ?�|b�zc?�~��MT�?��N�vͯ@��돉�@��NW��@ �����@(/ļ��8@0�����@5�K7��q@;����k@A]�º��@E ���@I>~P�I@M�wVfG�@QL��&�z@S�1��4(@V�N5�D@Y��sF��@\�9�u�@`.�_�@a�N:z��@cTƧ@e�.k3�'@g����@i�D9�u@l.�pXS@n�Gt�Pz@pz�Iy�$@q��~��@swm�$y@tj�@�@u�l����@wD��w(@x�O�<��@zM�� �@{��6$�@}������@1�Z9�@�t�O��@�V��@�<�LR�@�)H��@����@��]�y�@��*��@�]���@�����#@�!ɦG+)@�2��w�@�I&�_�@�d��1r�@����`1�@���ӓ,R@��wIXI�@��Q=�\@��j�lv@����Z�@�^��(ǃ@��'@��NV�p@�Q?�@���,h @��G���t        ?oND~��;?��]�X��?�a|1�v?�,l,D��?�>��f�5?�1�ӈ�?�}��Y�?�ηҺ�
?���u0�?�[U��:W?��瑿�@V��+>�@6��r/�@t{���@}�Sh�@�w����@4�bÍ@�����@!�Q�@a�!��Z@ �4ԁ�^@"����f@$�~�Q�@&�h���@(����X�@*򽒺�@->3*�_@/�:N"�@1k���J@2Z@�SL@3�ܓ�2�@5��"[@6��vQ�@7�h:�@9���z�t@;,���@<���T�d@>d9�n�@@���@@�Ψ�H@A׺�~4@Bŵc��t@C����׫@D���zF`@E��n��@F�1a@�@G�qD�1@Hػ��t�@I����u@Kj��e�@L3�6��p@M^=��&n@N��@���@O�?l��@P���@Q"9T�fR@QƏ�w�@Rm��~�@SH��)�@Sũ�c^p@Tv�S:�@U)v�Up@U��I�y�        ?U�V���?��:��'?����SE?�ʁ�$&3?�B�$p?�N�3Z�?؜7P/�?�*����?�t����?�MS<�N?��?G<|T?�Y�!�y@8����@kY
�2@(��X@9�Kٲ�@(}�'9@bX�>��@�Ιh�@�E&�l�@ �{"�i�@#*x��+ @%�P|X@(��*��@*͕�x�@-� �W�B@0ZA�˷@1�p���@3�����@5d�����@7=9K�@9*vK�z@;+ݥ�^�@=B?��6@?m�P��@@�&�!h@A�ߠ�@C3�פh@Dq�W�i@E�d�C8�@GN�W�@HgD(Iו@I�M�M�@K=tWY4Y@L��b	F@N<Dhss@O����@P����a@Q�û?:@RZ��e,�@S6�`�p�@TY���@T�%'u�@U�L�k�@V��q]�@W��X�;�@X�;��M@Y�!~cr�@Zوhn@[�t���@\���9l@^�/��@_.��8Ph        ?b�77l��?�PYy�?�$�����?�.��p��?ǳjz�V?��w�k2�?�S	Ýͷ?��<�?�1�ƍ�;?��f��?��ڊ,Gg@ ]8�g8@;��*w@�:�U��@x���@o: cu@f����7@��|Z�o@(`�^I�@���@!�X�`<�@#�\ķ@&^�X��@(�ܨ���@+0L�!�u@-�!d��@0w�7G�@2��?�@3����^'@5^�V�m@7)�^�Ջ@9	y�_��@:���P@=��j�@?&c��4�@@���@AюN���@C ��z�@D:Kϐ��@E~�`�Ɏ@F͌K��@H'*7��t@I�y�_�)@J����H�@LtP��C�@M��65�@O�eb�ʪ@P�d�]<@QdK�sU@R<J���@S�-�@S�y��#@T�ީ�.@U�S5V@V��&���@W�D	�r@Xċ/��@Y��X�@Z����4@[�X�6��@]����@^ t��D�@_ET伯        ?��_ @1E?ӿ����?�kv�AK�@ �{X� �@%�R4��@O�&��@!�v���@(�H�V@09�0��@4�q���@9�lr.�l@?��ɟ@B� �b��@FU�7:��@J���A@N!)�@Q,�>�D;@Sx�6�yM@U�zMe!@X�FF�{@[@��d
@^$��e@`��׍�@b/㽄�@c����@e��� �@gh�xP��@iL���|@kC�È@mM�R�@ojp�G��@p����@q������@s��@tK~��G@u��1�.@vͿM��e@x�����@yt����@zս`�L@|@�9�	@}��6�q@0F]@�[�%�@�"�{j�Q@���C�@����Fȷ@���*�t�@�n����@�MJO��@�0g'�+@� 9n��@�x��Yt@��s/6x%@���ty@��Ss��@��<�S��@���%Yݢ@��'��@�����2m@�E<e+@��l�0�Y@��%4�        ?��.�P,�?�С���?�O�,�d?�Fq��?�޵���.?�O�� [?��0ꩄM?��8s���@ ��U{��@�<B�;�@
�0lln�@/T��p@MI �uF@����X@]E6U�@NĈ��@!Cc8��@#��@?6@%�(ř?k@(ku�@+�;�@-���O�@0l��k�@1�fa���@3���K@5K$(��[@7.��,�@8�L ��@:Ҥ�k�@<��\��s@>��n�X@@�	�>Bq@A�>�+�@B�u��Ϝ@CꞀ�^�@E�PGkx@F]��K�@G�i��@H�d�H�@JKBK@K���H6"@Mj?���@N���q6@O�����@P�2���G@Q��t�ȝ@RMȋx�@S��~"�@S�?��lj@T�ݓm�i@U�]�O��@Vt���	�@WT�lo��@X8�ָ�@Y � �E;@Z;�G d@Z��w��d@[�y��@\叐2��@]�6�幣@^ޡg9��@_��ɨ�@`sV��"         ?mt ��Ha?�p��&R�?����?�چp��-?�'34P?ݐL�� ?�@�C=\?僧���L?��X��*?�n���+@;�ͬ%n@�wN#��@&���w�@c��4^@`p�a9�@ '4M@�;���@ D4F=y]@"���A�7@%D��]�d@(��op�@+�`��@.I�͕7X@0ۃ�g3�@2����J�@4��o�2�@6�e�}�@8�hV.G@;G�S�c@=rH��@@?��Q@AFH�a��@B�R ]@D���q�@E�S����@G�F#�@H��eE@JR#�k��@L�O��%@M̎���u@O��ߐu�@P��i2&�@Q��ݯ�@R���Զ@S�lv�f?@T�~%�xn@U�Ѣ_�@V�g�I�@X#B��B�@YNj��@Z���T��@[�Öa#�@\�M%!M@^D�g�~�@_�R-���@`v�����@a&���[C@a�U�c�@b��E��	@cMx�U��@d�ͅkg@d���m�@e�1��        ?t,S��X?�?���<�?�#9�)�T?�<��1W�?�;����?��(i��?�Pb7;n?��ؖ0V?������
@ �؜�F4@[�5�@
���-@N��6�@�:'��@c�����@�.��@ >��I�@"x_�.BA@%$oV�@@(�rו@+$*���@.z�����@1H�e�e@2헎y@4���&ǔ@7E'R*@9^��(�@;��G�Ӻ@>I�Sܞ�@@x0�5OX@A�1��@CP�����@D��X�h@Fk�����@H�)���@Iʕ�1��@K�mG��@MmN���@OXHQ��j@P�6K*p@Q��)b�@R�G�L�@S�`�o�m@T�AEG�@V"�Ж�@WU���-�@X��&��@YՄ���;@[#�5w@\y���,$@]�9h�S�@_B�ف�@`Z�S�c@a���*@a�˃��}@b�����N@cl�� @d<	z�[@e�f3��@e�
�ʶ�@f��+q�@g���z~@h�[��HO        ?���S��!?蛱dlb@�µ�@�ah7�4@ ��4��@)���7�D@2}(�n�Q@9- ��%�@@s���@DՉ��$g@I�hq�U�@O$��d)@R���g��@U��o@$@Y8����P@\񜋈X�@`u��;~@b�kՑ�/@dϼ��Jb@g-�"Lc�@i����њ@lO�����@o��u�.@p�u�K�@r�L�av�@tv��L�@u��w��+@wx��A|�@yB�Gt�@{��WS@}
��BJ�@��ĥ�@���Q��@��>d)@��Ŗ)�@��w�P��@��F�a�0@�)%S�F�@�avT�`@�����g@��~��"|@�7�DF�$@���@���z���@�T2Ziat@�`�D� �@�m���r@�ـ���7@�� Pw�@�`B��i_@�(ߺQ��@���ݚU�@��p�8v@��YaT��@�m��_~�@�GcJ���@�$�E�@����@���/��@��W��Ԗ@��Ƕ�|@��8�ȓ�@����:��        ?s����?����?���.V�r?���"]�:?��}L�J�?���g�~	?봒�ur�?���+�1?�@z����@ %M��F@��r�@���Tx@o�<$9@d��&�@N�N�A@u�f|_�@�L��B@|o/j!@!.��r@#>��@%l�X,�@'�.�-�D@*(����@,�G	�\A@/cQ�!�@1Vd�@2���f0@49�&@5� ��@7Sk� �@94^ؐ�@:ӏ�X@<��~�M�@>�G��J@@Hb��@AN

�@B\[q�r@Cr�U�q�@D��}�B�@E���_k�@F���� @H!�)[@Ia���v@J�ɿ!��@K�J�6=�@MV/=�`b@N�q���5@P�W�=�@P��{Q��@Q���S�F@RJF�Մ#@S���\@S����@T���=X@Uy�@�M@VO�l/��@W*vTY�@X/=ob�@X�a�R�@YФb�7�@Z��w��@[�i3p�n@\��,�:        ?k_�x�#�?�$R�m��?�)78"?�:�[��?ҥޒFگ?ތ�����?�S�~J�?�y�|�s??���?��W���@씱��@�W)ΰ@jp#O@��i�]]@H��n@s�<@W����@ �E&Fs@#|ݮ�@&2s��r @)��'*�@,B0���@/��x1�e@1�e��@3���:�@5�h�Z=a@7���VB�@9��9��o@<L����0@>�O�s�@@��K]�@BN/�g@C��f�@E�S<�@F��F2T�@H0��7�7@I�u�}tu@K��t!�@Ml�t�H@OJ�k˧�@P�hJL~@Q�L�q�@R�p�@S���T�@T�&�XHQ@U倉�S�@W�|1�@X9�"(@Yo�2Vo�@Z�ͮΞ@[�Χ=j@]As��^@^�0%GL<@_��_�,@`�@s�j�@ad	�dc�@b˝��~@b݆�t@c�:��@�@df���@e1�[��@f N^��@f���v]        ?g�U�:�?�������?�1��O��?�Z����?�j4�{�?�lA.��?�	0O��j?�W���?��,Fړ�?��m�m��@��޴@���6U@�@Hm@⍝�x@6��H%@�Zn�M�@��b�w@ 1�e9��@"��j�a@%6�z��@(�A2��@+	Xg� @.B+.��@0؄��@2�_��9>@4�̬2@6�,:W�@8����@;�s��$@=tƺ��@?�R`�w@AIe'��@B��<މb@D�5�@E�Naa(�@G ����@H��t�Z@Jj���L@L'�p���@M�{;���@O�h\�$�@P�#�p-p@Q݆�0y@R����@S���UT@U5�Jt@V%�: ��@WK�_��^@Xx��d
@Y���A�@Z��6@\/�ҷ�k@]{ˎ��?@^��C���@`�J���@`�n܄�@a|�RyB @b6j�4v@b�Q�\�@c������@dz	.Zy)@eCH�)�@f����        ?���n���?ހO<�ʻ?�{����=@	��Ů M@�r�0@"6��]�@*��9�@@2lMՍL�@8aC��ߓ@?6EƍJ@Cv�Y<@Gč�%��@L��sx�@P�$���{@S�uv8�~@VƇ��b@Z�h�~�@]��@;@`����@b�z���@d���(�@g��d��@it��@�@k���@n�O��mC@p��"�<�@r�$�O�@s�͡���@u��z&�@v�mu��@x_���L]@zv�7H@{��֛9�@}�n-��@�O2��@���{4&@�ڼ�s��@��l.~@���aWv�@����Q�@�Bj K`@�p8�
@��褮FC@��p�lp�@�(����@�uҾ��@�ʒj	��@�&�r�G�@�Ew���@��:���B@����逄@�q���u�@�2����@��}�@�s@���c���@�����u@�[Ic�[@�.$R�B3@���@��)�8��@����Z�@�����f@����vB�        ?f������?�	�x_�-?�^��ǽU?��&v��F?��A� E�?�/�4*�?�+D2%m�?��,G��?��1����?��+�?�ʭ�C��?��6�@\'3�@�۴�@
pCr�3D@����	�@�b���@��J��^@g� FX@�F�9�@���3�@�a��S@ �?�� @"����kV@$O �|?@&��N@'���q1;@)�kFrQ@+�ipw�@-���X!e@0��8Ԓ@1/Da�@2W�p��@3� F}ҁ@4�|ٛ�u@6j쫚@7]��P�@8��ۮ�N@:T�Q�y@;����@=?��/�@>�߹4Uq@@ ����@@��]�x]@A� KQ�@B�{�3>R@CaOmNY6@DC~�lQ�@E+
X��\@F�w@G
;L �@H��@H�����I@JL��D�@K	���@L0���w@M(�a�"�@N@�Y��@O]�T��s@P@���@P�Y�@Qj�e� �@Rʕ�l�        ?Q.-l��?�ǞO�?�;���&?�m�����?�0�x�q�?�
�o�R?�5�R�>?�{c�9��?�G'P�?�m�:W?��K'�C?��1���@ ����~@��3��Q@	
*����@��}o�!@�O��n@�N�I��@�����@����@gG�y�@!ƭ%�v@#�ܛ��@&_���@(�~�zkA@+��ܚ @.j��D��@0��sb<F@2HXW�/;@3�z��<s@5�UU��8@7{R�@9e���(@;a��?�5@=s{����@?��2��@@�`3�@B/8^"�@CI�`��@D�cI>��@E�U����@G*��I��@H�V���@I���;4D@KrT?���@L���К@N��!-� @PN����@P�j��@Q��L!?{@R�"F��D@S�kqci<@Tn�ڮ
�@U_kAM+@VVu�F@WR�K�<�@XT���@Y\��~��@Zj�XԻ
@[~QR�u�@\��މKY@]�����)@^۵�]�?        ?Vz	 �oi?�dbr��?��yK���?�<=�5�{?��	�`�?Ό}�i��?�!ehPC?���?����@��?�Ͻ<9|?�����$?�%G�b�@�[hx)�@�	���*@
,M5�`K@B ���@tv3��@����@��3l[�@���#��@ ``x���@"�X�*�_@$��>Je@'g�"S�@*ݲ��@,�N51�@/�y�M@1�8:�@3A�o3�,@5u\Q�@6�10��@8�A��N@:�у}�v@=`��^@?H����@@��X@B�>\��@CE����@D���Q@E�0�3�x@GT�*�[a@H�
��[7@JE��v�@KЎ����@Mg����@O
��`��@P] N��a@Q:��B�@R���@S\��K@S�LI m@T�QϽ_@U�nؑS;@V쩗/Z�@W���V@Y��A@_@ZF0��z@[38���U@\Tm�w�@]{�J�p�@^��1��@_��u�@`�1�b        ?�g+�/-X?��`�j�?��_�U#?�����@m����@��t.@���Դ)@"�Sm࿯@(�vGp��@/�9�l@3�ttp@8rFh`y�@=gXA��Q@Ai�[�@DZ�	k�}@G�4H�@J�su1�8@N����`<@Q(��3S8@S,�3ӚU@UL��h��@W��+z�@Y�虓�&@\U,�X�@^�a��@`���J��@b-l�pů@c�%s|�v@e!=��Pk@f��ʃ
�@hO���@i�Ly-.@k��zp	@m��:�,�@o]�*3@p�A|�@q���z�@r�Q,Y@s�:g}�D@t�X0��c@u�o�R02@w�澂�@x0�O�@yd�ɧ�c@z�]? �@{��|
�\@}2�Z�s.@~���q�	@����@��)���@�[��'��@��I���@����ޛ@���z�@�`cY��9@�+ʮ��v@��Q�)�@���M��@����k��@���x�5p@�b�
���@�F�w�[�@�.�����        ?���Ml�?�+����?�C�*�?�_��M?��Bd�}?�S1�UG?���L�@�Iv���@8��m@�d��]*@�ŨdB@�x~U2M@��a�w~@"��]ɪ^@%vu iD@(�ǁ��@,��&z@/�����l@1��a��@3�FܶE@5�W_��3@8���@:n��f�@<�T ��@?r���}@AG��
@Bs8�ۓ#@C�����@Ed�>��6@F��R@H�g����@J8vm�@K�{'&�@M��h�@O��9�7�@P�H-�@Q���Le1@R��L�W@S��زP�@T�5��@Uә�c@V�.�bB@X�>2 c@Y<o��@ZmJ�،@[��/N�@\�Z�@^,��i�l@_{ؖi@`hJ�Hz@a��"X@aȳ��@b~J�Uv@c7r���"@c�(���@d�i����@ex3�gk~@f?��d��@g
\�{��@gغ9�c"@h��E�P@i� ��2@jX��rU        ?z����?���]� �?���3b?�]��`�?�k&5ر?�0ŉ�e?�����?���c�H�@ Ų���@��|���@�Öc)@1(��@�u�&�@0{"��X@�)h�y\@!|���8@$G�Ȇ@'LZ��]@*�Rܮ@.�0��@0�XX��@2ױ�7�@4�_�9�@7 ��iN@9p��Q@;݈��T@>gL�0�@@���
� @A�*�8�@CY�@D��ƪ �@Fe����@H�6�@I��v��/@KhB�| �@M2>�r��@O���@PzOr��b@Qv��c�@Rz��z@S����M@T�y-mp�@U�|@V�w�u�q@X��l�
@Y7;Jmt@Zqi�Td�@[���oyv@\�����c@^K�|�N@@_�����@`�F�a7@a2��s�@a�g�H�@b��ol�=@c]�:Rea@d�`H�@d��7a�[@e��R�ڀ@fpf���@g<�'�@h��CY�@h�I��k�        ?=AУ�f?��%�79P?�����&?ѩ�5]�?�z�A3ҙ?�5-0S�?�ƅ���?���^��F@i�6y�@�I?�9g@��V�W�@�5���@�n� <@í�݀@qt߀VN@!ȡ���@$��]���@'�H�z��@*�K=�\@.Y��"�@1�rN~@3
��@5)T�$�@7hiS���@9�+F�m@<H���_q@>��n_�@@@�0�D�z@BG�~K��@C�mx+�@E]���(�@GY|��@H��V29@J{<�$�A@LQ^m|@N8WDUB+@Po�@Q����}@R)p��@S>�iuZ�@T]W�P�@U���!��@V�<��,�@W�h�쓸@Y,T��A�@Zv��-@[�|��ك@]#�)�)@^��6IX�@_��x@`��Y��@atU�Q�@b7mh$�@b��Ҥ@c����P@d�E(@eoZ ���@fG��z(<@g$[��@h	$��@h��w�F @iҳ`Qq@j��N�w        ?��g�F�3?�3���1)@�)���@!=�J�@-�� � 1@6��F�@@=4U���@E���b͇@L�$�N�7@Q���q�@V$N�H@Z���T1@_��u�j�@b�B����@e}Qu��@h�CO��@k��g��`@o�*��s;@q�d��0�@s�Q���2@u���z_�@w�{���@z2�g��@|���TCc@�� j@�����D@�3ʀt�@��%�p~@�A)���@��N`P}�@�G�$E�@��)p�N�@�_���@����H7@��Y��з@�R�2�+@�@e*ni$@�4ԛ4��@�/�ާ��@�1�� <�@�9�N�}@�H�2]�@�^���C�@�{}?i@��3-ut�@��"^���@���C],@�00���@�nG�e��@��oe�b@�;�ّP@�(A,�@�Ԓ�YPD@��,ج)&@�7�mLS@��3�[_@����Ib�@�cO:��@�#D�$G�@����$y@���`��,@�v��OK@�C��>r        ?vn����?���ⓗX?�����ȩ?��v��8?ۮ̽mt?��e���?�fBy3?�O���?�BQG�]�@�%�8�@\�VP�@�j�[�b@$&�t`@J�w>��@����	�@tt-Bc)@y p �@!�g��@$2+W��@&��ʡ�@)@1��@, �/М�@.��8e@0��@��@2�9J5�@4F�9�ά@6
~(�@7���hj�@9�%&���@;��)�	@=䬓���@@��B �@A'P�X��@BQ�TCy@C�YcSN@Dž�5M�@F̠��Q@Gd�
Ҙ�@H�'�=a�@J.����@K���[�@M$�3�@N�t�}"@P#�B�*T@P�=I@Q�'/R�@R����7@@S��3���@Tt$y9>�@Ub�cK#@VV�T4�@WQG���@XQ�2��@YXf�؃@ZeP���@[x�����@\�(0a.@]�%�+��@^؋�P�@`�cļ@`�P�W@a9.2��@a�Hݫp+        ?bu9�O�R?��m�.?�̭B�[~?�.���?�~Ib��?ْ
����?�oMM��?쌟Jڜ?�	CJ�?�Vĉ�S�@Q*Jm;@�	LK��@
�v�şP@Jg<Y��@�T��q@0�qDT@.��b�@���@"'�)�.@$��HV@'���$�g@*z���@-���t/R@0�F燖�@2U�O2�@4>��U�@6D�ӆ�@8g�_]�@:��<�@=/��R@?}_�T��@A
���vo@Be�9��L@C��e�Ѕ@EI^)2�j@F�FwQO@Hj����@J�~���@K���Q@M�8�!�h@Ok�+-�@P�4�4i@Q��eC~�@R����@S�f=��@T�X1۟@U��,ӊ�@W�ۃb�@XDz��i�@Y|�m�[G@Z���K�e@\59���@]Yw���@^�os��@`�X��@`�I[g�@a|�Q�@b;ٰT#�@b�1.�:@c�煙	@d��6�C@ecn�B,�@f8?Isɩ        ?_Iv��Sx?���v�"?������?�r�x�� ?ǜ5�҈�?�&Z��b?ߑqX\��?�91����?�I�/�?����h��?�� Q5r�@g!"q�@
��.�@E�X@��$�@d/|.�'@	g��Pi@�O{��@ 2��lX@"��G��@%�� i�@'��ќ9�@*�1%�9@-�:��F�@0�av��]@2B�w��@4`��"�@5��u�2.@7��+h�l@:�ޠd�@<;]�F�@>~�e
7�@@lXCUAg@A�Ѩ3�G@B�ܢu�@D8�5Q�@E���{t@F�
�Q�@HjŽY� @I��^���@Kp�b(}@M��Z��@N�����@P'�Ͷo@Qn��P@Q��ӂ9q@R����@S���Ⱦ@T���V!@U���&][@V�� B�@W��B}r@X����B@Y��E��@Z�Cr�b�@[�)K�@]\�2(@^I(5��.@_z�NH@`YI% ~H@`����B@a�]3�h�@bAwa���        ?��J6J��?��3���?���b��@	
E�`"�@d٨�v@!�7��@)�8��L@1��*���@7�p��@>>�D�@B����@G-"[@K�!�<@PY\G�G�@SD�?E@V~��S�@YT���>�@\��k-m@`?0��W@b7dDq�)@dN^��"@f�\��@hٟ�C+�@kNq��bE@m�T���@pK�Gm@q�{��i7@s1P�[	�@t��ٍ[d@vX4=��D@xsa�@y�Y-n��@{������@}mj��/G@\�eɐZ@����gŴ@��G���s@�Ȝ܄Q@�☷�j}@�M
x��@�0�BB�B@�e,G@�>@���N'��@���;9
 @�8b���@��e��@���A�XK@�]�K�@�i5nQ�{@�(��`w@������G@��A��6^@����\��@�S�!I1W@�+3]��6@��e/,�@������@�ϳ__F�@��uF�g�@��\�,� @��k#s��@���gp�w@���z�(        ?~]�Z!�?�%^��L.?�n����?�~�|���?���[��?�<ô�j�?���?�����5?����z�@2��}ڳ@	S�u�9@��ɝ�@;%0�]�@{����?@�o"��@�Wy�b@ o-m"�@"�Qa=�@$�����g@'Xl��Y@)�@��5@,��$�<A@/t����7@16-Oq��@2�Ƈ�M�@4`����@6����@7�+�{�@9�
P)@;z_7�c@=jS��!@?j��T@@�;�XP�@A�sƚ�@B�0� �4@Dy8�K�@E6Qm���@Fi���2@G�Ɩ�T�@H�v��'@J7����@K�WJ)@L��l
@NU2�@O�.�~p�@P�2Nf��@Qa��x�@R(?j��}@R�@�@S��>�q@T�\@Up��8{@VNsRO
@W1#�v��@X���40@Y� �m�@Y��F"��@Z�)�j�D@[�dk���@\�G3�V�@]�����q@^��Y��@_����Fz        ?e����`�?��Z��pU?����0+�?��ծ�e?�}��In�?�'���VP?�Y����?��@vு?����%?�x�Tf@�OU^�@���~F�@
��L�s,@U��Ga@���2�@F���/@O�IO�e@�$Ŏ��@"H>܍�@$�& ��@'�bP�u9@*�	m�|6@.*��/@0����M�@2�o��@4� ��P�@6�Wfw6U@8�e\<g�@;%�����@=�T�I@@�6�u�@AfZ�]*@Bː5��@D@6tv@E�W:���@GXx��@H�H���w@J�B�&@Lq]3��@NC�pg��@P]���@Q����@R�\��J@S")-F@T+ޘ4��@UG-�W	@Vk&�?��@W��Y�@X�jY�,@Z�_a@[S2���;@\��B�@]��RK�R@__(�E"�@`eB{�|u@av�Y�@a�2��?�@b�u�|��@ci>�jP@d5����@eOM܃j@eۊ���@f�5�        ?kl�-��!?�Q{�>��?��t)�?��wPa�*?з���X�?ۮ�̈́:<?�Z�`{?�ZX��iv?��ȹ��?���r�?�@�l���@��e�R@���ǣ�@�fX���@H �10]@>k��@$��EFn@ T\�ғ@"����em@%t7{~G�@(S� ��@+j��Ħ@.�D�	�i@1#ei�@2�␭��@4�5�9��@7s�s��@9E�L$@;���j<@>
�� _@@L��(	�@A�{��M�@C	�h@D�{�}@F0.V�	@G��4�e`@I@,�[@J���3J@L�@p���@N�4�>�@P=��O�v@Q9���@R?��U�@SL�q��4@Tc��@U�#����@V���?�d@Wݒ:�@Y����0@Z]"om�@[��Z��$@]]�5%r@^c�%��@_�{<?k�@`��T�wk@aaG��@b%�7���@b����@c��;��@d���]�g@ejǞp��@fI O}��@g,�3��        ?���'�B�?��j���?�U�k�@@N*d�>@��['|@%U�P@.�)7�� @5���@;���z�@A��4�	Y@E��G@J�mϣ�@O�<� =@R��U/�G@U͢G� D@Ym&�m}@\�����4@`3jl�7@b3N�]@dP�Z�a@f���v\{@h�9rp'M@kV���.@m��<W@pKn1�o@q���E�5@s$��)��@t���ԋ�@v6��3@w�nW"�@y�Tӏa@{=��&1@}��f�a@~�9-wb@�c���T�@�^�m^�C@�a=���K@�k� ��@�|K��M@������*@��&^��G@���w���@�B�O�L@�C`/yS@��U�;)�@��=i���@�.uՐ�@�o=��@�g=�糂@������@���S��@���FA@�@�O>�
T+@��Ӛ�@��IX	�4@��!n~
@�y֐�f@�N�}g�@�'�� �@���@��V[Y�@�ʗ�_G@��~L�'�        ?c�Ğz �?��p'��^?��� "jv?������?�s�2m��?ԍ�����?�{��X��?�D��(\?�\�J�?�D�}�*?��Nd�x?�/:�Z@ �3J�5�@�mJ@p��v-@"P@4�@7��@���H�@�U�#5@U��-@ݓ�%�n@�Zb��@U�t2@ ��tQ��@")yH��@#����1 @%j<}���@'"�g���@(�[*�@*���z�'@,�#}&�@.��l�sM@0U�&#r@1`Ц���@2s����@3���a@4�اԿ@5���#��@7	B��K@8@���@9#Qs�i@:Ĉ�bA!@<�^��@=c�KK�V@>�h�"`�@@�QzTR@@�"dd�G@Ax�@���@B2{��2@B�~���@C��Aq��@DsE��@E:��@F$��>l@Fт���F@G�)��ى@Hv��ٶ@IM@���@J'�H$e@K7��@K�����@L��6 �]@M���'�        ?RH����?��R��6?�Q����?����og?�`'�p��?��}}��?ױ%��(?ᆙ"�i?�1*�A�?�$$�g?��U��^?��q�@�]�Q�@�CmxG�@
6�B3@S���q4@�/'�LV@�,�"@Ucws�@�t��?d@ d򩸢.@"��g���@$�r����@'_�e �@*��	@,�e����@/ш.��@1|Kz��@3%<ɠ{=@4䭰�@6��k�~�@8�5�@:������@<�du�m@>�Z�Cm�@@�g�#�l@A���T�8@Cv E|@DU�V8�@E��9]@GU�wň@Hxg���@I�ݬwȃ@Kw� %e�@M
W�䏇@N��f��Q@P*�Uʊ�@Q%��@Q���>@R�S�?��@S�*���\@T��|>��@U�t��k�@V�����@W���/E�@XԥVI�@Y��V<�@[	��'��@\.>��1B@]Yb{�D@^�0\E� @_í�E`�@`�o?j]�        ?TSbV�S6?��]��=?�c��n³?��n�D?��t#?�����Yr?�B8�r�?ߗ����?�W����?�c��U��?��9��?��.�:a@ (�O�a�@�{G��@5>�!`@�,�� �@(�mr��@�2=�@Q��O�+@�E��@�$�� :@!a���D@#�9�QQ@%�A��?^@(*�@�@+0q{�l�@.���f�@0�gן��@2 Y��q�@3�Ȑ�@5��R��e@7i�׀� @9Xʷ ��@;]� ��@=yc��P@?�Y:{I@@��l�s@B)��S�@Cd��|��@D����E"@E�2먂@G\sݏ��@HƔ�M[@J<�"���@K���m@MM96�d@N��A��@PGq
�@Q!0E�@R7���%@R��V�@S�S.��>@T�~z^@U� �O��@V�G�p�@W����.�@X�I�f�o@Y�<-�<l@[�7���@\%7*c@]MT$��@^|>:�/�@_��8�"�        ?� J\��?�	�9�F�?�G ���?�E�M�I�@�Е��D@�]-j�@g���v�@ V{��B@%���C`@,c�T�T@1�:���-@5�d{:��@9���_d@>Ѩ�Im�@B	��4d3@D���k�@G��^bC@K6V<�@N�Lo/�@Q2${П�@S%�it,@U4$sZ�@W\�Q���@Y����@[��_�@^pl���@`s4���@a�ZwR�@c2�	���@d���o�@f��;ʮ@g��v:r@i*��[�@j���`�@ll� �w�@n�ߣ�@oܢ����@pҤ�$�@q�o��:@r���P��@s�-�.g@t�L�j�@u��)E+@v�B�2$�@w�����@x��lV��@y�0���n@z�{ �:@{���y�b@} �T�7@~GR�D-�@s����C@�R��2%L@�����L@��z:���@�+�[��d@��s?��@�s�s�3@�F(HnH@��Rc��@�q�����@� ��r��@��ɟ�}        ?~cg"�p�?���,?�B��L ?�fV/�D}?�:�� �C?�o�+&�?�h�!ؗu?�.�I���@ ���]@�?�_�g@	�8r��@}Q�O@Œ����@-y�s@�X��@p�h[@ B�x@"�����@%<����@'�ˁ�v�@*>nZm'@,��K�P�@/��E��@1^�Z�u�@2�: UV|@4�LeS�@66$No%@7���>�@9�	�ͳ�@;��I@=���\S�@?��Ǹ@@����s�@A�(Z�@B�l�`�8@D ���S@EIԳ �}@F{ʠ���@G��s[2@H� HtgQ@JByT�^y@K��A�(�@L�y���@NRuף�@O�ϊ�5�@P��#��@QU5�W�@R�ާrV@R��&+S@S�z�]��@Tr���@UD0�o�@V|�u�@V���e�@W������@X�7 ��{@Y�i���@Z����@[l�lCe�@\]����@]S'ᴘ@^L����@_I2�]6�        ?k�)�*�?������h?��PVn�?ù8fF�G?����K�?݋�At?�9h�,}?�'"�N?�r�W�N?�,�d��@�}h�@�ە��A@�<�@��@�ق@�Q�I @r�����@Y/���@�*
F�'@"��K8@$��o�+@'Sz�{�@*8�l�P@-QD����@0N��7 2@2�"��s@3��m�@5�u�Am�@7�V�b'-@: ���t�@<j;�2-�@>ϯ�k�@@���*<�@A���[��@CUD�m��@D�/�-Jq@F;�,��@G��*FG�@I]k�mn@KT=d�?@L�ːD˞@N��n�@P+;���@Q�vih�@RBp�@S�xB�0@T%�xn�@U8L9S�_@VSD��G�@Wvue�	�@X��#]UL@Yա�~�1@[�l�o�@\V��i@]���<�@^��߫�@`*�d|�@`�`u���@a�]J�ll@bO}b9L�@c�T�@c�V���@d�{��_@ed�x�sc        ?k8ۉ�~�?��B}��?�f��#V?��$��?ί4u~�h?�0�Wj�?�lurO�?�^�nz?������?��#�*��@ �3��@@4����c@���(mO@_u��<4@5m3nE@��>�c@D1�m@R/҆�w@ ކʪ��@#C����@%�J�"@(�㿘E@+�tY��@.�;�S�@1̞�U@2�c�`@4˗c@6�b;0��@8�?�՘�@;+;CX�@=�h���@?�?��l�@AF�g�Z�@B��(sv@D��n@E{�Fu&�@G ݸ�A�@H��-��@J8��.�@K�]M@M������@O���q�@P������@Q���Ł�@R�a���@S�@��P@T�>�T��@U�l5P	T@V�ۗx�@X(���@YZ̑eב@Z�uu��@[ج��;�@]$�D�c%@^yL��@_�P���@`�1&s@aU��1f�@b��Q�@b�僉x�@c���J��@d`�3�@e-�U��        ?��"�;r?�"U��?�+C�k�@-�k@X�gSvT@%c��}K@.�����@5���R�@;�q/J-@A~P�6@E��d"��@J)�nY"@O!�ޡJz@RC堰�@U+��g�@XHut���@[�Q�<��@_#����m@ap��2@@cj/H�x]@e~u�ȵ�@g�m5�w@i�p��@l[1銎�@n�טist@p�q��L�@r ��\�@sy*e@t��4؋i@vnǄ��@w��l9��@y��!�M@{?i�YI@|�x�Q@~�dؒU{@�A�8�^@�/���@�"���
�@��ӫkz@�ʸt1�@�#9[a��@�/?�@�B� ��@�\?��@�{�fr�@���k�x@��@�F�"@� ��C@�9�.���@�yO�޴h@�_v��Y@�hE��@��}�:�@�Z��Gީ@�
	F�~@������n@�rd�m�@�+J�)A@��_
�B@@����P��@�i�A(@�.�K0�@���)�
        ?�����F�?� *��?���#q�?�]?��*?������?�Qr�,�s@ �QF��@��>@�'�$�@\_\n�@��H���@����26@ ��Ͷ��@#wgM���@&�Đ��4@*�����@-�J�>@0���*�@2�8&Z@5!��*�@7uuI�H�@9���{�m@<~
P��@?2b֙�K@Ag��d�@B}�mf�f@D�p7l�@E�j�5�@GL�*zD�@I�1o�@JҒ�-ɪ@L��A�a@N��/�E�@PJ=@H��@QP" �@R^K�d5@St%���@T�A��0�@U�f�F@V�(@0m@X�����@YZ��*�@Z�9���@[��r��@]E�#�=�@^�m��@`{�V��@`��.,�b@ax^|I@b7k��,@b��ʪ�5@c�"7��2@d���K�@e\�.��@f0o���@g�����@g�e�s@h�;'ϣ@i��f��z@j�ɜO@kz�t`�>@lj�:QG@m^}�S�        ?p����8'?��2�n�?�� ��83?�ov���^?�WW0�n?�-�?�-OB`,?�E�4-?����f�@>"-@&��y@�����@����ߵ@v[����@���	.Z@Te��|@!�P�m�@$FL�A�$@'9��ɪ@*i�l�UC@-�5��@0���o@2�M�S�Y@4�3;d�@7�~6��@9[?��@;�6�J��@>n�����@@��V���@B�-�s�@C���GQ@E���g"@F�3[�Q@Hts:�@J<�_ߺ�@L�Ɓja@N�y�S8@P 8)=@Q4z�@R>~u�@S3`�l��@TV�.�i7@U�!�*�#@V�ܖv!�@W��&�xA@Y@W^��@Z�5<r�@[��@]Rj�h�@^���?p=@`gv~`@`�4�7\�@a�����@bmT���@c<�<�>�@d��X��@d�-(ư@e�M�^��@f�^�J*�@g�`�Pi\@h�R@h�o@ir1�`$}@jh��lrl        ?~|���'-?��1��#�?�/M�PD?�e��Z2p?�-��"l?��!Tn�-?�w`�b�?��h3�{@h�:yKL@�<�/T�@��J�W@�T�C}�@�A��l'@6A���L@~x�@":�(��@%*�]�j@(Zm��D�@+�d�g�@/�JF�-@1�<�U@3�.Q@6'���.@8���n%@; 2C!�@=��/��@@W�����@Aؖ9��@Cl�P�B�@E*Z�3@F�S����@H�8M"�q@J������@Lw�s��/@N���[ZG@PP��{dl@Qj����@R������@S���mC�@T����J�@V:=�B�@W�!E��7@X�&-@ZC�s���@[�`��F[@])�N��:@^��^�@`(;@`�v�?>e@a�Ag,ۨ@b���>�[@cot��Wa@dQ�?��@e:-��$@f'�9�y�@gJ��@h+�]��@i�j^W!@jqQ��@k!�\���@l1��_,@mHyM*3@nd�ku�        ?�_�kW?��  T�@$d���@���'��@*���.�@4�]8RX@>w�~5�@D��%�6@J��>@QI�2@U7w3�@Y�3ԟ@^ɮm~@b �Z�m@ep�	F@hH��t@k���̘w@oW4���@q���"�@s�ˏ�mD@u��*Iy@xp�s$@zzVl��7@|���@�@���Y�k@�+��US�@��tyHR�@�+� ��@�����~{@�7�sY@��n��@���۸��@�\�3��0@�1	�0�F@�
$���@��G!�@�l��w@�
�@,L[@��F6��@�/��l@�M	0���@�qo���H@��N��&@��һ�8�@�	��<
@�K��@��f �6x@���Z��@��7��@�ˮQ@�~"��@�4(��:@����.�@���O�'J@�k����@�0�j��@�����@�ôs9�@����|�@�e���@�<a1�~m@����\c@��;���        ?w�1����?��&�Ƈ-?�W�(�4�?Бٚ!��?��D8�G?�+|���?�L���ބ?��R��?��-��
@:KU��@	:��:�@Ў<�x@:U�B�@��$�`@��d$�@�V�ʚ-@ �r�Oo@#Bـ�C@%���gY�@(]4�^�@+(d�eM@.C�a�]@0����@2@�|�C�@3�V��^@5ƪz�۴@7��=f@9��Y�@;�J��:
@=�ѭp��@@ ��Aس@A%���@BU�̖�@C�1,��@D�I���@F%F+H�@G`��9@H�Cm���@JS����!@K�9���@MQ��{@N���1O@P;y��
�@Qb����@Q�.�"��@R��ٲI'@S�7w�4�@T�`i/�9@UiE�[�@VV�0��@WI@7km�@X@P�"$�@Y<��g@@Z<w���@[Ao�~d|@\J���|u@]X��[�x@^j�%�{�@_�,�k�I@`Mѵ��U@`��u'$@an_��@b�鴗�        ?bT�X�!N?��g�ǁE?��)�#�?������?�vU���?���呂?�����?�q�}���?�ݐԹ<�?�	6�1��@ &
�}Q@Z��E��@	)���&�@��=_�@X}&	��@�ߓF>�@v�޲q�@��pB��@!��i��@#n1eǢT@&:~�"@(ڸu���@+ݩ�@/
��.@1@����@3�c��@4�֩�]H@7	L��.�@9/\�aܐ@;rq6��@=���	��@@(�0.�/@Av��N�@B���{X�@D@��o�n@E�����@GH��9U@H�#�X@J��e�O@LHM c�@N�] n�@O����u@P�`ѵ�@@Q�}"�&@R��E�Z@S�e��T�@U=RjR�@V/gTI}@WU�|�m@X���{y�@Y��?��@Z�����@\B=��`�@]���L�@^�+�#�@`$Z��a8@`�"x�u@a����c�@bK�V�c�@coz�"@c�$���@d���z�@ebeǀ��        ?w��яdZ?�7"O�I?��a����?�*�wCk?���3��?�q�C�?�)�g�4?��;	fD@
	�)��@�;�:0"@TK���,@�K`(t�@Es�}mE@���h3@ �E\�\@#��띅0@&�͚��0@*��T
�5@.r"���@1Q��}�@3�%�_�@6i�m�@8�� �LX@;^�W��B@>Qr���^@@�?���;@BaZ�5�@D!i�6y@E��qX{@G�ߔ!Rj@I���/�@LŖ��@NV{0AO�@PWQg���@Q��_�A@R�9�.�@T-��^s@U���� @WU�W�I@X��e;@Z�k2.%@[��w�T@]V�@F5d@_m�m_W@`ls���@aX-L�@bK�Z&@cE�+!��@dG}�xZ�@eP����4@fb���@gz����@h��)���@i�֔M�6@j�lU��@l)���,+@mh�#7��@n�tw�u|@o���5�@p�&�;H�@qY8{��a@r5���X@r�!qZ�\        ?�|�[�?��~�h�?��%n��Q@�WJ �@m��*&@(9��.�p@1�ſ?�@8�<{��@@?��$�0@DϤ�K��@I���;�@O�����%@S��ĉ@V��~�@ZW�i�j�@^v0���0@ar亰�!@cӰkDC@f]�{ S@i�Qb�5@k�k���@n�Lα�@q_��O@r��v��x@t��%	�C@v`�gV�@xO�U�@zR_��@|j�d���@~��~:�@�m�0<R�@��`�ϰ@�ѻtC@�ԦN�@�a���5�@���J�@�Ȳ�7�@��y�@�@�/\r�@�����o@�����g@��;���@���j�1@����0��@�^���9@�?�S߲S@�%�	��$@��$��?@� b�w\�@�����@��6)Q�:@��a�pj�@��^޳s@�� �C�b@��0)@��0@�* a��$@�C�~D@�1����@��6���@�Ul=�QG@��N�[@����6�        ?�$?7E@�?���^1�?�װp�x]?�U���U�?�(Z��9?�t!�?�6U�|8�@����@�H�w=�@�!ȼ�@�裂��@�o�h,�@�W}�D@���y�A@"p���y�@%9��f�@(4�?�.�@+b"���@.��3W@1(����@3	�^�f}@5��@7����@9>�Zx�b@;���㶣@=ڮ�|�T@@&g�]U@Ak�.�\@B���K�@D���@E��X
n�@F��%��u@Hx��C��@JM��Z@K��|�s@MA�s�a�@N�&��@PV
v0�5@Q9Br/L�@R"(7��J@S�d�R�@T͒�\�@T�o�Lԭ@U���zy@W���Z�@X�_v��@Y ��~�@Z/�����@[It���@\h�`��@]�k�6�9@^�}M]K@_��wI�@`��� 8@a+�X=@a��'qڍ@bm��UI@c�)��@c���g��@de�F�[@e)$�@e�d@z2>@fv^��L        ?qOv=�G�?����j8?�?���S?�w]�a�?�C�*�??��K��F?�棉%��?��i����?���O\e@ �\4 ��@T)�]?e@
����5�@7�;���@����@%���_H@&�u �@����ء@"!�AŇ�@$��}o=@'v����@*l�olB]@-�d�&E@0|�ro�@2HWF��@4/��Y4S@62�Ƶ2�@8R��g��@:�)�h�@<�%f7�@?^��p�i@@�^�V��@BQ�}Y�@C�K��@E/xR��@F��L�Q�@HH��%�@I�����@K��U�@M__*߲@O0&ޣ@P�����@Q�D�g@R����@S� E)	�@T�X�_�@U���_(�@V��b)��@W�%�S��@Y#oۯ�l@ZZ�rU�P@[�"ǌ{@\�1��@^1G���@_���/�&@`t��j7@a'�qDYL@a�ܑ��_@b��`;��@c[����@d�@c�%@d�fY�@e��}�i @f�oʇB        ?};}�m~7?�_���`?�-�J�,�?�<��j��?�#�A�?�R5�5`+?�E�;���?�2ϱJ@ A�^��@$��t@�@
��i��@�j�@a@;�}+�@F҉G��@���
��@ ��䞮�@#�KTƛ�@&l��	��@)��&�a@,���(@0I�L��@29w	d@4H�@6w/�2��@8��Fw/@;7D^�=�@=����@@=�D딯@A�0?M��@C#r?d�@D��=�[�@FMR�g`@G�(}���@I�_!�č@K�Py��@Mq.8�U�@Oe�`z	@P��̷@Q�s��_@R��)�D@S�n\�f@U �)�A@VJ�'J��@W�/�j1@X����@Z�4���@[c���6/@\�3}�7�@^'�R�@y@_��1�(�@`��,9|@aHip�j�@b����9@b�TBj�E@c���rAE@dx)��`@eOL����@f*�
��@g�3:@g��t�@h���B��@i��J�&~@j�E9,3�        ?�P��y�?����Y�@��P��w@��2��@&�Fg��@1�k�H��@9����?@Ax�dUX@F��V�&@M_��+a@Q�R}`�@U��l:%@Y�r���F@^�����J@a���X�@d\�`�M}@g0c��L@j2I��@maY'���@p^�G�a@r#���(@@s�>0P?�@u�ۜ���@w�*,#t`@z�B@|BV�v�@~��UQ@�r�e�@��2 w�@��j3]P3@�<#����@��J�Lf@���.�b@�c�]1T@��^�g�@�[FZ{��@��)
ZL@�z�`��@��5y�@�����@��"S�v�@��-U@�z�b��9@�a����@�M����[@�>J��^�@�3H�{Q�@�,ҩٮP@�*��b�4@�-�	ӼE@�4��ߊ�@�@n�)��@�P��?oA@�ev�j�@�~�>&Ҍ@�NU��f@�ߎ9�5�@�s���G@��*|�2@���qk{@�;5*T@���\���@�v�܂O�        ?l�8�t?�îđ(�?��@ܢ)?�N��[Rg?�k����`?�̓iW�;?�j����S?�A��Y�?�+��@?���e��?���7ח�@5��+�@�}��@	�<EI��@:?�8)@M5��P@º*��@b��U�T@,p����@ [E�?�@>0c�@!B���D]@"��8@$�`/žm@&�F|�@(�L�x��@*�Qm@M@,�:����@.���I�@0�I< w�@1��V:@2��>�^�@4>�,�b�@5���0]@6�?m @8;L��_@9��ʶM�@;I]p@<�}�W@>�ty(@?�v�]�@@��-x@AtO�%�@BK7n���@C'DV��@DAP��@D�-�G"(@E�e~�5@F��#~@G��ޯU�@H����K@I���|}r@J����@K�	E��@L���OKV@M߸I*�@N�77��@P���@P���>��@Q+�Aɢ@Q��v|EL@RV�eb$�@R�,)�         ?SZ��<Y\?��U���?��M%��D?��_.'�(?�B�U��N?φB6�?����M`?�l�?$��?���<V?�#���?�%�ӏ y?����	@��'q%|@����o�@مGa@�.Br�@�!��Q@CB�z@����)�@㓘d�:@!��^)@$��ܗ@&���x�t@)R�����@,@d���|@/^�
�?;@1W6�.��@3�"*�&@4���
z@6�q��@8�(����@;L 9�q@=Z��o�@?�� ~@Av��@B`2��	@C�)�T�	@E����@F�$1�/�@H~�_@I�Px=N@K>��t��@L� ��l@N�,�:Ջ@P9�^� �@Q&�7��@R�>�.@S{ڶ�@T���@U):kU�@V=o�&m@WY����@X}��m�@Y�ƾq��@Z���X�@\���+}@]]ѷ�@^����B�@_��2��@`��A�$@a^Z�@�@b��e@b͔�R��        ?c�Y�W�?��6�m7?�Ǔ����?�,�d`q>?ɚ���ZK?�S�9˻?�Ti�I�?����'I?�2��2??��r+ ?��΢I�V@�^��*�@�9����@
h�?���@�\\'�@��Q6�@\���@��s�B�@kU��e@ ������@#�a���@%y��ǵ�@(��A��@*��s�d@-�%�]^u@0o����@2o�`ۗ@3�}}�@5�����@7�,��1c@9���0@;���˨@=���X@@����@AB�_�R�@B�r�@C�"���$@E��1@F�E!��{@G�*�*��@IhH�\�@J��@L�(�7.'@N�z�.�@O��r�@P�nSIs@Q��2��@R���_�@Sx��ٽ@Tl�2�h@Ugb�l1@Vg���@Wn��ݢ@X{�m�)�@Y���$K�@Z��u�@[�t�%�,@\�"��/@^�(���@_J�FKQ�@`AMJ:��@`�^�,0{@a��FX�        ?��މ�?��\��t?��9@�!�?��'���@ӊR Ė@:a��n@ Se�Q[�@&��Mv�@-�1��9>@3 y�U�@7�7Ľl@=
c���@Ab��5�@D���ꤽ@G���z	@K�YE��{@OpQg�@Q��
���@T )��@VZ��$�(@X�-����@[lȧ�hJ@^'! ��b@`���܀�@a�^b��?@c��S�*F@e(����@f�0j�}t@h�Fx�@j\��2"@l7����@n"qQs�m@pA�Tg�@q���h@r��g�@s4"����@tPg��G�@ut�<���@v�g�.R�@w�W�=�@y�񏠭@zR���p@{������@|��De@~J;��Y@�w2�c@���)��:@�Cw>��@����*@��8����@��Ut��@�L>�i�@��S�Z�@��e�W�@�����Y@�������@�l-鱲@�J�q�ˆ@�,�-�Ɗ@�=���@���F�.�@�苨g�@��zt        ?tH�u�v?��=�DB]?�F*4R�O?�d��A%?נ�p��t?�!�V[?�X�7��t?�Շ��B?��W_[;V?��b�<n@�܆K! @�bm�� @�h�$F@��.��@��՗i@�$ Y�@��2�@Uj�N~@ }+�xvJ@"k'��A@$t�$�j�@&�T\r��@(�O�@+4eZ�4�@-�q١߳@0��,	�@1sx�m@2֞O,�@4G�q�F@5��=�Jg@7P�7v�@8�I>�@:����@<Bv��@>ȡ���@?��@�ֻ@@�Д��8@A��W@B�Z���@C̄�/�@D֠�hO@E�[N�@F���F:�@H��Mm-@ID�{��@Jq�Y]nm@K�hA�%:@L�/�}�@N!�
c�@Ojvm�~�@P\��9��@Q����@Q��~��'@Rh��LB�@Sa�2>@S��^c�J@T���w"�@URfI��&@V<K�D@V�c�-+@W�ҹ7M�@Xq}W��@YAXwD�v        ?YI��׀�?��*��"y?�����G�?�DxU��?�l�MgV3?�2��f?�c��.�?�΂�f��?�c�.`�?��`))?���x#�@ X�]�2@l1T��	@	�6��@O�'f@�dz?D@Sc�*@嗞���@��{E"�@ ��s%�@"�q��ö@%O�7�@'�+���@*�H4Y`@-����o�@0��$��@2D�� '@4
��.�@5�D-K@8�g��J@:"7ٸ��@<[��-s@>�� ��6@@�{�@A�Ė��@C'�a�[�@D��"Mˢ@E�9_,aq@Gs�o--�@H�m}�^@J�l�ê�@L<�Ɩ�@M�ƹ�ko@O��k^�@P�Z_�@@Q�8�$��@R���9<;@S��߸�@T�1wW�@U��ң�@V��]���@W���~b@X�-��@Z-���@[L��z3@\� �ud@]��V�ٹ@^�ˁ��@`"�'�V7@`�����@av��S	*@b%��/�@b؇��Ĕ        ?g��,���?�̋e�d?�����KM?���rH
?͚�tq�?؈�o�,(?��'��?��F�(Ƅ?���X?���m4?�����p�@�;6��@���b��@���{#@+�r�@RYa�j@����N@�\b랼@ ��GZ@#
���]�@%�6�Q7�@(V�zQ�6@+Gt���v@.k�R�@0�<F£�@2�]v/�2@4�Q��a@6�|3G@8�9:IAs@:����r@=��x;�@?���{@A
����@B]����@C�u�j��@E/�F�@F�e�S#�@H=щ5��@I�Zlvv@K�Nv9@MD)�Jm@O����H@PuK<��o@Qj����@Rg�k�Cu@Sl���c@Ty��Bt�@U����o@V��
R�@W��ßH@X�p�vf6@Z4��F@[r�K�@\�u�Q�y@^6 Ms@_^k,��_@`_J�rE@a5j-$@a˩M�@b�s�1�@cI�W"��@d%�a@d�,0#        ?�V��9c?�'�IX�?�Q�y	�@�f�@Ւ(���@�Ь���@%�(��j)@.���@3�틳��@9?�I���@?`��?n�@CL�G��@F�ҩ�-@J�b�>�~@OUW`�8@Rzoa�@T�-��K@WS�w4�E@Z9�%i�@]Ju�7�@`C;��n@a����!@c�K�V�@e��T��@g�����l@i��u��@k��(j=�@m쓫�dg@p7�r(�@qH�
5s@r��|4�5@s����[@u ��L@vk�&�G/@w��c��@y=	�h:@z��z�'
@|9�Wb�@}�5yH�E@a�G��@��G��
@�Z�� ��@�7����@�U�+��@�aQ!,4@����JY@���W�n@��F��K�@��#��`�@��p��@��(�� @��HaJ�@��C��2@���R�,@�=���L@�aQ�zX*@�E	���@���v��@�u��1 %@�ƭy*�@��s��%�@�Q����@��4yN�)        ?�L�)��?��^B�%l?��؆��?�cd���?��^�ϺG?�W�����?��Ꜹ�0@�g�#��@�%�FV�@j� �x@fXG���@z�/��@򊆝�@ gQ�"��@#ԕ'��@%�0#�6O@(��5MT@,�.�s�@/�mD��@1���6&v@3���Β@5��B�,�@7�irDn@9ި���@<2�gI�@>����7�@@���$8�@A�|=�$@CD�E#�@D�S���@F):#@G�Q���@IB��!�@J�$��H�@L��9�n@NK��0]@P
'�0�@P���]ƕ@Q�e"��q@R�{CҔC@S�=�ʽ*@T�b�*�@U��qpg@W�q�@X��x��@Y<%6QU?@Zcj^@[�l���@\�'Nwj@^��XM@_C��po@`FG/��@`�:c�9@a�6gi�@bG��+F@b����y�@c�2NB$@dh�lO@e$kA� @e�.zt,�@f�[�0�@gm��H�n@h7��]�        ?y���u��?�3�B���?�j䇪�?�|�S?����M�?�uuՓ�A?�Zi8�?�H���U@DnOV�@�lUD!@�xG1f@v	nƆw@g	��d@Ʃд�@���԰=@"l�"G��@%H9`j�@(^�1�r	@+����@/?�,tU@1�.l��@3���>8�@5���.a@7�E���@:\Qv�}C@<�!�ia@?�D�|{@A+�Kc�6@B����6@D)�F���@E�\|J��@GnV�(�n@I+�A��@J�q.X�@Lٶ�Yr�@N�཈�@Pg����]@Qs�o�	@R�
k!~@S�< ��@T�m�k5T@U���L�}@W26�˸h@Xs��d�@Y����@[R}�@\p�O�z�@]���'�@_Hd� xI@`aN=�@a#Fh��@a�(<�}=@b����9(@c�����@d\��y�@e7d�o�@f3���,@f����@g��v_ @h԰��9@iȍU�\x@j�l���@k�L�b`        ?}�=��#E?��Gp��?�%��}?�{m���?����+�Q?�W8@�<?�?W^Y�?�}�Y��@z���@1ĵ�q@�=�i�@���.z�@&���B@�D"�;@ �5�z͙@#c����O@&��^#^@)���E�u@-�g+(��@0чK�Q@2��u#/�@5=�G�\@7�e���@:B�M�9�@<����9@?��\I�@Ax�Цz�@C�w�@Dé&�v�@F�dJ�N1@HbZ;t�f@JQ���S�@LV�v%)�@Nq�r��#@PQq�t��@Qu���@R�  ���@S�<�K�@U#�ɰ�@Vu'��@W�h|�@Y:��#E@Z�N�r�@\/�9�Ǭ@]���X�l@_U��s��@`}��ag@aV�|?@b5�I��@c��`�~@d����@d�Qx���@e�t)�/�@f�&NX�7@g�orx@�@iU�`�:@j�C��@k4Ow@lT�	�ɘ@m|i4~�g@n����@oߍ��с@p��փ��        ?�4@!M�?��{J�[@Vo���g@ {F#�s@,��[)�v@6<l���@?��Yq��@E��ɺ�>@L3~!�o@@Q�\"�uW@U�����@Z}�g�B{@_x�XG�@bp��	^�@e[�a�*@h~b��^@k�|�0��@oj'�gy�@q��r��@s����@u��VSL@w�eDV!�@z@R5�E@|����S@8�-�@��g{�
k@�NF�Y��@���#}u@�6n��_@���o	-@�T7�2�@��%:���@��g����@�d�_僫@�/�[ �5@���� �@�v�����@�p�ǂ�@�o� �l@�vg�z�@��|��2W@��3*Q>�@����on2@�Қ�\@��TI���@�(�c�j@�]�u��@����+`8@�� Qҝ\@���;_�@���,W�5@�eٿ3P�@�{�b�L@��{�H+�@�{ޥ�F@�4��{o�@��پ47�@��t�߀o@�suu�!�@�9�P �@��h�_/@�Э�;��@��nw        ?vF��(c?��v��?��_��� ?�_AC�<?ܮ���?�˸�L�?𐇺ý?�����g�?��=�X@8�s;!�@�w�B\�@P��O�@m�yp@��eE�@��3L@�m�@tI�a4�@!̛~�#�@#���EÀ@&R�*.y�@(���P@+[_	��@.�_5�@0sB]j��@1����v@3z��-@5����b@6��嬤�@8��'�9�@:Q����@<14��@>!����@@qgϖ�@A�/(ү@B,'�;�o@CFA{��@Dhަ��@E�RCz�@Fǰ��f�@H��`��@IH�9	��@J��S���@K�ok��@MI�X�=�@N���s��@P��3�@P���@@Q��c0�@RPYlF?@SQOz0@S���ll@T�Er��-@U��0~�@Vf��Lb@WD�jb��@X'}�S��@Yb�F�S@Y���J�k@Z�U�(a�@[�qW��@\�Ư�3@]�)g\�@^ԏ�X        ?f�K+B%?��:(�ħ?��X9�c%?� }�N��?��:��Ի?�	q��?�n���?���a�n?�H��S?�eHc��>@�K b�@t@����@!T#�8@4�;�;@�*e���@��Ju��@�qƐR@!I�;��@#�R$���@&��$�@)� ?�s@,���&��@0t�Yr�@1�f��;�@3�ӎ6�@5�:�J��@7����@:���@<x�1$�@>��'���@@��>o��@B&��Z�@C��q��T@E���@F�X��Vb@H@�}{u@I��>s$J@K���z�$@M��7[�V@Oh�z�_	@P�L�3�@Q�B�<��@R�Z��@SֱZL@T�eB�=�@V���}@WRT�ŋF@X��ՓV�@Y��tj5@[$�X*|�@\~���v�@]�tG>k�@_P%�K�@`c�o�ݖ@a$˳g�@a���	�@b����P�@c���x�x@d[/����@e5���d�@fS؀�@f�9�K��@g�\���        ?bXYE�Ӻ?�3�u���?�n�؄?��1J?�^/k-]?�6�V��?�O)�w�s?�-9f�?�Ox�?^*?����;]Q?�(�l:S@͖����@��_-�@
��2�m@$�U"i@#��
[<@p�sq2�@dCS�@�C�:�@!t���Y@#f�K�� @%ژpK�@(x�`f��@+A�n;�@.5ӄ��x@0�����B@2P���x�@4tYz9�@5�����@7ʪ�*Ҩ@9� ݫ�@;���%R�@>��o�W@@/ _ë\@A_���@B�E+�,�@C�8���@E:����@F�&P�@H
-��i�@I���@KW�[kq@L�no5˴@N=Н�c�@O�u�_@PЪv���@Q��՚�%@R��k$�l@S�
�)��@T}W��"@Uw�ߘ�@Vx6�V�o@W~�R���@X�}�A�@Y�Ko�Z@Z�6?���@[�=�Soe@\�`�_�k@^&��0B@_W�Oqd
@`G�����@`�{'+�?@a�P[_2�        ?�G��fi�?���|�kh?���JML@	�2P@ܐ}C@#��N@GN@,�5 ��M@3�ֿU7@:@I��r@@����Hn@D���Qͭ@II��?n�@N8�O+@@Qˇ�_;@T��3�-@W��sg'L@[ l�o@^����G@a3Q1f$@c,ar�m�@e@K)e�f@gn����*@i���Ba�@lt��@n����(@p����ȵ@q�҃�@s[�g@t�<%]�@vR�=��@wⰄ�ք@y�_A@�@{+�����@|�P�Ms@~�;IR�c@�?���8@�0��v7S@�(y��2@�'����@�,�Z5�@�8�p��@�K�k�¢@�e�/���@��M�N�]@���B�K�@���^�e�@�ݻ�=@�L��"V�@��G��@�����!g@���hj�@�@5�]�}@��S7o:�@���	"��@�XTv�H@��57j�@��ܻl�@���p�n�@�T	���@����^@���e�SX@��'���@��6��[        ?mLν�?�'�E!�?��~&�J?çz8aX�?��X��8{?�e�춄)?��C�t�m?�����?�?�9b��!�?��P���?��P��Y�@�2[���@�����]@
���`�@FsU���@7�o��@����p}@{��#��@wa<�}@�? eVx@ }\2���@"A��2�@$�ߵ@&��f�@( b�C<@*@gP��@,{��3@.�~~X6@0��p�Re@1�(R�sJ@3+���(�@4����@5�d�wϦ@7[���H�@8ى�L�1@:cm0�D�@;��x*@=�4��$@?K5���X@@�W���@AgVԥ��@BQ��*�d@CB)Ӯ@D9 O�i�@E6W�H@F9xf��@GC|t��@HR�o�ۧ@Ih� ?*t@J�����O@K�[x�@L�p�@M�هD��@O2M�B��@P6ao�O�@P֗3@Qy�o(j�@Rވ9t�@R������@St�[uY@T#���:�@T�^��{�@U��B�`�        ?]'�uUb?�=[�T�?�����k?�
1�f�U?�����=?�M�
#?�����{>?��]�i�?�FA���?�N.w�?�t=Б\�@ ��^H��@�~�Y��@	��S�M]@@�c;�@z�kF-@���r�@e0.�@[��9nU@ �?#��@#)��U"@%�C5�\@(]B�P$I@+=[����@.M
�3)w@0�_��E@2~pkት@4N�fW��@68&Z@89��e@:T�h4,�@<�-�c�.@>��δ�@@��"m#B@A�[S���@C,�Q�vt@D��h-�@E�㌁��@Ga�鸘r@H��(��@JqJ�"�@L���V�@M�Xc�@Oj��k��@P��<���@Q~�wj@Rmzf��@SbۜvL�@T^�g�Y�@Ua���=x@VkB�I@W{����U@X��o���@Y�Vf�s@Z��PX�"@\ �ϒ2@]2��Wo@^j�u~�w@_�H�}Fx@`x@G1@a�j�Qh@aȝ��jz@bu���        ?Z����6�?�8S��v<?�I��nH�?�%�3�="?�Wڸφ�?�h2��?ٌ�=P&�?���6?��X�?�-���?���;�?� �erR�@)@�2e�@@v��G@
�э�N�@����=i@��_�;@�W�.Z@Ylc:I@@
[�qy�@ �WZ�p'@"���U^e@$��U���@'eDC9@)��m0�@,�VW\�@/���)�@1]��zz@2�����Q@4�2���@6q�n\�@8K�p��5@::9)��c@<=O�5@>T_�W��@@@�Ǔ@A`����@B�;���.@C��׻�@D���q�R@FE|�3E@G��[�@H����@JZ����@K�Q��@ME���X#@Nɮn�u�@P+�/�KV@P���;��@Q�~f��Q@R�'(;:�@Sx�ޟ�@TX�9;[@U<+�ʽ�@V%�Hj�@W�g`��@XKQ0�b@X�~��d0@Y�j�eF@Z��$e@[�a/d}@]cTND�@^��I        ?��[�XӼ?������?�+2�s��@ A�"=@��:�G @V��a\@ �����]@'�c��a@/3�V]�X@4 ����@8�WَB@>�|����@BQ���@E��0�"@IO�N��@M>�~Y�@P��_�@R��ǒ�@Uh�Vj4&@W��x�@Z��45ށ@]����9X@`FD�T"@a�ڹ&��@c��*��@e=��
B[@gz℅�@h�f��5�@j���f�@l�^�E:@oX%k��@p�̒��@q���Jp@r�V�_X@t�>���@u[����@v�;M��I@w�8r3d�@yQ	3��@z����)u@|&+O�?�@}�}��L�@"��p@�Wɹ�t�@�#!���@��R���4@��SL��y@���^7@����=r$@�c�w
'�@�K�w�r@�8f�;�@�)����M@�j'�K�@��I+/@������@���5]�@�#����@�/�gU�6@�@1V%s@�*���@�����,@�E��>D        ?tU��W(!?�ٴ�؜�?�J���X�?�R�$;�?׉���G?⩒Ϭ��?�IJ)71?�Ӣ`���?��;B�?��EU��@�M���@0��b��@ 9� T@!�ҕ`�@��#	��@�bU��@d�e��>@𢁬jS@ ۣ���@"�d����@$����1@'6nH��@)���Jyw@,yzt*�@.�2��p@0��㜗@2-��@3�F��[@5�:���@6�}�˺@8Sśs�@:
*�h�@;��m]'�@=�m�/��@?���S@@@�տ,m@A��h��s@BϦK>��@C�G�Z@D�b�\�+@F K��@GKB��_"@H~K�"�3@I�k��c�@J����@LH � �@M�|�6]@N�ir��@P-pHjS@P�c��є@Q�g=�W�@R[w����@S�6��@S�����@T��m���@U{��f
/@VN.���@W$e�G��@W�����G@X��(P� @Y�YQ�!@Z��Mg�@[�G�:        ?^��+D �?��E:!�?�$�,nQ?���%-y?țO�u8x?��S�BK?�2W���?����l?������?�I���}?�"�G�9�@��ޥ�@:�=���@����@C��If#@���s�@Xx;���@t"��z�@ z��J@"�x�Qj@%����
�@(s�d���@+�5��@.�A��R@1,y=0!�@3x�&@5xt�9"@7 � FG@9W�x?��@;����3@>��j��@@X�7�V@A��?�]�@CT��@D�:��4�@FK��+@G��`s۵@ISQ���)@K	�#� @LЌhqo�@N�R�E�@PG <��D@QB�1s�z@RFS��k�@SR�D{x@Te���@U����E@V���:͇@W���@Y~�m�@ZBF+��@[���h��@\��nJ@^'�3��@_�V�{5(@`t����@a+�
)k@a墱bK�@b�F[�0@cf�v]1,@d-Ǟ��}@d��>��A@eǒ�ֈ%        ?b�*vМh?��#\~6^?���&��?�=�u��?�сNY�l?��< *=o?ޡ���ݧ?�.��l^:?��<7?�{�&�$?�� �N�@ ��p*�@���\4@	}lj¤@�_�!0@7�:ܔ�@htwvjG@�v��Lv@�3�9�@ r�U�@"���!y@%k2��@'�ER(��@*}���!�@-rh��t�@0J�m�P�@1�V��>@3�!`�@5����@7,R��@9���<�%@;�l�b��@=��5;�@@�,I�@AR��s�@B���b�@C��@E?+����@F�h�v�@H\�*�@I��}�@K,�)G��@L�%�AO�@Np��v3�@P�� �@P�w�u4@Q�s�/-j@R��@G�@S�^ݻF�@T�T��[[@U���9ȷ@V�F8D��@W�C$P<�@X��2�J�@ZH_Ir�@[0R���'@\[Ūk@]�|�ǌf@^ĝT��@`�U!E@`�u�c^�@aJ� L�@a���C^        ?�����ܛ?ظ��a�?������@�J�z@t�H�@Q��@%t`�͕E@-�ɩ>E�@3��p@9a��@?5��l��@Co9\5@F�{!&=@J�ma1u@Ok��4�@R ��%p'@T����@W~�R[6@Zp���n�@]�{s�ՠ@`n�!�)�@b,5h��Z@d �?�7�@e����@g��+X�@j	:�r�<@l;�ϱ�@n���+t@pt�5�S@q�Q@ٖ~@r���p�@tPB̷�@u���e�@w 	�L$E@x�W��d�@z �!1�}@{���a?@}SQ�� :@~�0b�@�[�I8RC@�>�˫.@�&���@�w,�X�@�
�4B	�@��{���@��?�a�@�����@��I&F�@�2:���@�L�*��@�mi�g�@��M7��@��NV��W@��g�Q@���8x@��i���;@�Y�K6B@���W|Q�@�����"@�SPg��@�(^�c@���.�@�h�����        ?k�h����?��O���?�HO��?��lFؐx?�"8��r?�PҘ��?�gl���?���ċY?�r}��?�Z=LtG�?����7�$@e��D�@R��a�@�͎�G@&�\�]G@���9�@g���^9@R��ʨ@o�ic4@����@!a��_)@"���M+@$��/r@@&�17NzU@)
c�@+]g`g�@-�Aǅ��@0H7�d�@1Z%>���@2��/d�_@4��;@5w�g]�@6�lx�#�@8u���D�@:c���@;��밆�@=P]'�@?h�Q:@@e_kW�@AM,�q�@B;���@C/5� ��@D)xJ�r@E)��i�@F0��I@G=W�l�a@HPP?��*@Iii�,�@J�� ���@K�Ĩ���@L����u�@N	�2]_@O@Ȩ�*�@P>���z�@P�����@Q��^���@R*ǯ<��@R�}Us�@S���Q�@T0e�Gj�@T▆��L@U��ۙnp@VOq���        ?W�5UVX9?�@j�Tw�?�ǍTƦB?��C���?�R���p?��Ӱ]�?�5~��ފ?䣅��!?�͡8�8�?�]�:��?�Gjy̆@ "N�@	�"�@��2#�@���Ѐ�@����@�TnPJ~@b-E��@1-s��x@ *�쟵�@"g��=@$ьB��7@'g�?[M�@*+���v�@-ߚ��#@0LQ,�@1�M��;@3�7@�@5_E�V�@7O�a�W@9X����@;z2L� �@=��	@@c��u@A:G�yy@B}/}l�$@C�Ў�=@E)?� E;@F����gI@H�\�K@I��Q�=�@K%t��@L�;1.�}@NcX�w7@P:9�@P�H���@Q���.u@R��4���@S����9@T��2��@U��ԩ2�@Vŋ�|d$@W��&�9�@X�{ck�@Z��-�@[/ۀ��@\[�zT��@]�6���@^����+@`4@���@`�˭S�@aOS���@a�+���        ?Zg�<IX,?�>"��x?�HN���?�<���e�?Âg��?Й66�ؕ?�靰W�?��J��?��v	�?����R�?�S>� �?���O:X�@�9#%��@��0�@l�'�@V��y@=�*��@n���\�@�Tp{5@��'��@ ��֛H@#N�;``@%q����@'�Fe�V@*�����`@-wtL��@0;�v�s	@1Щ�p\�@3{KW�@5:���@�@7wE���@8��٦|g@:��;�sW@=��Hu�@?A�M	(@@�'\Wy�@A���"��@C&��t�1@Di�+U=T@E��ꊨ�@GAe	@Hu�ù�3@I���Gǃ@Ka.��n@L��Y/�,@Ny�+�@P���R@P�A���@Q�Pq�1@R�I�k�@S�̳@Tk�Ev��@U\�	;��@VT6��a�@WQG���%@XT2��AU@Y\�M��@Zk��3�@[���I@\�r_IIM@]�����I@^�\l�9@`I�fHT        ?����D'?�A���?칲Y�"�?��p��3�@�y�r-	@
�D3�@ ���-��@'�����y@/7�)�@4G>�(	@9�[���@>��kF@B`�su@E��>S�'@Il�a���@Meyδ$@P�WF	�@S*��]�@U�����@X$�Pz�;@Z�@�\Y�@]��dd�@`i�����@br�@c�
��S�@erh6y.�@gG�)>@i0]w�z@k,���@m=<u!�@oaF�/�@p̆���)@q�H�g9@s!�2yJ�@t[O&�� @u�z==M@v�SP���@xA����c@y����~@{j�M�@|~��лz@}�Nz8�@��&r@����/@�U��Z�&@�'.q�!@����]�@�ةt��@��y����@���6���@���}��3@�s�&��@�e�`���@�\'_�[@�W&{�(@�VW*�,@�Y�WM��@�a���@�nF�a�Y@�~��<@�I�|o�@�֗hܥ�@�ef�j�