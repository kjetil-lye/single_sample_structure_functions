CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T115217        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?z�8��2(?��.�ʇ?�_�H�}?ơ�D?�l����?�I��?�HFt�?�V?��?�0�C�f?�U���?��/I�@?Y�3��@�=����@	�1�+I@�x�J��@*�'�N@v�M�@ `n�%s@�Z^b�@���?"@�Y٤@ �5�v:�@"�J�1@$JV4b�@&��aO9@(ܠ�!@*,tRRN@,��/;V@.8�.]�@08̩}�,@1_� ��k@2�����@3̞lj�@5`�5�B@6b^�A�V@7����~@9 ���Y�@:����?@<M1�Q�@=�)[ߚ�@?Ȫ�h@@W�g,��@A(�i�@A��+?�E@B�H�Pp@C��N���@D�E��@E��S��@Ft&D+?@Ggv�ê@H_�S�@I]M����@J_����@Kg$��J�@Ls��VF^@M�$G@N��&�r�@O�t}�V�@Pl�:�@P�4�\�@Q����i�@R,�Ct@R�#]�9S        ?|�e�}��?�)��gv�?��R�Y�?�r]Ç?�v���c?���E��m?��^:KV?�H�-��?����2A@0�"j�=@�w-r@���t�@�f��@+���P�@��!�V@ b��Pf@#(Q�PT@&0�'�I@)|���X�@-�$g�@0q��j�@2����1@4�i�:l@7����@9���U�/@<�-:�@>���Hp@@��q�@Bi��8@D$����@E����Uu@Gi���i@@I9�P�v@K�V��t@M���@O �@��@P���^v/@Q�B��@Rʽ�5��@S�E���@U"�l��U@V\^�.60@W��em�@X�N�t�B@Z>�)�p@[�ܗ�6�@]��_Ȏ@^p�	��@_茶zd~@`���΃@ay)���p@bB-6V�@c��@�@c�L�]�@d�e/�e�@e���{��@fp��wd�@gS��.�#@h;1�T'�@i&�>V;@j*v��@krRP=�@l$���        ?{æ�a��?��046D6?�ˏ4Ds?�?����?�sA�+?�i6d��?�H�#?�C?�Cv��1?�֕��B@;q;@��Q�9@��M\@
��O?�@�v��i @�s�5j@"?�J�@%,�<
	@(���:�&@,3�o�@0u�m�@26G&R�U@4�^�@6��K�z@9�Ll�@<L�6Hl�@?7��@+@A&A�=H@B�a�.��@Dyn%��T@FB�Ο��@H ��$�f@J+Mw�@L��@N;��<G@P7]�+T@Q[����N@R�c�4�2@SūEr7@U
����@VZ�����@W��	�@Y)0��@Z�Q��-�@\	�cA�G@]��Ң��@_#|����@``��d�@a5��*a@b>:-#�@b�]�!`@c�{Ѥ��@d��>���@e�uɠ(@f� ���@g�D�.S�@h�C����@i� s�eM@j�{ͣ�0@kͷ"�$@l�C�@no�*��@o)����@p*�ճ�        ?�VʽS]%?�H���V�?谯5"�?�
��?�@���� 7@�7w��@YE��u�@ ����le@&�o��@,&����@1�%M���@5l9���@9��e[>@>nzZHS@A�6n� @D���q$�@G�e���@J��-}H@N,�Ě�g@P�e(HK@R�ǜL�@Tۜ�]��@V�妄}@Y=��F��@[���q�@^P9��@`Os"30@a�4�'��@c�?��b@dzMol@e�?]w0*@g��QK'�@i�bl��@j�U���@l|N�7y@n>���?@p(B�&@p����@q��5\@r�D�;�g@s�h��}�@t���_@v +�d~@w�<v�-@x1�L9/@yT-���@z}����@{�>���@|��)�z@~����@`%�vM@�Tf�'
M@���ઈ@����vO@�Te�@�j*/��@���@f>W@�q1���@�+�Zͱ�@��d�H��@��]�
{@�n�2�v@�5ߙ?��        ?s�9
7�?�y��:?���D�?�eM���?��{悩?�]�78V�?��FM��]?����?�G��aE?�Cn��i?��M��S?���2�V@\q���@t��J�2@�jq-]@mA�H#�@NY?p@�sks@�%�h�@Ct_*�@�?�;U�@T��Ǩ`@m,�4@ v�2���@!�p-��0@#����7�@%(.�s�@&�_D��@(�tCj[�@*qq:�O�@,VX��-�@.L+�&Z@0)s�)@15D�B�*@2I��c��@3f5qDw@4�L��3@5��`��O@6���@8,���9A@9s*ڠ�E@:��zY�.@<�K�@=w�=�~@>����@@'>d��F@@��o�N@A��9�y�@Bfo�W�8@C.'=^�@C��8W�x@D�nc���@E��-<�@FtZ��-@GO�T��9@H.�i�;@I��1�D@I�l��VI@J������@K�C��e@L�S��@M�!(@N����("        ?z��?���z*C�?����?�E?ɠ�^F�	?�[�K�,?����K?��ϗП?���`�*u?��S���@�ˡ5��@~�k��I@�ґZP.@�=�u�@A']��@�g�ޢ�@ �,�i��@#[���@&uk�V��@)�t��֓@-|Xď1C@0���R?8@2�Q��B@5ڗg��@7w���?�@:��W��@<�Wz�EN@?��I�@ACb"��@B�圠c^@Dy���aM@F1�;[S@G�����@I�u�g��@K�k�#3@MҾeu�N@O�na:�@Q�u��@R+l��!�@ST�
�Y@T���?�@U�WT��@W
�.��@XZK�93@Y������@[q�u@\�Ɲ$��@]���̩�@_w�6}��@`�9��b�@aI;��zg@b���u@b�@���@c�:��o@d��0��@e|
�)f@f`��y= @gJ>��{@h85�j�@i*���#Q@j!Ѐ���@knb�6&@l�m��@m"?^��:        ?xh�*,)?��.�d��?����$C?��q����?׏�\���?�KDɒL?�D��2/�?����6�?���n���@J� 3@�G��D�@�*��[@1&�Lj�@V[UQ�@�k��@ ���}@#eӖ#�v@&�pH@)ߧ��O~@-�)��Z�@0�;�{�{@2պ|�ڣ@5�)s��@7{:���@:ڢ1Q5@<���VJ@?�aMX�@AD
/q�@B�uM�@DyLI�k�@F0��9��@G�F��@!@I�!N�l�@K�C
G8�@Mΰ�u�@O�k+z�n@Q��[@R'��4<@SP�v<�@T�7K��@U�X����@W���@XT��g�@Y������@[Rʛ&F@\|��3)@]�L@_r\)E[@`}��\�@aGZ.�0@b�}z�j@b��f�j@c���<�@d�����@e�
^,�@ffT���@gQ�`-�>@hBTtj�@i7�<�@j1���:@k1`���@l58Jo�@m>F�        ?���W%I?�(��c�d?�5��[7?���5�?�ʺ\��;@�)��(@�SP���@/m4�bx@  ;o@$�;5�Ρ@)�aj���@/S#�s_@2�fG�C@6LB���r@:���?7@>-ePd�@AJ�Os�k@C�k�f"w@F,U�/@HٓCf@K�����@N��a�]N@P�k�k+<@R�i�g�(@TKaayN@VC�O��@W�'�P�@Y�c��@[�
r��l@^:��O�@`'X�`3@aI��g�@bv�r��@c�[�� @d�k��{�@f7����A@g�tM���@h�&�$@jP�w�+ @k��g�G�@m<Tx��@n��y8��@p'U�4�{@p�Y:||@qà3���@r�����@sr��@@tQ�gr@u4�3�Ӈ@v�lNQ�@w	�z�i�@w�����@x��'f�I@y��\�j@z黜��%@{���@|��ŷ��@~6����@��@��,��@��J��j@�/=Y I�@��]�#i        ?st�d�[?��1����?�*8�1?�fdː��?�e�D���?������?�,J���?��h�M:�?��"�k�?�t�E�?��f�D�%?��z[9@ ��8��@ъH&�@ J���@
��o�U@��cw�@T�SUN@�,�7_�@ڥCU7Y@R!:襴@쮃�@�S>�@ E�:�֨@!�m򔵀@#Zڧ��@$��W�@&�8a� _@(~�?�R@*Wy��@,B>!Z��@.>cy]&�@0%���@15T�W�@2MZ;�@3m�A�"@4�2M�@5���r�@7O�bb)@8F(s�
�@9�z��6�@:�9�I@<AWB���@=�Ģ	��@?r��4�@@C�H�6h@A+Z��5@AĹ;���@B�MM�\@CU��l1@D$t��	[@D��P�8�@E����f@F��7Yz@G�T���{@Hh����V@IN����@J9c��@K'��ܫ@L	��@Mݟ-8@N��2�g@O��        ?�@̈́z	p?���4[4	?�����!4?�t��%�?ڵnd���?����Xz?�}81�?���BK�@ 4���n{@����#@���r��@��q���@�-����@b$�͹�@�Y��@"�p�*U�@&7� �d@)�����%@-z�a:��@0�"��ǝ@3�8t6@5���\�@81��8�f@:���)�T@=�ꤾ�h@@�	Z-c@B;s�}��@C�j=�(0@E����@G˹B�9C@I�e:�B�@K�E�<��@N4{t�_�@PD��]�@Qz/,K�g@R���s"@TsB���@Uf��@V�gj;V�@XB���eV@Y�Zx��D@[P�����@\��K�@^�|�'+@`"bp:@@a��b5@a�D-Yc�@b��9]\�@c����@d�$��@e�֩X�i@f��Տ��@g�_M�z@h�7��q@i�tM-�;@kz���@lEC��{@mq��@n�H".�@o�r$�P�@p�}��@q1qC�}@qגrּI        ?yi� 
�?�ϫ�ߢ�?��\83�?ɫ���?�FJ��?��@���(?����?�e�b�ø?���.P'@m`�Df@�2�4�@��Q�vq@[��P@Evx{�@�T�+4�@{��lH@"g8~��@%O$%7G+@(w>W#�@+�E��@/��l@1�B���@3�(�4RY@6�P��+@8i��EM�@:�2>64@=���Df�@@$k�V.5@A�xL�h�@C����@D��V5#�@FS7a�S�@H	��z�@I���*[@K���Y$l@M��ܪ��@O�h�80V@P�^��(@Q�{���@R����@T�~�L�@U7=��L@Vf�9b�@W��q�Z@X��{OV$@Z'V��ު@[w�p���@\В�|M�@^1V\{� @_�$��{�@`�yW��@aAڲv@b0���R@b�v�P��@c����g@dZ�*�|@e*��-� @e�|� Y@f�S�@g��"��L@h��҂+�@is����;@jZ{%n��        ?��'	�?�Om��\?��6D �?�L��y�@��a�y@��%�:@#1�� @�dx�@"j^V�@'�X�Vh�@-�S��0@2l����@5� ��Q@9��. �+@>T��Z�@A���po�@D.1���@F���L@I��M���@M&b�@PC�@��@R�8U�@S����JZ@U�Mg�h3@X(��f\@Z2a���@\z�W[��@^��cQ�)@`�ի1�@a�J�B�@cM#���@d���:�q@f ��b��@g��)��@i&K���@j���a�~@l]�M,mL@n��F%
@o����0d@p��C2/@q��P�/�@r���J@s�*J@t�d_�QS@u��y�@v�I�t�5@w��ݏ^�@x�x<���@y� ��@z�ϞXJ�@|#����b@}P3���@~��F�o0@���Ťu@�}�	U�@�ehԖ@�Ĭo�E@�l�X�j@�#�"�X@��P<į@@�woE'�S@�+}���@��uN9��        ?r ���?���6/%�?���A�?����J�+?�~A�rh�?Ղ}���?�@$l�/�?�8�?�hJ��v?�,Z9p3?����Jy9?��&s\@ �1��j@���j̶@���<@
���}Us@e�����@Bʀ��@u�R�,4@�����@EP��oR@���sm@�ůoh�@ BiRkv@!ŀ�;�@#Z"��B@% %|_=�@&���Ma9@(�$��C�@*Y����x@,D�[�@.@HCl@0&&���@14����@2K��R�@3i�a��9@4�`7'@5��G7��@6�c���%@83���*4@9yp���@:����n�@<�Ni}f@=x;±޾@>��w��@@#z���x@@ܕc J�@A�C���u@BY,�D@CA�N�m@C��!�@D�F��@E}3Pa�@FO*(��%@G$B�)g@G�ľ�z�@Hث6��#@I�����@J����(@K��?ӫF@Li֡ث�@MVnt@NFNFo�        ?zS}��+'?���H;��?�����?�ft�%�?�4�,���?�X���?��ZW�.?��(G�!|?��t��@��"��@�3�VdB@��CgP@1���n/@a��Xbl@���\�@ �)%Δ@#��޺M@&�����l@*!��e�@-�[�/,�@0񂴳/�@3(쬓@5k��§@7�|>�@:��`�@=J�ȷ�c@@�Z�@A���Z,@CK�N��@E ���1@F�Ρ��@H�R����@J�|�o��@L��� ��@N�߳�0N@P|�Uz��@Q���&@RϽG�V@T	;���@UM^����@V�'��a�@W��E��B@YY�a�|
@Z�u��
@\A�I�2]@]��϶�H@_T��?_�@`v�c���@aH�	)�0@b .Q@b���FDX@cވ6�_@dś��~�@e��|��5@f������@g�L��C@h�N$�:9@i����}@j��;0>@k�y$�1�@l�1���@m���~�@n��Q'        ?w��8%�?�qpT{.�?�׾0�#�?��0�H��?ׯۺ�� ?�v�S�7R?��Y��?�OdF�:�?�Xp���@�P�^�@	@
]�@�$�WT@Ǐ���@�;u @�+m
/Q@!1�q(�@$/�g@'v���0@+
~�$@.�$7��j@1��aFf@3�����@67<����@8����1@;�l#ez0@>mg�TO_@@����b�@B^-i�ī@D�NCI@E�����@G�g�?A$@I�0�Ǵ�@K�d��A@M�!���G@P�@Q8U r�@RlU�އ@S�ΖJ[3@T��#hs@VM[^���@W���0��@YO(Nt@Z����@\�G,�@]���!I*@_I��3t@`x��RR�@aS�2�8@b3�X-@ce��@d��NF@d��7~3�@e�f���@f��;9�@g�"@h�F�),@jq�I�@k�՟Bk@l9� @mZ+]�\�@n�@YFޟ@o�@R��S@pp�rz�        ?���k��_?�r�S��?����)?�:eԕ.?�8=�W��@����@֫!!�@S`�l@ Rª�@#�:/-�N@(��c��Q@.�"	+��@2}����@5�4\���@9�i~J�@=��9n?,@A&
�Й@C�5C{�E@F�w�0-@H�~��6z@K��Z,�@N��gi�@P�UsX��@R��E@T_�*��D@V6���8@X"vb���@Z"��@M�@\7H��@^_���@`N$A��@avY�Y(�@b�b��]�@c�(ӂy@e)�4:U @fx�2_�-@g��g�@i2�&�F�@j���$�U@l)h@m�]r��h@o�Ӆ@pRl�T	V@qn)XB�@q���G@rÂ��x�@s����@ty�¶�@u[P���@vAL=��@w*�H{*�@x8��:@yA���@z�G� 2@z��&�oh@{�v�1PK@|����@~�����@��@�I
㡴@����"#�@�"�:�t�@������        ?x��n0�?��y׺�?��s�?�?��	���t?��^�[��?���ux�?⺔Ŭn`?�;�5�?�fpY?�I!3�2�?�e����y@ 
�����@,k�Z�@�M܏�@
N�c��Z@P��Bh@N@W��O@�)W��@��x�@�z>��@ah��@D��:4�@ �c�?]�@"?��d��@#��
�b@%�V�E@'{B1$�@)`Os�}@+X]/7|�@-c�m�J@/�ʡ1]m@0ځ�n]�@1�P�@3)�ي��@4`��+@5�!����@6��G�܈@8=v����@9���C�@;�_��@<r�W�@=�"jI��@?q\��I@@�dІ�@AKs��x�@Bb/�r@B�K#�@C����=�@D�+� �@E�<�S1g@Fx*QQ	@Ge��k�@HX�~˘@IP,�T2�@JL�ϥ^�@KM�<�@LT4��@M_a�8j�@No|w���@O���k�:@PO:�⦴@PިzE��@Qp�#�`        ?H�k&T?�5����?��p��?̜�?�?���]�?�B�O�?��=�Գ?��PS�?�)���a�@�P���@
���ǎ�@����@� ֝.@&!}�~�@%.���@!���c�@$�[�a�@(@���3�@+�T�:6@@/�r��.�@2� 	U%@4WS���@6�r|��@9dt�UO@<)�"�5}@?
��@A����@B�2�:c�@Dt���@@FB���@H'��lO@J!�����@L2xH?�#@NYщ��@PK��^@Qv9]�`@R���؂�@S�.|�S:@U9�� J@V�* H@�@W�Ͻ_�@YeЇk@Z���Yr@\gq���@]���@_�5�e�+@`�e͆@a{��l+ @b\�6:�`@cC_O.��@d/����s@e"X�׊@f�Ue��@g�*~[.@h��s�@i'�s��@j7#��u@kLߩE|E@lh�k��A@m�FP9l�@n��9�_@o�I�$�@p�R_��        ?yl�ҿ�S?��E$h?��X�<�?�JV;�H�?�ڿ��=?��/�<�?��S`J+?��Q��{?�:�1Zd@���I�@ D�_�@|�6�@�;�`�m@��9��@�O�'�@���L]@!�����@$Ǜ��O@@'�Gɔ��@+0�:�ɉ@.���I:�@1NEr���@3Z�׺�O@5����mU@7�FJտ�@:I�['��@<ݼ7n��@?��H�et@A6fO\��@B�,�9�E@DC`���?@E����@G�E��>V@IZh0�k@K/h�j�@Mb��@O��ݑ@P���R��@Q��	�z:@R�YC�`@S���D@T�Z�%��@V*��=y�@Wd�!�\@X�e�i~�@Y��z�_�@[GU�D[@\�q(f*�@^
JP�&�@_x�����@`x�?�@a8�F@a�i�60S@b�.c��@c�!�5@dcnō�@e9�o@f	�fT@f�K��5@g�ק%y^@h��Z}�@i�Ư��@j�$A |        ?�Wt,��?�1��Y�?�!~�Ǩ ?�E+����@��\^	o@'�+�@W$�@ �����@%�B�@+ DԸRz@0ַ���^@4���6и@8��-��7@=F+���@A�$QX@C�r�v@F��#)��@I�W��O*@M%(y.�@PWS�)v�@R7�8)0E@T3mHN�@VK
۸X&@X~���%l@Z����׶@]9sHi-@_�
�W�F@a2d����@b�[J��}@d mg��>@e|���_Y@g��"T2@h�m����@jFY�D	@k��E��@m���@o� [{�@p�A�}��@q�S�):@r���H�@s��6��@t���UL�@u��D:�@v�� �*�@x
�ߘ@y2�"�:�@za��� �@{�%M|@|�C(��@~x��s�@d�%K�@�[�&���@�@�"I@�����@�lY�lw�@�#���o@�޾�[��@��TW$O�@�_���r�@�%L8a��@���� @���� ؔ@��8a�!        ?s�\u�r�?�~5Qcϩ?��1���?�0_D�B�?�����x�?�u�X�ŋ?�;7z�?�}R~�h�?��T�?����4��?��.�5��?�T:ʸ��@8䬱~Z@�����@	?;��r@8�&�@�^�dČ@��~��@����I�@%��2a@�6l�k\@���p(�@ �so.E�@"$�F,�d@#�C��8�@%�M����@'��W�ߑ@)���"@+�p�M@-���'�@/�,� �a@1'A@�B{@2Z��
i�@3�k$P�@4���*�@67]Ao\�@7����l;@9)T�S@:vJ�:ZT@;�s�@=��·�@?v��@@\-�n�V@A2	c��@BO����@B�����@C��<�<@D�|_��@E�G�(7=@F�k�q-@G��a�i@H��#��@I��̂ާ@J�$is@K�Ǳi�^@Lڬ ̊{@M��t��@O(����@P�����@P�>a��@QK6ʼ��@Q���V�d@R��g�W        ?{L�P:�X?��:O��&?���҅x?��z��y?ת��N(?�f�N�i?�|��=*�?�/B��}?�%tk/�@_ࢢ��@	�8�b@��E?�!@��[o�@��:+��@�2 @߃@!�HԻ@$�3R�@'I��Z]{@*��@[^@.��U�L�@1s߶��@3��9� �@6����@8�&��@;t��N��@>`���{�@@�э�@B_Ǌ�(k@D���i@E�k<rT@GҘM)b@I�O��r�@K��PeZa@N6��k@P0cf�9�@Q`Rc�-@R�{���@S���l��@U9�N�ԡ@V��B��@X�]�@ @Y���	�@[	��П@\�M��@^=��@_雙���@`�n9�`@a�d�vL|@b���IG�@c�Yk�`"@d�Y� U�@e�W�F@f�i��@g�w�#�r@h�ߤG�L@i��Y�d@j̸���@k�(Jd��@m����[@nG��B)@o|v=�@p\�;�@p�%`�`L        ?y/Es4?��0�D�l?�R�22�?�3o�Ns�?���a��?ㄢ+��?�r��D?�+�j�o?�	�U��y@>����@������@F���>@U����@�4�Co@5���j�@ �b�kR1@#��]�@&�k�a��@*.�;�2�@-�e��@0�Y�XgA@3"�=7c@5tR�~�@7��,��@:��DCv�@=\=�y|�@@(�14�@A��y��@C]̎1ki@E~�|�@F���Ǹ@H�Gv�7`@J˵���@L�^c�ڗ@Od�o��@P�t~��@Q΃���@S��XL@TF�/0Ї@U��JG��@V�IA)�@XP��Y�@Y��>��@[;���@\���R�@^UClt@_�I2��@`�s���B@a�gi�~@b�x�^�@co��o�@d[��6`�@eM�i�&@fE�2�@gB�Q��@hE���+�@iN�¯��@j]]p�q@kq���x@l�n��@m�PD%�@n�ڻ�ـ@o�Uz�|�        ?��U#�D?���n�i�?��M��?�+��CEX@ ֓Ad�%@
���@~=Z��@�z$Y,@"]�Y�Q@'B�`A�@-<W�'�@1���*�@5��)�Q�@9��vn�@>t��a�@A�|�o�@Dfқa��@GMl4Y��@JjbF3�d@M�6wq�@P��bV�y@R����8@T������@V�1��<@X�,{恶@[%�-*�!@]��"$�;@`1k�sr@adoz~�6@b�>-�x@d83t��2@e��J׬2@gE�"��@h�h��%�@j�y�n��@lG	|�@n0]��@o�+hn(@p�]L�#"@q�#̧C�@r�)}9�#@s�m�	3[@t���@v�����@w,�ȓ�@xQ��F��@y~F[J@z��k�;@{��(Y@}.ې^;(@~x'۔�V@ȫ1�aR@��2�Ě@�?�C^+�@���vYx@��\�C�@�c�U�C�@�!huk�@���*Q��@����[@�p>����@�<LԦʷ@��*�        ?u4�
}�?����O-?�M\�A7??������_?�ZIL��"?טR���?���+-�?�`I4O ?������t?�qn�?�n��4�?����"@٥,��@Qf�@�(2"�@n���#�@D�w�@w�((z�@�l��@N8m�x]@�LN�%@�i!bgW@��9^��@!a�4�#�@"��w��P@$��x)��@&vZo�/�@(Ng��@*9�#�"@,8c�2V�@.Jd���@07��V%�@1TNc�fR@2ztWe<q@3�[�J
=@4�"�@�@6'|{f�@7t���Ժ@8˹|��@:,z`0R@;���s��@=$Al�@>��}�@@F;�f@@�ێ���@A�>.�G@BpjH]��@CG]3a�@D#Dhn@E�H�M�@E迤u!�@Fұ`���@G�]�
�@H���q��@I�۲�@J���4j�@K�"n}(�@L�H���@M��CB�@N˄
���@Oߍ�]S@P|�V �@Q
�I�$�        ?|J����q?��C���?�5Ȑ��?��r�#��?�^9�2�9?���G�vz?���đ�?�S���?�&"bLB�@A��̓@����@HL$�h@-3>�@C�=���@ԏ(oN@ q����@#:z�ĉ@&E;�E�@)��?���@-&�,˘w@0�h>�Z@2�Hc<��@4¥U04*@74_�G@9���䌃@<6��u@>�6��=�@@�3@BzH��H�@D�<�`@E��/�w@G�=6���@IS��(�A@K9ս�@M1C%��@O<Ofv��@P�vO{@Qņ��0-@R�a|^@T�n-\�@UGmɾB8@V�����y@W�DS���@Y\%�B@Zx���@[����;@]J]�I�@^�HRҼj@` �N<m@`������@a�i�m�@b}ΎT=@cP�e5@d(�>VF@egۗ��@e濟%Y,@f�Կ5WJ@g��h��@h�7�a@i������@j���1z@k�[�p��@l��OQ]�        ?x�P䤩�?��G�2+?�l��.�?�r"!��Q?�4V4p?����p��?�.Hǡ?��tg�11?�ʍBP��@���~k@	��Z��k@ i��@���e��@M���.�@+�z�}a@!J�Λ@$F���@'��gH�@+�x��#@.�C��+�@1��暕+@3�"�SV1@67	��M@8��-��:@;}��>-�@>_ll�_@@���jĩ@BP��u@Dy7�@E����I@G�x�M�@I��6
�@K����"@M���0��@O�T�� �@Q�4:դ@RI�3 �@S���8�^@T�_�+N@V�$�@Wu�����@Xܠ���@ZN��]@[�,G��@]TǘHN@^�P�\6@`C���@a! �~g@a�ϳ9@bԚ3<�@c�ݸp��@d�ӵI��@e�~\��{@f��Ѳ�@g��.7�@h�υ�#@i�a��@j��aC�@k����T0@lԛ��@m�6&jA�@o��(��@p"a�R        ?�X��bb?�S�ۜ�?�T9�.�?��Y�@[!ha@��'��@��?j�@Ey�+`@$J �,@)܍�t�@06�a�"@3�m�Q@8y2
�:@<��J�_�@@Į�ZT�@CxԬ�9@Fei�1��@I����R�@L���O��@PAl&I��@R+_|@T1��u�@VV_���:@X�~�	[�@Z�rc|a�@]v^ӀYY@`	2�U,}@afS<�@bҟz3�@dN&g�ܱ@e��h�d@gsF:�t@i��٩@jդ���8@l�"��?]@nv/P�mY@p.��9�@@q*�`�1y@r.���@s9l����@tL��W�@ug�]-��@v������@w���}�@x�D��u@z"��Nv�@{eYlyҺ@|���b<�@~��3a,@\9�Z@�_R
n @��On�@���m��^@���:���@�JZئ)E@�[���@�ף�wV�@��+��?�@�t�@���@�H���_�@�!;d*{�@��`����@��f3!        ?w��\-�?���f?����T�
?���g��?�D8Ҫn?�(�)��?�PB,R!G?�ƪ���N?�<A��;>?�3{q��?���׻�s@�-|��z@�Hz��@�]QNP@�TdjW@��p�hM@��5��@q�}�	@!����@�B��W@��D��@ ��Q4�@"H��J��@$�W�Ii@%�e�s�@'�%��T@)�̡̓`@+��|�@.#�:I1@04�����@1b9�M@2�:�B�@3�2��P�@5*�@�@6�bɩ�}@7曗ݐ9@9T�+���@:�R��H@<PΉ���@=���9@?w����@@����h\@Ad�7U�@BARJPH@C#Z�L�@D
��@D�Q$5�@E��Ī�@Fޢ�>w@Gڬ!@n@H��Y[�0@I�t*"�H@J�(�8�@K�
�50{@M���@N08�4�@OPug$�0@P:�)RN0@P��S�@Qg�C�!�@R��?<@R�t>D��@S=��n?�        ?|�@�|zN?����D�?��7ȳ?�������?�
�O�5?�LCKY�2?�*ud?��Y�7<q?��xԧ�@���b6@	 Z��u�@����)o@q�����@�x|QV�@3�Ԓ�@ ��@�Y�@#{I�.�@&�Y��@)�|�	VF@-����9@0�G$Nv�@2���@5	$�|��@7hɺE��@9�Qx��@<��ܳ@?f�0_*@A-H�@@B�h���@DZrx$@Fr��y%@G�uU�ȡ@I��p���@K��H���@M���>�@O�?�ǹ�@P���a.V@R9#m�l@S*&Щ�c@TY��I#@U�Ƿs@V�z��t@X!�7�o<@Yw�Z�3�@Z�9��X@\@�e	Z@]�����'@_.�[� @`Z/E��@a!�-���@a����@b�0�w*@c���8�@do��V�>@eN�(�K@f2دe�@g�7PO@h驠��@h���t��@i�%3}^@j�	P��@k����g@l��u��        ?yK���Z�?�MXIe.�?� '�l��?��_�I��?آ�� �#?�*I\<fi?��z�D?��֭ȑ?��( @�y	A�@	��7Pl@?'-|��@)���@u@�g�@XK�@�@!cb�e�@$ba"��@'��^��@+>䃩��@/�}�L�@1�P-�}�@3��7�M@6N(B�'@8ޝ (/�@;�i��@�@>{���jM@@��:,!X@Ba��3�@D���@Eٵ�o�@G���W@I�4%E��@K�Š��@M�W�Kc@P��,�@Q'�c�@RXk�&�@S��v�@T��I�D@V,�U3 @W����]@X�{����@Zf�gJ@[��b�,�@]o��H�@_jK;��@`R�(~��@a(nI��"@b���D0@b�0��@c��dF�@d��ۡ�@e������@f��[d=@@g�F֋�@h�1����@i��|/@j�����@k���S��@l���@n˒�G�@o.T�T�A@p,�ǂ        ?��C��?�Oj�q:*?��pU��?�K^L�@@��/��@{����p@����"@ s��hg@%�f�$��@+��oL��@1V���)@5/�ϧ˶@9q��/�@>�z>��@A���V�@D]."�f@GV�>�@J��y��@M�?Fc��@P���:�@R�T��?�@T���y��@V�簪�@YR{�F.@[v��nx@]���@`A`Ҝ��@a����;�@b���!@dtr�g�@e�4%y�@g�0''@i'j֤/@j��}Hl@l��� �k@nZ���e@p��Hc4@q�Dl��@r����@s	S�"+�@tF|�%@u"d��A�@v9�Cٺ@wXIE�@x}��.�3@y�T�E�@z��d1�@|�Mp�M@}Z�!�	>@~���%�)@��Q�E@���i�E�@�T�&��1@�>�_\�@��Q���@�v��?r�@�3�{�@��Y2��@��>��_@��n�#�@�JG[��@�b�^��@��݁��        ?v�nH���?��2��x?�UA���/?ïP,�b.?���u�?�`�X`��?�	e�:?��*ȩ�?����d?��Т�4�?�Ј'�s@ F�#�V8@m����@�9��9�@
�h�c�@��!̐@ob�"g@�P��V.@%��h�@�BG��@mD� z@G����D@ �#�{��@"4��%И@#�.*�@%�ϑ�O@'Ur�;]�@)/�'9@+}_eZ�@-����@/&�ras@0��Uᄄ@1����b@2�cI�@4�v��@5<�7��@6w�><L@7��:*�:@9��g$8@:]�W���@;�����@= �Q�
R@>��F$��@@���Vo@@�Ӷ���@A�% "m7@BL��ˈ�@C�z�3�@C�^ｚ�@D�����@E�-���@Fm���'w@GL���j-@H/�IO��@I�B�3�@J�%+��@J�Z���~@K�ЫI@L��c�7@M�D�l�@N��ʕ�7@O�=��@Pk��H�        ?z�{`�4�?�Ը�,%*?��h�#�2?ɟ����?�X��uZq?��*�5?��X���?��h�$�Q?�����O)@�����@{0Eޛ�@�`��@ �1��@K��`��@�amO;@ ��<g5@#t�G+}I@&�ldu]�@*	
��j~@-����x�@0�S��`�@3-���@5\"E�S!@7Ӹϕ�=@:sl��@=;�˅HM@@j*�Z@A��T ��@CE�F��@D��*߁�@F����@H����7@J����Zq@L��H��@N�t��"S@P�g�A@Q�J�y�@R�癀?@T?i�C@UYP�aR@V��.��@X��ĭ@Ykι�^@Zܰz��@\X;�q�E@]�k�#�@_o:��d�@`�Q�f@aXN%=m�@b0��J@c+���@c��T�$U@d��TR�F@e�$�@��@f��/N��@g�N�_.�@h�4Q���@i�MGm�.@j���w�@k�1_
@lԽ�7� @m�dO�>@o�����        ?wn��Vg�?���!j?�0�w�W'?���)�?��=~��?��نF4�?쐨�&�l?�D����?�0M���4@��vz�@/�8s��@�j���@�/���/@�r�m@����D�@ d��n2@#9��մq@&U��?@)�F����@-e�_	��@0�S%{T@2ς�n�8@5��1�^@7�'ڼȬ@:w��@<�?���@?��db��@Ad* �H@B����}@D����@Fo����@HG���@J2����H@L2h-���@NF�g@P7����@QV;�X�)@R~�>�-@S��%�@T�
�`�{@V6P�?�@W���� e@X�<��Kw@ZH�2��T@[�~m�^@]2.)�r@^�����@`!�<u�@`��ֆ�@a�P^�@b�:�Ԧ@cn���r�@dN!��)@e2�t@f�!W��@g	�E E@g����@h��42��@i�C���@j�O��E@k�Ͳ�A@m��-�#@nf��         ?����9�?̴���.?�q8~��?�m�֮�@yn��'�@`%X%@�'���j@z@��jn@"0���t@'S�&@-'#-�@1�bs`��@5u�@F@o@9p%���b@=ƷZ��@A=)�x�:@C�ē�a#@F}g���@IdAgr�T@Lzv�~�@O�!�u��@Q��	5��@Sm��ڸ@UW<���@WY3^�<�@Yr벽&@[�\w��@]�u��;�@`'-�e@ac*â��@b��,�|@c�_���@e]]�X�{@f��S<�@h=�`��@i�I�v�@kK�Q �B@l�S���,@n�&`�LY@p��+�@p�[�/��@q�#ei*�@r�H��)�@s��w~*@t��8�.@u�{j��t@v����r�@w��G'��@x�i5UIh@y���+�@z�vc�h@{�G��)@|�xr�s@~� {@(bR��@�(��6�@�����h@�Y[V�O�@��;l��Q@��P3�D@�4$2��@��'z��@�|��Q�        ?u �!�J�?��ߢ�?�l4}�mw?��v/�<V?�ϝ_߃�?��!M-v?�X%���?����E?T?�?��TA?�絲/�?���=ͩ?���c�e@�p�3�@4gM��@���&@u�XRɛ@@�b�s@hp�C�@�Q�|�@#��wr@���N݌@m���Jo@HWPgRh@!#gj��p@"���܁�@$W��^�@&��M@'�JǬʟ@)�����"@+���P�@-�7�>�-@/���G�@0��>F�9@1�i,�@3G��%;@4=~�3�@5m�;
�B@6���?_@7��,@90fB�e�@:�E�Me@;����@=:��R��@>�#�	(@@	��+�Y@@Š��q�@A�k���@BI�^=R@Cg�x�=@Cێ�-��@D�sC�(�@E}K�.'@FSW���J@G-F^,�Y@H
��Kz@H��g�w�@IЕ�X�@J����G{@K�a��x�@L�y*��@M���@N{�%c�@Ou;��_        ?}4_�n�x?�
�,�^?�gI@���?�!EP}?؝tO"�?�>Y=1(?�X0A��?��_+�?[?�� i�/U@��Ӱw`@	YSXYl�@괗�,@�<"(�@�#���\@�x{cw@ �N	@#��Ƶ@'2�h�@*�ƫ���@.Bj� Y@1%��(@3N�����@5�"��c@8.���@:���+�@=u5�_@@0fT���@A�,�l@CW�z=iC@E	]�#�T@F�,�˃@H�)0�jS@J�`@��@L�ً!�@N��u�2�@Pm��|�3@Q�}��ţ@R�L͍�@S�=qG��@U)L"_��@VqtS�x�@Wð��%�@Y��e�@Z�NJ��@[��H�-�@]p�$O�@^�0�^�@`A��H\I@a�W� �@aޤ~��@b�}�l|C@c�:j:�@dnո˺@eSJ߹u�@f<�ID�P@g*��D�>@h�P���@iH��&@j�.��_@k�{X�@l��L�@m#��\�@n2�랟^        ?yR���N?�ˋp%"y?���<i�?��^)9k�?׊�S�H?�:�^��?�Zi,�j?���s��?��4b�@��Z�'@hO'��k@���>�@@ t��@W��r@�9u{4�@ fP}Ug+@#5�����@&H��s�j@)��	r�i@-@��K��@0��O�@2��1�@4�쳊`@7J�C�f@9�l{o�@<��4
�@?R���Z@A&&b�2p@B� �|�Y@DY��'�@Fhl��@G�oȯ@I��3;�@K�Mzq��@M�� �6@O��
?]�@P��L�%@RUa�v@S<��p�.@Tn�=�;0@U�>1{�@V�X�y@X=�d�@Y�v���@Z��s<�X@\b���3@]���ɞ�@_T���:@`m�Ƕ�Q@a5�tX̗@b�ɴj�@b���k�/@c��AB��@d�R���@ecK1���@fFǉç�@g.�k"��@h:�鈚@i)J2
�@j�%�@j�\;���@k��t�<%@l�;�A6        ?�����/�?�8���O�?�؋��?�[�M?8*@��e��@ѳ֥ʋ@BϾS@n@��%�@"��]�b]@'�L	a
j@-�E>O4@2+��@5���
M@9�$�0�g@>M�ho(�@A��a}�@D���n�@FޜD�@I�L��nI@L��s3�_@P!���D@Q��z��@S�bxw,�@U�YV��@W�c�<�C@Y�zhR�!@\��;�@^`��ћ�@`d��]�
@a����g@b��-�@dH���@e��Rp$�@g�]#�$@h�2���@j���*�@k��`��@mH��n@n�_j�@pPթ~��@q/n�n�Z@rn�dt@r��ɤ��@s�me{��@t�W���@u�y�Y�@v��A�>�@w�F_���@x���O��@y�r��d@{Y�Z��@|'򩯭@}7�I<U�@~Y���s�@�\��r@�U�P�Ss@����@���h@�@�%`T���@��~&�@�e���%�@�	����@��^�+�        ?x�e,�� ?�OG �~?�Dˇs�?�i�Y��?�{o����?��? ���?�_�M�q�?�e�8P�W?�H�7��?��D-wt?�/��;�X@ ��l�B�@�v���@4�q{�>@ `�@�2?7�@�.(�@��SrV@�.�:�@@��7@K�,�@3���o@!A=�a@"��+�V@$i�^���@&4�p@(.���#@*HsJ`@,
i�2�|@.$��G�@0)gjf%5@1J�C�@2u��L�@3��Hۿ�@4馧�0.@62����B@7�A�R+@8��]7�@:H"� w@;�.�S@=1�3�P@>�98���@@!/��@@�I�_��@A�E�G�@B��~@Cj�}x<@DH����@E+��ӱF@F��C�@F�����g@G�7����@H�(Ei^&@I��*1@J�5�oo@K���@L���:!-@M���N\�@O�֛b�@P�1��@P�A��0�@Q/ 7�]"@Q�K @O�        ?}���"?�j7�.�?����| b?�g6�w�?ؾ+ g?���^[?�I����?��9��?��V!8d@�����&@	��c�@��Q�-@y7�@�5Rq�.@J���[@ ��x}7i@#����J@&���l�/@*
.��.�@-���TN�@0��霩<@2�#��I@5&��/�.@7��<�g@:n����@<�8r�(�@?����d�@AF��\A@B�AK �@Dy,���|@F/\�p@@G��ՋG�@I���r�@K�]���@M�k�hk0@O�� ��@Q�쓰@R&Q�@SOǭ���@T�)%G�@U�zN��@W���<@XX�Vnl�@Y�:w���@[x�B��@\����V@^��@@@_�tځ@`�w� �@aUB;�I@b&/�۟@b���B�@c�~XS<@d�2F�j3@e�l�"�@f��3��S@gv>e/@hjڭ^��@id�fx9@jc��.v'@kg���(-@lp����@mDb�%�        ?z�B>�B�?��72�_?�����?�\�?���?����'�?�0�~�?�y���?����o��?��%}��_@��K�ۗ@	Nfm?w�@ґ7�/*@�	q��@�\��@��v�4@ �-���@#�)�^@&�ʫ<a@*7B���2@-�� �@0�l�9��@3`�ʮt@5D��x(�@7�>�KCb@:2ăBr�@<�Zs��O@?�6W8X�@AWB�-�k@B�M�7@D�q�Q}@F>1-���@HKσZ�@I�V{���@K�Tߏ�	@M�I���`@O�6�)`@Q�,�f�@R"}(�zL@SH�Q=X�@Tx�T�@U�'�@�@V��z���@XAA�N_@Y����G@Z�%AQ�`@\^���~@]м��Q@_L"�]��@`hvp��@a/�t��@a�KJ�N@b˷M�@c�˾Yn�@dz�.���@eX�5��|@f;�m�[p@g#�mr�y@h���q@i �� @i���ǚ�@j�����9@k���@l��`��        ?�.�T;��?��[ۃg?��5��.�?�;����@�Su[�@,�O��@\�-ċ@ ��A��@%��(@*��S -@0����@4�\�@@8��e=�@=-��p�@A��5WK@C��q�@F�UKx~`@I��"��@MCn�8�@PE1\�@R#(Ľ"�@T�{�e�@V1ξS�@Xb����@Z�t�[@]8Ma�@_��`��@a��B@b|�x<�@c�RykP$@ec��9L�@f����@h�\�I�d@j&���V5@k����@m�B�7�@og|헮�@p�ӕ���@q����i@r���>�@s���u,@t�g����@u��[l�@v�Z��B�@w�jƉS@y
w�@z6)D���@{h�Jښ@|��K��@}�dZR+@(.?�8@�:����1@��� �@����5p@�B����*@��i���4@���<���@�hW�L@�%杠�C@����'1�@��`���\@�sUdNt@�>	�i�        ?t0�Լ�X?��f�b?���}�?�q�~�8?�9�]�r�?׈B8:ݏ?���Ax3?�L�ͣ��?Ѱܖ?��C?�6�<ܟ?�p�.w��@�^��Ҝ@�%�Z��@ �k%S�@Ɋ])�@�i۳Ih@�E2���@+|��u4@�ZL&C�@ְ���@��U.|�@`~=C�@ ���F&@""�W@#�� ��@%V�KѠ�@'
�{9B@(�MV�@*������@,��-��F@.|��6@0Aa���@1LyO�`@2_�D��u@3{�tmR@4��B�Hn@5�7I��b@6��`�ߝ@89��Iv@9}L�7`�@:���Q�@<���z�@=xB��M#@>�țu��@@#�2:�{@@�C�e��@A��e!b/@B\a��@C!����M@C�)� ��@D�f�{]@E��kO^B@F^��K�A@G7dX�L�@H����@H��5H�@I��9�@J�H�{~@K�N���o@L�"���@M��AW��@N�6�/b        ?|(���nL?��h���?��uMD3�?ʊ�W�߀?�&Y;���?��7��?��ߎV?�o�q3t�?�l��P-%@� d��@	.V�9�@��d��@�W�3^@����ϱ@���*d�@ �����@#��.0p@'�FG��@*����@.\$���@16���Z@3f$m#ZZ@5�!�M*�@89[�Q5�@:�7�;@=��h�'@@Pu��@A��h0��@C�0.z�@E9�fmU>@G��-@H��D� @Jܝ1���@L� �!�@O3/%ڭ@P���f@Q�����`@R�w'��@@T)�p':@Um���<@V���]@Xf�0O@Ywq[v��@Z��}��	@\\�?O��@]��	��@_krx�*�@`�'���@aQ����@b'q�X@cE8V�m@c�1���@d�367�@e�D'���@f�_��a@g������@h����A�@i��*�QY@j��{a�@k����7K@l���M��@m��s�Ώ@n�-C��        ?w�����O?��?�ʛ�?��~��&�?����F��?֛]�
��?�ʗd�?��f=7�?�"�yI+?��7���-@W��%�@���B@�9睥d@t�IX�M@tY���@��h�?@�,=��@"��B%
@%��9�I�@(�T���u@,����@0)2~�g�@25ht��@4eܘP�@6���wO@95�2�@;�Sn2�I@>�&Ud�r@@��
�X�@BJ
qhR�@C�>O�|�@E��]ی@GT����&@I)PR|�P@K���Q@M�誗�@O�>y<d@P�>��`<@Q�F�F��@R�Ո�T@T�lU��@U>p"w�@V~nQ ��@W��*���@Y���� @Zv�g�ѵ@[�AQ�4�@]J�߸K@^��ۿe@`"V�G@`�)g�PC@a���"^�@b��@cQ��w��@d(�G�`/@eh"l�'@e�e� �a@f��R�,?@g���/"@h����A~@i��Ұ.9@j���$v@k����/@l}ۭX	         ?�5Q]��?ˮ5:�p�?���m�?�l�y�@ �k�L,U@
���ӭ@h�^%\@ћֈ�E@!�pN�ze@&��pZ�@,�gSci�@1��vH�M@5�<T��@9"��F�@=]��f#@A����@C���l@F=�I}��@I!�iG�@L5�YK�0@Oy)���@Qvn����@SH]X@�&@U2h��J#@W4����!@YN�K�J�@[�Hl!�u@]˾a=D@`��lA@aTJ*�+K@b�g�y��@c�i�-�+@eSFWk�2@f���T|�@h8lC8Ʀ@i������@kL���BA@l�1C-��@n�w�j_�@p!/�B~�@q p!��w@q�zخ@r�J�@s��=r�@t�5+T�@u�J�	�@v��H�@w���J"d@x��U�l@y��[(�@z���T��@|�:I�@}8{��@~a�iB��@�+�E�@�c���D@� {��@���[�`;@�C����@��w�Nߜ@���,zT@�=�� e3@���M�        ?x�a ���?��C�T?��٫�o?�^�sM��?щ�%4�<?�+w�t36?㍼Q_�2?ꭏ�f� ?�zIO��O?�0�-�\?�z7��[s@ ���Ŏ�@��ZzN@a+�k�@)m�Ϫ@:N��4�@��3�ZO@��%R@�ߟ,s@(���P]@��� r@�ה�o+@ �m6�@"y��:�@$���YJ@%� _��7@'�U�?�@){%z��j@+g~��%W@-eM���@/t~�}Hd@0�~�:�@1�X4w@3��ٽZ@4.��j��@5a)���p@6�b�j7@7�n!ul�@9+6���@:k��O3@;���W@=A(��@>��\�c@@@�T��@@�k��D@A��6£K@B\h�F@C(:h���@C�F�Y��@D̏��@E��+@F��zv5@Gb��s/<@HH4��d@I1w7T�@J�-��@K���[\@L�%I@Mn�l@N ��@OԀF@P��4�N@P��0(F�        ?}y�� $_?�M�FD�?��;
���?˳D�oC�?�1����?䕠���?�/;��]?�U�f�^?�����Ts@L��m@
*���@z�0��@[�� �@�a��e@���ő�@!�Ma<L�@$�?I̎�@'�v�@+Kg4Pq�@/��1�@1��D~��@3ͺ6���@6%Pl�V@8��G��@;D)�L�%@>+¾W.@@|��\L�@B´�Y@C�s�I�8@ES(o�@Gv�@�@H�1)N�@JҮ�B@L�X��@Nڞ��-�@P}6��,�@Q�Z'^��@R�����k@S�/h%!@U��ޟ@VV�?iEo@W�Z½K0@X�5���#@ZFh���@[���.@]��@^���d3j@`�ղU+@`Ģ���}@a��2xI�@bW�!�s�@c(�9�@c����R@d��y��H@e��r��@f��>3T�@g|�S�@hf���@iVYiǝ@jJ(�l4@kBl�#9@l?$��&@m@TGL�        ?yl\�PY#?��GH�5[?�;j�h?�eZn#?״��J%?�]�f�1�?�S��?��R�zYj?����	��@����@�����@��G!=>@e�5 @1�z	�3@�P�뉘@ ly��@#66`��@&A�o�"@)�U[��G@- t �k+@0z����@2�{$��/@4��w#�@7?�K@9|}����@<a��@>����@@Ԍ�.��@BS����@C�s=v�@E�q�@G9z�k�#@H��5��@J���ӱ�@L��px�@N�/E�w@P\� {�@Qhu��Y�@R}1H��@S�<��@y@T�����@U�C�A�@W"�9�@X`�2!K-@Y�ͳ�;�@Z��*l�@\K��<�@]�(�ӓ�@_;���@`>�*�v�@`����@a�b����@b{ up8�@cA��6�@d8��zC@dڈ��w@e����@f���ٲ9@g\Qo���@h9�����@i����@j  >��@j谀v�)        ?�������?̷��?�V;��K?���u�@��,�@
�>���L@S4P;�p@���>:@!�Fi��
@&z�{�> @,��k�@1"9O��	@4���@8X�o��@<s�1¿�@@rQ��A�@BծI�Q�@Ed+z�[@H�}�n@K�9�|m@N0����@P�k=���@RZ�t�M@T$�=��@V�'�I3@W��R�@Z �ӟE@\ C��>�@^U��@`O�����@aF�9ii@b��A9� @c����C�@eM���z}@f��D�k�@hT>�@i{$���@j�Sk8n@lwխ�Ev@n����M@o���[H@p� 8o�@qvC2�}�@rQ��c@s2��0@t���i@uP�͉:@u����@v�����@w��^{�@x���u�@y�)'��A@z�r���@{��fأ]@}Tbu�@~'���� @E�	�FD@�47?�?r@��,tuoH@�^�*C�g@������@��e��@�1�@n|=        ?r�/�ƹ?���s?���$��?�0�~���?�,`l�>�?��]�_E?����C?��Nz�??����}W�?�v���?���z�C?��{�~*V@ ��9rT�@�G�(�@D���@
��Ǉ�@q���,@A����T@l@-���@�G%��@%ik7K@�3�F}@d}6�p@ &-@!���y�@#9f/�@$�[�j��@&f.�Z�@("�����@)ﷄ3�@+�T%��y@-�n�蹲@/�����@0�uڏ�@1�;86@3��:@4+�V��@5T�z�b@6�VC�]�@7��]��t@8�U0��@:F 6�@;��5��@<�	�Ό@>PV� �\@?����@@��5�F�@AQ(G�ߠ@BU��A@B�eez�@C�QH]OE@Di�(�@E8�m6cf@Fb��L@F�.�|��@G�6��@H��?/K@I���@Je0�V��@KN�B8Y�@L<[��@M-j���f@N"jg]�        ?zY�D���?�t�҆�?�h�C�u?�:-v>5?��h1��?��	ؒͤ?��%D*x?��T�"�^?����_@�n �@���֔7@Y�A��@C�"��@~u'Y�\@>m|�@ �@`�&�@#��j�!5@&����a'@*f`*�F@.3t����@1'W�y@3\��d% @5�p�@8A��D@:�04>�@=�(Lpe�@@g�ò��@A�(>�L�@C��B+V@En��T��@GF�h��G@I5)[q�@K9Q��c@MS�I@O��@r=@P�>|��@R�:��@SMKlM�@T�Ӻ��@U�(�zc�@W=u��}3@X�_&@Z�V���@[�S��@]���2/@^�q�k�@`'T�p�,@`��U�k@aםGä�@b�M ?|�@c�����@d��M֞@e|���wR@ft##��m@gqe�(@hta��RN@i}M]z@j��7=E�@k��.8��@l������@m�eA��@n��k��@p/:"        ?v�kA��?�����?�/��{1?� �	�K?����wrT?�?�G��?�_W5$��?�I���P?��$��@�"a��@/����@E
��@�@Mm@��C<'@}���@i �
T@"k2q�@%de2oF@(��]#�@,#��"y@/�Y�!@1�j����@4*����/@6{)��;m@8�-���@;�|cU@>J��x�@@�d@B�ۀ/+@C�!�~��@Ea��iM�@G xa؂@H����@J�n7�Q�@L�H�QȽ@N�I�l�8@P{�7)�@Q�d���@R��V��@S�x����@U�G�ń@VV��b]�@W�cX���@X�z!=�@ZMh%�@[�C��@] �^�3�@^����@`bנf�@`��K�{�@a�=��}�@bl?w�@c?�n�L@d_��D�@d�y����@e�@n�9�@f����L�@g�ʅ[�S@h���l2�@i��s#�@j��	��@k�u?L*�@l��9C�        ?�����.?�Wc�&?����?�����/?��&'�(@�)&�{@��yd&@:()�@�&���@#ٯ�~�@(����UM@.�M8�C!@2d���@5�'����@9��$�wv@=��Ww�@A<���@Cg� l�8@E�}�SP
@H������@Kt�ZW6�@Nv�	dx@P����@R{q�5؛@T:�r��@V��i	�@W��@��4@Y�e�
�4@\�^:)@^/g�%��@`5�H	=�@a^R6p�@b�2	�>@c�k�>V+@e�>�@fg�1��@g��by�@i*��
��@j�^�͗4@lv�Lb\@m��qe�>@o+r�-��@pb�$�:/@q4��W�@r��Q@r��X��X@s�����@t�Q�T�!@u���f3�@v�����@w����@xz�0@yyO�"�@z}9P�@{��~:�@|��pL�s@}�J��@~��42�@�Q@�7@�}��~�u@�h�X�@��ͥ+�y@�=z�nb        ?w�OO��?����L�?�
j�^I�?�2�"��d?�{ǯK*?ل�C�8�?�a)Zo?��c^�E?�|h�?�!?���Q�ײ?���8�?��_;�?@���|�@HTv_�@	�d4҉@ߵٳt@b�)�@Mxͦ!�@�6�g6y@=��j��@���wr@�C�F@ ]:`�6�@!�S� @#��p��@%B���@'��Qt@(��Z'�@*�pZ���@,�~�O�@.��ٺ��@0q��+@1�x\@2���v�V@3����Ҵ@5!uN��@6`I ;�@7����v�@8��S��@:TM�a[�@;���@=#�O�l@>� �dʗ@@�@@��$��@A���K�@Bbݯ�U�@C3f�y�v@DIp�]!@D��[� @E�	Q4r_@F��V�=@G��(B�n@Hq_��@I`�2��@JR�I�@KJ��T�@LE[2 R@MD溄 *@NH�B�B@OP���;I@P.X���@P�{����        ?y
�)5a?�w����?�BI�>UB?��jX��?զ̾���?ᬌt\�L?��\V�?�&e�(�m?�B`�'��@f�����@o5�G�Q@ED�	��@yT��2�@@496��@{e�w%j@.��l@!���i��@$��Q<�2@'��.gJ@*��Թ�@.�T�¸�@1:4�^@3L��l��@5���:�#@7ۑڕ$P@:W�q�(@<�ܢ��@?���8�@AQ�}�ɺ@B׏�<��@Do�����@F�����@Gկ:�L@I��Ʊ�G@K�Oo+�@Mv�U��@O{Z�ѫ5@P���\P�@Q�WS���@R��N
�@T!�/�{@UPK�8��@V�b�t�@Wɖ!�I%@Y����
@ZfF�yX@[���<�@]&���@^����@`N�ر�@`�i��7W@a���T@bNuM,�@cZ"N?o@c�v��}@d���m�@e�A�Q@fs仜��@gT��1\�@h9��:�@i"~����@j���J�@k ��a        ?l7�=y�?� �׊�	?�6D~?���O�wy?���s$ݹ?�o	�T�?�W�?�K �w�@%8f�i@��O��@"|�
�@?����@|����@D�D
I@ NmƷ�M@#D�^WR�@&�@o�_�@*&XSO@-�+�7�@1��?��@3Y���)@5Ɛ	p*P@8_!A��@;#8_��@>��ᓉ@@�B���@B=O+I��@C�yc��@E��˃
@G�� �ym@I���8/@K�^0�
@M�o����@P#�8՝8@QSV�
�@R�n4�@Sֵ��r@U*k�g'=@V�3�\�@W�x�	n@Yn�ǩ@Z�@[Xw@\���b@^y�+�@_�̉���@`�Y3�e@a��$x. @b���{�@crF�V��@deGn�|@e^᢬�@f]�[S@gb����@hm4p@i~dR�e�@j��	�Zr@k�簲��@l�5�É�@m����x@o.�&M��@p2O��@pϼwX�A@qp^h�B        ?�꠼~��?�����?�Z�����?�����S�@i6��@����(�@<�?�@ ���~.g@&C�Wb@,I�w���@1�#di��@5�z�@:�i���@>�G�Н@B�(i v@D�$�v��@H%���@KT1�r@NާU�^!@QQ�=�@SR�v�@Uo���\@W�,-f2�@Z[h��h@\{Y��ò@_-�z�@`�k���@bI�d>�@c��8�8 @eF�"g�y@f��%_�@h����@j2=�G.@k��Rނ@m��)�3.@o���(�@p�E9w@q�g��c�@r�ш6��@s�z��@t�Y�$��@vi�K@w)�.�K�@xR����@y�w���4@z��q�@{��<���@}?]�g!@~��l%�@��m�q�@��NN	$@�N-q�ye@��^$ u@��\ܸi�@�u��� @�4j#�h'@����Sl@��F
�r@��]�WS~@�Q�	ì5@�!����X@��=�}��@��	B��        ?x�&���?��v�=fN?��ܶ��?�P@�?�y�Y6L?�:s��?����7�?��q�?�|�Jj�?�=|6�A?�����e�@ ��'�
@7����@��$!�@lͺ��@�<Њ�@FV@b�|�@�3��@�/��P@i�`��@d�l]&K@!C/�w�@"�t#B�@$�:=��@&ju���@(HG�,�@*9��{@,=����@.U;'��@0?��CG�@1]�)b�@2��<��6@3�M����@4�?�aM@63MSY5@7mMP�%@8Ԓ�#�@:2��(�u@;��A��@=	�:ڍ�@>�Qt8�e@@�nn�@@��S
b@A�ZD�t0@B^	��ԟ@C/�s��@D(�L|P@D�����@E���@F�پ�m@G����/@Hs�u`]}@Ib�&f�@JV3w0F@KM���@LIqV��@MH�ʀ�O@NLTT 5@OS�S�M�@P/�=���@P�f�^�@QA$�^AH        ?AK�Ht�?�wv.��?�Z��T�?�����?�Kg��u?�\F�M�?����?���u�?�^�q��@�E*~^�@
�'�=�@���!�@��HR��@Y�B�~@�ˏk@!���ͧ@$�6�-\@'�����Z@+��ҧ�P@/Z|O�M@1��N9��@3�q-��@6S�l�%@8؄��m@;�K��@>W�X�@@�=Wٲ�@B:�~�e�@C�Ak���@E����@Gh���@IJcDHO�@KA,���&@MLpO��@Ol:��4�@P�K�mf<@Q�Ȣ=�=@S#��a��@T\����@U�9a�>@@V��N?H@XFA�__@Y��=ge�@[�D[��@\�����r@^�r$�@_��ބ{o@`�f}�ʭ@ah�׳��@b>2Pk!@c����@c�����@dݨ�z4b@e��t�з@f�+^�t*@g��gJU{@h�f4��e@i�JN!��@j�^"��!@k��%�{@l���(�@mӼ_�9�@n��B�X        ?}Ԓ�>�?�����=?��/1�J�?͎���B%?ګ�;��5?圖1�,E?�=��=�U?�B���?�vS�K�@���$9@
����3@�����@NVJ�x@�ɞ�s@�IQ{bd@!}I����@$l��Q@'� ��v�@+���M]@.�P��K@1t^���@3�R�s=2@5��x��@8f���ޗ@;�b	�V@=�.s2V@@Y��8�@A�X5?�@C��bUZ@E2��-��@F�d��@HҜ˖X@J�H��k?@Lā�F@N�\��P�@P�x~A�?@Q�(	��i@R�E�;�@T�2���@UE�pO@V�}�*]�@W���v@YEF��bZ@Z��0�d�@\$`���@]����m@@_-�`�-@`aX����@a1n�K@b�U��@b�{�.0p@c�7�ͮ�@d�N.k�&@e����@f�J%��@gt��N�@hoGs��@io5��i|@jt�4;p@k>f��@l�]h��@m��;`�@n�ܒg�N        ?�A�Ac�?�����?�"���F?�i{_H�@��E�O@��(s@}7�M^�@!���k�@' �=��#@-�UE��@2s��K�@6���_�@;Q�$�@@��<br@B�mW�'@E��~���@H͝.�?�@L-�G�dr@O�l!A�*@Q�p��Z�@S�$qFe�@U��-@X8��L�W@Z��\}�}@]�k�9�@_���Ci@a/:�1P�@b��w�i@dR$��@e��\m<+@g(�O�37@h�m%���@jz]i4A@l8P�8�@n8���@o��A�@p��׺=@qݓG M�@r�*�7�@s�Nq�@t��g�q@v��*]G@w)i|�@xL�$R�X@yv���$@z�J�&�@{�oa�V?@}��2�@~`M�5�;@���I�N@�~�w��@�)��6�@������@����LL@�@f�1�o@���tp��@����Cֱ@�s�z��z@�5��xl�@��؝Y�4@��'���>@����l�@�]��+�        ?z�D����?�i�V�/?��h-��?�-�����?����J<?�l�$�D?�+>/���?��ud�?���㺜�?�# S

 ?����<�@<.ƄĆ@��n�lC@	�����/@x3�|@R}�
��@�iF�Y�@wOˆ�@M}j�l@Q7{8��@���g�@!q �*�?@#7��� �@%��I!@'F'���@)�'�so@+;��M��@-v���@/�U���@1���U|@2Z"U��y@3�V�)P�@4�,׶x9@6a�;�B@7Ы`�@9KH~6�Y@:�p-��/@<c瘫�@> ;��'C@?�˭�E@@�^�!j@A�o�c�@BsI��@C^+��;�@DN�5[�@ED�w4Ǿ@F@���@GA�{�@HGx��3)@ISE�W�@Jdq�:�g@Kz�x��3@L�ս�.�@M�{h�N@N�w�e�@PEWS�@P����d&@Q8����@Q�qz�bk@Rv�u]	�@S��O�@S�*�8&@Tg9��/E        ?{��	�	T?�\�U�$�?�e����?���)��<?�u
fpl?��oM5?���´�~?�P�#l�?� ���@�o:��s@�0 �94@2$��ix@��o)@���C�@2�a�'@ �m2B@"���0}7@%���ZВ@)9]G@,��Y�a�@0W��@2m����@4��(o@7	#��U@9�1��[m@<@�A�m@?�CK��@Ad�H�@B�4,ۑ@DGe�َ�@F�aR@G�y.�C!@I��7a�@K��!��@M�u��o�@O�]! ��@Q�x��@R:1%-B@SlI��s@T����=�@U�6��T@WB��;?@X�w�K��@Zu.���@[w�K�@\�6@^y����@`r�^�@`�DHy�B@a�Q��ZL@b~�f�!@c\$@d>�$���@e&���f(@f��*��@gŠ���@g��ol�@h�|:�@i� ��!@k�p��V@lG���E@m�T#�@n3�2@�a        ?yf�j�?���wYq?�٠+Le�?ɗӪ�V?�A���?���T*�?��Ӥ�?��\��?�*�����@��.�j@�fxU@R��9
�@��P�@̅�W@W�˦�@ 2CW��@"���2Q@&U�p�b@)[��5@,��6�~@0m���@2�Gބ�@4����|?@7#2rI�@9�n��6�@<\��k@?4\���@A�O�,�@B����F@DU���v�@F�;P��@G���;G@I��	��@K�!��@M�� R@O􇙒6�@Q����@R=A����@Sn~D�tH@T�@�;�@U��A�@WAa�;cB@X���G��@Z�d��s@[s8ԡ��@\�FR[�@^s��i>@` NfU�@`�S��r@a��)��@by��]Z@cV��R�e@d9���L@e �u��W@f@D�@f� -`:�@g�,w�	�@h�a� �@i�I�5@j�:Bc|�@l�e�	�@m����@n,d*�&�        ?��W�F%6?��i�>?�����?�/W�q_�@�R�w/�@ ٗ�g�@h��z�@�Ʌ��X@$C�����@)��0�J@0%�儊�@3�F9��@7��hNt@<�E�@@g@�//@B�өw�@E�K�O�@H��eܕ.@K�S��%@ON�v��@Qr�i�3@SXMu@
�@UX:��4�@Wr^ؓ$|@Y��M�Lb@[�J#��@^^�Ӭ�@`pv�;@a��Tڕ�@clt�@d���c�@e���r-@gz�n*�U@i
L0ߖ�@j�|Vm��@lO}/@��@nC>�?�@o��C��@p�v���+@q�[r%�@r����?�@s����	K@t����@u�x2RG�@v�zo�9,@wϜ�UfM@x��Ha� @zH�_�@{-e`��@|X��[�@}��}U¦@~�ʄJ�@�	��|�@��uO�f�@�D�j�48@�����@��<9�hN@�CHVe��@��5ߩBv@��s��@�[���-�@�8���@�Ϟ��ts        ?sw�V�?��8QŻ�?�g�P5u?��u�璺?�>���)�?�Ι�IV?���8�?栉�h*�?��
܍�1?���`���?��7��8z?��(`��	@%��O�@7��@�@�(�_��@"����6@�@��@��d���@�j��G@n�d�@|�5B@y�;!�@��a���@ K����z@!���8@#P�l��@$�#�KD�@&���J�@(SOKʾ�@*?4b�,@+�^h��@-�	��x@/��G��@0�31�^�@2fd�`:@3��
��@4:�����@5`�s�l�@6���Rf@7�o~eC�@9�Lի@:G�|j��@;����^�@<�D��@>F^f4>.@?����լ@@�L�N��@AE
5͏@B�_�|@B��%q�@C���N_X@DQq�Ga@E�P��@E���5�@F�t�G@G�@�$�@Htj���@IS?�"3�@J5��K��@Kڋ���@L�HG�M@L���\��@M�ʡX�f        ?|CNN;4?��CX���?�7���J?�Ԥ-�$?�X�~}�?��'}�mX?�3��SU?�u�>Н�?�g�����@y��X@	s)��^@��-��@��T�{�@�P�0�@s_Gτ@ �pP���@#���|n{@&�0��n@*P���n�@.���@1(b���@3+6�$�@5v��)7*@7�� �!f@:�/���@=?�����@@�Pξ�@A�@��@C3;`��N@D��NTr@F�&Ps�@Hw%iKL�@J_ڑE�@L\F"4��@Nlf@�@PH�&q@Qc��L @R�k6�S@S�˺��@T��� �@V4�%qH�@W����"m@X���'x@Z8R��H�@[�AD��@]��Q@^�:��m�@` t�+@`�y�:1@a��f �@bt�FU2�@cK�)�e@d'9�@k@e�A�%`@e��bl@f�R%Kw�@g�^����@h�C�>@�@i�$~�z@j��tbܲ@k�o���@l�[���s@mƆؾ92        ?v��%�RO?�3X�c��?��.?1?�c�?�K��5�?�FY���?�vX�?��!Aj%?�Y8���@&|�z��@m񫮝v@���#��@H_�l4@?�Y�̓@�GI��_@�ۋ���@"��Ua��@%��Pޥ�@(�}�QhR@,F-�9N�@0	�CF$@2���m�@4=I_�:6@6�{��{d@9��5��@;��<~�X@>`��7@@�Ԥ,l@B*F�
m�@C��p֡�@Ep��w�@G1���@I���@J�!�ua@L�W���@N���3��@P�	'.�N@Q�!��A�@R�)T}�@S�%,�%Y@U4��ģ@VwZ^G@W�d�2@Y ����@Z|����@[��cp�@]\<�w�P@^�r�Ai$@`2_:�x�@`��8�U@a�΀�@�@b��'���@cwp�ݮ�@dUU���@e8G6B�T@f E���@gP+k �@g�f�]b�@h����Y@i���%@j��q���@k�.��Vz@mydMB�        ?�$cJ� �?ʱC�R�?�P�\���?����@ t�У�@	�M'ͺ[@�z�f��@��:%�Q@!xWI��@%��7�n@+T���^�@0�AqKlJ@4=�h�^@7����*@;��I8@@Q�8T@BZS �<�@D���}�M@G}	k�@JL�=Κ@ME��UZu@P4J(�@Q�LD��:@S��WJ6\@Ud:���@WH
�@Y@�Q~@[Ml|���@]n˪ ��@_��;2@`�H��@b&d���|@c_���ɡ@d���L�@e��~�@gF��-��@h����r@jC�rye@k��i'ep@m�>Q�@n�����@p�s@pܤd�o�@q���M@r�i4@sa��]�@tBa+��p@u'��W�@v}W�˹@w 
�z�?@w�=��1�@x����@y�"G�{@z藀:�@{�@w/��@|�~M/�@~L���@�l>�@�D9cg�@��t�b�@�7���,@�ʇ���@�_b+m�        ?y�]Ş�
?�C���w?��$(G�?�,l_�}?�/Z���?���\��?�5� �R?닯[��?�	zƗ�?��\��<!?�Y~ l8�@3 ڒ�}@��¤K@$�X�J�@m~vo@$�Я�;@gkv4-J@��w�)�@a&/oƕ@1�
@�)Yf�=@�*<��@!��l�Ӗ@#=f�F)�@$�����@&�n� @(�,���@*��6�@,��rU��@.׆�n�'@0��f@1�'5+�@2�SBX@4ڪt�@5QkG��@6��X��J@7���@9Pu�B�9@:��(@�@<*�%nw�@=�K��@?+gL�X@@]^�@A)#�Vr�@A����C@Bϣ�|�@C��d�@D�!�0@El��$��@FU�A�r�@GB��V��@H4��5K�@I+���*�@J'9��a@K'y�i�@L,siB�@M6%.��@ND����@OW�C�_�@P7�Br�%@P��Ō�	@QV�{L�]@Q�lYM�H        ?|�P����?��(�5b�?�:��>P?�ͪ�5�a?�/�x̝?�4�� ?톣��b�?�pW�,�?��] �X�@�BLy�@Ke�@}®R�W@Ɖ���@�v=��U@0;/A�@ �6�S@"������@%�xjja @(�f�� �@,U���7@0���%�@2��~n�@4��w�@6`�Ӽ+@8AS(1@;G��Pm9@=�wY� !@@]�$@A��fk�n@C[�"e?�@D��n3>`@F�Ӟ��i@H]y�I�A@J+���ژ@L$�k@M�<�z2@O�~�S�o@Q	�[�@R��>�J@S6��,WU@TZ���,@U�3L@V�rY��@W���a�]@Y?��h�@Z�6���@[�CrҒ�@]D�h�5}@^���q�^@`{����@`��Z��@a�I�M�@bO�(�'�@c�Q[z]@c剁���@d���!U@e���4�Z@fd��S�@gA״�+@h#.40�@iH|��@i��.@j��s�|        ?zZ�4� ?��F���?�o���9E?�Z]ۦ`C?��]T�"?�Xţ&S?���	?�쀕A?�H&��H�@X���6@	�h���I@T�k�@3��!e@���=��@f��<@!z���U@$~�pL&�@'��GF�@+gg/��@/O����L@1�ݷN#�@4>�MR@6u��I�@9��z�@;� `D��@>��ZS@@�o�\�@B�� ��@D@��S�@F-��U@G�NJIo@I���c�@K��3C�b@N"����S@P0^Ċ�?@QZ��0�@R�j�@Sѩa{�G@Uo�4@Vv��߭�@Wڷ�ߟa@YJKR+�@Zŉt��@\Lz�÷@]�&��G@_}��E��@`��ȧ~@an�}XE�@bO�	��@c6�
{��@d#�Z��@ei�T\@f5Ki�@g ��$�@h�p��@i��~H@j.�����@kE���2@lb��Xg�@m���b�@n������@o�b���@p�����        ?����?�D�嶲?�#�bW�"?�p%Z�H@2�	9�8@^�u �@�g��z@4Ɖ�@$r�O���@*v���@0<Գ��@3��&��;@7��&�@<�<��@@Y�q��@B�z��<�@E�E��@H}ֱ�β@K��� @N�E;�@Q)�Ν��@R���(�@T�rY_q@V��x���@Y	ϼ�=@[=�wf��@]�r��@_�)��b�@a5�ds>@b~�!�q�@cԿ���@e6a
�r�@f����@h�[�t@i�✨�o@k2o}���@lΘ�"�@nvQ���f@p�Y�E@p�$��@q�8t�'�@r�1��W@s�{Oֹ@t����B�@u�uϤN@v��4T�@w��>b�@x�ͥE��@y�)�rp@z� �!��@|��e��@}&�W�1�@~O�p\x�@}�Pf>�@�XΚ�@��|�'�p@���c���@�7"��q5@���_B@��˭��@�.<���@��gn�r�@��IS�t        ?v��GF�?����9U�?��K"Gۜ?�=����?Ѝ�BU?���p�?✆ZG�R?�y	�{?�%�M�?�Im��?�f�uq�@ 	�H�H@%�h!h@����@
4=��G@&���@/��Yز@o���N�@��RMu@[�>j�C@��?F�@�vn\@ e�FT�@!��ؑ@#�[a�'@%?�[G�@' �U��S@(�+~W$@*�y�R�@,����^�@.���ޯ"@0j�u��@1�[���>@2�t�״@3�dm�q�@4�(,��@61��7��@7t<u7�@8�)�0X@:�d�>@;on�0 �@<Ԉ+p�m@>B7|�\@?�qq��@@��%X�[@A_*���@B&��ָ�@B����=@C�	�1@D�EJb@Eo� 9Y@FLδ�Y@G,��5�@H\>��@H���yh-@I�H��Y�@J���*�@K�u���@L��%�@M��d���@N��]��@Oŋ����@Pf�d75        ?~�Y໛�?�B{i��?�+��`?����A�	?�5)E\v�?�L|1@r*?�|�O.�?���@�G?�C'��i�@�9�A�@
�U��t@��!���@���A��@�oX�Gv@Ě�S�@!��T:\�@$�@UR3�@'͐χC @+U&����@/&\�i�:@1�5���p@3�5���(@6/�ڿ��@8�ٸ��@;Y���R@>)��_l@@�R��M@B!7i��@CŖ$k=@E~?�W�@GKHƸ�@I,����@K"�	�N@M-9"���@OLKic @P���:E @Q�!�C�7@S�^���@TKf�W��@U��hFu�@V��� o�@X3�?O @Y��w�@[T��H:@\y���Y@]�E��E@_�j���@`�nT�@a]h�y�`@b2o�#�@c�Ϫ��@c���S�@d��D"@e�gi��@f�����@g�8"]@h����~~@i�Ų�@j�~��@k��U�	@l�(�E��@m�`7�=9@n�|�;�e        ?x,�1Ш\?�[��_o?����ڪ�?�i�C8��?�+�n���?��	K�L�?�3'�%?����+*�?�5;H�c@���R��@�	F��@]�T�@�9�P�v@�q^2�-@Wsu��5@ /���!�@"�
cL�J@%��M	^�@)K-�Fҷ@,ިl�E@0\�q7�w@2n<�K@4�o���@6��&��@9����J�@<'��W@>�����@@�X_@B�c�T��@D �j�Y@EԊ�s�@@G�����4@Iw8��T@Ke�q�{@MhzW�i@O~穕�@PԚo�5�@Q��)}@S���-@TO�0>+�@U��v鎬@V�:�6r@X%!��@Y�:��E�@Z�^}�@\T����@]ͰI��@_P�6�PW@`obki @a:�b��(@b%<�@b�� �@c�-���i@d�����@e	x�F@fh_��
�@gV�|���@hIι���@iA�y�F�@j>ׯ*e�@k@�3n�@lGa�R)@mR��j��        ?��)�X�?�b��
?���A�?�!PTl�B@j��6$;@�؟���@?l-gp@5��D@#:;���@(�8:D^@.ۊ�0Mf@2�0h���@6�Vhf:@:�\��@?�EH��@BIG�`;�@D��4���@G�p���@J�n��x@N<�	�x9@P�s��g@R�Ng��@T�zm	�@V�J���@XЁ��6N@[�M
N@]c
[�q@_�jB~��@a-���Z�@b~��2�@c�/bvD�@eFsE~�@f�O�#�@h@�)䭨@iбz�@km&!�4@m#�Զ@n�o0b2@pF�3J-�@q-����@r�{	�@s9��2@t����@uME��@v�Q�Z�@w�j�x@x*��~�@yBi��H@z`J1Q�@{�,�Rf&@|���@}�읋S�@����@�'�K��@�Ȭ�{s@�l�!��@�]���@��*p�@�i�Կ(�@���ל<@��Q���@���0���@�:��7��        ?}"�K���?�bZBa�?�kgw��?�4U�|n.?��"���)?ް$F�?���@��?���a�?��aQ�?��b	~?���G@�/���@���%�1@
��{�@�t3}/�@�܍Ċ@ccaqlh@v���@�/�Y�@��/�@ !���@!դ9�[�@#���ީ`@%��Ė@'vFͤ��@)��B�&�@+� ����@-�B�/?�@0�ڌ�z@1G�	�I�@2�qV�Y@3�6v�@5�.'�@6{��%`:@7��zw�x@9Vہτ@:�z�'��@<\��vU@=�ۆ(�@?��H�g�@@��Z^�8@At\��C�@BSk϶�@C7hԌ@D 6����@E�Ttۋ@F0(��@F��3�0R@G�ִ�y@H�߇�>�@JT�b@KK����@L#��?Ӆ@M;t�2@NW���@Oy=����@PO�2�!@P��y@Q}���@R�|��@R�����@SUrWڧ�@S�la��        ?~6�~s?���7��B?�C&��� ?�-�?�s?=�?��t�!?�a�-p�3?�p���?��'p��@ZA)��@
6b8�5@c�80@^�m��\@�2�]�o@��Tl]�@!�t"�U�@$����Or@'���_s@+N�C-��@/#�
�'�@1�l�D��@3������@62߆��
@8�}A�%@;_/�Tq@>0FR��@@���m�>@B$� �_c@C�/YfS@E��ju@GNNy�`�@I/,���@K$I�>�@M-����@OKIr�EP@P��<[�i@Q៳�x$@S¹�N	@TE�����@U�8�7U�@V�~IC�@X'����X@Y�����:@Z�*�4>@\c�I.�@]���k��@_f����@`{v���@aH{�-@bP3��@b���hUO@c�Fob9S@d�WOF�5@e��(8@fzx�s"#@ghw��N�@h[	��d@iR%� N`@jM���	o@kM��c��@lRc)-W�@m[T���@nh�.�@k        ?}՞�k�~?��:I
�
?���"˄?ͯ-�s?��c?��qÊ�?�~�@V?����5�@ h���@K�Qm@f�|�	@<OB10O@E���@թDJY@�mV�@"L�0�Y�@%k��F@(Ԝ�	A @,�0��%@0H'4�q@2r��v2�@4��[��8@7BE(o�b@9�w��<�@<��'�@?�+j:�@AmA��7W@C+�ğ�@D����wO@F��*�m�@H��{f��@J��-a@L����y@N��"�{�@P�+$|V�@Q���SjZ@R������@T:�)�4@U����tQ@V�c�7@XLY��@Y��_�bN@[;G��kW@\�<�
@^Xp��@_�C���@`��)1K�@a�>-��}@b�se���@cun�e�@db0�b@eT�ڀ�B@fM	X���@gK���@hN��J3
@iX���ZG@jg���8@k}1���@l���}s@m����9@n����!@pkL֒�@p�Ee���        ?�;r��!i?����*?���j�?�Uh�4Tc@�U�o��@K�)#@�����@ )�� �A@%Nz��vy@+8�ɿ��@0�Y��@4��~Fo@8�<�LK@=_��4I@A'����@C�I[	@F���?��@IŠ�.k@M����@PC��e*�@R�����@T�>�@V����~@X:���U@Zx�%Xc@\ϕ0�Ժ@_?��!%@`�{ʻ�@b5�{���@c���d@d���B,@fs)Iġ@g��|C��@i�9Pɇ	@k�u&٢@l��X�� @nx�7K�:@p��>��@qF�F�@q�$��@r��*@s�B�ܨ�@t�hwb*4@u�m�>��@v�K�j�b@w��W��a@y{0��0@z�f���@{;���Zb@|aw��@@}��&;@~���\�@��
��@�����?�@�9��A��@��Q�T:$@���_%)�@�-Fl*q@��g�'��@��I�*-@�9�#tj@��>Q���@��K�Z(!        ?}|���L?�kV���?�(|?�ڔ?�S����	?�j�qK�?��銦?�Fl�k	v?�n�@��"?��T)cq�?�qo�&N�?��ćģq@>?'��@
����@4��4C�@�K���@R��5S�@��Nf��@�C{�̺@���M�@�!��@ �N���@"���=B-@$lݷH@&k�$㜃@(��O�5 @*�p�m��@-�̻ @/i8^��@0�Q��j@2@�Ф"@3�x���@5 ��l@6t�1_8�@7�#麺�@9��f�@;�kGJ)@<Ŭ
6�f@>zࣀ:�@@�N��1@A�(���@A� ����@B�j�u;�@C�sq+u@D�A�ȳ�@E�ڠ�%@GA+�@@Hv�c��@I8|��J�@J]Q��pp@K��zz~@L�eQr�B@M���h��@O4��܊v@P=��w�@P�u��}�@Q���7*M@R<����@R���-]L@S�ab�@TX��R@Utw�@Uќ���`@V��R^�        ?zf2�<hm?�0�9
0?�BKʑ��?�ӳ5:�c?ւ�t���?�X0���?�ݣ|�w?�����5?�-��"7@ �����@4T��Pt@<��7'\@vr��@@����@\GtXo@:��'_�@"L��ZQ�@%>͆��@(t�,�a�@+�.J�@/�����@1��Y#��@4�:�Xk@6V�+�@8�����@;g#�H�@>)]�4c�@@�s�<�i@BS*�@C��*
#@E_�3=�v@G%����@H�O{�@J�����%@L�JZ��@O	�Y��4@P���䙽@Q�k� �@R鸾_g�@T �U4�Y@Ub̠u�<@V�� C_ @X��|�f@Yj���-5@Zإ� �~@\Q�bF��@]�Y�5�@_f@paF@`����mi@aSɛ�AW@b,�&��@c^�@c��+5#�@d�����$@e���@�j@f�����@g�]Ӂ�@h����@i�,|�Z@j�a�m�:@k�y�m��@l�w#?��@n[�KB        ?}�'j?���W+?��}�3�?̤TY\;�?���t�g�?���n��?�uFd?�c<xozo?���l�@'�*Y�w@	�hD�ޭ@@��1P@�cv�c@J�BsE@Ё�@!*���te@$���E+@'?�ʻ)�@*�)\}�J@.pϓ�t_@1;��S�@3c�t�@5�@ǏY�@8&�X���@:�(�+\4@=����@@7;�vD@A�vIP�@C\�Hz�5@E0��@FӅ7�#A@H�q���^@J��:H�g@L�:�zk@N�S�]��@Pr/z�p0@Q�;�6�6@R���v�B@S�?j/�@U6��@V����9�@W�`��@Y925AR�@Z�6np3@\����@]�����@_*���c@`a-���@a2�ڮ��@b	c��x�@b�����e@cǧY��@d���	@e��u@f�}�P@g�~�X��@h��k�s@i�k*��@j���>�	@k��I�� @l��$��@mʽ�@n�yT�S:        ?��ס�r?Ө_�5v?�7����A?��sT�R�@҇�^��@�����@��UU�@!���*n@'1�t�M@-�,Xz@2��X��@6�WqXN�@;,E�dd@@�EK�@B�=K��,@E��E48�@I���~@Ly�4���@Pj&���@RAP�'@T$��mV�@V[����;@X��G�ה@[)�>�#X@]� ��]@`<��?8�@a��!���@c%v�b��@d���4� @fP!r?�H@g�>�U@i��I��]@k�?�A׽@ml:=f�2@o\�X5�@p�+M���@q�IK�C@r��$(�@s���d?@uiEd9�@v1��@weAбq�@x����L?@y湈��@{4���@|�m���@}�_"<-@Ro���@�a��t�S@�p�>�@@�ߢ���@��7{;��@�o.�@oB@�=���{5@�=|��@��P�2@�½��g@���Vh܇@�����@2@�n��I�@�[���*@�L����q@�A��N��        ?rEd ���?�L�v�?���	(?�dp{�
?�{ U�I�?�7�1pv�?���8�?�V�0�6?��+)P?�5�q�?���_��?���/"+@ ����@���8T�@Y��3@
��٨��@L�R��@*���t�@P0����@���j�@�2���v@��-���@4CD�h�@  �YS�@!w�x�@# �,�u@$��˨|@&Bs�PR�@'����i�@)�K����@+�]�k�@@-���m@/�3��+@0�Y��H�@1���@2��|���@4	'/��@508ż�@6]"�L��@7���@8��(tn@:�R���@;]���@<���ک@>
ܵϬ@?k��L��@@j5ku�@A"2�i��@Aݽ�e:�@B�̓�.�@C_U2t��@D%O^ʡ�@D���F@E�}c5i&@F���r�@G_-�m@H6�hH�@IF׹��@I��3@@�@Jν%GC@K��u��@L���l�@M�T?��        ?{V�l�@?�NJ�l?�h��@�?ɷ�^ֺ,?�TVS�b?���{<0?�Ɓ����?���6A�?�:	���@�:5To�@?�{]@cr��JL@ȧ�;*�@�A ��@d��nd�@ 9z�[�@#���*m@&�r�o�@)d�,�$R@,���Џ	@0q����@2��ٟ$@4Ň���'@7(je���@9����@<b��;�@?;@� ��@Aޣ� @B�T��5@D[0��@F��Q�@G��>��@I����?@K����@M���_�U@P���z@Q p"!��@RH�6]�@S|AQ��)@T�Q�m?@V3�.I@WV�FƋ@X���<�@Z	gvo�@[�uӣP�@]����D@^�$�y�@`7u�}�@`�Z���@a��S�@b��O@cz�YGo�@d`��1��@eL}5�5$@f=�h�Rz@g4=���@h0[�>G~@i1��qO@j9�ԋ@kE����@lW�%�N�@moa�8�@n�wx�WD        ?u����?�oT�2�U?�[�G'��?�*�@D�?�<����G?�rw-C)&?ꋝ���?����?�?:��@p���G�@��1@r�Kl��@�����@pMsX�@����(@~Mc�w@!�@����@$�����@'���;4@+B�2Ê�@.�uxVQ�@1i0�Q�@3��E��@5���q�@8�=mg@:������@=<�S_��@@�y^�W@Ax��d@C����@D��s�׍@FHp���<@H�E���@I�:A�-+@K�K���@M���4�@O�F� @P�\����@R�J��@S$ �'CM@TM͢��z@U��f�R�@V�cq ��@X,�w��@YRI�V!�@Z��N�V@\z b�@]w�PT��@^��Ȗ[�@`4�$��@`�@��T@a�\~���@b�A�T�@c^x��@d4w�P�$@e�Ԧ�@e�R�ͅ@f�.���^@g���:ʆ@h��@+e�@i�zָP�@j���7@k��V��        ?�D�!r]?���Z�*?Ộ�9Za?�?��z�?��)L= @���Ò-@+�XT8Y@ S���@ �{%{�@%B��*�@*����C�@0=�7�Q2@3�U��@7X�L�@;	l��g@?F�O5�@A�Q�-<@D]0D@F�_�l�@I�=��Y@L�����@O�[j���@Q�[uH�@S9z);�h@U��\@V�qe� @@X�0��I�@Z�� �@] ����@_3�<}-�@`�e�z_�@a�.F�=@c#4���@de�E��@e����j@g�s��@hf��Z�m@i�v2km@kC�ڼ�7@l������@nG��ѕ@o��ULLz@p��h���@q�p`��@r`��x!@s;��-�|@t�#[ �@t��(g�@u�D�v�@v�#�>P_@w�m*��@x�R��@y�%S��D@z����@{�C��^g@|�P�qk	@}ȯ�C{�@~�^��#@�]���i@��VI��@��y�"�@��΅d @�3�M7�U        ?q���!Wo?�/�-�O�?�F\ҹ`?��crgQ�?���υ�?��*j��0?��,��?�dχ��?���0��?�����?�,ő%�:?��@x��?��cf�O@ws���@����@�>���@m| �� @ q�DA&@eÚ���@gU����@�ߞ0��@�J,e�'@tUSx@�3�m�@V�Ǿ�@ ��`���@"<���'o@#��a,�@%'Un���@&�c��f@(F���6�@)��gғJ@+�T��>�@-W��*>@/"*C~d@0|�X�?m@1n�~���@2g~���@3fz�U�@4k�bd@5w��}��@6�y��kq@7��*���@8�L��7@9�D#��@;u��y�@<@R�=X@=wD�9	�@>�Ci6�o@?�E`�R#@@� ����@AG��9��@A��K���@B�R!0�"@CO���X�@D��ne@D��	�P@Eq�����@F-{z��@F�,{L5@G�����@Hr46��@I9���7�        ?x[T�?�mn�|W<?������?���"<�?�+|҄t?�/��O�Z?�6&�� ?�f#�?���Mm��@ �����@�ފI�q@�G%��@�e�@�8��2@���c�@��`��@!`桒J�@$-��sXL@':���5@*�Kv��@.eu��@0�lma}�@3���@50{_z�@7���3<C@9�ퟄ�@<�R&4�@?C��Z@AqO&2�@B��i��t@D"�WԦ�@E�la���@G|���@ICu�UX�@K���f	@M�X�[@O���!@P��;�+@Q��*�@R� ĕ�@S��{��L@T���Ԏ@V3K���;@Wo���U@X���?U�@Z|h��o@[X����@\��6@^�"�Z@_���C�@`�QX�Ӝ@aD���@b	���<I@bҾ��]�@c����q�@dq@��B@eF�[��>@f D���@f��5�D@gߝ0�d�@h�[��a�@i�����@j���"A�        ?|��V���?�p�@m&�?��1�o?��	ӿ�g?�&֯�L�?��<8�?��`���?�Ζ? 8@ E��� �@�g"2z�@���1�@az����@pA���
@uR^	@$�%]��@"i��$�@%�1��@(�*�Fz@,���"D�@0^X��4@2�>���x@4�j��T|@7aE7Q&�@:d:R��@<�Q�^jT@?��. �@A�EZ�f(@C2[ܧ�x@D�����@F͛���v@H�%�s��@JÇ�Fݠ@L��:�@O����@P��N��@Q�d6eh�@S����5@TiFӯ�@U��垻@W�,}K�@X�Y�5�@Z�B+\@[����uR@]��	�@^��v`[�@`3�|h_@a"��e�@a��M��@bؾ��/�@c�����=@d�d�.��@e�)����@f�A��q@g���^�@h��@i�rK�@j�Dٕ!�@lF��M4@mC�PH@nq�ov�@o� �jP@ppn��y�@q3�2        ?��8tB��?˟*h% !?��A/tk!?�>��y<@	�ye�@
�e91�@���~o�@��� �`@!�Ԯ-@&�+���@,��=d�@1�ވs��@5; ��@91���Q@=���8�{@A��q��@C��4�A�@F\��FT@IE�����@L^�ۦA@O�5��UR@Q�\VQ�@Sg?��D@UUgj�{v@W\Fc�+@Y{��:@[���*�@^�9��@`6��"ic@awݪ�k0@b�&� om@d�C
O@e���d��@f���Ͷ@hu�� g@j ��8�6@k�3<�mv@m<�5�@n�I0P,@pTt##�x@q8�N�H@r#��+6@st��@ts�M @u��*�]@v�~)L@w_�q�>@x$���{@y:�L�D.@zV�J�\@{x���vG@|����S�@}��ۥ�@.$�.@���<�@���KY�2@�b��H@�\^ǈ�@���Ђ,@�]��+��@�B�M�y@���T7L@�t�����        ?s.����?��垕H?��'m�Sw?��^cҷO?͛V�*?�#C�?�ũ[�f?���/?�Pzsj!+?�T_�,9�?�]��Ey?�A➳��@�h5�Ҵ@���,N�@���@Ō����@�|�0�u@�@O{�W@A��J�@��i/.@4��0�@䴖_�@��� ��@ ٢f�j�@"i�y6@$
�v8]�@%��)yH�@'��`�m�@)`�X�-�@+Ma)>9�@-L��%�9@/^�Qr�@0�}v��@1�L�,6@3�~�A�@4/�ja�@5g4����@6��pK��@7�WW�Q@9D��E�@@:����� @<���@=t�/a��@>� �Y�@@6lA?@�@@�R��,S@A���H@B���/6�@Ce1r�3@D<,�F-@E��(�@E��4�@F�����@Gľ.Иv@H�偟�K@I�akF��@J�'3ݝ�@K�+����@L�c�'�@M���0��@N�<J��@O��q5-�@PY��i��        ?zq֏���?��Y��?�Us�?�;;9k�?����M�c?�ѓs���?썬����?�z�E���?�"�>�@�6H��S@�~6+@o�!�-�@�ɢ��@��>(�@�
B.��@ T�}Wt�@#(es.D�@&B#|�B{@)���&:@-N��T��@0�~� ��@2ñ֋(@5�����@7{O��@::]q��@<���� @?�7v׫g@Ae����^@C��1�^@D�o�"o@F}Ȗ�ӧ@HZ���/@JM��.@LU�4�@Nr���Zl@PR��5�h@Qw�N�̬@R�;�'^�@S�� A@U'���|@Vx��L�@W��h��T@Y<_��?@Z�"�@9K@\-=ю�/@]���.Ud@_K���b@`v@%d@aK�?V�G@b'����B@c	���*@c�H�e�!@d�JN��F@e�C)8@fȮU��4@g���0�@h�H<���@i�L-��@j� o�[U@k����@m;�e��@n7�!�@o^��j1�        ?x0�Er�?� �,d�@?�%�NEz?��]1��p?֨%ӻ�?�.?b�?��^��ݝ?�ꙵ��?�l6��1@'�/���@cp�dd�@s'1@0����p@�)X@}�����@[���T�@"\s-�
^@%L:��@(~�T	L�@+��(��@/��?S	@1أ���@3����	S@6D�t�@8�1|@;B~���@=��2�e@@i��bA�@A���@C}N�@E#�D��@F����N�@H�����@J�yx@L|��0x|@N�k	��@PN�c�Y�@Qe��b�@R�V����@S���fV�@T�&Ա�@V#S@c�@Wk[�m�/@X�BB��@Z	�A@[~�"��@\�5�Ҹ@^g����@_��X��@`�	E¦@a��h��@@bX�'p�@c-d���
@d��J�F@d��ݐ@e�G�S@f�*��@g����@h�Δ�r�@i�y��@j� *�g@k�^���>@l������        ?��HΎjY?�VPn1�?��ʸn��?�J��M�@ D�BK�@	�W���@��:�+@�l��]F@! Ӟ��@%���mJ@+~��ʓN@0���Y�@4A݋C'@8șc@<���@@F���Ń@B��FZ�@E;3�$�@G�ߚ��@J�%�Z�@M��mCѩ@P���M
o@RTu%��@T"����g@VB�(�@XX��5@Z��2z@\;�<�@^z��*V@`gB����@a���@V�@b�
�~=@d(f�#_�@e~���o�@f�R�@hL ��/@i�#p@kD�cvM�@l�C�)/@nhu�*��@p+�Iç@p�q*>f@q��ޑ�@r��R���@s~���@ti��s�@uZ<n.K�@vP2�l&@wKf��@xK�0cE@yQpg��@z\8�Dr;@{l!as�@|� Q	u@}�)E&~m@~�1!ڢ�@�+� 1@���P��l@�d�`�@����)�@�OO��ت@��RYd<@���� �        ?r����?��s"V	�?�&�?����E��?��N��?֝�5��?�j�j��+?�fY��?�����ܑ?�s����?��z��?���C��@RDʗ@v��K��@����Xu@���v~�@�$�Ft[@��'n �@'K*�*@�ӱ��@��QG@�u0\��@��,£1@ ͧ�S�@"]V�@#���P�@%�&��z"@'{@&�@�@)TǚYl"@+@�q?�8@-?�,�h@/O��]�F@0�J4ȍb@1��E���@2�����<@4$@�q�@5Y�Z*��@6��N�ȟ@7�Z&�w@90�ܘ�@:�B�jJ�@;�n4,��@=W\�!
@>����@@#��� G@@�>ζ�@A��v9�@BxVl�s�@CG�E��r@D��O�@D��?��@E�h����@F�,��d!@G�3��=I@Hu�y@Il��l�:@J^��5c�@KTH��@LN�De@MLSq�P@NM옕.�@OS�#�9L@P.ը9"h        ?y��ZI^�?���?��;̏��?�t4>gx?�Ljq1��?�AŴkd�?��i]�?�� ��$P?�Ps��0�@!ɍT��@i~/�½@����sT@G�[G`@@����@�{k���@���^m@"���5`W@%�5l��@(̟`��@,S��s-�@0�4Ę?@28f�@4J4���@6�����t@9�&��s@;�����@>y3�)@@�����@B9���a�@C��V�,+@E�c �@GE9�J��@Ir �Ă@KWkr�@L�7���@O�~���@P��ޝ�@Q�d����@Rٔ�P
1@T��%@UAn�uG@V� �¶R@Wаz�R0@Y' ��W�@Z�t�w�@[�;��@]e���9n@^���Zo@`5�� ��@`�ڱj�l@a��R+@b����Ž@cwl�ʮ@dT0�&Z@e5�O�@f���@g(�R��@g����@h�#_hL�@i��*�@j��ƽ@k��^M$!@l�mk�2        ?va	�է�?�ki�i>?��2Ib2N?������?��O��'?������?� �Y�?�r�Q&�?�����r#@�m��N@�Y���@�}�n@��
�Hv@�Yk���@,��aB@�z�8I@"1�CZ{�@%!O�z�@(S��F@+�hBgj�@/��~�^�@1ƃt��j@3��u��@67���f@8�g�}Y@;:̧���@=��R���@@j	��?�@A츽�\0@C�tz"��@E+St� @F�i��/�@H��	�c@@J��X��#@L���D@N�5$�0�@P[$�8�2@Qst��:�@R�����>@S�wocF1@T�2eD�U@V6�=@W�*e��
@X�k�R7�@Z0�X��/@[��7E��@]Wy+ϧ@^���n@`�/1M@`�
#�r@a�4��/7@bhO�y��@c>\'o�.@dY. U@d�F�}Q@e�%ڄ�@f�����@g����݅@h�\�d�@i���}.@j��J��@k��	��@l�Vm�+�        ?�3��z=@?�!G���?��(�L�?��_�3?���Z�@� 9��@F[%�h@�FǑQ2@��u�$@$g�R%0�@)�9H\@/R�K?��@2�tS�A@6`�P�d�@:6�O+��@>^��(ޠ@Al����0@C�T�r�V@Fc���P@I�8ŋ�@L����@O���@Q$HǇ�@R�+މ$�@T�T�w*i@Vv~C�q_@Xf����@Zk�WȪ`@\�y�N�@^�
��@`{����@a���?8@b�-�@d��0.@eil���@f�e��%@h��Һ@i���1QY@j�rX��@lwH��j@m���݅�@o��Գ/�@p�T�fن@qg�!�@r?��J@s9`���@s�B��k@t�$��N@u��W��@v�eK��@w���v�<@x��H�c)@y��� �@z����܎@{���@|�1�v�>@}�>L�N@~䢫?�p@�ի!��@��҅���@� �	��D@��z�.@�J�cͫ        ?v��L��?���P[o?���n:�?�p픿r?�ll:%��?��;��?�dԵIf?�'f�'��?��nA��?����5?��u��7?����ƪ�@��v�@V?���@
 ��Ո@��O�T�@���<@\p��N@��\�@R�A��@Bۡ��@�0����@ n��@"5BPa�@#�tt/��@%^�=�d@'*	La=?@)x��*@*�6+�M@,���0@/�+X@0�<=�@1��ʃ�@2�	�"�@4p*!�@5X�����@6�7�؁@7�(�z�@9HЧy�@:�.]�Qz@<@+�S@=��Ҹ�@?y)@@MO]���@A8�~# @A���J}�@B���H�@C��G¨=@Do,R[�,@EQ5[z�?@F8FAg@G#�B��y@H�ʇB@I	E�q�S@J3�P�@K�G#�:@LEd�D@Mcb�@N6<��@O+�2���@P �8u@@P�`xr�9@Q>_4,�        ?z{�sA�M?�rP��?�11�Lu�?��ywt��?�|iqP?�Ue���H?��m`�	?����Q�?�+�@z�[@���?Z�@/�2��F@4��8�@p:G��@��PW��@K����/@#[9+_@"<��؝�@%(�����@(W�c��t@+��!;�@/�nG���@1�u��B@3�i��@6'ㄙ��@8�e��N@;!�O1��@=��e6�@@W�1�d�@A�-���@Ci�PI��@E���@FǤ�^�@H�kFo�+@Jr{�1@Ld� _�@@NjƟ~@PB���@QX�?�h�@Rx�l�U�@S��R���@T�°ǌ�@V�\C@W\8���@X��牯�@Z	P�_� @[n�(C��@\�5�v#&@^W�r޺�@_���g@`�B��n�@a��@bP̓|Vf@c&�8�i@d���nk@d�n!�@e�jZݖ^@f�v�Y,%@g���U�g@h�ŀ+�{@i�	X��@j�a�eE@k��ŀ�@l�L�<T        ?y����K!?��t}0'�?���Yt?��o�� P?�w�즰M?����K]?����8��?���U���?�?�_��@�Ȏ��@���Z@BS޿��@��y�a�@�����c@(���@ �Ӫg�@"�6���@%�+(,@)���yo@,��)P^u@0.�-�a�@28Cϣ��@4e�et�@6�x����@9.y�=@;��a@>�P!�G�@@�F��*@B?�~��@C��gˮ@E�W���@GGϥ��Y@I�
zV@K�Q�@L���W�@O�Ζ��@P��R��@Q��=��@R�:`��:@T	�φ
@UCM��@V��`_�]@W�i=�ҁ@Y+����w@Z�����b@[�;�7�@]n�m�{�@^��"S@`< 7�H@a�s�u@a���Nu@b���YfI@c���-	!@d_V����@eB&�NJx@f)�Cb
@g���@hp �}N@h�!Mu�@i���"�@j�\Zw @l ⍙5�@mV/. �        ?��H�kE	?΍}�6�?䴐���?�+7��[@bt��֗@����b�@�X	�K@�5je�@"�!�%#@(S�d��@.^;���@2�@5��@6N1D�@:i ʧ:@>�V�"��@A�+�w�/@Dx�'nz�@GD����@J@z��T�@Mlˠ�g@Pd���$@R+�y<l�@T
���<@VϜ��@X.RxJ2@Z<#X܁T@\}�,���@^��A���@`�sn�@a�M磶�@c=�\��@d�<����@fZd@g~�)��y@i�a�w�@j�o�r�#@l0_��5�@mٽL�@o��{{	@p��=W��@q�
pm@r}i�n@sp�xz'M@tj� g@uj6[�@vo��>�@w{��l"!@x��N��l@y��S���@z�{�.7@{�e^36@}LѾ'�@~A/&y�@wz��@�Yj�C��@��H{4�@�����r@�D�c���@��@��>|#ze@�J���@��DW��@���щz        ?x y���?����P{M?��>�M?�W:2p	�?щ8q�Ġ?�4�hRk�?�C?=\?�υxQ.?�P��S?�cuR�U�?��U�o�B@ �(F8@+Yi��@�&�$կ@�rQ�"@�9g看@(���,@�@�A7@��jD@ȼ0��
@���+f@���*DD@!a.�>�@#��Z�@$��le��@&��꛱#@(kQ2	�u@*^C��@,d�	μ�@.~1,�F�@0U�Iv�2@1u���v�@2�N��=@3ҊM.19@5Nv���@6U���6@7�]�zO@8����[@:a^݌�4@;͒xCc�@=C6�Ԗ@>�B[���@@%W![��@@�7�wwb@A�����@B��f��@Cd�}@�@D?��IUa@E�o�A@FIx�wi@F�C0`?0@G��
m�@H�ə��@I�Q��8�@J�Y~UvY@K�� t(@L��qG�@M�U�	�@N�>���@O�]K�2@P)�� �@Q9�q$z@Q�w>�'        ?}���Q%R?���S�E?�|a�F!�?�*�Ce?�meAA!�?䠕�L��?�2yt O?�H&D�?�*M���\@�;�3��@	��Jes@�kQ7�@���y�K@�t|�M@�v��n@ �?���@#���HX�@&��S��"@*"��,`@-�
y��c@0�2��@2�#L��@5!�(5�@7vk^_3J@9�1��_@<���!��@?Z�=��@A!�瑰�@B�S��@D@�r�̻@E�?�:Q@G�bt|��@Iu�ƾD=@KU�Lㆶ@MG�O�g'@OK�l���@P���~@Q�C���@R༂��{@T�z//�@U4����@Vjć��@W�8��9@X�X���+@ZC PY3@[��-d��@\������@^i4ݸ�@_�o:M�-@`� >���@anS��w�@b4ѷ��@b��� �.@cή��3�@d��Jp�@ey�� wT@fU����>@g6P�&@h��7�R@i�5�u@i��LZ=�@j�s�*��@k�l����        ?}�%�r?���Z��H?�h��?���$as?����A�?��&V��?�w��ޚ?�khզ �?�ꣷ��b@�k��@
��\%!.@�*��s@�Z�sm�@'��p$@V��g@!�#��y�@$�[!5��@'݋��'=@+Y��e�@/ ��1@1��	�P<@3��r>��@6����V@8w��rI@;z�d@=���z�@@R/���@AӾ��8j@Cg�t�;m@E(���/@F�k��@H�R�u2M@Jp	72�@L`%cУ�@Nb�VE��@P;�vqm)@QOO�&�@Rl V�C@S����e@T��&bW9@U�<�@W:6�d��@X�)�@Y���&@[4=�L��@\�����@^��K@_�H�E�@`�"X�@aD��"�@b�VKƋ@bۨ�5�m@c��7f��@d�|��]�@e_��U�2@f?2)}	@g#>��3�@h��� �@h��7��@i�!�g+�@j� ��Gn@k�S��@l�f&.        ?��ݬ��}?��
O��?��jד�"?�_�M�:t@�X@���@���H@���@!����a@'R��Y�@-̥�~� @2�l�*=@6�7m��@;(�y�U@@kjV�@B�߅�}�@E�]��N�@H��Qe��@L�����@O�#�cو@Q������@S�6�r�"@U�h��O@W��@R@Z>uY��h@\���FZ@_*��kUy@`��N�m7@bA���@c�%Y��3@e#���0@f�)�iN�@h;��7�E@i�e�E��@k�Q�J��@mB^X�&�@o	�3G�@pn���7)@q_n�S[@rV��G�@sT����@tX �	~@ub���]@vsri��@w�����a@x�Ne�@y�4�)�@z�[����@|&��f/	@}]=DI@~�����M@ܝ$IԞ@���n`��@�:�Ț%@���#&�@����5��@�B@����@���S$@����*>@�d����$@�!+x3@���iVv@��׭d��@�f���
�        ?t��tDd?��Y~8�0?��`j�\?��K��[?����0�?�5<N��?�%��aB?���[��$?�0v��?�+dU�?��``�A�?�\/���4@(�d�ܐ@i���i.@��t?.u@��J�x�@l���@�U�:@���~�@k�G`D@
�%Bd@Ε���@���P@!c"�N{Q@"�l^�@$���L�@&i7�@�@(;|�jL@* �Q�;�@,����@.#��o�@0 ��|e@19�h��K@2[�H��U@3���r�@4�`=��@5�7�ZJ�@7E�ߐ@8��/[�@9��s�m�@;Y����z@<�#�D�@>B1�C��@?��"���@@�n��uY@As4}�-l@BB�	�@C�!k�'@C��{�@D�es�M!@E���>́@F����@G�Kf�KL@Hr��nW|@Ig}�=|=@Ja #`@K_�IQ�@La���'j@Mh�G�u�@Ntq/z,�@O��YڛU@PL��h)@P��G�x        ?{��x>�H?�]j���?��!��H�?�:��7�o?��cC ׅ?�c�ҍ�?�K%�^�?���<�r�?��	�~�+@� o���@fn��[@����A@󩂙 @7R��@�Me��@ O� �J�@#�V�@&#F���@)s��4�"@-
�"�`�@0tD�E�@2���
�@4��~�Nh@7�9��X@9��`&��@<I�	�@?��؍�@A�m�}g@B�Q�7?@D8�AԸs@E�.�ۍ@G��?^E�@I�~���@K�쳇��@M�(�&r�@O��=�@P�-��@R�U�� @S>�RY��@TvX���	@U�j�qD"@W+�\�@X\Z��Ze@Y�OS�@[*��s�@\�e�h��@^$��m�@_������@`����"@av5P�@bMc,~�@c)uxؑ@dR܉�G@d��y��@eߘވ��@f�����@g�wȁ)@hǋ�U�@iʥւ��@j�SH��@k����@l�p+a(@n��}n        ?u��4Ҭ"?��ƞ��?��Y�`?ƅO㊱b?ԃ�[W��?��n��?�ahH�?�)�)��?���ѫ�@ }W�5�9@>� �@�@
��>��G@�4��v@#��M@N�ϳ4@wϰL��@ �˺���@#R%�O@&6$���@)V����@,�/��w&@0) H	�@2���@4$�4/ @6S!���@8����$@;&��h�@=�p�@@)i��j@A����w�@CƆ��@D��z{C�@F36ǥ��@G߻;l�@I�-��.�@Kk��VX@MK	�"�@O;�N��@P�����@Q���5@R��f^'p@S�F;���@T�XՈĠ@V#�]S@WWMn�M@X�5p�"@Y��y���@['�Ҁ�@\~�5aT@]�^g��@_F�[V2�@`[Щ�T@a�C�~K@a��j��@b��1F@ci�p~^�@d8#0�fo@e	��@e�`#^\�@f�(\���@g�e4��@h��R0�@ilE�: <        ?�A���?����0K3?�����?�)��_@ ۉ��>@
���M��@�s�E:l@��c;��@!߃6*%@&�p��u@,�g�Y�4@1�:�X�R@5��HK@9�wEh@=M�7h�@@��t@Cw��h�@F%�Yt�@IVB�@L	#��@OLF���@Q\����@S*��U1@Ur�]@W�~��@Y$C�T@[R���
�@]�g�O,E@_�z�<�@a7���m�@b��~��@c�G�*��@e4��(ŗ@f����w@hD���@i��ڕ�@k3Y��B�@l�8��R@n}H
w��@pw��~Y@p��p�q�@q��Q��@r�/n_b�@s��,�@t�}�-N�@u�T��	%@v�DX)(�@w�I���@x�`~�f�@z�P��@{"���l@|G��VL�@}sF��@~�/�J�K@�8pv�@����Y�@�-l��@�ѭ^Y�@�x̃�˳@�"��R@�ύ���T@�$!�\@�1����        ?u��rc��?��P4�?�p6C{�0?��J��n�?�aΠ2�?ٍ���G?�ӳ�J8?�e� d8�?�6Sg5?�X+�ŚD?�����n�@ -��!�@a����@��:Vь@
�ƣ%V@�(VOJ�@�?\I�@���u�J@{Xl���@&uHjJ@�	��t4@� �L��@!
`F�;@"���[R�@$gK�*F�@&3_j"�@('�v�E@*��J�@,��<��@.(\絠K@0+E�UM*@1L�Q3�@2v����@3����*@4�m֒�g@6/��<&�@7�}����@8��2��@:>}*��@;���8H@="3���L@>�!�
�@@��o�;@@���H@A��-u@B}�m��@CV����@D2s��@E�`�]�@E��o�@F�7��Q�@G�7�m<k@H��A���@I����@J�3ڒ'@K�&֭�@L���9@M�iP�@NβS�l7@O�fQOR�@P{@�P��@Q3��@Q���<5        ?� Ҳ.j�?�(�!'�%?�mP�V�?�T?��h?�yC���?�[�y?��@"��;?�ƣ�co@ y�;BK�@�	�
�@6��	@�p�Uf�@��]��i@Xd3�l@�o��vr@"�H>&�L@%�>N;�@)1�1s?<@,�x�*@0xg�1)@2�^)��@4��؋�@7gb�<�@:��LW@<ɩ��>@?�ô���@Ad�Y!��@C(\-V�@D�j����@FxmP�&�@HQ-��V@J=��ϷI@L=��@NQ�	�Q�@P<�z�d@QZ0�K[�@R��t�Ư@S�Ĵ[Y+@T�����@V2��
��@W���@X�f�f��@Z;��_�@[�eAb�{@]R`N@^�~PB~@`���	@`�[f+r@a��M��@b~�vB�@cVB�I��@d3ap�%b@ek�ٳ�@e�ck;�@f�I�w��@g�"P+@h��+�U�@iɬ��Q@j�b�;��@k�T��@l׵��l@m�T���@n��e��I        ?|�9�w3?�$qwr�?����a��?��q�U?�Pj:��i?�^�ރ��?���{�)�?�U��"$@ ���#"@)��׋@�$�gof@��@J����,@��o�'@ B4��@#Ay�/tz@&����D@*,$���@.�v��@1-��a@3x��X��@5퀜u!@8�idyT@;X�s7�@>O{DK�@@�#�'�k@B`�����@DR�D��@E�Nf+��@GܨA@I�o�Ǆ�@K��2O��@N"|X�8<@P3i���@Q`�Y��Z@R���� �@Sݲbf�'@U-�YnI@V����@W��kw�@Y_0!�D,@Z���d�6@\d3R@]�y�MA@_�YGtT@`�RA�:�@a{0˜�r@b[�GA#�@cB$�\Ά@d.?��<�@e �@M/@f�߷�Q@g1��/�@hi�a��@i!mYxs�@j0>����@kDހa11@l_NW��@m�#�`]@n����E=@oц�?;R@p��l��@qeY��        ?���DTo?��*�/*?�<��)/A?��O�=�@6[ٓ@�
�r��@��ʤ@�On��@#�%�*�@)��s��@/�kts�q@3�Q@��Z@7�)0�@;�T�J�@@WX�C0b@B��q�hj@E�2^t@H��!�U@K�]�4@O;�x�=o@Qg�v��^@SK�
~@UH!|:@W^g�9}$@Y�9�I�1@[�g���@^9݀Kg�@`Z�V*��@a�'"+�Z@b�f�I@d_q+ʭY@e�ATѶ�@gKt��C�@h� zS]s@jh�I���@l	�(�+@m�U��L�@op�(�8�@p�Y0}/�@q�U��|�@rsh��L@sh��a��@tc��N_@ue���@vl����@wy���%�@x�����@y��1�>@z���f�@{�{�@�@}8�x)@~I��c@���Zi�@�_�m��@��|{��@��NL��@�N	O�V�@���/E�@��O�@�z@�V����l@�
H��I�@������@�y�l��        ?tw)�mz?�l���y?�&�`�?�i5��n�?����?�N��)d�?��h��z�?��Y]GJ?�@�2��?�E����?���,�u;?�#j����@o+/��@���4[@�0��y@�+�ë@� �@�e�7��@ W�j�2@禗��@+��ܪ@�>V�ǒ@o;��t�@ �0�Z@"4,��$@#��J��.@%w
2Ә@'2�ɉӟ@) iWFA@*ߔ�ðM@,�h���@.������@0s}g2\@1�V:Ek@2���p@3�_ymf{@4�$��h@6)pڵ��@7h-wt�@8�cA�9@9�]�R\ @;W���4�@<�&�z��@>"��t�S@?���s@@��.8b@AIq��)~@B,t��Y@B��*��@C����@Dy,�7�.@EOY㕚'@F)�뤋d@G�>p��@G��/�@H�����@I�"���<@J�
��v�@K����/@L�^|-4S@M���C�@N���_@O�ŋ��b        ?}*�O��?������?�Z����]?�V�/z?إ�Y�?�!��t��?��1�?��G"i�?��nƩ��@��OȺv@	���^==@-�y�r@ Yۂ�@S`0�|�@*pvc�@!D� ��W@$9��1�@'v�qs @*��d��@.�P��<\@1qYe�g@3���Ȼ�@5��ݏ�p@8|���u�@;#�E�O�@=�|�w0@@t�!�Gb@Bਜ਼Ջ@C�����@E_��3�~@G,��M�@IG'�@K7,ς�@M liD�@O-��"ul@P�=�O�i@Q�,Y�/O@S�ɠ
�@T?���G@U�����?@V�;w�@X.P%
�@Y�<�P��@[��ۤ@\}`+ظ;@^�qV�Q@_����j�@`��؁�|@ai��� �@bA��
��@c���Q@d�$@��@d뤜�U@e�Ƀ҅�@f�i�|@gƅWO@h� ~j�@i�<���r@j�ۂ׬�@k��hro�@l��F��w@n�0�jm@o0�;i�        ?w�pl��?�(��Y ?�GR�1�?���#?��^���?�^p�%7?�f���F?�Z�)�%$?��:��D�@�/h��@�-���!@#{�/X@��aP�@�Jj��@+�gnh�@ j�V}�@"�����@%��!@)#�0�i@,��ˏ̕@0A�Q&�@2O��L�@4��c�@6գ���>@9O�.��b@;�m�9@>�Ute��@@�y���@BW�/��@C�#�'��@E���	C�@Gc�����@I8��j�@K!b�i|@M���J@O-/�)g�@P�;�!@Qð����@R��n�g@T&"�@UQ/��@V�J���@W��)1�P@Y7��R�@Z�i~�G�@\W��@]w�vL�/@^�`�ME0@`?�>�vc@a�G���@a�D��@b��e
 �@c�+�X�	@d`�L�v@eCS����@f+pb�k@gԥd�@h	���S�@i ɧ��@i��� ��@j�O T��@l�_�@m�q.�        ?���Q�?�8���RA?���%i�?�7�3YG?��F��@�Z�;�@1�a@磮�*�@ ~�6��@%);2u�f@*u;?ܳ@02�%�@�@3}4���@7\8�H@;
�4u(@?N҂:�v@A�b��&�@Dir��;b@G	��F,k@I�XF�c�@L�u_��$@O�7쉫@Q��U��@ST��+��@U$���=@W
�vh�@YQ�zuN@[}�v9a@]>^ʆ{@_z��|�-@`����@b�(�Om@cY�s��@d�kM�
@e�<���@gWn�j�@h���n�)@j6�0/R�@k�K�ŎD@m@���S@n��C��G@p:�2�`Y@q��D�@q�T�.��@r�{�T�@s��eč�@t���]8@u�vЪ$~@v|�&N�@wv��[�T@xu��I&t@yy|_�e@z���#��@{���|�@|��3�_3@}�)v�@~�m��T @��~ۂ@��vё�F@�'��C��@�� �R�@�[(��ƿ@���^���        ?s�8�շ`?�P�T�?�P�gyy�?��vnU��?������?ֈ����?�U�DN?�rd�b{�?ퟖ�A�<?���6��?����.?��!�?�@PB��@||]��@�~yXƄ@�p�3K@��Y�8@�zC6�@Pލ!��@��N�n�@Y�/��4@����@�ֽ�@ �Rh�&D@"���?w@$;Os.@%�G�y(�@'�y�)g@)�Ҽ��@+�?6���@-����@/��p�h@0���P�@2�N�˝@3'N�#��@4T�\���@5�;Y:@6��b�@8g�wA@9alh��@:��O�@<��7 @=�"Po�)@>��:�H@@7��=1[@@���^��@A���q�@B��۷U@CS��{Q�@D$�a_�@D�x*\|@E�7E�8x@F��4��@G�A���@Hs~>��@I[p���@JG<��V@K6�bMl�@L)Ƚ��"@M ���̦@NޮL�@O����@P���        ?��)��h?����?�D?���K�?ͺ�ȈBx?�b��Q<?�=	Vs�?��{�ψ?���C]��@ uݒ!��@�J0�%�@< �6�~@�t��S�@�b���@�����(@ *��%�@#0".�ĸ@&���(@*2���@.36�	�#@1FC�?�0@3��ڂ��@6'q7�W)@8ݔ.]�?@;�C��-@>��o/@ACC��@B��\�@D�7��4E@F��ݲ �@H�H��.@J�Z���@L�ːi�@O@f��l@P��VL�@Rq��y@Sk>!�@T���}��@V3��u�@W��R}�{@Y1i���@Zá�5�@\cm�E�@^���D�@_��2�t@`�Wl���@a��h׻@b� Ի0o@c��K�b@d���A:@e��O��1@f��X�A@g��I��@h�+�n_@i�N��2@k &AE��@lM�n�B�@m��wO�@n��Ϡ^@o������@p�p�=@qJ���@q���*�e@r���+        ?v%��c�d?�D(!޸?��]���?��S-�?��A��[y?���QQ?�Ke�NT?�qV7Q?�7��*h@��x2�@G�s��@m��)|�@>/��M�@>vX�s@�k�uB�@�Eewi)@"�꽷f�@%�G��"%@(��U�+�@,�Λ��@04M���Z@2H$ô��@4�h_k�@@6������@9e��n�@<�-\b�@>�e!��@@��z�@B���;�@D#���D@Eۃ&G.�@G�*��NT@I���yg�@Ky�����@M�5Waj@O�	�r�@P�l�!P@R��.�@S1��?l@Tg	9ac@U��9&�/@V����k,@XAh��_�@Y��T5[�@[����@\s��:F�@]�|��%�@_p�c�`d@`~ԅ)* @aJ��o�@b�c�@b��f#�@cȀs��@d�Ϗ��:@e��r��	@fq��D@g^Y3]\@hO9����@iE�C��@j?�)�m�@k>�~��@lB�字�@mK&:        ?���SQFn?ə4����?�r�˔+p?��D�`�0?�G�Ք�@�vt���@�ϋ��@�aPY6@ j�9�=�@%�-�1@*i��t	@01x���s@3���|��@7(��/�.@;%Q�i�@?x��ӌ@B�F�@D�����@G<��Q�@JB��K@M�ݤ��@P"�w���@QϡK��@S�P��*@Uj����_@WX�m��m@Y\Q��gn@[uvT���@]��o#@_���x@a �����@bX
�^�N@c��$��@d�g�}��@f=_:���@g����<@i
�Y�@j�۰�A�@lc�;�a@m�1�!�@o!9Q Ο@p`6wiR�@q4�})@r� ̿@@r�DН�V@s��=�@t���Se�@u�6MR�@v���o��@w�'�p=�@x�r�pIb@y���ŇJ@z���/la@{�F)��>@|���0@}��Bs��@~��@]@�^����@�����A�@�!`�O@�����T�@�N��o�+@��:s�V