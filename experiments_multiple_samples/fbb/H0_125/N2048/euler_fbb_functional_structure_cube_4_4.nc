CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T110718        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @               ?}��ǯ�?�
��8�?�&<?��?��F%���?��ֵ�?�~��D�?�ȥ�-��?�-��@xj�uJ@

#9BR@&k��&@@���|@trM:@�F�"�e@ |0p��@"��S��d@%(I2X�K@'��E��/@*��vP@.&��>�@0����@2��Q8/�@4p��˶[@6m��2*@8�fm�к@:��_bϐ@<���E@?X����@@�}+v�^@B3�Q�b/@C���9�v@D�c̭��@Fd�9E�@G�P�YR�@IuiH��@K:�V@L�f�ʕ�@Nt`J�7@PUtb�@Q�7�,	@Q�����@R����@S��Ƕ-l@T�0�@V��
�@W��tL@X3֐	�_@YW@�*@Z��6Uv�@[��õ��@\��@^,��NE�@_sʩ-�@`a�0��@a�ߓ@a�����@bk�cȽ@c!,��@c�"NKXM@d���*$@eV��.�v@ft§�(@f��U�}�        ?W�����?�G/��.�?�v@����?����R?�l�>��N?�%��V�?��d����?��-��?�j���@F]!��@����@�P�=#@5���c@"��h��`@(g���#@.���bθ@3&se;@7z<!k@<n��@A���c@D-�Mc�q@G�i��@K�k �4@O��t��@RQH�
��@T��p�B@W���e{�@Z�z�f�@]�Sc.F3@`�
�W@b�T�<-;@d��L�c�@f�����@i=PTM�@k��N�|�@n���@pg�Jޕ@q�*�q@@s\�:Y��@t��z.н@v�0����@xh��Ea@zCd�R��@|5Fzu�@~>�.\�@�0E���@�M�3c8w@�w����X@��v(7��@���߫@�Du���@���	#�@��>�@��%�)0~@�#�.q@��)�@�\{1RZ�@�����u�@�o?M<�@�[ib8�P@�O�j0�@�L�����@�Q��`�        ?i)y��?�=���?���[#n�?�'��?� ��0?��2�k?�B�.��i?�q�����@E@��'@
O� Gb�@\K�6@�l�<�@ ����@%}b�Lr@+j��>@13���s�@5Fh�>,@9�FX��@?P;���!@B�$��@F���!@I�1Ҏ6�@M����@QB݋���@S�0���S@Vr@r��@Y]d��R@\������@_��~��@a����X,@c���8�@e��R�G�@g��O��@j)��*a#@l���N�@o!��)@p�䙖&@rO�Ca4p@s�s+x֋@uT��y�@v�a��A@x�4�>��@zd�^HN�@|:fc�J@~"����u@���tH@�����7@�*+Wyw�@�F��u@�n4ς\@��6�L�<@���B�@�%Q�y�@�x2�=@�ֲ�¼�@�@�N��Z@��S|&�b@�7�x�#�@�b�6�@�/>fi�@���X@����I@��Q��p        ?�wj��@[S��m�@1N���H@B2��Y@P4����@Y1Hr!@bV|�*&@h��wŦ�@p�,�i�@tW���@y!�58�@~o�.�@�"Gd�&@�P�'o�@������@�|�Hy@�=�}��%@�`���d'@��;=fOr@��xA2@����߇�@�R��aإ@�)�s���@����<�@���2�b�@�E����@�� 5[]�@��[x���@���>6]@���4�1�@�����>	@��":V@��$A@�*�܎I@�-����@�`&f@��|�bAx@���c@�2ڏ�@���		�J@�����@�^(U�9b@�զeo�@�WQ\u�@�qL��Ĥ@�< �D�n@��'�@��A�Ta@û�&��@ěh��@ŀ�a�@�k7���@�[/���l@�P��6��@�L&̨I{@�M$��^�@�Sޝ{v�@�`_~3$�@�r�ߔ�@Ί�%�k@Ϩ�Tš`@�fs?�<�@��n�k�        ?aԺM.?�Bmy �?�K3��H�?�jҥ��l?�<"��(�?�ֻ1��?�͇���X?��ҁ�m�?�ƝҮ�?���o�\?�tqɸ:4@ �Y��N@��9ZZ?@�c.kS@^�J@��M��@��c���@��1�|�@�(5��u@<�s�v@ zh�b�q@"x�v�� @$�'W+��@&���13Z@)G��``�@+ԻPo�@.�����@0����@2-_%r�b@3���ung@5ckے{@7�.�U\@8��p�@:��7s�@<�nʏ�@>�|Y�I�@@i��-�@A�A��@B�����@C����`@D����@F<g_*�.@G��V{,@H����B�@J5�U%@K���|�@M��_�N@N��?�Z@P	����@P�߈��@Q��}5�@@Ru��H�@SO}�Av�@T.����@UBP6d�@U�rh�q�@V�	�d�@W��bJʦ@X�GU�eK@Y��g���@Z�>f�@\�s��@]�"        ?M-�L��?�U+[[�?��C�[�?�V�%�?˅US�9]?�VE���?�HY�'�U?��<R�lG?� ����@!;����@	W~�y@;�'�@��v�@���6��@#���p@'�K䖕J@-�0�+�@2���@5�?Ug<@9�%Sʫ5@>��k��M@A��!�@D�7uፘ@G�+�]/�@KWa�<+|@O`%�!�@Q�R��_O@S�UZq@Vr�Q+�@X��|+&@[Mڈw�i@^,�Dee@`� _d@b;�qm@c�NA��@e��Q��@g�9�d�@i��G�"�@k���_�@n�ȁ"D@p1z����@qj� ��@r��L���@t	W�-ժ@un�{N�@v�H�ն@xhݸ�@y�<���@{�x�E@}Ur��@R<�G@�xC���@�k� #�@�h�r6M*@�m��5�@�|���8�@��Y��@�����E@��S;�Θ@�� ��|@�R�W�@���T�w@��"��,        ?V?�����?��s��oP?���Ψn?���6!R?�tx�9�?�t�>�_?�W�C���?�*2���?�����@���5�@&��b#�@�_I��s@�H=8@#(c�7��@(��v4�N@/�2��@3�/0z@8�x�Z4f@>�����@B;����@E�gP'1@I�֍gڻ@N}C�q��@Q�v�=�6@T�&N}@W��ݰ@[��}g�@^ӈ:e��@am��K�@c��f:c@e��i��@h}5���|@k2�f&U�@n;�w�@p�7���*@r9�/Qy�@s�J����@u��@;�@w��:���@y�(�ݣ�@{��-��j@~2�׵�@�H�V(^@��=��@��m��@�-`��>@��Q�A�i@�y�1m@���%U�@�1P��@��pQc!@����@�Z>��Z�@�����Z\@���!�%n@��/�n�{@��U@�:�@��;;��@���p{&�@�ٻK޿@���@ev@�6�P7�e@�r�S�T        ?ʼ�����?��͔��@��-��@*�AN2��@9�A��D@D���8�@N���b�@U�Q�f%�@]	�@a�@bЄn�@�@g�gMj�@mL0�z[@q�4 �w�@u?\:\}�@y���� @}Y�(��@�U\��@���؛@�^�zS�,@�h�)�$V@���8�@��>8(,@���ۼ@���Qw�@�.,O3e�@�uO���@�݀�:�@�f�s6"@��0���@�n�W�H�@��Zx��@�l9耐K@��݃��@��O����@�e*]p@�.��Y�$@�Q�_q@���/-v@�v���P@�|j��{^@��p�`_@���GGb�@���S璆@���!u@��TlV�@�O!��:@��AMCڅ@��*����@�,�	`�@����=[�@�������@�-��p>@��2, @��%���@�o��P��@�9�Wc�@�	��Z@��D Э@Ŷ�/=��@Ɣ�Z���@�xS� �@�`u&�j�@�M�+��        ?v�(I�?��?�	껃�?̰�_���?�:٢�W?�ŭ��{�?��>�?�H���?��^h��@ �_���w@������@	\W^�[@{n�L�q@�T��@%��j*�@�\�@�@!(Dy@ Qׅa�@""���R@$X�+��@&�T�{c6@)BAŶ@+�5��u�@.�z��,V@0�(�a[k@2s��M��@4T�:#�@5Յz�@7�W[��@9���f@;�a�X@@=��BV��@?�����@@�;3�T�@Bq\9@CPu|Z��@D�Y�j�@E�0`X��@G(�1��@H��|�@I�7!�@Kc�bW6a@L�b@Nov��i@Pw�r@P�`K��z@Q����I�@R����og@Sl�k@TUd5D�@UD�X3�@V:6��@W5��D\@X7C�U]@Y>�f
@ZL<�X�9@[_�yy_@\x���@]��X�z�@^�`Y:��@_�dPk�@`�V-썭@a&W�9        ?Qk�*�+?�>���?�mt���?������?�y�F�$�?׳�+O?�62��%?�-���	?���yA@F�T�@	���U/E@��+)#G@��jj�@��@$+����@)_A.�`@/�����@3��3��@7�ޤ^�@<�0�ܑL@A+�h�@D,6���T@G�%nUt@K�>��@O˘?(�@R@�����@TԸ7�@W���Df+@Z�*��M@]��ہ��@`�p�s@b�� ]@d��6�L@f���y��@iALVX��@k��IN|@nZ�P�-p@p��.�:@rA��c@s��� @u4k�mt5@v�	^opn@x�7XϚ@z�\��|@|��R.�r@~�qw��@�`�ʶ<@���E@��h�kg@��ƭfU@�"^Hx@�qWLx!@��׻`��@�5���@���n�@�+��r8@��hni@�W`���@����<�@�\�E�@�>��3�P@�'�B��	@����        ?HlX ^%?w��!���?�7d��و?����:��?��4�,��?�F��83s?ސ�aO��?�4�5�M?󮊷� �?�hV(�s�@-�*��@���5�R@x�54@����@![!�;�m@&+��R5X@+���'�@1B��!��@5��(�@9�X�|D@>~V��~@B4�K�@E.�����@H�H����@Lz] `�V@PU��� �@R��� �@UHf�@@W�9_K�7@Z��u�1@]��ɋ7@`��sĺ�@bEzjq�l@d#P�F�@f �@h3��.x@jhE���@l�X�J�)@o*����@pܾ.��4@r3���O`@s�`'Ml@u���@v���9/�@x/p���@y��P�@{����Y�@}Y@�SS@4L7��@��n-���@�����>�@�����g@������@��@?J��@��܉ͪG@��F���@�J!����@���i~L@��I��M@�&A��f@���NKg�@��Z@�m�@�,��\�l        ?��h��@ia|��@ ��+sM�@2'�4f6*@@F�s-�@I�I|d@R�z�i@Z2Ы�F@a_��5@fOɼ���@k�����x@q1#�F@t�@bsH@x�c��6�@|����82@��� .'@�;���v}@��M)�܂@��о}�5@���{@�`�ܥo@�zm��F@�a����@�fC�>��@���Ys�@�ʂ����@�*�oy��@����v�A@�����@���Ʌ@�tz���@��g5sR@���:p3;@�%mEeU'@���,�E@��O���@�l=�,��@�P��Y�@��%x[tQ@��Š]v�@��H4�;_@���8�@��i#׺�@�A��o@�@n�{�@�{
��o1@��-E��@��v��@�d^��R@�ő9�ʱ@�0��T�@�R�;�-�@���@��q�E	r@�S�As@�m���@�A�&%@�(q�@�����L�@�״��@Ǿ6;�m�@ȩ}z�/
@ə�~��        ?b�EC7�3?��
D�S?�b�TD?�%�L&�?Ϙ-��q?ًܼ��?������f?�p-��D?�¾i(?���i�7?����.��@��"s@U����@	om~K��@��&�@q>,�@ �w���@	vWk�@,�A��@�!�/@ ��p@"��8���@$�|I|=�@&���L�@)n/j�e@+�}I�[z@.4�Ƥ�@0}!�ZP@1�NHG��@3}P�Z�3@5�0�H@6�I�؆d@8��J?�@:r�x��@<d�"�Ȱ@>lQ���^@@DĆw@A^?�@B��ޓ�g@C���3@D��Õ@F2v����@G��ѠFr@H�"v�W@JHZ�� @K�u��:A@M<���F�@N�|Ͱ�@P1�1�Nn@Q�B'
Y@Q�����@R������@S�B��3�@T� |�dn@U�� ���@V�(g	!�@W�Ҷ=(:@X����@Y��?OB@Zɳ���F@[�bt�Q@] ��a@^M
ϟg�        ?J�4�`A�?�vb��{?��ڊ54{?�/���?�P���sH?�o�'h�	?��`�?쌏%y~??��B��w?�L��M�@	8Gc)@30E˦3@5ί��@}'2���@!	��%/�@%��/���@*�4��@0���ט�@4
T�]8�@8�o�@X@<�i\mUF@@����K�@C�"v��@F�&�f�}@J3��J@M�$�y�@Q�ä��@S8|��@U��H�Q@X+�S��@Z��K0��@]�հ��@`�z��F|@b-)�F�@c��op��@e�`��@g��U]�@i����M@l�?��@ng���xH@pi�0�V�@q�ٵ��0@s ��a@tbZ+�@u��;�:@wRx�>.�@x�=�Q@zV�d�@|,�>�@}��`{�@���
��@���x�<@��"�)�@���$n@���ȃM@�ӕ��>@��f�}m�@�	z�bx�@�0���@�`�zk�8@���m�@�ّ�ϼ@�"Ӻ���        ?K��%�o)?|s1c}B�?�gy)�(�?�d`:�!�?�%��|�?�i�P�Z�?��"ah�?�;r��+g?�LQ!@ ���٩\@�6��L@�����@���1�@�t��� @$1/S��x@)��s��@0l��,)M@4{+����@95x����@>�)t2{@Bs�H��B@E����r@I��?]@Npu����@Q�J�z�@Tp��&ʢ@WuQ���@Z��<@^\F�Hk�@a"��c��@c?�_*�@e�e�+��@g�zq�M@j�Q���@mh �v�D@p2�
��@q�.����@sx�]��v@uAAC�0�@w#�P��@y �&�>b@{8���53@}lw��j�@�"��@�%���Q@�XƇ��t@��*�Y�n@��e��@��'6|��@�.��N@���x\T@�2U{C@����ܦ@��}'��K@�:?)�V@�*�f=�@�$�{��@�%�/�wN@�/�lE'@�B8WC�@�]&4? @����\e�@������J        ?�򯒍�?��\�6%m@�@1 �@(�=��@6i��k�@BB3��x�@K/�-�67@S��g�@Yc�Ãs@`a̾c{/@d�(
��J@iMI?�@n��z��@r3���b�@ui0�!1@x�X��k�@|��1k�b@�sG���@��͜��9@���<�@����8{@��!C���@�}�Z��n@�Wo�)�@�
#��E@��̆i.�@�Ñ=L�T@���8Tǹ@��*�b@�0��tʶ@���긹�@��<!��@�ӗ�҉y@�0�5�@@����X��@�E��|�@��AaP}@�9����@��R�ٕ�@���	A֛@�b�LE @�ߧ4i@���R�=@��E�@�p?��o@�qN{H�@�0��z�:@�MJW![@�rNu�ڑ@���>T[@���jz+�@��BH�@�\��'@��A���?@�;��7@�5TԴ�?@����l�@��ctͶ@�g�=�&@�-���ͧ@�����^�@���H�U@Ş�
U�8        ?������?�����u�?�XHn\A�?׼��1�?�Јy�y?�9�"g��?�d*x�p?��ʝ��'@� ���@
����@f�}c��@�(��@�YW&��@鯦!t�@ 85[��@"� )�o@%D��KZ@(j%%u�@+���<@./~�y@0�~&�^y@2��>@4l��3@6h'��@8վ�[8@:���2g7@=���v@?q�ź#r@@�)(��u@BReR�@C��O�L@E'��]@F�;�X�@H9�Z��0@I��ª��@K�"٦�@MG�|b(@O0����@PzTO�d@Qp��`I�@Ro����@Sv���VI@T�<;�a@U�
�;�@V�x�51@W�ˡ��@Y#����@ZU�pf�@[�s����@\��o�K@^@�x�ؠ@_��"�Z@`��@��#@aA��@b o�j/ @bĢ%��@c��}�8�@d[���|1@e.R��H�@f�>��@f�X�'S@g�	��Il@h�����?        ?jx'�4G?���a�I?��>��?��E�`	?�Vq۸�?��DJ�?�q�-q�?�ڕW��<@�
�3�r@z�3�|@�M�N�{@��X��@"Dq��q@'���ُ@-�i��P@2��2d�@6�s��@<t��u@@䔏�l@D-��mp@G��j-�@L� @PXu�R �@R����@U�&��@X�@�	<@\E�� @_� C�Q@b }��h@d-|�'�@f�Bׄg@i�&.g�@k�P>y�@n�<h^@p��}���@r����
@tBy�G�@vaw�1�@xs��z�@z(�?`�@|Zz	�5@~�&���@�����d@�����@�/)jƒ@��X�!�@��@���;�3q@�B�u�@��񒮁@��)'ӥf@����&@�A� D�v@�C�c0+@�N��	�@�d̸	��@����0;�@�����I@��p{Q�@�*�@|Sm@�x7cT߷@��dG�b�@�6L�PF�        ?z:�<���?���4�[�?�A"d�?�+�ΕR?�̙_�L?�p>T��?�iLK�?������@�&Ʒ�@?0���@}�o�@��4X?%@^),@"���>@' ��M��@+���XtJ@0�dkx=�@4��쵎@7��]���@;ʶ+���@@*�eHO@@B��V�yl@Es̮rq@H|�/��@K̶	���@Of%�v�I@Q��v+�B@S�$����@V�d��@Xom����@[���G#@]�j3͚�@`\g/d��@a�ӂ~!Z@c�e�4�d@eM�5��H@g"�0��f@i�Q��@k�q�X@m4�6��@ol���v'@p��l�@rf�n@sVƪ
�"@t�'2��S@v�:���@wlQ�^@x�V��i�@zg�}�@�@{���ƸK@}��)�@G�1�а@������4@�g?��XY@�S�XJ'@�G�q�W@�CS��M�@�F�̷a-@�Q���,@�d�'#�E@��$��@���v��%@��~@�7        ?��z�8g@k�6ř�@5[���me@G5Ŋ��@TmM*fud@_���{�@g��p�?@os�g��@t�<�@z���H@��&*�I@���
�@�B �9@�T�o�{@���}�N�@�=ӟ�],@���W��@��O�l'�@�d����5@�x;XR)�@�]��:��@���f��@�� &��]@��(��W�@��b�8��@�9�^�@�>NB��@��D��� @��Ouu�@����=l�@�"�fW��@��Ʀ�@��T�P�.@�y�Ay�f@�񌥕�@��q��dx@�R�Q2Q@��4��@�׊W��@��f��8@���f��@���F�@��ODj�p@�ٶp��@��c��.@�uX'�@�1���W@�_&�a�@ʕ�����@�ա��O@�6�� �@�o��T�Z@�ʲ�3.@Зl��6@�N5�*ޗ@�	����@�����@ӎ�gU�@�X�X��@�&����@����@������@׬c۶        ?u�d���?�e�:l�?�^�؃?-?����n��?�b�Y#?�z��+'�?�|�=I?��&���@ ��ƌ�@��x@
�S��<�@��Ys�@�m��@������@��5��@ �Y�B@"~��@%$زEԇ@(�r倷@+�5�R4@.n�
�#�@1 ��K�&@2�rY��@4���1�@7"��}�@9sw٤(@;�ؐ���@>�E��=@@�"_�O�@B�te��@C���	n@E=�>\�I@F�D�8.@H���;@J�ڗ>��@L�9��WC@N�Z!��@PYJ�J@Qu�j��.@R�����@S���;@U�y�`@V^5���@W��2-~o@Yz��@Z��w�p�@\
��~4@]���80@_-�4�@`i�ㇶK@aCf[2�@b$a	(	@c����J@c���q]@d���@-@e����yv@f���Ӗ�@h��V@i���@j;��k	)@k`��y�@l�m��J'@m�w19�@        ?v4�d|�?�,�ü?�n
Woj?��)m~��?�ա�-=?��ѫ�@�A"�L@	\��c�@�!
�G9@!��;N@ Uߣӭ@$��ƟD5@*��?	��@0�9Q�@4�G5�sm@9 ���?@>L}���!@BCl�a�@EcѰ!u@IK��d@M,=��I@P�kV 3c@SS����@V	�#q@X���8k@\1�R�Ҷ@_��^�<@a�ʒ��@c����@eג��@h#?�Be@j�K4��l@m2�\�S@o��-B^6@qt��3��@s�LvJ�@t��Yn*�@vf�@1_�@x<y�y��@z*�R�w�@|1�E(��@~R�}��@�F�I|lO@�qлJ]�@��udj�"@�� ��@�F'�$�@@����Ö@��0Ǟ@�����j�@�1(#��@�ӟ����@����Q��@�%}�4�{@�G*� .@��!�@� v��@�;�:@��O�x@�,��@�NDţl�@�y	t+�@��I���(        ?Jwc�a�T?vGj�̿?�8�S^-?��$�	��?�O�[�a?؞�71i ?��)�%?���#�?��@L��D@���a�N@��u��@}{�QV:@�,�<{@"BL~��_@'�a����@.��/j@2ć9ja�@7'(��R@<5ݥ��@@��seE�@DFXg�&=@G���W�@L�Q+�@PZ}R�f@R�%�{~�@U�֦�b�@X�v〵�@\'cao��@_���*@a�>���'@d*]���@f_c���>@hގ�"@k�BMX�@njV�|�@p�����@r^ %Fn@t�[�@u��za�@w�PX&K^@y�ٽ��D@|�Qz�@~k��m��@�kDFA	@��؈��'@�A��.@�n=��*�@��
=��A@�q��7@�dl@����į�@��3R��@�\�^��@�$Ȑ��d@�%���@�1�ܿW�@�H�M���@�j�yJ@@��l=4N�@�������@� 6e;@�h��2�X@���)7P        ?��[:\:�@�*>v�@/jU��A�@A�R�O��@PHc�<mh@Z$�R�|@cA2sd/�@j�]?(/@q��j�@v����\�@|[�:OI@�YZ�2�D@��:���S@��D6�N@�W�z�@��"	�?@�aݰm �@�����B@������@�Aҽb��@��B�e6?@��K�x�@���K�;=@���AKP@����?<@�*I�hF@��G�0)@�7jǓ�@���ˊ@�j���@��V��@��>�p�3@�.���(�@���Q17�@���%�<@��.�_ҷ@��ص9�5@�`��)Z@�wN��~@�g ��@��@��~f@�؎�'�@�I��I��@ǝ��8�@��
��@�j��@��D���>@�l˜�>@���T��@�R�A*�@�+��R�O@���&MF@�����|@��_cY�8@����n@��4=,�@��.+�8@��3<Uώ@�%.�@�&�Z��@�M����@�|*A.�:@ݲ���        ?�f�!/�&?�~~5�?Ǩ�+��?ٟ�-��x?��'�]�/?��k J�?��1^@�����>@d��5�L@���>@z:0a�@w�΂@��y;@�@�WZ�@"n��[+�@%?M��y@(F��G�p@+���a��@.������@1Y� ��@3S7�s@5o��ȿ@7��{p�@:0�u�@<�=c��@?jG�)0@A're���@B���~;@DK?13@E�����:@G�`�M{@I���@K�:O��@M�����@O�ex���@P�?&��/@R$���@SW���@T��V�@U��f��@W/�}{#@X�B�z��@Y�@�0|@[h�c�@\�U��M=@^p��;;@`�،�@`���_�@a��H
U@b�}=�&@cmw��t@dVٸ���@eFF�g�@f;3y�N@g63#@h6��Ͱ-@i=�x�.�@jJHg�`�@k\����@lu�`�w	@m�8Cf? @n��P@�J@o�6�,        ?yV�����?�^^~,�W?ͳ�D$[?�p3Us~X?�=b��1�?�{�e�Y@�@���@z4ցX@A�^��O@"̗�ͦ@(�+�g@/e҅hb@4xķJ@9>��n$@?@!�(@C�kC@Gu����@Kx[B��@P:BG�F�@S =�؋@V[��'0@Yp��]no@]"%Y��*@`�3&Z�@b�lAR��@e K�<R@g�U��@ji����@mW�
,˛@p=Y�2@q����:@s���de�@u�g)%@w���@y�;�N@{��G�Z�@~?/補�@�[���@��#$�p;@�Q�,�@�z.���*@��[�b��@��`�@�E�z�3@��f���@���^��<@��ig�-@�f�D��D@�s?�*4.@��Һ#�@����7�@��!��<@����Ԗ@�[:��@�����@��g��s@�o=q���@���(�@�_i��f	@��#�aG>@���2��w@��J<;c@�b��x�        ?|���?��Z� �@?�YCvmL?�{�F��?����
?��c�??�@��a)@�{/��@��C�X@z��K@�@  ��h@%��`�)�@,cSh�j�@2F�t{+@7�^s|@<ʋi���@A���d}^@Ei����@I��p�b�@N_�pM�O@Q�y\�:@T��X��@W���5_@[U~8"�@_��1ݼ@a��Jh�@c��9o�@f�b�?@h}�=�@kC4Z�@m�/, (@pi�F�@q�]5S�H@s�xn�
@uPQ�vH�@wi�c98@yK$��@z��|mP�@}�Z�^@@�̕@�ö)Ŵ�@��*s��A@�2C�G��@�~��(/�@��gjU@�C��|��@��g�'/o@�G���3�@������@�������@�NǨ�C@��[m�
@���A�@���?G@��)!s�>@��'��
@��9���@�ޮ�
�@���G]M@�S`d�z@����@��ў��@�_���        ?��a�r0@"A�eF@=��iPΊ@Pq��V�@]��Oѕ�@g�����@qa�U�!@x�nU�@��yf�@�S�x��@�YȐ��@��Vy>�n@���J�#@� :��0@��`pi~@���v�R@��*xX@�cE��d/@��-�2@��b�uл@�g���@�o\(��@��JTF�g@���}��@�[VEǂ@�F�(z��@�L�3�I�@�nxi�'�@����xX�@���m��@��'$Rn@�4�{��@�]����@�Ò��I�@�7��@Ǻ�"�Ek@�KMw:
�@���P�%@̅̕��@�N���_v@�
���@����yZ@���Zj	@��:MÎ�@�҂��i8@��&u�y@�����
�@��0���@������@�^G�b@�8��/!@�_%��U�@܋��B�~@ݿ\t�y@��y��ԏ@��|VI@�(%z��@�em�'�@���Y|@⻮��3h@�k�Q�z@� ��@�աl�K�        ?f��뢢?�+2,�I?�=���?�k�U��	?Ґ~O���?��� 6 ?������?��D�&=?�g��1Q?�[����v@ �bI�@y3�G��@�"�X�L@�ߍ�j�@�!�#^@�%�@՛T4�@gd��ò@F5}��@!���.��@#�v|�"@&_� [&@(�g�|�@+��5<�@.�<�Bk�@0�k��7�@2e���d�@4%ꤗ�@5�@@g,�@7�G���|@9�L����@;�_&�D@=���nk�@?诿�I@A_�	-@B@Îd�p@Cvr��|@D�ZD*�@F m.E.�@GT��E�@H�����@J\' `D@K��˦_@MF�H�@N�`�mf�@P^���x@P���\@Q�!$qL@R�]���@St�Oy��@T[�y�ž@UIV�B�@V=@�@W7_��I@X8W��$�@Y@9�
K@ZO:-f�@[e���Z@\�L��0@]�����@^�ԨKͻ@`jY-��@`���wO        ?GY��JT?{���u�?���J_Y�?���U��?�F�E�3?Ԁ�K��A?�(r����?� DaUu�?�w��N�g@����Yt@	U�z@���%�@"k\�T�@ ��_C�@$�M�=K@*ѭ+ֳP@0��A�@4��3u�@9��Tx�+@? Q��!@B��TZ��@F�5;�@I�4s�
@N5IV��@Qv X���@T{1��@V�{�5�X@Y��%u�@]7�v�4�@`bvѽ�T@bI�wu��@dR>1d[X@f|��0@h�>�-�>@k8��q@m˄�#ő@pA�g>�@q�l��>�@s.)I�ka@t�y���K@ve��*,n@x�=e�q@y�%���@{�ى^��@}�E��8�@���x�f@��kSJy�@���9�;@�&��2@�Q��N�v@����_�@���	;�@��	 ��@�g�o^�@��2�Ì�@�1����@��?���f@�#���~q@�Vl���P@� �c@���?��@��'��@���z>        ?R*
��y?�� ����?�R66�3�?������?Ȃ��>��?�^8�-Gk?�our`�?��W0?�}''��@u=|�_�@x�9@�=vO�@��`2�@!�Y_��@'n/�~@-�+(��@2�]i��@7eE��@<B�����@A-�ˊ@Dw�Ҁh�@HC���V�@L�Fl��@P�-o��@S5�"|�W@Vjՠ�@Y.4���@\���9*g@`���@b�Iu�@d3��;z@fw����@h��m�@ks��<ʟ@n-ѭJ�@p�B Ep@rZRf~S@s���B�@uZ)��@w R�|E@x��m��@z�~v�@|��@z@��˲K@��C�Q �@��C���@� �<X�@�?�Sg��@���v��@��[
[P!@�Bʿ�Z@��N�8�@�+�,�$
@���� �	@�E�xgu�@����l@�����Y@����Pr�@��}���@�msO$�>@�[�Q`�Q@�O����@�JN<��        ?�j>���@Yi�@"K��@4B8���9@B2i�)@Lа�!�@U=?mN@\�b��&�@c���@hp��F�@n��e��@r�N���@v}��fq(@z���JW@q��i�@�MLh7�@�ٌc�.@�+tq���@�v����c@���*�@�e7�
�@�i��W�@�����|�@��j{'@�:��gÛ@�Ԅ��@�l�ŋ6@�
B���@���1���@�(a@�@����1�@�g�_F��@�)]	Nc@��<��f@��[�u�@�Ṑ��@�x+�ܟX@���S`w@���Z�GK@��E��@��kӿ@�-⿠��@�o�b��@��B�N�@�_�@�@�r4����@��
{(pl@�U�i<@�דaQ��@���2�L�@��#<��@�R�N�g@�+˨H�h@��t�@�� +@�ܴ��m@��5l�6@��G��x@�� ���@��wOZ"?@���9�L�@���	NE@�jܽ�        ?���`��?�U"zuu�?ǜ!�W??�S��	�&?���v�?��:�/`?��d71"?�)J]��@Rȕ&�~@	�e%[F�@�G��@T~�S�!@:�!�@E��;�@�u�ύ�@"d[��q@%%��E)@'����C6@+��㯿@.o�E��@1 z3��@2�_�i[@4�:��@7��dQ@9L�8"�@;�g���@>+�L���@@eO�$!L@A����E@C4�����@D����@FE�_!�@G�k{{!�@I���Q�@K\�D�p�@M1�w�@OH�_,*@P�V�)��@Q�2��t@R�ˈO2@S�2���@T�wn��,@U� 2@W!�{a�@X[+�L�@Y�h^h@Z���\@\=Ɍ�@]�_o�,@_��Csf@`9��wgK@`�t����@a� �Y�@b~�ڽ6,@cI����]@d�ՠ[@d�\$ˠ�@e����@f����3@g��� �#@hpf�n�@i\�p�5`@jM�w�4�        ?hۥ
��?���cۨ?��Ηj\?ȿG����?������?䘟���|?�M7�q��?�o����@��ٕ�:@���l�@�b�n@Yf?���@F�$��?@"�-tϘK@'�лG{�@.FN��@@2�CH�y@6�q3Q�@;��O�r�@@���	�@C��&�~@G_$&���@Kh�[��{@O�>Tyz�@Rxc�{��@U>��;J@XL�܅D�@[�D���@_M��F�@a�ق���@c�v���_@fz)�V@h��#9.�@kSuwvI�@n6���@p����}�@rL$V">@t܊SPI@u�X^@w��*Fy @y��{Vt�@|/3�l�@~��Z��#@�{�^���@��-��5@�!"H�l@��NWB�@�
J��c�@��*�
�@�:�U2�@��-E���@���Z�F@���6?: @�;�����@�;��6�@�Ed�Ai�@�Y:&lM4@�wL��E�@����mi@�ҵE��@�L6|(�@�X�wX@����uC�        ?b�вt`�?�G1�p�m?��x��??����)v�?��&Y �u?۪����?�P��S&?�V]�w�?�>��U@
]��/@	;�,)�@:S�R@����Η@��C��@"�B<�@'�T�Ș�@-�ۿ��@2^gx4�@6U��:�@:ޤ�G�@@�-�ޒ@B�E�~�@F%^Z�y@I�>����@M��MUT>@Q��@Ss�X<@Vڣ�3i@X�E����@[�!��a�@_Hv�i�@ak�<RR�@cS��l�@e]�S�8_@g��"T/d@i�P�@lN��<�@n���:��@p���&�@rH�,�4�@s�#g���@un&���@w Z,��&@x�89�@z�;�� @|���;V@~Ƣ����@�t�Qk��@�����E�@���m�NV@��L8A�+@�6��u�H@����@�䮣���@�O�M@����@�O�#��@��՚� :@��_�Kq~@��EG]�@�}�����@�e����#@�Um�)        ?�2�X��@�a���b@4�A�[�A@E�ȿ��@S<s"��$@]���E@e��/�w�@mE�wo�@s$�'�@xGz�qP�@~t �|e@�E|e8!@�۔��4�@�Έ,�H@�!m ƽ@�k�gC_�@��#�\&~@���[hl@��m���@��@�0�I@�,����@�ȟN1�@��Qm	@�4�v0C@�A��5�S@��~⇽'@�8d)@���w"r@�@eV���@��ϕ��@�C��>��@��c1Y�@��ތ�0"@�f��Y�P@�Ikqoں@�B��K!W@�S9~���@���o�@�ݲ��@�	�p��@�BA���@Ň���@��fzҕ�@�6`u�u�@ɡrbU@��6^�@̝Pl-g�@�.���F�@��ϥ�Bk@м�,�1@љ��+4�@�|��Z��@�fͧg�@�WZ8��9@�N�0��l@�LFJ
�t@�P����.@�[��4�@�mq&�L@څr�@ۣ��� �@�ȠMddu@����ə        ?j#I6�?�jɣ{e?��
��?�I�٧�?�'�C�t?�
�Ҳ�?�{,A�Q ?�6\P��?�t1�K?�{8�Ǉ�@($�2h�@�����@@	:P��w@�)eO��@���s�e@H-G�@J����@��l\��@@b��@ ��x{�@"�yj�@%��Nv@'Fl����@)�v�n:U@,8��k��@.�izF�@0�"0�*@2_���@3��P�@5��V�V@7T���S@9$�m�@;	�Λ/@=���x@?�}"��@@��̪u�@A�1�{��@B��6\z@D�Q��@EUZ�mm�@F��c��@G���\O�@I]���@J����@LLX|3z@M�`6; �@Op�9�@P�+��_@Qe9ަ�N@RFMf�[@S.&܆)@T��&@U����@V�_��@W�eBy!@X$��@Y8� V7@ZT2g��@[w�;��@\�U��%�@]��~yh@_�K@��@`&>�lE        ?[�a�Yf?��1��}?�@�ڸ��?µ�T#?�k�|�?��%4ZoX?��O�dF�?��2<�Tw@���'k�@
E� WS @�i���@�MQ�@!E����	@&�S��Y@-�w�H�@2ʻ'�ь@7�Qx���@=0b�Cv�@Aة����@E���1�}@I���@N��>���@Rשh��@Up>uӪ@XW�)��@\����R@`�����@b5��k@d�C�Y��@g/��A�@i�X��w�@l�ef�@@p<N�v@q�gDm@s�|�� @u���,o#@w��|��;@y�r���"@|5�zf�J@~��"R�8@������/@����U[�@�e�y
 @��n�ۥ@�rꊺ�o@�[	+y@��h,:@��g�/9e@�g�����@�Sˮ��l@���V���@��O�u�@���p/��@��v_�@�?'ܿG@�>U	Ru�@�z�Xm�@���\�%@��(l.a@�p�T�u@��_���g@�I�@f@��<�bc.        ?ZW���i_?�v����?���f�
?���z]�:?̌��v�?�;�H@&?�B��]��?��<R0s�?�<�-G��@
T�-6@� �<�@���k�@�->���@!�C�%@&�I~u7�@-~�)�L@2)�؁�@6j%G��@;Oْ���@@rq���@C����G�@G"���M�@K��Ad$@Oj���@R)��#�@T��(�@W��y'u@Z�>�x�@]��˴_j@`�E���@b����H@d��1?�4@f��p@�@i�`�@k`���@n�@4+@pX��I�@q���^�@s3�+*�-@t��Y(��@vQ�Bv��@w�G�UO�@y�~7���@{}�<B��@}Y�x@E��\�@������@��z͇]�@���@��{�OX�@���h�@�!��9@�Ve���F@�����n/@��� �@�-+��@���rh�0@��0z�z@�ZL91@�iV(��@�*	���@�����Q@����|)�        ?Ӂ٢�A5@�ݴ*Z�@ !�0@2D)Uo�@@��v�a�@J���Q	�@S�[�&	@[j�[��@b.�<�[@gU;(u2�@m-S�?��@qݪ �eT@u��x��2@y����O�@}賶��d@�Xgs�I@���C���@���g��Q@���*2��@��#`��@�8�~^�@��h7@�Kc�b@�b
��I@�P�;m@������@���Z;@��u�y�@�5����@����$v
@�#Zʹ6�@����p�@�XO���@�IJY��@���OZ@��A�t @���w�@�S6�g͚@�_LO�@�uϣN�@����h@���H7@����.U@�;��[FN@����	�&@��u�
�@�E���׏@��)�1(@�0�9�;@���B�X@����8@�u`�z��@�KIbP@k@�'g�щl@�	�VYn@���!R�@�ᜅp~�@��#��!@��+�]v@�ՑC3Y@��|Lg�J@���ʈ�@��-���        ?en��k?�;�Y��?�gi$�\�?�n)<&�;?ѝ~�t��?���)?䢑M��g?쌛L�?���I!�7?�?w��?�KK�{�@��=�@L��Ǔ@
t�9�@���s�@�̓fn@���.�@�*����@�ۗФ:@8�Y���@ �1��@"�u�φ"@%ͣ��}@'V�s��6@)�:�i\@,\��Y�c@/*�G�@1�O�	@2�~b^s�@46�P"� @5�w
h�@7������@9��NU@;�r��y�@=��E��}@@
�p��@A5v�x�@Bm�y���@C��w�@E��.�Q@Fi���n�@G�|���@IX�_��@J�Fݮ�@L~�w� �@N&��YL�@O�T�@�@P� ��qW@Q�s����@R��ǥ@S����]W@T�e�Pw�@U���@V��#֌�@W�%FϦ�@X�`S^�r@Z]²'�@[*w�0�@\X����@]��Bpn�@^ɣ�`6@`#��,@`���r�        ?Bei:���?u����?��1o���?�{�ot�B?�1"��?���>�F?�e��+!?�`")���?��7��?�,�" C>@�uY��@���WA�@��� ;@����@",q�>@'>N^���@-<O�]�e@2�o��@6'�r�q@:�tE)�@@��{wB@B����]@F@�i9�D@I�}/�H�@M���Ζm@Q5���r@S��1�W�@VL'�<�d@Y.�Y�@\L����@_�����@a��Gϯ@c�r��@e��y�l^@g�%ly��@j7�Z���@l�*L��@o^�B�(@q�����@r���b�@t!���a	@u�� �@w�W��Qr@yQȓ9�@{8���}�@}5�k��@Ju��@��3��@����@�*Z�@�EM�ڶ�@����fG@��`!��_@�?��@��@����bZ�@�'<�~�@��É&�k@�C�{�
@���m�s@��ưL^@��"����@����乯@�.�O]z        ?h"!�% ?�Ƃ��J�?�c�/=��?�*y�:�?�vp� j?�34��?�����?�:�mg�@�8��@�	&+�@���)�@D=I^�@
�9@"�gg,@'����[�@-<Bra(0@1�{M��@5���@:#C�r��@?�rÜ�@BN�x�]�@Ee���:@H�Kؘ��@L��ix-k@P`B��_c@R�@�}y�@U\�hDR@Wǒ;G�Q@Z��<1@]�AWUh�@`�`;^�X@bY��0��@dC�N�_@fN}w.u@hz1��Y~@j�����@m;��<�@o��ސ=�@qF�k >z@r�E�s[J@t=21��@u�6rn��@w��2v@yFJ(ͪ@{5b���@}�i�?@�e�@��?��ߣ@�����@�Ҫ���@�5H�K@�?��38@���-+�Z@�ޓg���@�@�ֿag@��%6�@�,r��U�@�����́@�L���X�@�x�ܑ�@�Q��˅�@�1�"
�@�E(�?        ?ә�\� )@�j�E��@ ns",Y@2�	A�]@@�J�*@K=�-��@T����@[����{@bW��Z�@g�G'��@mZ����@q�۞��@@u�g����@y�w7�L�@~��W+@�q׶��\@��L,�@��9&c�@���.ԇ@�]���6@�{��r��@�j�Ml�N@�}�px�@��`�x��@�7��@����V@�D����@��l�-�@��'��@����DT�@�P���@�AG��@����X]*@�߭�e�`@����@� �pV@�����;@���k�fD@�ӡ~�{@�H�8���@����t�%@���N�b�@�b���v@���3}�@�`�GH��@��i�]ch@����9��@� ֍�@���\�U�@��k�p�@�����M@���L*�@Ļ6�(n�@Ż�i��@��&�T@��[9��D@���dH�@���|��@�!j	�	@�I���2�@�x��n��@ή(g�3�@��l_�        ?cJ��(h?��"�V�?�qV�
&?�
mJ��?�E)/]!?���9z��?�V}]��?�z)3�t�?��pl\�?��h��
b?�L���@ ��t��@.��^�@��`�@)K�h
@]�WUv@�Q"Iu@��?�wz@|�w7y@�Ď'l�@
%�f�@!Wt��AT@#J�ͽ�j@%_X�	��@'��+<�J@)��fy@,p����@/�2�@0�^���@2i|A g@3��4x�@5�.�@7NU�ڸ@9�[F�@:�v�@<�M�J@>��Ȧ�-@@�f98�$@A�HdW @B�8��@C�k;��@E;��_I@F�t%Jp�@Gק����@I7؞l�@J�)�e�#@L�IB��@M��+�f@O3*�u!�@Ph�B ��@Q=��Y�f@R�f/�@R�j�&�q@S����@T�	�Oy;@UƤ�D @V�^42/@W�&�4B7@X��n�:@Yձ�J}�@Z�_)N�@\ �i���@]g2��        ?I�]��?~�8��v?�~Rk=^?�3,@`�?Ǎt�E?փ?8���?�"���?��ɠvM?��+A%�@?�b
�@
�*u@	�r�@_���/�@ �
ǒ@$��Ժvz@*`�1F�@0y�� ��@4J<
b՘@8�kN�E�@=��O���@A��΂6I@D���@HHK�/�@L'�#�Ǵ@P5���3�@R�Y;gU�@U��Z��@W���D��@Z�q׹O.@^�ǌg@`�̧l,�@b��}�@d���{��@f�޻�o@i ���@k������@n*,4b��@pub��#B@q�q�c�-@stӫ�KL@u��_�@v��p��Z@x�b@}��@z~{����@|{�c�i�@~�0���d@�_�N�,�@��0�@�@���F�?@��C)�@�?i���@���>�|@� ���!@�v�o��@��-6�R@��S5�#@�0dK�E�@��O�<�@���'X@��qJa�@���nj	�@����ZW�@��A�!�        ?Wht�D?�����qw?��� �ʔ?��) �)Y?��v��5?ػ�2�?��4��?�A�5ݟ?�^��#/�@��DOT@
*kA{�@�;kk
�@�$MD@s;ۇ^O@$.�#f��@)s�?��@/�8���@3V����@7^�P�Gb@;�[��@@���a1~@CS�垨@FoT.>@I��6!�k@M���Zq�@P�/]�((@R�|�0E�@UPq��_�@W�?�m�@Z� ˑ�@]d[,\<@`9��%��@aْ��-�@c��Q}�&@ee���ɏ@gS!᡿+@i[�<��@k�+&�@m��~h�@pmN��@qM*0�(@r��(@�@s�/���@ua�9��N@vݦ8�@xik��P�@z�x�!@{�W��]�@}pV��@>ݑ��@������@��x^w�@��F���@��	?���@���l^!@�ŖݦU�@��iig�@�?��@�R���@��҈��@��q�]��@�.�&k�@���2�b        ?�jmVo�z?��U�OX@C�t�V�@+�,^�0@9^`���6@Duu�t��@N@�rT6@U'�9k@\4e܋@b�f@f��ZT�@k��bzx�@p�w�%E�@s�M _��@wW�f�#l@{,+�UR@]�*{g�@����L	<@�ut�EK�@�'�����@���%@�5:��@�J*D!�@�x��v@�zڸg�@�&PO�@�Et��@��_9��z@��)<
�@���"���@�5B��-�@�����;x@�0�Õ]@�˛"�)�@�{���?@�@�+��@��h8(�@�
�LqK[@�p5��w@��O����@���k.��@��l#o@�,� @�C]���@���%���@�⟺=U@�D��=]6@���ԫ�@�/��:��@���"k�c@�Lٻf�b@�wF�r�@�Ns@c��@�+�X�@���;�@���8	u@����u@��]y"-@�����@�ߓ�`i@��X-g@��4���@�'6��N        ?w�����?�-g���?�7�Z1�N?�ZiW��?�i^�V�?�L�R��.?�mѕc�,?���ᗌ�@��c��]@�[L�VP@u�0>�@�Cә�D@��Xu@ؚ�9�@XT�N%@"T#f/@$��%�(E@'�Z&�3@*�Ȥ�'�@-�?z[��@0���x}@2Z !�@4>��i\@6<.�nA@8T���h�@:�m�$�@<؛��O@?F"��/@@�� ��
@B>jbQ@C���6@E�l�_@F��;1FA@H.|,r(j@I��<��)@K�B4���@MHYo�H@O=����@P~�s{��@QxT-���@Ry����z@S�"��)\@T���:�@U�`��Y@V�=W��n@W�Y\�%�@Y,�霊�@Zg��2Ua@[���O@\���� �@^J��`��@_�56@`��s@a<��u��@a�Ax��V@b�10�+L@cyO���E@d@��X�@e$x��@e�߳1��@f����@g��{��4@hd4[s�+        ?nX��9�?�M	S	��?���C�X?�8�La�/?���9�;�?�KCxJ�?���]�@n��� @�l�2v@p#b�e�@O��/��@!eᗭX�@&�]�V1�@,�j�kQ@1�����@63�����@;��K�	@@K�Rv�@CjE�C�6@F�Y-��@Jō"I�[@O�W��R@Qَ��4y@Tcsᯢ@W"���@Z��d6�@]EHp�@`T��p��@b"��J��@d��o��@f���@h5��V@ju�`�1�@l���V�@oM�Q�@p�6~u&�@rN�B"�@s�$&[��@u5@�f��@v���Rs$@x\r@�C�@z	BϘ7�@{�go�:@}�F��T@yHȆ=<@���;פ@���s��@��&��@�߄_@��@� ���@�,�<3@�c��w�@��	u�J4@���Nd�@�F�)�5\@���JӬ@�E��F@��©��z@���t��@�QyE*��@�KY���@��pw��@�̱���        ?c|\��8�?�����]?�����}?ũZ���R?ժ�f��f?�@�MiU�?�3�d6?��ͨ4E$@[h���@
kC��@s�l��b@GDuK�@ ��ۿ
�@%(�"@+Ԏmx�@1��
��@5�_x/[�@:��'�Z@?�g�, @C�yN�@F��`� @Ji��>&�@N��D��@Q�<�٪�@T6h`�(@V�`œ� @Y�����%@]6�R�H�@`X�9xE�@b5���&@d30X�É@fRL���@h�����@j����y@m�ؿI�@pWa@q\�2�@r����@t�*����@v.ǜ,Uz@w�.�@y�{��{=@{�gC��@}��v�g@�v @��7�mq@����`8x@�%�V��@�Z�oD��@���a�*�@����6 @�CЌ'<@��Q��y@�S3��@��|w_�@�/ͽ�L"@����b#@��)M�Y�@����
@��cz	t@�m��b��@�cd�պ@�`��Qx�        ?䜏߁�{@FHU��@1���
@C2�o<�r@Qr���q<@[�>���$@dWJ�<2^@lk� @r|�NN�@w��mc�@}W���L@��8[��}@�g���@�DЍZ�@�y��|G@��m]If@�v�&vg�@�<�ޡ�@���Bѧ�@��%yh�@�	��3��@�0�"�c@���	2�@���w�p�@���Kb]@��EVn�@���[@�A��P|@���sk@�q/��@�Z����Z@��՗UU�@���_@��YS̐@��9���@��mO��@�[��TF�@���c��@���gG@�T��Q�@�E�IҰ@�>����@�?c�}�@�G�,qW@�Xh���@�pչ�C@Ǐ��~�@ȷJ&^}w@���� @����U�@�\���(�@ͣe��2@���n�p�@�$.�Py@��[�_g@ц�)Cg{@�=��Q/U@�������@Ӹ@�|�0@�{��7�@�B�e�@�J|�nt@�ݝ��o�        ?q��юWB?�揍�e?�QSt�x?ͥ�;]m?�k���{�?��i��?�M�Uͽ�?���a���?�w�_�ka@�����3@Տ���@
��+��@����@�m����@N4��7@�%-�;@C�@ ����!@"�og�E�@%`���@'�8M,�@*$h�X�@,��g@/̖���g@1n�ũ:K@3J��@j@4��qx�U@6�f�I;@8itd��@:a\�gڟ@<qD'���@>��%�id@@ms��h@A���	�@B��1�-�@D�v�@Epu7��@F�g����@HB"�l6:@I��!�i@KL �dʍ@L搦�]�@N��ԎT@P#����@QL6�!�@Q�H�5fF@R��?�2�@S�6M��@T�E��@U��'@V��i�p�@X9Q'{�@Y7W���@Z`�-�&@[���G@�@\�U�Ռ@^�A'@_S�'��@`RxVs4@`�a�6�@a��%�/�@bd�`�>@c���g�        ?F֣U3��?y���D�?�a�l�}�?�Ύ?���?���w	�?��h"se<?� ��aam?�����su?��x�m�@]z5�}�@����;@�����@9��@"�T�K�@(F00,�@.߱�o_u@3L¹���@7�,��k�@<����Z@AT�0��@D��ҽ�@H3�\�-�@L6�(�{@PP*�,�!@R�[�X$@U[��!�@X5A���Y@[I
Kq�@^�Iq���@a*+���@b�8_��C@d���]�@g �Q�k@if�Q��%@k���f@nW�Ɍ�U@p��Ue�@q�� x�@sc�-$�:@t��c�Km@v�"
�v�@xC0�z@z	�Z�Z@{���)��@}Գ��$5@ٔFi��@�� 7e{@�0}h2�@�5�ʞWx@�dI�ٰD@�����g@�䚑I|�@�6�F�i8@�����$@���n�+�@�u�`�@���cF��@���l׬@���|wl\@�g��O^�@�CNh���@�%t�s@�MT-��        ?i.0��?����ŏ�?�>�վ��?����]?ׄ�DO?��ѱr?�V��R�?���Y��@���(@/�m�@�q�U$@�"ō �@! *�/@&[���u@,�s��3@2!+�T:@6��$/��@;ȱV�r@@�6��@DN�$�\|@H-�Ma�@L��s�O9@P���F�@S^Ԭ�F@VS2�E�@Y�&�P�@]Ν�b�@`s4���@b�z��@d�~��@g���}�@i��`K;@lS��ђ@o1 ؊	-@q��E�@r��I�\@tf���d@v-��e�@x����@z �Y��@|- �T;@~1Ĩ��@�7X�-V@�b'�]�@��{��է@�݀.W�@�._s]�@��C����@��X����@�o�P��@������O@��|�Hg�@�+EV/�@���o {�@��bw�* @�����ƞ@��l�	K@���ܶ�@��}���@����p,�@��<)�
V@���S��D@�����        ?�'��UI@�ڦ��c@'A�yZ�m@9]Gړ�T@F��#�@Q�y��U�@Y�w"�� @a�CؽVC@g����@mnZ�@rKR���2@vJf��R@z�[��*x@�?FC��@�n�S��@�N��*Ο@�i�-I�[@���`�
@@�Xhs�@��dQ�
n@��6�u3j@��U9Pg�@�i�x~T@��#o�SB@�&9h�0�@��iR��@�^��~@���Z�@�u�a�U@�q��@��;_�F�@��q��3@��u��<@����9�m@��rڞ��@�����@�2��d4@�+7�F�@�`�9�/�@���p7��@��|���L@�Jެ*�3@�����9#@�&�i��@��7G@(�@�5�t2@����@��P�2@���e;�@�}�"Y�@�g'y�?@�XFڊ�@�Pp� ��@�O���T#@�U����]@�cP��c@�w�c�,�@ʓǽLhP@˷\��@���]�@�榟i@�M�T[v�@�Gg�K�        ?��
,>�?� k`>W?�����?��c�=�h?�Vͤ�� @�.Ξ@	E4h�1}@̴����@�`�h�-@��PJc�@ g�4DA@#�|�`��@'12�H�P@+ ��J@/�-��$@1�U&6
*@4w�'\@6��d� �@9*b��P@;�j��@>ɽ��1 @@�����@By���t@D��3d@E��,{*T@G��0�9@Iv{�&@Ka����@M]��4�@Ok���@P�ù��@Q�Jyxt@R����@Y@T#�\�7@US!贜@V�k��D@W�eL��@Y��,F�@Z^/]�@[����"�@]C���k@^v.�a�v@_⸀�K@`�t>v�@ai`M�$@b+�X)@b�Fv>�@c����@d�S�s�T@eXr遨@f-w��zU@gmz�>�@g�[|2�@h�KJ�q@i�I���	@j�iW�@k�4�f�@lqC~�ZU@mgL���@n`���?@o_�<@p0�%B��@p��x��        ?�G-Q���?¿�l]I�?��4m���?�3Au�.1?����[w�@ě�^�>@
2_��%�@{��@<��Fpl@ �~Y�n�@%�X|��@,N�2�@1�Pn�w_@6�葠@;B�g.�p@@�����@D��&�@G���,-�@Lj@{�.�@P���p��@S~@Ƌ�>@V���m;5@Y�g	�4i@]�K��@`�/&��@c�4l�@ew)�V2�@h��?@j��z�h%@m�����@pYpYg�@q���G(�@s�r%���@uw�j�@wW��B�@yL���@{T�Γ��@}p���v�@�Z�%��@��EI#�@��"�qw@�N�8�vB@����^�A@��G��Pi@��ud@�rZ�o�@����L$�@�7کc��@������@��_��@����\F@��t���@�^���j@�,�|�/=@����f@��oW�@���H¨@���n���@�y��&@�d�S���@�V	7��@�MB>A,@�J���HA        ?o)�Z�NR?��P��?^?�9m�5?��~I0�?�iQ��?�>��H�S?��h���R@:�]r4�@�/���@w�ɛ�N@��T��@���n�@$��p��@*Hjb�b�@0�!rk=�@4�]��@9(�r�4�@>x�m�@BA�4�$@E�6���=@Iy��A�@M��E��@Q3� +9@S�M�S�@V�r>5�_@Y�l���@\�Zsz�@`I���v@b7�G�{�@dJ'P�@f��g�@h܄d@k^��F�@n妝�@pj5N��T@q�uG��@ss���%�@u�yh��@v�C6u�@x��;2�@zujm��\@|hf|,�-@~oɥ��c@�Eױo(@�^<De�@�����#@��۔1�@��|�@�'ǔ���@�t�;-@�̓٦̷@�/Gaxmk@���5u��@��w��D@����la�@�S�7��@��~�}2	@��Pm�@����X��@�j��zY@�N�d�t�@�8�,�Q2@�'�Ph1�        @A{��t@?/�2��@T��fKs0@d.q��n@p�դ:Q�@y����@�����Lo@�Z��Z�@��\�zߤ@���w��@�ٟi�%@@�aD���@�(��E@��G�Gd@�����G@��4ţ�@�|�!9�@����@=�@�����@��nkT��@����ۓ@�ɖ�H=[@�i;�q�@�lC��p�@��Z�'��@���!��n@��5�@�}>P��p@���EP��@�t�R�L�@�j�gŒ@ɤ=���6@�P��?�@��~��@�ӟ�(,~@�T�jo��@�F����@�>8I���@�<��<@+@�BSl��@�ND�J~�@�`���K@�y����@ؙl�0�@ٿ��X8@��(�M� @�S&��@�YX<��@ޙ��@���A�@��^�t@�Aౕ\m@���K@⡚��@�V�)RC�@�A:t�@���@!�@卉�U�M@�Rn��@�C[x��@��L&@�"�6i@鉬B��        ?|�Gi���?��ސ�?«�ڗwi?�^?���?�==�q� ?���l��?�"J�o�?�*xo
`_@J:�)ۛ@�PC_�@���@�پ��3@�K��R�@�14�|�@zo�B�@"<�L�@$� ��(�@'�\��@*���xw�@.O龄_�@0���@2�a�X�@4�h�A�@6��c��u@95�J	]�@;�lJ�e�@>��QD�@@S�hƠ�@A��E���@CU���@D�2�,�@F'��'@G��4N�l@IuY���g@K6aV�"J@M	%��6#@N�Ë�Pp@Pr�~��@QvE�MH�@R�I'ׅ�@S����@T��6���@U���@W)���(@XG���@Y�f����@Zӌ0��@\&b�S[@]��-u@^�G9��+@`)�sܛ@`��n�6@a�_��w�@bhn�A�@c0�B ��@c�����@d�z2扂@e�S	]��@fq�ob+@g]��N�@h@��]]@i&q���8@j����        ?s8>{W��?�k�"���?�j�	��*?؜. ��?�Ɏ�>�d?�';�Hb?�`�r��@u�?�@F�[��@ExA6{@��k�M�@#u2�;�@)�!�fL@/�;�O @3ө���@8}�V
�<@=�u�։@B��n��@E��u�@I��;o�E@NUTJ@Q�懺p@T�d���@W��_�n�@[;$�=�@_
I�_�X@a��y|�@c�٢�d@fJA�
�k@h뎂�#�@k�i?L�*@n�~�Zf@q�yj�@r�����@t�Ч_@v��`�@x�`x*9�@z��N�[@}"M����@����<M@�#�ќ@�p�:/-7@���w<�j@�\��Öb@��B�_�@��V��V�@�Ix�0@��v�@��L�6@��2
��@���1/�@�|�Bne@����Ya@�>��t@�lH&��@������@��X[�ܙ@�6��o�@���r�0z@�����i�@�e�D@�ᆄΏ@�4;dF        ?��@��?�є�8��?�c����?��¢���?�m� z,?����l�@FO��@
�1�th_@�\�r��@\�d@!����Ic@'>6�!�@.(ī�t@3@���=6@88E���@>��1��@Bk"��@FP{~�:@J������@O��8��@R�!����@U̒��R@Y?�E&�@]=�C�@`�zؠ�p@b�@y�֜@eR��!��@g��Bi�@j���GT@m�P��{@p�g�W�z@rbV��&�@tD z��w@vD�"꾫@xdRK���@z�;�.�@}�D��@�n����@�ψ�4@�z��@���%�[a@�x7�Ř^@�2�GNc@��R�s�@���y��@�X�V}@�B�;.��@� ΑB�@�*�8�Q�@�?����@�_f)=w@��L 2@���
U�`@�0�0��@�O�
�I`@���N
�/@��i3g@�=�:�@���ܭW�@������@���h���@�`+�f�@�85���        ?�P��}�"@@фl��@7��Å �@I���,�@V���3@b-��V��@j�r��Oc@rH'�)�@x)X�,6�@~��ap@�P�˺	@��$�@�t8�D@����Lg@�Я'2O�@���� @�~���X&@�E *�ۭ@�,Q���@�]��^6�@�����:@�=���@����c�@��0K~E�@�k�XH�@�9'�Yb@��X��r*@��6�X�@�lߤ� @�h�#�-@�|����@�������@��tL�b�@�'0�N4@�c?�	:@ë� $zJ@�`��@�c��R�.@�҅8�`�@�NT{%�i@��7��f@�l�q�p@����@ϾMc��@н)߅A�@ѡ��0�_@Ҍ!e�?�@�|�kr��@�t�ɑ�@�q<�<@�t��֧@�~8�۴@؍�-�6�@٣J$�=(@ھ���!�@��mcc@�ʉzN@�4��giG@�g�hצ@�O��@���9z�@�i��z�@�4�(�ȹ        ?r@EQGJ?��]�b�?�]����?�z�06m?��ˮ�?�wG��g?��Y�R�?�e��a�B?��ɳ�]�@0�9�J@r�ܓ@
;��\E�@�����@����O@�<j�+�@���[�@Y��#��@ �8�@�@"�)�F�{@%a\�4��@'�q�+�|@*�����7@-�]#�+�@0O"Q�@1��L^�@3����'@5j�6��o@7K�B)�@9C��Q(�@;SD'��c@=z5��#@?���D�@A��#@B?�}lj]@C���»@D��`@F2S")�z@G��<I�@I�js�@J��#��@L*J��C@Mɉ��@Ovn�:"�@P��mZ@Q}��q�@Rh��H�@S[��\:@TVB�@UXqb�@Vbj���@WtPP�֋@X�G+�x�@Y�q���@Z��Iw�@\�sA�@]I�_��?@^��8�6D@_�����d@`���[�@aHC�kA�@a���I
�@b��ٜo�@cs��@˅        ?J��K��?�]����?��n$�ַ?����N�?Ⱦ�O�wr?�H����?屃Ag_-?��3=j?�^V���!@I�u?X@��:�rT@x�Q�O@+��^@#U�
[#�@)L,#� @/�pI`խ@4��j��@8�]d�PC@>*��_��@B-/��0@E���(6@I���<װ@M�o|�K�@Ql!��~�@T��
��@W
�cyP@ZA1��@]�>(�`@`�WL^@bѤ�n@ec��@gd��N�@i�T��D@l���@o�u�
�l@qM�Ȇ@s@r�g8�@t�]8�J@v}T�\@xjį��@zsFU���@|�A�Z��@~�q���)@��I���@�׳9�@�$T&���@���}�|�@�����@�i)�T�@��I�cl@��p;�E@�C��h?�@�Dd%T@�خV��@��J�5#�@�۬�M@��n'5@��rX�0r@�1Aٞ@�/��@�]>5��@��܅W+@���^]        ?]����(L?���E:�?�lR:(�?�As��:?Ϩ�7�?ݸѴ>%6?��첉��?��	���@ 8�*}�@�C>/@��"�@��|�Xt@����@$����@*�^Y�¿@0����@5C�2@9єc6��@???�l�@B��:���@F&�P�@Jn���@NI`�׺.@Q������@T���(�@V��9%%�@ZY�^a�@][���@`|N>��7@bndʳ@d��p��@f�#궉@i#�f�\@k�����@n^_��A@p�r=�0@ruy�
@s��7S@u_���I@w�t*�@x�����@z��+/�@|���'@}�k#@���d�;@��S��!�@�����@�,	^~�=@�u_���$@��@�1\@�-���!�@��6���n@��U���@��Hzg9@�9���"�@���/�@���3Z��@���@?�@��N���@�{�M�S�@�pm6`�D@�l?����@�oC���        ?ؔ�U7�@���y�@"q�Q��@3ѽY��@A|��Ya@Kft���@S�e�M�i@[<j���@a��{ڄ@f�T��pp@l��SS@q{A�@u����@y�12�@}Xp�@���<A@���%�H�@�hk�:(�@�i�9d6@����@�	^�x@�޷"�@��!���@���1��F@�gWϦ�@�Y؅�_@�Ï�!�@�K�G�86@���pe��@�\�O��q@����2|x@�R�޸�Z@���h��:@���[U�2@�=��5�	@�Kt	f8@����r��@��3����@��)f8lQ@��N28Z@��ڟέ@�yӸ!�@�.٪���@�Z�ʇ��@���z�@��o�IO@�*�_	2@�q��K��@���,qCy@�=!����@��ȒgB�@����e�D@�a�,emh@�.�l���@��Ah�@��ކ~.�@ĺ4�J�v@şގ��@Ƌ�?/�@�~��`+�@�w�Q�A;@�w��£�@�~KKr�        ?f������?���yW�?�������?�}���?�}5D@C�?۫	��?�& �kl?����U?�B���}�?�P�^��?�`w�j9@���œ@A�B��@	'fjq��@h�{iw@ �JF�@��w�-@-~�@�'@	�NQ.@�c���@R]��q�@!_�է?@#.�	g-Z@%/���@'�6[q�@)4��4)�@+k���V6@-���sM�@0ځyA�@1[3���f@2�/��K@4�}�@5��_�@7�L� �@8��;��@:7�.r�_@;��>\*�@=�{��F3@?|���G@@��#CK@A���PN=@B�bO$i@C�$�O@D�	���@E���Nt@G�pw��@H<7��@Is��z�@J�ص�@K��Xh�Y@MR�t��@N�z����@P
�%�l@P����do@Q}�R�H+@R>��#��@S�Xr�)@S�c����@T�	��BG@Us���@VMc&�|@W,,ռ�@X�4�        ?kz;D�׊?�Z��P?�C���+?��K����?�ťԉ�?���?�6�1���?�G�K@��I��@
�5�~�#@S�d ݧ@�}u��P@ !ٔ�.@$˼Z!V@*^܃�1�@0w�i��@4I�|�@8�[S-9^@=���&�@A����]@D��hh��@HH��p��@L ���J@P+�0n@Ru��<��@T�^�v�@W�sC��@Z�.d@]��a��@`q�L���@b3��1MK@d�H��k@f�`�@h%�M
��@j\�Q.�@l���H�@o)4�`�@p�әE-�@r;�k�}@s��+$�@u'����@v�$\�@xZ�EYN&@zbN�_@{��p�@}��)�p�@�7��d�@�������@�����c�@��A��2@��Ӂa@�B��F�%@�x�P¤@��B���@��V?�@�^5�*��@��#�n�@�/����@���:�̻@��( 0>@��swc��@��?�?��@���}�%        ?B�,�/��?rbFlC
�?��+��{?��v���?��J����?��7��¶?�Z�	AS?�n�F0�?����8�?�	�|qs�@
��h�@
��>	�@y`q��@��J;�I@ '}O2-@$�c�XI@*+vӼ/@0"�b�a�@3���w�Y@7�g���@<HX�Y@@���Q@Cu����@F��rHd�@Iۭ��S@M{�0A/4@P�B�V�@Rθ�փ�@U�h���@W}2r��O@Z,z�u�@\��)���@_�[߆@ak 7�z@c���~k@d�ݻ�Ώ@f��h���@h�����@j���?C�@l�����@n�ϓ�@p�P]6T@q޾[�*�@s(��L@t�����@u�g�)��@w`+��@x�3�q*@z����>@|*Ȍ�&L@}�6:?N@��C�yI@���\?٩@��OAM(@�ƉǛ�L@�����D�@��@r�>U@�C����@�:k:K@�q�u�@��8�<%@�!��p�@�^�$�i        ?ײ.CZ+}@zz��e@"#��6$@3�Su�Y\@A����e�@K�EL9D@T7�)��@[�c��@b$��V��@gխ���@l��q�%@q\�)�x@t��c�aC@xt-�D�@|{cR���@�kE���@��r�X@�DX�x�@��!Cxӂ@��9����@��͏K�@�~���@�,�sl>e@���)Δ�@����t�@��?q�@��^����@��#F��@�,�]ni@�A��e��@�y��D�@�����d@�7��0;@�t��85@��>���N@�bY�@��,��?u@���U�`D@�5���Z@��%Һۥ@�\�'�ԉ@�I���Qg@�>js�X#@�;�1)@�?����@�L�)�Yi@�b#{vL�@����y�@���,�Z�@��IN�i�@�x��*@�K]��UN@��
]��@��:��@� o4�>@�Ѽ��uL@����e8@�B��fc@��WT�@��ݓn�@ď�z���@�]�F�N@�0�XZ�H        ?��.�^�u?�m����M?�C}(f@P?�7�ݝ��?�C��Y=?򫥁a��?���Ve��@��縢@��O���@����g�@wC~;Ŕ@\��9"@�]YXB@M���k�@"-����@$�;�Zd�@'���D�'@*��\��@.?�����@0������@2�`��@4����p�@6��݄�R@8�B�P�@;D)�$�@=��a{v�@@���'�@Ad��9�@B���fm�@D+ ��@E�b����@G)��y�m@H��825@J_�@L�
?@M�oյ��@O�il X�@P���j�@Q�'�H]|@R�(
�@S��L�@T��H�/@U��8�@V�Ʋh4n@W�ޟ^J@Y��G�@Z?z+i��@[q�':#@\�i68U@]��Ӝb@_3��%@`@�q3��@`����@a�ϋ�tM@bI�"��@b�z�E�T@c�\�k�@dq���yK@e0TK�ț@e�y�1�L@f�u�Yq@g�@��h@hM��	��        ?XRED�?��J�w�?��I��?�B}:^?�"D�,�l?�%�ؙ��?�pŨ�kn?��2$��?����ܠ'@.}ۧ�@$��N@x����@��l�f[@$�����@*ߴ���@1Hd�J�@5�,��sJ@;K.���6@@����@Du��v@@H��9�G@Me����@Qa3����@Tb�ː�~@W��3�@[r3��@_�����@b'��@dx��5Y�@g%����@jz��@m/�5�3l@pI'�ы�@r�#~@t5�%"�@v$KE��@x^,��2�@z���H�@}Ao�2��@���T�@�_��7�{@�ݪ����@�p@��@���|�@��BP��n@����|�b@���S�c2@��Cɑ@�����\�@��L��@�o�ZL@�35�bc�@�j����@��Ƚ]�q@��U���@�Vv�"�@��8�8��@�-����!@���;_��@�3�! +�@��\Oi�@��h^|I~@���+59*        ?]n엨��?�B���?��eVw�T?�1s�UX�?�˜w;�>?�+!%1%?�c��ʸ�?�A:�?��6Z��?�͟�-+x@	͵o�~@��^@w!X'^@�!���@ �P���@%�𳐈@*w!��z@0]d��K@3����:�@8%t�-@<�J	J��@Ai�@D��X�@Gb")�w@K
p[
s@OI�Ʃ@Q�4�0�@T�cC@V�?PY�a@Y��y�t�@\��7k�{@_���N�@a���Ո@clW�@e^�20k@go��b@i�x�ē^@k�j���@nX�ieL!@prD��`�@q��:�@s-�D0��@t�瘛G�@v*:Z�Ƚ@w�(e�@yh��w�@{ �ɴ �@|���@~Ć�_J�@�X%k�{g@�V��K`@�^A����@�n����@��^]�t@���_4@�֑��:�@��/�(@�J���&�@���$˚@��au��@�A���_r@�� �1�@�P-��        ?���0A@3ĜǞ@2���nD�@C��+V��@P��.V�h@Y��]t�@bm:�-hl@h�F6�C@p4uH�,0@to��OG�@y(F��S@~]���q@�5��L@� �k��A@�y�q�٬@����Ϛ@����{�@�	�t@�:d�8=�@���^m�@�C^IL�@���S>=x@�e��J^@����9@�*�L�b�@�·Dm��@�mu�?�@�+�E;F@������@��C%�HS@���Q���@�ߩ�}�@�~R�-�T@��{|��l@��_�{�@���x�@��
WO�@�X���$@��:6,-@��Q�3]�@�R4[^U�@����N�@�)+D�a�@��-I�#@�kL�.�@����O@����n��@�u���I�@�J�2�N�@�$|���@��_�f@��@�u�@���ROS7@Ǻ~�f��@ȫ�o-T@ɡ���@ʜ"�3d?@˛X���@̟=��JX@ͧԾ�>�@ε"ŝ�@��*�B�/@�n�:�*�        ?wS�R�?������?��E�L�?�R��ʬ?ޯ:�Мh?��A���?�wO��&?���V��]?�r�,�@@8?��@�i�qH�@B��3�@b���@h��M�@v$�@�k�-�@ �f��@"�D����@%h.RV�@(���4@*��I�_@.
�-h�@0���|h+@2h�-��
@4CڐJ��@6;2eY��@8OF��
�@:�zY�1@<�/ߺ�@?;�p�4�@@�@�gj�@B7�����@C�͢%��@E8`��@F�.��ԯ@H$��>@I��QQ{@Kx��IU/@M9��8>@O
f`vޯ@Pu%HS��@Ql���<�@RkݝI��@Sr�|Da�@T�$�@U� 1yn�@V����l)@Wڽ���@Yvջ?�@Z>B�+@[|9·N�@\�v�}?@^"���@_h. ��@`c�I	�@a
��@a�u�j�d@b�;;�h�@cNY�n�@d����$@dݨ)�	@e���)=�@f~a����        ?dW2�t?�;��cI�?�U'7�Xe?�Mk%�2?�<-f{��?���47�?��J��?�gM�-�d@�E��þ@*���4�@�D��@�~��:@!i�5��@&W��|�*@,2Vu�@1��ܺ&�@5��b��@:�^�YE@?Iw�C@B�2XD�@E��Ή]�@I�]Ӟ|@M�M�&>@QճoC7@S�D���c@VH�oA<3@Y@���]�@\|aƆEG@_�\N�D�@a�'�q�@c�a�ց@f%��(@h�CY�~@k,>l@m�SR�G@pU����@q�4�a@s��B�7�@uD ���N@w��R]@y����	@{$�D���@}S��F@��FK��@��c# @�N��(��@��·"@������@�����@��Wn�@���C.Ћ@�c�;q�6@�'���@��d�d�V@�uL	}U@�t�u>�@�~�B��@��ֿ�ъ@��ZH�\�@��`;j��@��z�3�@�LGK$�@��I��<`        ?f� k�+�?��Z���z?��jN�T>?���MQ�?�{�$g�W?���	\�?�q�v`z�?�0CZ�O0@A��ڲ�@�^�A�@I��r1&@��m�o@"G�s��@'Ž���~@.[�T���@3��;�@7���S��@<޹�<M]@Ao�ƨϸ@D�>�{@H��Z��@L�^g՛@P�s`��@SpeC���@VM�z8*@Yl�Dꎞ@\�S����@`?�Ju@b;s`>��@d]+��!�@f���B�@i��(-�@k�aн�;@ns��QC@p��a���@r='����@s�| ��@u�
���@wg(1!0�@yM)t*��@{Jb�)�*@}_)-��!@��f��@��U���@��W��@�Rf���@���H뤘@���b@�OJ�a��@��m�Ap@�8���@��"��<�@�V��Y_=@��`O&L�@�U�����@�5,6��@���K`�@�	$���@����6�^@���/@��� ��@���$��@���a#�        ?��о�@��e>@/@�[cg�@@�7����@N-�ԡw�@W�A?��@aA��׿[@g�yfd�@o.�p��@s��z&@x�}6��-@~C��.9�@�0�x#��@���U�xa@�Q�z��@�lL�Nb�@��~.��@�fd��q�@�~��=�@��KFF�@�^K�}@�cܿ}��@�}���@�jr�%�@�x���$@��A���@��JD"��@�u���Kb@�����N@�����~�@�_�Y��y@��x�T@���{���@�4IU)�@���5Z��@�ѫ��d�@���L��@��=��A(@�l�+�	�@��F��R4@¤p�TV@��mc�W@�K0��@�E�iǁ@ǐ�5@�����^@�G�[<�@˲RW�n$@�(�����@Ω�_w@�֟�ւ@��]�X~D@ѷk��,�@Ҏ:��q@�jP+Q@�LE�!eo@�4�<��@�!�c�&�@�*�O�@���J�X@�:b��@�����V@� "�!(        ?sG##���?� 5���'?��1E�*�?��»1�?ܕ+ ��:?杺��b?�}Q$�??��
����?���d
C@1�T��@����~�@MƐ���@��y�@���4ܾ@�1U_@w�!/@ _?�:F�@"���Q��@%+�|�@'�U���6@*��S�F	@-���1 �@0x�"Ih"@2/J���@3��-j)'@5�	m�@7���
.@:M^c2@<@�����@>��8���@@�=I��@A�5ۥ��@C��m�@Dy� �%�@E�
��^@Gd��;�'@H�<�@J��3e�@L0|�Nv�@M����@O��Je�<@P��5V��@Q��5d{�@R�4a�^@S�`V�@T�-�O��@U��u��2@Vԇm!#�@W��@Y�$g�@ZA�r�e�@[t�z���@\���7�J@]��B~�@_7���r@`Cy2^�@`�
6}�@a���f�9@bN�-K6B@c:׮]@c���`�w@dx�H�H@e8d�A(        ?j��ֽG"?��j�b8?�s=�ƴ?��c�݊B?�H!�q�?�!�y]?���	R�@ [�ʨ@����b@��w��V@�~A���@�Pk�n@#�7�@)��!� �@0G��y�c@4P��=�^@9A��6	@>llK��@BK��@E�|+X,@I���G@N
�cdZ@Ql/��A @T����@V�|D�
�@Zl�
�@]z�y��=@`���!�@b�5k!�8@d�'�Pi@f�~�@�@iH����@k�.	^�@n�ÖX�(@p�O��y�@r.�c���@s�:����@un�����@w.X\_��@y Vec�@z��f/��@|�u��@��@����~I@����CAU@��f;�3@�07 �j>@�y���@�ϡHq��@�2�m���@��؟+��@� nu�n�@�����kH@�D�0W;)@���|.r@�Ч�Z#W@�����U@���*�$@���#�
@����1@��g���@����lWj@��D"�Z�        ?^�}��n?����1�2?�+�c�?�T�v�u?��%�?��m��`�?�b�t�?�D�k�@�c���@
P�"f@��F�G@��v��@!��%��@'>���@.0wo�[�@3B��!@8/8�.��@=�N�@BHqγ+@F^�<!]@J\<�@O,�⹑2@RE w�j@U=-f2�@X���I@\�����@_����*@b�O>�@da9|#{@f�I���]@ivɊ�]@lFʭm�@oFX�Z��@q;=|��@r���]g@t�4:��5@v��v%@x����@z�����@|�/���@3V�@���@a�z@�I�B@�c���V@��[�;�@�1�b��@���Z�	�@�:cg�dK@��*w8�O@���o|@�8f��f@� �����@����t�:@��蜸�@��P[?a@��%��@��W�,j3@�V�m9@� ���ԡ@�Fޥ�DZ@�u�)��@��J�8��@���C�=        ?ݞum[@_n����@(���b@;�b��=�@I1�ŷ�@S�Ly�ۤ@]KIE@d=� ��@j�j ��z@q2��5��@u�*|�|w@ze5Z���@ؓ�M@��v���@�G�mj�@�������@��f`�P@�W76�2@�t5�dW�@��'���t@�����w�@���rnv�@��@�	��@���on�@��I�l`�@��D��@��n=��@��$�wO@�ô���
@�[����@�qE�ܷ�@��I�"Q�@�H0= @��e��oi@�����@��
f��@����c@����|%@�P�S�@���Ic@��Q6�D�@�M�����@�>l���@�6T�W�@�5�%ʧ�@�;���L@�I����@�^u�ZY�@�zj��@ȝ|�Ԫ�@�ǨqQ��@���O�y@�1CY�z�@�p���N@η(�%��@�X��EM@Ь�A �@�Zt���@��Ax�c@�����@�y)W��@�5/���@���5�|        ?c���\��?�Ǯ�{?��4�#�?�[5�V!�?���-r2�?�d���L?�U`G{x?�l5��?�8g�P?��o����?�����[�@�G5�@ ꮇM�@�"5�q@G���ܪ@�p
�i�@�|F�@%��0^�@��睊@ *�k�X@"*�G�-�@$N>Vk0S@&��5:W@)��X@+�x�lv5@.W�I��@0�3�t�@2'ebk�@3����q�@5xEs���@7A��6A�@9!��
@;��eo�@=&���&@?M �at@@ũ���J@A�#��L]@C)ئf0@Dm�2��`@E�8:�@�@G�^�w�@H���#@J��vr@K��_��9@M�h�D@N�C�x·@P6�Sq�S@Q�CDX�@Q�0�4Ot@R�(��T�@S߹�e�@T����@U� f.<�@V�1F��@XLՔH@Y!��k�@ZF��k��@[t��u?�@\�v���@]�1�N�@_/� �@`>�CN��@`�ד�&        ?Q#�C�.n?�ѕt�K?��Ar��?��1~_+~?�?}h��?��-�Y�?�9�tю?�T�0Z�9?�zٶ��@��K�@
d.D]T�@D|͌�@��dy��@ C6�M@%}�O�@*���r�@0�5h�j@4��w"$�@9Rɾm@>,�4��@A�m�M�@E.�n�@Hô2�Z@L��_0�@P�1ۓ�I@R��:��@U�m늖@XM:D��'@[Sw2�ƫ@^�@Cg@a��82�@b��#Uu@d�Y�&`@g=I�@i@�o�@Q@k�Gek�@n'�A@pg��G@q�ø�Պ@sHj�H�@t�U� @vu��\�7@x*����@y�;Oha^@{��i��!@}�����I@�<��@����</@����@�<���[�@�pZ�ז�@��K��)�@���Y>�8@�U�	�Y'@���kSJ@�/���In@��s~�@�?0�MZ@����o	�@�Ðԣ��@��qcn��@������@�p�t{g�        ?JDm��ӵ?|��0��?�c��:i�?�F��?ý�=V�!?Ҳ�C��?�2���Z?�I9�;i?�E���KE?�`��"�@u�RYۖ@��z�"@-����@��sT?�@!X�E	@&  q�+@+�ٞ>�s@13@§�@5o#u�7@9g�"LH@>`3heS�@A��sY��@E-���L@H��
�@LqN��$O@PU�u⛧@R�"{��@U+]ݨ�'@W��.��d@Z���ʻ!@^�Ni@`�֭���@b��K�ȫ@d��1E�@f� K�@h䟁�(�@kE�Պ,�@m˪,I�C@p;�Ph��@q��%���@s#�w���@t�f�$z@v^A���@xڬ�h�@y��8Fa@{�q��ȋ@}܉��%@���e�@����$H@�:KS�@�l�喔h@��h2G}�@��F�&�h@�S�?�@�����@�2)�F��@����]�z@�I���@��z�D�@�Na�7�@�.S���@���xה@�~��z        ?�!}aVt?�r�f
ql@�b(�2�@+rJ��#|@9|����@D�IK�d@N�c$�@Uyi'h|9@\�����@b�����@gS�˸@l��wG;�@qf�7�c@t�;1�%=@x}�oۻ@|��)Eg�@��]��@���%@��õ��@�l ���h@�zk�&�_@����H@�!�6���@� �E���@���D�K�@��{G�@�[��G/-@����I�X@�>\_2�3@�qݟI��@��]�rɉ@�M��a@��KG�@�rz�D�x@�!�m"i�@��7p��@����O�o@��-�F&�@���a�K@���,d]u@����@����F�@�>y_��@�s�T� �@�����oH@� �$�8@�W��˖�@��$bh�@�*2�1
D@��Y#5�@�,�e���@�`W�,��@�0�V$%�@�H�-�O@��n�r%�@��$���@ĲzrLPp@ţ��_��@ƛCDME�@Ǚ͈��@ȟ+��j@ɫk;��@ʾ��F        ?_��YT%�?�ѵ���X?����֔�?�S�5]8?��M��>?���X�?�ʫzfk?�Ƕ�89�?�*4�?��S:v:�?�oW"�n?�� �L��@ ��j[H'@ɂ/��@?.(�:�@-"P�@!A�UE�@ɮ�N��@/�9tK8@�z���@�!Ջ�@~�D��@@����8�@!�ێ+��@#H�b�@%):�6��@'$�DY��@):��u'k@+l)��d@-����.�@02�.d�@1Q�)Rf"@2��L��>@3���ȯ@5k~�9,@6���@8n+��@:��7�@;�(��@=]�w��@? ,�@�3@@x��v> @Ah��bp�@B_�� v�@C^�de9@Deof��0@Es�X��@F�IV��@G���1@H��1���@I��)�Т@K-~<��Q@Lj Hf�@M�Zo�>�@N����Ǿ@P'b5���@P�way@Q����C@R=���M@R��_�K�@S�
�JI@Tx7�{jY@U>]M��9        ?@1-��?q�&�g?����2G?�}�-�?��OÍ�?��nƢ�?ݜ����?�=�%l�?�C6R�q?����HL�@�f�G�@#�tM�@>h�\��@�Q[S@#��P�@)V!���@0_��7@4��7g@8��㸷@>�����@Bqo<�6@E��'_@I��E�@M�Ŀ+U8@Q`�y?�|@T���I@W$a�u^@ZN.�|�7@]�46�k�@`�an��@b�9�c��@e=��Ij@g�f�v��@jTnq2��@m(�D�5�@p\�	+�@q���[J�@sp�̾I�@uGiH��@w;Y\���@yM�v��n@{?��CC@}���"@�"�W�@�l�8�r@�Ȩ�m@�6�D�j�@��`����@�J�-(@���`>@��&��=@�|���,�@�`��S~v@�-O���@�5	U5�r@�G߿�8�@�f
"��v@����O{m@��-�Tym@����@�Tz���@����F��@�K�]V,        ?C�P�h?t�V=J?��#:-�?��aM\��?�����m?�>�
1?��|���?�f���?�ɢ���H?�-����@.܎�-@	m�;4q�@J�fD//@�*��@�7�EWy@#�5�@'֜���@-rO�e�>@1��"3q2@5��^0|^@9�9q�iy@>[\L��@A���^.@D�:@G���,NG@K
M��F@N��n�B�@QTB���@St�y
^q@U�R��wV@X+{�CK>@Z��ӊ��@]�@����@`6�Zw�i@a�jT���@c_�(��[@e8�+j@fޝma@h���i�@j���y@lFw=j@n�>T�@p�n5��@q�V�@r��U�R�@t.�La�@u{�ؑ@v��i��@x8�Uq�@y�~�}/�@{(�|N!�@|���!�@~L=`�h[@���7�@��]x-��@����ڕ�@���P5�@��GmxfN@�}Æ+�@�z����@�~���g�@��W��@���>�*        ?���-l�U?�G���)@ռA@"8�Vo @0����;�@:��6�A�@Cֵ;�Q@K��o�:@RSĠ��@W����@]���T@bCuz�@e��0W@i��r^�@n��X�P@q��l��@tu�+��@wg�M��@z�i+��@~���0D@����q@����wz@����#�*@�:�B/��@��j*(�a@�,��i�w@����Ky@��b�#!�@�W\�%�@����v~@��pC;>�@�F����@��K`/@��	��N@���@�����W@��}(��@��[�B+-@��-���@@�� ��@�8c-�@��#�&x�@�ӎ� K�@�2̩"f�@���V�@�W����@����vܹ@�(�d�J}@�b�(z�@�76Ϗ�@�n��@��j�;��@��'a�}�@��[��.@��x�l@��P�-g@��*�٨�@�í��~=@���䔻@���7��@��	f�@�)}.L��@�T'ޱi        ?���:�о?�
B'�K?�&j�1{�?ܷA��?�0���?���X���?��y�@@�ը�B!@W�kR�z@`+�-z@��R��@�pe�<P@�o:f�@9�۰&�@!��OUrl@$h��@&��Yf��@)�9�3�@-x��@01�U52�@1�Z����@3�`~���@5��u@�@7��Jsl@:,�H��@<}�����@>�|�!/@@�:��K�@B݇��@Cp|pL�@D�a	��'@Fcӄ$�@G��`@I�h�=@@KG�D���@M	���@N�Q�I��@P_|��T�@QX���U_@RZH���@Sc�:8��@Tu��:@U�~��@V�ņ.�@W���t�i@Y	�匽�@ZBA��(@[�w��-B@\�[�w3~@^뎶�@_q`���@`g֔2e�@a�R���@a�&�4;�@b���Mp�@cH䡦:@dT���9@d����1@e�R~���@f[���@g(�����@g�O+�z�@h��㋜        ?���%j�?����v4�?���<n�?�����eo?�X񂐒�?��:��?�SV�$@ 1!��5�@ ���@5m�{��@�VB
3�@�� I�@!��<�@&�nsܬ@,���>1<@2~����@6<@�^@;y�D��@@YN]�L@C���g�@G'�V]�@K6�rDq@O��ӯ#�@RaFbY.�@U%(�_�@X,�`��@[z��w&@_?D�_?@ay2���r@c�H3�@e�R��@h4�T��@j����^�@m|�|�@p0�v��@q�2�z� @sT�K@u]�B@v�oF|��@x�u��2@z�uVκ�@|���W
@~ۋ����@���;2H�@��k�׃�@��`8�.@�1�=$@�� 3��4@���/X�s@�E~a;�@����M�@�;���@���*�<u@�cf��$�@�F�k�@��.�Α�@��op-)@��z"�@����{��@��Gp+�0@��@��~�V@��Wn��p        ?��^!�d?����a�?˱�{��?�]�shW?논!$
?�<��3�g@ �<����@�p״s0@{]�vq�@)N	+K�@*���~�@"�a��,0@'�.,��@.�Ҍ~�@2��6ѣ@6�Ƶ�~@;�I���@@�.`��8@C���ߋ�@Gj=���g@Ki�Ωo@O�H�$��@R_ò��@U Xo@W�B*�S�@[/P�� @^�����P@a,8].��@c*Tuv�)@eL[C@g����G@i���R�@l�����@oD�����@q-��K@r��2��}@t*��|�@u�0�+@w�	��0�@yic�]-X@{R�W��j@}Q;_q�@e��Ij�@����V1@�� ���@�IS?�@�I��ٺ"@���4�@����]��@�3��@��@���qIlH@�i��'�@������@��[9�@���_AN @��b�@�~�Q�@�]0Zb�@�A�y}��@�,�h�+�@��)|�@��Le�@��4v8        @�,�2BO@(Bxb�@AP�|=��@QQ��@^S�.�@g��)A(@pT�	�@u�x:�?@|7ֶ�d@�����e@��Kڹ~@��>���@��cz���@��P7���@���!��@����_"3@�����vh@�3`8w3@��aF|@��&��o�@��B���@�ro��n@�nӚ3,�@���+��M@�tI��0@��o	b3�@���8@��#\��@�����v@��QЃ�)@�s���@�A�ˠ@�$gB��P@� h͕m@�u#�1<@�%�Dw�@�A�n�/@�h�'���@Ě��`�@��9ڱ��@�͘��@�q9ixH@��iQ�#j@�6C�̑(@̨����@�%��Ӥx@Ϭ�~ �@ПWp!��@�myB�&@�@���,@���@��@��j� ��@��e�`�k@��_S��X@֯:x��@נ�3�t@ؗ&�pD @ْ���M@ڑ]qT �@ە��'�@ܝ;R���@ݩ����f@޺rm�K        ?]q�<�H�?�k��i�?��z\�?�@����?�|��?�cDA���?ቇY�d?讠��� ?���z
?��Ɓ�w�?� ��2:�@ �xK�a@GI�LZ@3*�TO�@�b%��@���mƩ@)�
���@�ǔ�+@��
�*@�~��@�@���\@!��U�(@#���ea@%��s�Eo@'�����b@*���@,{o�h3�@/	A�?��@0���c�n@2D����@3�
݆q�@5G�Z�#@6�_����@8��oC�@:L�i=�c@<?צU�@=�)Uݭ@?�ѵ�T@@��8e�@B-�\�@Ca�x�@D6�&��D@E]Y�\�@F�`1���@G�����A@I
p����@JW�1��@K���.g�@M`���@N��X'@O�:�!ϡ@P��˺'@Q�rVlM�@RR���[G@S%���T@S�"$�D_@T�o�y�%@U�kTZM�@V����@W�kG�б@X�x����@Y�G�Zm�@Z��a�        ?H煥�I)?}�&���F?�ܨ}�[�?�|H?��c���?���"e]�?�2���?�o�n�?��A �@��ώ@_��G`f@��>�1@����"D@I;� Ŀ@#�'lEt@(�n�e�@/����@3$S�|�h@7?0�c�@;�3#��@@���z$?@Cr�s:�@F�����@J*��|
O@N ���@Q�����@SV��b�@Uó��@X]���@[&}ڙ�@^">�!$@`�
��a>@bM啤+�@d�X��v@e���@g联0��@i��0]�@l'��d�@no�Ǣ+@pj�Ot@q�M�+@r����@tVc���$@u�Ǯ�,�@w>o��w@xɢU��@zd�P�2@|ʭ~!�@}�R�J@���r�@��\7D�p@�����@���n{��@��o\%�@��](Aˑ@��{����@��b)�@�9��S�-@�qm!!	@����� @���F��@�ScziT@������        ?R|�'N�?��P��?��1�?��1ִ��?�[�L.ď?�ߒ^��	?��"߬�?�?�eޯ?�/-��I�@�|�G@H?���@ǳ��i@�O=���@�Z[� �@#>���@(m���$ @.�����@2̍ˆ�@6�����<@;|@�Y�[@@Y3��W7@CCU�鑾@F�:��@JM��YW@M���<~@Q"Q�M��@SuB��@U���&b@X��t;��@[�Zs)P�@^���ka�@a�٤@b�մS|/@d�upJ�Z@f��y^'@hѦ�Wc�@k�!?�@mpD xs�@o�*�	w@qI��@0F@r��ڶ@t ����@u�Au��0@w@����@x��%S��@z�zD<g�@|��[J�@~m���>@�6��D�@�AS��(�@�WK���@�x��nN�@���U�-�@���@�$R�/U�@�v��h�@��ZJ���@�?��l\@�����I@�=dw��@�Ѕ�?x@���~}�r@��.��[M        ?ɣ��
�?�{�0J&@ApȰ�@*<N��@8nQ�<��@C�;d;@M��nP6@T���y�@[��Z�r@a�cP��w@f������@k�6pl�G@p֨���v@t��mf�@w�N~/r@{�1�y�@�2��e@�'����M@��]p�@�E@V&�@��fԒ@�!��|@�,��PL�@���Qn@���8\�@������@����(@��>�V�@���4w��@�V7 �r@�e����@������@�*4�p�@�ll>[P�@��9�p�@�e���@��ugub@������@�O�2�1�@��L�Η@���+���@���z�ݷ@��a����@���Pn@�X�@�"�O�^@�#���@�K��_�@�~�v/�@��B�|�E@��U}Z@�Vuob6T@���Țd@�J@�8�@�F�A�T,@�|O|E�@��m53�@�hC�@�aM&@>�@�5>�d/@���s�@��KR���@�ф���        ?wԑ��?��|h��D?��Ē]
?ό� A�?�6ܗ�n`?�K-�K?�:�D�?�U�[��?���Wz��@�>M��o@���(B@�%ć@?4�W^@f.v.�A@�$��{�@������@��$@M@!�yVc@$0����_@&�d��^�@)47Z�	2@+�f�v��@.�"�3g&@0��l�6@2�O�RO�@4/?���$@5����h@7��d�m @9�(��c@;��/S��@=����@?�p��@A����d@B&��<��@CU����L@D��o]T�@E��[&�@G"eJTS@H{��G�<@I�iƒX�@KM�:>�@L�T�v�@NK�k��@O��n�<"@P��˖ @Q�uoE@Re��g&@SD)�a�@T(-k��@U-���@V�l�@V�����@W���U�4@X�N����@Y��s�o�@[ ���!@\#���u@]?�ʿ�7@^b��Uԓ@_��\7@`_�P%�@`�WC�@a���6{        ?M��]�?z�V�?�Y�vR��?�qsr!?�w�Ԩx�?���q`��?�ՙx�<�?�4��^?�gZK 	?�(�@��@�
�=[�@0��0@�[��h�@!�H���@&q�Z��@,A�+脒@1�5l�hD@5r�>p@9����@?,:3݉@BaCO�ĝ@E�	N�5�@I w�>�@M
y�/�@P��$}C_@S�%�}@U���"�*@XRoB�G@[L#f+]@^�.Kۈ@`��-��@b�E�F�@d�8)��~@f����Z�@i�Y��@k\c*��g@m�~
�TR@p5S�`lt@q��yr��@s��ya@t���^�O@v���&�@w��K��@yt%�.@{?���	@}�+��2@C��I@����j=�@��8E��}@��Ő�fH@�ҩ��ia@������@�5�Y�&�@�w�6�^�@��4�Ԑ�@�År]@�~v�wf@��p���@�e��'ub@��Ƒ�L@�����Op@��쟆��        ?z�����?�(,����?¤��WՒ?���[�?��I�'��?�N�y�?�}0����@5Q��@�n���W@�T:]��@6�ѵ@!
[��n@%��̱��@+�	RcU�@14�8���@5&��X@9�*�ʛ@>�<M�><@Bbo&��@E��}��@I^h� *�@Ms�I���@P����@Sqv����@V"�tո�@Y��0-@\9ӣ*��@_�j����@a��W�B@c����Im@e����F@g�h�%�@jR��2n@l�#r��@o�^/��@q'���M@r��� �2@t1�l�P@u�Ʋ���@w�t�%P@yYs��@{:��V@�@}2�NE�@@��N8@������@��{�@��|1Ŝ�@�-DW�	�@�nY۫4@������@�%C�:�@�y�d�ϲ@��D�IZx@�k�'XB	@���A�|v@��7�N��@��	GR�"@�vC�QF�@�We����@�?���_,@�.�{���@�%X�DQ@�#=��K#        ?⍝k{�@���u@'�x��!@:~�'!��@G�"�t�@R�hŇ�@[��V��@c�1�E@i�31��@o�Tk^z@s�O�=�`@x#=�p8�@|�D)_x@���� @��S���@���
L@� ؝B>�@�o'���@��#�J�@�|#��r�@��i�7Y@����&�Y@��_W(@�g?��f�@�����c@�IPz4��@��G$:(�@��В��@����7N�@�.����@�Ϲ�
��@���p���@�AY�>�@�`�� u@��-� @�r�˞�@�s�"l&@�},=t5}@����(�@���6��@�˹~y+_@�����@�*����@�gd��S@��J��`�@��D�\}�@�Q!'��@����J��@���?`�@���U)�@���}awx@�Eܴ?s�@��R�@�؛�b%�@ĩ"��d�@�~|���@�X�SZ#�@�7γ|�Z@��"S��@�׿s@���ff�W@���>z@�݁�z�        ?|/��+%?���`º?�RР;��?҅�cG�b?�I�fɢX?�hz��?�KBA �??��{i��@ E��G@�{a��7@	kGIQ�@�����@Mؽ<[@|KN�=k@�בϴ@�R$��@ T��!�@"x"3���@$��{��@'.��.�@)�bєw�@,{�t���@/[֝��@11B,� �@2��8@4rV�j��@60���%@89�Te�@9崙�c)@;�v�[\�@=�{��9@@c���@A3w�@B>�z��@Cj��b��@D��)q�@E��@*�@G*�����@H~rS���@I�"�it@KC�f�m@@L��~-��@N1_bP��@O�s��c@P��P�`�@Qqx�ȴd@RDTI�ԡ@S��B�U@S�Kv�� @T�zf���@U�)���@V�]B3J�@W���@X�N�ʚ@Y�}pGm@Z�8I,��@[���P�@\����1@]�t^ڪ@^�V�d�@`M�e�@`������@a,����        ?P\�P��:?�&6���?���"�D�?�*�À '?�R+7��R?�_uu�S?�z��`5?깇՘��?�����t�?���ԢE@�X�H�p@L~>�<�@|}�H �@�m@!����@&N�}�@+�ub��@1;Ot�@4��!%S@9H�{c�@>"�"9;K@A�u ��"@D�q��.@H0W��
@K����y@O�8\�@R2Me�@T��]�@W7�]�@Z	�`��@]���B@`'�tb@b@a�0D];@c��+�t@e�72!'�@g��7�M@j��q,@lpK��@n�p�Z�@p̅�PlB@r2�0i.+@s�{O7ȏ@u:QB-7@v��{��,@x��i�]�@zbIL}t?@|F\?�h�@~An���T@�*	.�y+@�?m=��@�a-��9@���O|	@���R�@��b;��@�i��;F�@��ɇ-��@�@S�;@���aq@�P��n�@��ut�?@�N�@�@�.0���@��*��        ?x�c���0?�Ζ5۳?�>]�E�[?�&�zǠ�?݁)�8E?��J�\?�.�eՀ?�,9��;@,V��>@���n�c@7V\��@y���@�I.�v@ ٍ���@$�j�p�U@)�#��@@/Y`�@2���k�]@6�-�-@9�>�x6@>I��
��@A�';+�@D,5:�m@G;���%@J/�U�~@M�c.�O@P�Bp�Ң@R�}��R~@T�Q���O@V��sW@YdO�\�@[�*BY�@^����@`���M�h@bMz����@c�Pu,�@e���&p1@g_����@i;�$�2/@k/@]��y@m9�T��@o[����@p��6XI�@q���f�7@s)+�� 8@tk�a�@u�����@w(��=@x}���L�@y�s��@{w�&��@}8���?@~�/���@�*��Cr@���p�i@���R@�ئmg�Z@�� ���z@��:��4@�ɉ���a@�ӣ��@��q��Q@��
�m�k        ?�Df�/@�I�c'@2I����|@C�H2�3�@Q=�q4&@Z�c�gR2@cCXe)?@j%A|��@q2S�b@u~�����@zx�j�n�@����"@���H�K+@�<G����@����Ͼ@���,�@��{Ƌ��@���$z}�@�6���N�@����;Ĕ@�/� �AK@��+�� ]@��3�@@�Wg��@���\�A�@��VY�@�9�W��@������p@��*�|b@���%<0@��(���%@����U�@���k4�W@��>mg@�/T;�n'@�Z�c@��/;�@�����@����6@�c��p�@��@�8�X@� �zh@���~t�y@��*�L�@�AL�d��@�R�E�Y@��{�lwv@�(q��@�t�&|��@�N�,��@�.8�c�_@�O���@���x��1@��8�J@���n��@�ߐ���@��	�@��d���B@��f�@��;���@�a��Nc@�X7bo*@Ю�f'X*        ?����0�?���/�1?Ŕ�bAO?�i�+<s�?��}��?�kv���?�����{@ b�	g��@� ��>@�2<J$�@��¢�@Ҟ�ȳ�@�#t	׻@x̆��"@!4V����@#�@���@&�0�9�@)�"{��-@-/��'l@0[�>5�&@2:�jV��@45�:�-"@6L�ʪ�@8�J��� @:Д/U�~@=>Q��@?�^o� �@A9p�+��@B��^9��@D�����@E�a�X�@G)���Z�@H�(��7�@J����f�@LI�f-@N!p�~�B@P2f�3w@Q��7@R� ��0@S\T��@T1>�j��@US�RWI�@V��;�m@W��"n�@X�TB@Z>YKF��@[�p�G"@\�V��� @^UxA5�@_ŕF�s�@`�����@ab	�2@b)��F@b��'Y@c����o4@d���6�@ev�~���@fVJnV��@g;^�A�@h$тj9@i��kl�@jn�lq�@k S���#        ?r?�+�i�?�־ h<?�	Pb�Ը?��� �?�l��H�?���<�?��{Vd��?�����(@	!�@��d�~�@�ݒ�u'@+.�x@�Tp\�@#��@(y*ZDjm@-�U1@1�uH���@5OCJ>@9#��vA<@=ikޭ��@Ahle8@C��2�@F��9sR�@I��f*�@M>�|@PW�ܲ�@RO�U	@Tm�
�"�@V�z�5V�@Y�:�h@[��B[�H@^m�W�@`�ǫ��{@b4\]6Z@c�-�h�f@e�����5@gX�RD8�@i>W:�@k;�
�+�@mR����@o��3��@p�C2���@ruJ�4�@sX'�̆@t���3Q@v T@�@wj�aF�=@x�Q5f��@zj��FGT@| �s�qr@}��C-�y@[�.몀@���1;Ǌ@�{d/J@�nj=##@�i�̵��@�mҫZ#W@�z�&�|@��
�	�@����c��@��H�I[�@�M�v��@�A�`"Щ        ?�����?���n���?�y���?��"Ƒ?�Q�e���?�
z��@���WZ@E49F��@X.��^R@�g![�@#X����@(��mM�@.�o��O@3tڮ'@7Q�>N��@<'5�`��@@�|Jf�@C�Q�1h@Gj�� )@KMS�>�@O��6.Z�@R.��pW\@T˟=;N�@W����-@Z���C)�@^$�cFw�@`�x
��@b�1��@d��hJ�u@gD(�Ҹ@i��(<@lK����@o�ֈ�@q S����@r��M�h"@t6f%�-k@u�jII��@w�F�x�4@y��}�@�@{�$z|7@}�x���@�%��T�@�H#��]@�����0@�Ѳ��ם@�,�&y��@���ԧ��@���^-@��c�t3�@�7L����@��	t]:�@���6&w>@�7F�@�'�St\�@�!��7@�#�亶>@�0�4�@�F���x@�gd�p��@��e�:.@��@�-:@����@�Q�����        ?�T@�fo @!��w�@="��T\@P�,��@\�<�@f�3~��|@p�G&f�@v�AL=�@}�&��@��g���@�����hv@��4�Y@����@��`��@�1���l�@���eYۑ@�`�R��h@�+����@�Fm�뇃@���Q�\@��h�ڧ�@�U�%�@��o���T@���Q9��@�C����@����F:@�P�b�ʓ@��` ���@����,ѡ@�aү��`@�4�ۉ@�Zi�Ŧ@��p#��@��
N�* @���J~��@©�Ȟ�@@��f��u�@��RA@���? @�X*��@țS���@@���X<�@�>}\/��@̞�^b�@�T��5G@�{��q��@�|Kd@�?�(�>�@�T�رx@�ՙa��_@ӧ����@�~�����@�Z�s�Vj@�;�R���@�!�`��@��NY�@��Ȝؒ�@��0��?@��Q`H�@���!��@��l4�@��_
Ց�@�\ ע�        ?'w|5R?��9խ?��J�'�?��7E:��?��fe0�h?�;ax0_?��N	b?��e�cW9@
D�;T�@
�]�5�@���{�@l��	��@~��TI�@�+o��@ �Q]e@#��\�Ĝ@&cʺ��A@)rM۾�@,��#��@0��S@1�l�ud~@3�=��v�@6�_^e�@89��I�@:������@<�����@?���z@A��%4�@B�t�\�@C�� X�@E����m@G{m�>�@H�;���@J�T�T\@LP!�&�+@N/�"ܽ@P55��M@QYh]�M@R%�"@S3�뭒@TS�(LI�@U}��5,@V��9�@W�_aϡ@Y9�8��h@Z�����@[��A4M�@]Sb�6O}@^�o{N�x@`"��q�@`�h��h�@a�(?0�N@b_�wh�@cT�w�@d.8 "?�@e��c�(@e����Q@f�:F��+@g��/��@h�2y��@i���^$@j�9u��@k�3u��        ?s�	Rs| ?�cQB`�?�ĳc��?���W;?���l��?����yW?���"��?�ڒ�l
�@��A�\@2��� @�f��@uʅ�i@!�����@'No
@-<r��@2@&�G5@6�+��hD@;lJC�%@@�T�`�@C���ѩe@GcI�O��@Kxy���@P���@R�)��Q@UT[��S@Xe_� 8�@[�Iu�Fv@_hD��K�@a�8���6@c��~�|@f&�D���@h�b@@p
@kP$ގ�@n+����@p�>	 	�@r<��*t@s�IJ"@uˏ4i��@w����	@y�����@{�S4�&~@~@OXI#�@�T�ѥd@��d�J�@��v���@�Tb���M@�ː�`��@�TgY��@��KƎ ^@������&@�\����'@�0F�j�3@���;0@�	1'��~@��Q��@�"��}'Z@�?��w��@�f�)�c�@��P�~�O@����"��@�����B@�s��u�s@�Ө�?�        ?�t5^���?����^�?�'�ي'&?��kԹ�?���Ym��?���x���@*N�8�
@�ގ.�@[ߧk�@}�\4��@ c�,1P$@$�P̪�{@)���c@/t0R�@3
�7�خ@6��2u�@;	�ny�@?�p��@B�nx2@E�{�c|@H�3����@L��1�@P9�M�GM@R`0��D@T��H ��@W9#,��*@Y�]k�Q�@\��V�I@_���U�@a���e@cc�~
�@eB�7��R@g>�F.c@iW�R�o@k�hQc�@m���C�@p.1W�R:@qyؿڥ@@r�c���@tDL�@u�3�-@wV/0n�v@x�**l�@z���y��@|��T�@~`H�Z��@�*�h�3b@�0?��G^@�@���8@�\04�@����F@��w����@�����@�>gN���@��@g�ue@���T�c�@�hĠ[�/@���Z`!P@�p�@���VH��@�VM��-@�/����B@���@kj        ?�v�4P@
�6�@8���~�@K��&k�@X�0�--@c�Ȩ���@l��b�U�@sڂ��ky@z�_�K�@����i@���y91�@���M��W@�����^@�vUvYhH@�J�~�YK@�Vu4��@����U��@��pR@���9uq@��f㉠�@����!E�@�+��m��@�~�NW@��p�\�@��2��@���#��@� d��x@�x!�:��@� Ө{�@��?�#C�@�Am��@���UVج@��:�/$@���� @��ma,-@���ʭ�@��V�N��@��_�X�@���j.�@� +�N@�MٔiC@ǅ4��@���b�@��Y��@�c���z�@��F�@�'�k�9 @ϗ�^ �@Ј�����@�J	X�@�$���Y@���(u#@Ӫ[��þ@�~je>�0@�W5��@�42����@��9zu�@����q@�����C@�ԓ9���@��JuM�s@۾*ɱA�@ܹ.���        ?j�!W�ْ?�cYE8�?��SW��?�@e1�?�9/!}]l?�.���?��ɍ�J?����l�?�����1?�9^�ä�@��DO\3@��*�Y�@
1�apqi@&WS+@K��q�x@CSt`$@{ې9��@�q�v�@�\��lN@!�p����@#��y�_v@&Gg���q@(�a���@+D5g
մ@-����g�@0k�"D0@1�f'	@3�s��4@5,���@6�T�FY�@8�y�d�@:����}P@<����J�@>�R_cI@@o(#�8@A�|\Bm�@B��jFM@C�b��
+@E(�b��I@Fr/_��@G�W��;�@I%rEO}�@J���my�@Lù�+�@M���"�@O�S��@PS��?~@Q$��rG@Q�|@yE�@R���!@S�w�6�@T��g}@U�q�nh@V��+4B�@W{*�}Rt@XyM�[��@Y|��M@Z���3�@[�s�p"b@\�[�* �@]����Q@^�c�)�3@`>Ig        ?^,>�
'?�oڠ�|�?�?�x�j?�M-�m��?ԉ�J�E�?�T0���8?�%}�q?�e{��ז@_aN2�@�����@O)[h�@t��m�]@���`@$,�cSWu@)�1؉mQ@0'���@3�a��|@8hsE��z@=u0 ��@A��Z]��@D��]) @H[8j���@LM]W���@PQ�"j@R�m��@UE�4�Q:@Xƈ��@[�
@6@^U���ZU@`�C�@�@b�k�Y�P@d��U�s@f�¤�U@ij��j@kv�9Q�@m�j�g3�@pM��l�@q������@s'�n�=n@t�	/K�@vM}��	@w��"��O@y�*���@{�\��g�@}�˄m��@���0+@��-�
"V@��P蓪@��!��@�@�>".t@�|�U��@��NIt��@�(�.�*@�{�gup@��-2�;@�e��W��@��4�/V@���c��@��6 �&�@�l�?P��@�L�lA�x@�3q�d@� �����        ?l4�s�y?��#��]?��2��s9?�v[4��?��6�J?��e�m��?���a]ւ?�8n����@���ج@	#D#(�@8����W@(`/�@�]�4@#���q%h@)�k<K@/j��L��@3j�Ώ\@7�Qw}�@<�/:�n@A��>�'@D>�/�}�@GČ4��;@K����,@P��o�S@Rd�9�* @UpzIT1@W�g)N_�@Z�;�u@^J͗%,@`�V�z��@b��'p�@d�=A�Y@g1Af�y�@i��*I��@lP����@n�7�V)@p���8Q�@rKg!�8@s�aJ��;@u�/ @wH�p'u@y:Z�D�@{
H_$I@}����@&�<�[@@����0��@��;\���@� W�[a
@�<d9�]�@��u���\@�ؠTY�Z@�8�ZW@�����j[@�`���@���BM@�@�54�X�@��J�ޛ@������j@���&[@�|rX@��@�d�=���@�SU4�	@�HaSӍ         ?���fq�@�rY��R@!u�_z
�@3�Qm^{�@BS��v(@L����e.@U?�ߌ@]eA^�@cw���*J@h��b-O@o&&wOv�@s�����@v�h$��@{!��4g�@¦!�,�@�e8{�@��V�@�3]�C@�//|�z�@��Ys��@��O��@���@�@��s���@�N� ��@�T����W@��an0�@�)�B�&@�aE���@��dV�N�@�)����@���_��@�2�e���@��l�t1@�~�Y|=B@�>���@��R��@����P]0@�r���.@�u�E^�@��I�g�@���O��@�������@��@$t�@�
.��@�B�(��c@��6V@��j��@�$���!@���S�t@���e"�@�-7ϴF@��ߡ��@��l�7��@�qX�A��@�;�AG[�@�
�˶ԁ@���"���@ŵxX�d$@Ƒc��
�@�q����@�U�ބ��@�>���5@�+O'W�        ?f$jT�n-?�5c��\?��;�i�?��!�.9�?�k\E�?��B�u(q?�*cW��U?�'�Me�?�p�`l�~?�E���A@	��ak�@r+�#g�@`��̱�@�_}wR@�n$�Y@>=J5@ؖ�l�@��tF�@!~�~ȗ�@#�Ya3c$@&97��ώ@(�g˺@+�&'�@.�\��Ҩ@0��Sv@2��
/�#@4Z[Y	�@6:OmS�@83�4uj�@:GaS���@<uc*��)@>�jV�O�@@�����p@A���4�@C �* �i@D~���@E�^=2�@Ge���c3@H���?N@J�i��D�@L5�M���@M�<ʛ�L@O���pO@P�}����@Q���x4�@R��.J��@S��G�t@T���N@U��3Cm�@W �P"G�@X%\N���@YQ�B"�M@Z��d9�@[��9Igs@]�7/�4@^Oy"0�"@_�B����@`}�t*@a-C8�N@a���2��@b�|7�@cQ�)�E�@dō��        ?[�x��˨?��ᖘq?�5E����?Þoy)� ?�0� %�?���uc?�&_���?����@�p��p@	�t6L�o@Q���:@-G���U@ �'m��@&C�o\H�@,���3ǟ@2Pn�� h@6�ˉoA3@<j���@A^�֞w-@Em..�/@I%��z?@M��S(v@Q���d�@Tx�G$*@W�dv�@[MZ���@_;����@aÿ|v��@dF��"�@f�D����@i`�z&�_@lT	�K�@o}�&�@qrce��S@sBߜZn@u2!R)�h@wA���;@yp�L�H@{��c[@~5��q�@�f���N@@��r;v�q@�5%��@�@����*�@�P�>;|@����0@����L�@������@��%�,s@���-�SM@��l5I#d@��p�J�@�	>�1�@�9$��@�u�8�@��d�n�(@�Qj,�.@�s�6��@��4�@�^����@���kKh@�|�۞�@��=N        ?D;`9l?um�HI��?�;e5P;?���'l�?��w:�?�K��d�?۷E���?����\f?��#���?�� =���@C:��1@
�]�G{�@8���@!_�(@K��_@#��^�:@(�$ �@.����@2�z�L:@6�Ŷ�H1@:�'8�F@?�v��}N@B�"�@E�{��	P@H��'�>�@LfK��@P&��D
q@RD�b(8@T�8Z��@W��C@Y�7�~@\~gr%ʗ@_��`z�@a^��2@c��a@d�(�<b@fϚ��-g@h���:�@j��I ��@m;l�(�g@o�Qb]@q����u@rY��&�/@s��t��@u&R��yc@v�Y�g-@x5[6$��@yְw�t�@{��Mu�Y@}N���~@&)Dvؼ@��(�L�A@���{x�7@��)�ӎ@��x;1�@���^�@�����@��}��@�R���@����F�@��?Qu@@�H�ĭb+@����p��        ?��#�=�@��޲��@!*7ª�@3���[@BACR�w�@Mp�Mg�@U����@^>L�-$@dszd��@i�Y)��@p96��,�@s�Ks�|f@x'�r�@|��WxB�@���	�~�@���PhL@�x���s9@���=�+@�)�
�@�s�G��R@�vt)�@��q���@��딧@�\��3+@��L+�3@��� s�@��zR�@�^���s@��`�X�@������@�����D�@�c��cI`@�]�4��@�oc��*�@��1�K@��ػ_�L@����@�Vm�@��<}�N@��Y���@�U��a?C@��7��z@�DG���Q@��F6��@�jU�B{�@���u�'@�d��#��@�G
^�@�0�F@�!��,�9@�3��c@�]�s@�ǳ�2v@�-%Q���@�AZ���@�\IZ��@@�}��3Z@˥�"i=�@��sk1�|@�	X��D�@�D��Q�:@�C���-@���{I        ?_�Jx��?�?�YI��?������?�$I9�?�K��{�?Ա�?ǱT?����O?��|�AȦ?혮l�?�Me�X�f?��K���r?�p;ݤ��@�:�-�h@P���Y@
x�X{I�@�#y��@��⼩@�b�O��@�_!�V�@aܹv�@�]1M��@!!,��9�@##�b'U�@%I����m@'�!�:Q@*�%���@,��W׉@/b�O�/�@1(^$3�@2������@4Y��2Q@6q�9��@7�;�4Q@9�>Zۨ�@;�v�A��@=�I3���@@"Kh�`@ACŠ��@Bz��_)�@C�[j��u@E�\�6@Fw��R�@G��А@Ik5$%<q@J�^c�@L�*���@NM���Oq@P��f�!@P�m�;4�@Q�ەjw�@R��<��@S��[b��@Tڦ�Щ@U� !(@V�e���@X3]��@YCuC�T�@ZqT�Ι�@[�+q'@@\���F@^*����l@_y����@`g��(Y�        ?:��3���?p��~,�?����TG�?�O=��?�옪��?��̖6C?ݵ
�c	�?�t�1�C?�}�Fr�?�\�A��{@<�}��@L`�u�@e���M[@��xα@#�Ɲ�Ŝ@)-0���@/�e"�0�@3�	���@8C�!�@= Z��`-@Ag��Ȧ@D�!0�7V@H%z�`�-@L<���(@P4X�N�|@R��\�@U)Ȳ�ݰ@W��lm�@[c����@^J��<n�@`�1�$��@b�F��@d�TZ>z@f�hQO�@i=Y��v@k�����@n7�TE�r@pu��L4�@q��*��I@s`�f�9o@t��g�@v��E�Cs@xPp�l��@z�����@{��&m@}�i��@��b��@�+�16@�%�����@�I��O��@�x��+��@�����u�@����;԰@�H�j�m@����3�y@�:����@�~Iu^�@��-�{Y@��
�T��@���'��@�a"y�p�@�8��8��@�=sMC        ?F��ǟ�?w7����V?��x��9�?��A�r�X?�d`9��?������?�|c�p�?�?�(�?��1��|M@*�p�N@�Q=��@�_�̆@�ή�f@ �ȉL4@%�u�~�@+�����@1�nc�@52_ ���@9�7�i�@?|�Q�Q�@B���)@F`�H�i@JOZ}L,@N���H�@Q��}�ض@ThW�[@WO����@Zy��w($@]�k*��@`�d���@bπ�?j@d��5*ƭ@gCw��@i��J	e@lW����@o!<�)*@q
��\@r�J����@tBL���@v S�� �@w��S��7@y� ���@{Ȱk�@}��Hg�@��γ�@�7H�(@�k�C��@����;��@��e�@�X'���@��f[��@�7?YU�@���ۙz�@�K�r|YZ@��8���@��Y���@���5%�@�����@�v��đl@�h|˃�L@�aJ��`&@�a*>���@�h%3��        ?��:k�.?�[�:d��@r'
�e�@!��s�z@0K�7r@:g_��nJ@C��P7-Z@L)�r��@S��T�@X������@_����6@c��d/@h���@mH~��@q<f��1l@tBq[���@w��)@{:(O'��@1��;�@���?�'s@�`D�?�@��6��{@�F�U	J@�*q�*f@�A�[L�@�G4�T,@�	����;@��t5_�n@�窰}�R@�e
`|@�C�y��`@���=I�@�.T>�@�d3���{@���*Ǡ@�=�<T/�@��t���I@�_��t@�|һ��@��@�SJ�@����A/�@���� |@�Cf-�Q�@�K��nj@�]�1�B�@�z7�}@���H=N@��L��@��>3�@�P�b���@���a��@���̏'�@�\W+�a@���6S@�B2Msj|@�bU�E5@�(� �=@��n��n@��T�E�@ÛzǸՔ@�v��
@�W�OW�@�=}��sq