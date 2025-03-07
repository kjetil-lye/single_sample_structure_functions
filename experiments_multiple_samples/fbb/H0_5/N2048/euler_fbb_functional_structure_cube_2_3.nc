CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T103718        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?zH����?�[����?��RG��u?Ś�)��?�p�����?�^8���?�O�A�c�?�	��H?��-1��?��yJ�?�J1�l@%���@q��6�@�`<�@�Dft�I@y�ߎ%@H�H��@��SB�@2*��5@��~se�@��0[�@��xz7@!b5S���@#�2I��@$�@&{�&�KC@(Sv�SG@*=�E@@,:(�Ʊ0@.H�E�`@04�ݔ7�@1Nw�/�@2qtt��@3��L��W@4ѯR��k@6�p/�;@7V�1��@8�~5�a�@9��4n�@;a��ϝ�@<̌ :1�@>@��Y�g@?�����@@��a���@AiH�4@B5B�kUR@C�6Bܯ@Cڬ����@D���NM@E��7 �@FtU��&@G[!��]@HF]��`@I6	[�)@J*"Q�@K"� 錝@L�uN�*@M �+���@N&���k	@O1{�;G@P�Y��@P�m66yU@Q5;S։�        ?q�Eo�2&?�u���$?�9��#�?�W�i/ ?��Q�G?�:�F<?�=��%�?�=/u�?�V�XN�K?�P-��6�?�P�zq@ �15[@�O����@�K�+�@)�u�@����@�_��P@���ɧ@�Ki�5�@@h���@ nY���@"Y�s�.�@$bF�3=m@&�-�F@(�i҆�j@++��ԍ:@-��M��@0"��6a�@1~���@2�u1�$@4b�*�@5����
@7�.����@9&�E>�@:�?��#=@<�٤_֩@>j��� @@${pU@A��~��@B���91@C_��*@D'��Z^@E:C�:��@FS�6ze@Gt6Cf*�@H��p��f@I���k*@J�n�/`F@L;��X��@M~��B�@N��v@P	�G�w@P��pOg@Qh^u��@R-�.Mj@R�h�$@S�OrQ�@TH�L��@U��K�@U�p&�B@V���S�@W^]5XM@X,l5��        ?w�65�e?����a�?�A;(�)�?��bC?�g` ��?�9��?�f�vr�d?��v��s?������?�Ͽ��h@ Gd턿@pG��@^�!��u@�< �@'\t?�@���J@1@_���@a�3�D@��_�@ ޣ���k@"�0ȌQ�@%	���@'M7;�"?@)��>I��@,3�ɓ`@.֍wsv�@0�Z�sD�@2=4�K@3�Ԉ��D@5N6ʥc>@6�W���@8�/���N@:]�Uc�@<,�k�d�@>��)�@?�37ˈ�@@��6-@B��Lap@Cx���@D'�l�q@EE�c�+�@Fk��$�@G�D�&TU@H΍�T�k@J���+J@KPA�#�@L�����@M𻞕!�@OL|��<�@PW��a�@Q|�[v�@Q��݆FC@R� �?!�@SD�C̸�@T	��y�
@T�A��a4@U��B��q@Vn��8*�@WBsq���@X*J(^@X�Nf�O�@Y�R�H-@Z�� g5        ?����P�?ƍ���B2?��ȅ��?�&��5�?���.6T@��5�F^@Tb\ـ@A_%w�@*�4��}@��!��@#�"hJhl@'���f�@,^ )@0��,a�@3rO�[F@6YH��ʸ@9s�T5j@<������@@!Q�,M�@A�V�%�@C����@E��A�A�@H!�,��y@J`�;)�@L����B@O)�FHA@P��9`B@R+x!�@S��˚o�@T�ό"@Vh���@W��ӛo�@YyTm<@[��a�@\����@^m`���Y@`���@`�~�\z>@a����@b�7�ş�@c��Rk"@d̳~wF"@e�Ϥ��_@f��*&��@g�7c�@h�n�ZY?@jmR�A@k7me�y�@l]�a1�@m����ԅ@n�e��(�@o��b�І@p��6'�@q9�GM��@q��#��@r���ۋ�@s.�pp@s���Nf�@t�j�X�@u=�r�'v@u�B5��@v�r�L�@wf}v�aZ        ?n���$5?�{<\���?����]�C?�W�X:{i?ǿb����?҇��?��?���V�<�?�lP��M�?�D��M��?��EoL
?�>�Jh{?�o�B;?�
��Ҳ@ �u�K�@B8���@0��/�@	T�_@ �@�nk�t�@�ˁ��@ }��z@��X88@�^��C@E	���9@���A�@�8�i�%@u����I@!�Z�@"ai��9@#�����d@%:���z@&��A�v@(F�X���@)߉A��@+��ڙU>@-6��~@.����U�@0^͍�PX@1I�1ߝ�@2:��P7@31���
@4.MĚ�,@50��џ�@69_���	@7G��)y	@8[��jS@9u[_�@:����@;����@<���e@>� �h�@?J�H�@@C+��`�@@����@A��'�d@B,�}��\@B�.�0.@C�[Z��@D.'
ȍ�@Dތ�]'@E��n�@FG
�D�u@F�W6�b@G��_���        ?ol|�G,?�2�� �?�\��&�?��s�	?��Z\_�;?Յ��>�?�
D�l#?枦�|?�I��?��M�3�?�l=:�n?���=F&u@P�;rm#@8�R���@�1'D@#�@գ@��Ɋ_�@� ?;@@�cf�?#@�3���@;鬡f�@!uq�q�A@#i���o�@%z�v��@'�(~���@)��c'�@,]�ʊ@.��|	0@0��c %&@2"�u��@3�ÿ���@5)�I��@6�,�t�z@85�9�ޔ@9��i�}�@;����,�@=\ƅ^�@?1[R#~@@�'q뵟@A�����o@B��/[��@C�b�,�@D�I�t��@E�6�@>@F����@G��&Q�@I�6b��@JEY�n}@K|�R�@L��_b��@M��`+�@OK{�G�M@PN�k��b@P�9K��@Q��吚�@R]���}�@SϿ��@S����@T���=@UI�m�t@V�;��@VщD_i@W�i���.        ?kV�P��?��_��_?�}WF�M>?�+��9u?ȃ-�n�?�����9?��\�W�:?���X?��QG?��:��Y?�w,�rI?� ��K�@aCs�O@(��r��@
Y����@��HH$b@����-G@����W@��3���@�u����@F/�cHU@ �3��ff@"��A�gW@$�QivC�@'���v@)b�W+u@+��B�ȋ@.O�0�7�@0zb���H@1�I�X�1@3M���B�@4��O�~�@6_�-��@8 ��;/@9�aZ��@;pu�/zA@=@a}/��@? +�`�u@@��M=@A����B@B�|��^�@C�9�iT�@D��7E@E֨�o/@F�^@И@H.T�m�@Ie����@J��;��@K�J�P��@M=B��}@N��f�� @O��Z4�@P�M��F@QfB����@R"=k�@R�<�X��@S�AT��`@TnJ�辈@U:X��!�@V
j�x8�@Vހ���@W���r@X���Pe�        ?�k��89?��E0�?Ѻ�5�?�*���j�?���x?��+�k�	@�yOf�|@g����H@��@zl�-W@rc��M/@��|.Q@"��f1*i@%ӝbt�@)hc�&�@-B���-�@0�:�
BF@2�9��@58��x�E@7��F��@:I��]�@=�@�c@?����t�@Apm\L��@C ��Er@D��kC��@FS0�S��@H��@I�Cr��@KɌ0T�T@M��1Z;�@O��UsJ@P�����@Q��0`<n@S8�3@T1sp@UYOԽx	@V��̂/@W��k�@X�&h�@ZCŜ�!�@[�ר���@\�0#%@^@�d@_����ne@`��r�٥@a?1�)@a�7���@b��#�/�@c}�R��<@dD/��#d@e�@��@e�K/���@f��`���@gɌ��7@hV��Ÿ@i1e��@N@j	����@j��$R�@k��N�@l�鰸�B@m��}`@n�Ne�[        ?vX%\t?�x�`a?���u?�1 �î�?�+��ݣ?����&?�./��?�`�[�;?��p�7?�c@��?��)62�?�@��@U���ɭ@`LxR�n@�%�>��@3��E�@��t���@��-��@�K?�?�@�*~ @F6PiH@�U��{�@el��;@ ���P@!�ݔ�@"��8_=�@$�^9qE@&&?�Zc�@'�"�f�@)��OJ�)@+S�c��s@-*�GK�@/��r�@0���(�@1�I���@2�	֩>@3���/@4��׌0@5�J-�:	@6���Jx�@8#��|6@9WZݪ�.@:��?��@;���"��@=��2@>j����@?��d�H_@@�d26Z@A?��LN�@A�{sS�@B����*�@Cg�}�܄@D&r3W�e@D�&��!W@E���r*�@Ft�6�B�@G@��j}@H*R���@H�\�n6k@I����M@J���*rZ@Ke A���@LB^�\X1        ?r.�8	�|?�(MU��?��"ҿ��?��My�K]?�gBF^z?�gTE?�?�N*#]?�>v=mU�?�Kߏ�5?�1����/?��i�Dӥ@ �}	�@C;QP@IJ[m
�@�����`@�G�-�@o��.J@L<����@`��e�@�bo��U@ �緉@!�X�p�@#��1�(@&̓��@(F��W��@*�s]��t@-�V���@/�b���v@1%|�2(�@2�5{2�1@3��`h:@5��@Ƌ�@7-4�l@8��S= E@:hp|�@<(���@=�����@?�0��@@�V%P�a@A���\@B�(�mR@Cﵒ�v@E�Ҫ�@F���B@GA�\��3@Hk�2�\�@I�(-n�@J���d@L�/V�@M]M�nfi@N��O�>�@P �r|�@P���ӵ@Qa�ai�@R�7��F@Rьs@S�Ӟ��@TO���S@UV�;i�@UܐB��@V�m�9�@Ww�?Zv~@XK��c�        ?r��{߂6?��U'�?�OU0���?��p���-?����;?��K��?�c�s��?��b�%�?𧯊pW?��-�O�?�r��l@x�ˎ1@��_<�D@�6�g�&@V�
(28@%̀1K@��ڞCQ@�F���F@�k���@B0Z���@ lb�B�L@"T���@$Z�!�F�@&~#��@(�L�<��@+X�Xɰ@-�k-*c�@0Q_8֋@1x��\@2��-�@4_<�{@5�in���@7���:�@9+���:;@:� t���@<����`@>�u>�@@4K�6�@A/��Z�@B1]�@�@C;]��W@DL�ƀ��@EfB����@F�&/�%j@G������@H��0��@J�t�ܛ@KV����@L��M�@M�z,��/@OB���!@PPB�	�@Q�)N|O@Q��@�th@Rs���5I@S2ߖk�@S�T�@T���а@U���X��@VQ�v/�@W"l��'t@W���G�f@XК�k	�        ?�|0�u>?�%׹oW?�q�LL?�����?����tg@ үE�@��M�@i�5 �q@x����@<�=ؒV@ ڵ�}~@$q��a@(aB4��@,�%?���@0�B��I�@3%�f��@5Ђx�	|@8���%r@;����*�@>۩��]�@A�M��@B��X@D��O_�@F��n@�@H��j 2l@J���ʏ�@L��hl��@OA��`G@Pι�*k�@R.�k�@SI�k7�@T��kh�@U��3@WP��d3r@X��"�%l@Z3=���@[���ؾ@]>c���@^��=L@`8�q�I�@a)��@a�g���3@bč{��<@c���JU@d�n��:,@e|p\�@fm�Q_1@gc��;��@h^�P;�^@i^�}��@jb5/f{@kj����A@lx0��N@m��^��_@n�4)Ɗ@o��Z�s@pm �2@p���d�@q������@r(�!�ѹ@r�vf��@s[�O@s�T܊�        ?k��B��?�xT!��?��Tͪ:�?��[�&߸?�S�!h?Ц��c?�"Sn�OK?���<*&?���*r�?�ͣ�M��?�E�au�?����"�?��4��?����;��@5�%���@Δt�"&@���$�@	�%n�~b@��|�C�@��}[ג@�&j�E@�$k/֫@x]�,	�@x�:s��@��9�@�oP��@����%�@ *�jAY�@!aP|��@"��)��@#�0�@%E(K�8@&�-S~�U@(��.�@)�wd[�@+��ɚ�@,�0���@.&�%l��@/ņ�!��@0�7t��@1����@2o"���$@3R���@4:�:w��@5(��(9@6���@7����@8����"@9 ��'@:m���@;�A�s�@<*4���n@=="?b^R@>T��o݉@?p�:=	`@@Hr+���@@��gr?V@Aoj��H�@B*�&t�@B�l���@C:[c�n@C�J}�4@Dv�	g��        ?mL�s\I�?��.>3?���9"_a?�F9�J�?�qKKS#?ԋjX9i?���#�Fp?���a��f?�/�_"�?�T <;�?��rpJ��?���~%x@ȔT�@���3�@
��o��0@{����@F:`N�@��@���,��@'�͸^Z@��wnT@!g<���@# �����@%~����@'-�q�@)ne,&@+̳�\�f@.H`��@0pD���@1� ��s@34���f@4����ʥ@63��U�;@7ɂe>H@9nq�@;!n�Y@<㲏���@>��)�@@J̌�@AB
ԍ��@BA�� \@CG���Q�@DU���w@EkGxV$@F�iDz��@G�<7 �@H�W3vo�@J(�@KH���@L��"@M�(@�P@O(]MLK�@PA���@P�вjNN@Q�Y�j-�@R^�T$��@S�p�$�@S��j�I�@T���8�@UfK���@V1��T@W��@W��g4�        ?j�-`�q?����'�?�0S�i?��wN��x?��.SZ�?ӅV�r�;?�KO��u�?��_���/?�7�B<�?��X�M?��&kx?%?��Sya_@�!N�s@Á�w�@	�N��B@Y�\eu@�$Y��@H���@% 8���@7�
�@�?���@ <�a�@"Y�����@$Ow7X��@&`��̦�@(�����@*���@-8�9���@/�}F�%T@1(��ښ)@2��{�7:@3�~�*�@5c���@6�%%�F�@8x���L�@:��C�@;ŵ?�F�@=��A�$�@?I�!�@@�����4@A�`�N�r@By�9�+@CyS)�p�@Djt�][@E�:�UDP@F����Zk@G���Mo@H��K"�@JkeAV @K0��)0@Le{ߞ��@M��v�ca@N��!�@Pޢ�i@P��x��@Qhi�G:�@R����@R�
�[B@S|�[1��@T4��^-�@T���o��@U�0���@Vo­kp�        ?����P�?�����S�?�>+\��m?�
t�6y?���0�?��f�g.P?���D��@��!	�@�(���@7]����@����@�Y�Ը_@ x}W�X�@#hZ�O�@&�n6�n@)�e�#�@-�����@0�g�/�@2�քs�1@5!��9@7L&���A@9���4��@<:�G�I�@>�<ƕ�@@�k�=Ab@B>@��e@C��zI�'@EG4A��8@F�(�|�d@H�R�x�@J?�2�+�@L적5�@M�2o�Z@@O�Y��p@P�'���@Q��P+�@RԱ�7�(@S�.�O@T�l�Ό1@Vc�	D`@W+_c0-@XQKJ��9@Y~#�2�}@Z��2�x�@[�a�B2@]+�Q�]@^rc�).�@_�ob�'V@`�b��Z@a6+��f�@a���(�@b��܎�@cN�\��@d��B�!@d��k��t@e��3-�@fD�ϛJ@g	K;�B�@g��OY��@h�^
w�@ih�>t�P@j8ΰ��@k�
���        ?�k��.�?�����~&?�C��;4�?��"�t"?�&�2���?ޮ�m?�ʱj�
#?�nd���?� �k���?�"JO�?����1�@���Щ�@W�M�N@	k��E�@�T� �@����@艅��@U_c@TM@��:�4@���غ@{;+�2@ >�G�@!�W�؈�@#xP��@%0�4?T@&�h<�n�@(�Wx��_@*�g91%@,�}͡�w@.ہ�w�@0�-bK��@1�x���@2��+�ՙ@3���j@5"6��@6`��Z�@7�ʟ�1@8��:=�@:P>^jS@;�6�?$�@=�&@�@>�#FT�~@@��B@@�}T�@A�9�%N�@BU�݌o@C#�n�@C�%��^@D���-k@E�!�L��@F��Ԣ@Ge�d<@HJ˝W��@I4rF<�@J!�1��@K<r��@LTji�@M1���@M���3`@N�#�B@P3tC�@P��vaz@Q
�٪        ?s��(�R?����i�?���kD�?����W. ?�T��L��?��u�*o?�z�)ۓ?�锻W�?�n��=?���z��r?��wʐ�@���>X@���o/�@
SCt�@�;���@5]�8^@�ؿu�,@
� ��@a0D[�@�/�L��@!c�V?�@#lC�Δ@%�_-�l�@'�:	�W@*C�{�5@,˱��(�@/s����!@1�ıˮ@2�ʽ�Z�@4��'�@5�<"�<0@7N�Y���@9ɳ�@:ǉ�y�@<�C��F@>�}a��&@@:m 
�@A<�̈>@BF����B@CXW.}�u@Dq�:r(@E�]�Lj�@F�yb7��@G�@�~�@I%���@Je�kBV@K�(�c��@L�)<)��@NR�
n7�@O�o^C�@P���UmI@QAX�>@Q��g�@R�j�Be.@Sy~�C��@T>%��Ց@UY�)[@U���-�@V�T�d�<@Wt3p:�@XJI����@Y#���8@Zg�ܔ        ?v�V��]?�ÖU��n?��3f��?�u�z���?��N?ܺ� =S�?�@�
�?��.�*q�?��ο�<?�$]���@ �c���l@�^*&��@	!�B�T�@,���ha@��
�)W@�����@B�r@@܍Kw�"@�1����@!�X��@$,p����@&�X�@)
��W�@+�N<��@.z��vQ�@0��F�S@2>Z�1��@3�Q��V�@5��x@7H�x�[�@9�ߖo@; Lr�~�@<���@>��s&@@�8l��E@A�q�T#<@B�v�(@C�v]��@E.�ZlJ@FT�p�Q�@G��5$u@H���)�@J5]\?#@K��A�7{@L�y��t@Nc���r?@O��H�@P�_�O!@Qp'ڙ<@R7�"��@S�#�@SԎ�i�@T�F��O�@U�B���)@V_��) @W@��N�@X&��q
]@Y����@Y����@Z�d̗@[���x3@\��Y�1@]��         ?�����("?�ӗ"�B3?�@$��?�RU�ep?�7��m�X@�rj�kY@���bi�@j>��@�I(�@ �`��9�@$`ɢr84@(��bS?@-Y"���@19��<s�@3�#
�}c@6�� !=@:��?:@=	��@'@@���D޺@Bn�+�Z@Dm�q�e�@F��I�@H�"����@K�?�ǘ@Mo��,�@O��\��@QE�3MC�@R�]��j@T� m�d@U{��߆@V�>!��@X�wB��H@Z#8�a�@[�uϗMp@]|!�l�;@_;0�B^�@`�K�rH/@ao$��q,@ba�
�@cY.:�N@dWP�_��@e[|4'�@fe�\���@gu�Ъ��@h�����@i��S�y@j�Q�q�@k�����@m��% @nP��x�O@o�R4ѝ@pc���x�@qZ]Kq�@q�����@rQ-W�0@r�/�W@s��4�l�@tWS��&@u	n8g�H@u�4N�&@vu��}{�@w/�L� �@w�d[�        ?tv���{�?�u���?�
�E�O?�(�!~�?˶��x?�j���l�?��m[)��?��쥷�r?납�]ʢ?�w���,�?���장?�BQT�
�?�U?���@mȄu�@jyF��@���ٛc@�=�@� K��Y@̦޻n@ْ�+�@��r�@H��-�@�pպ��@&ʺ��w@���u�@!:~����@"�Ϯ^@$�L� @%��3&��@'.,�-I@(�C�b��@*y�ϥ3@,4r�p+@-��_a�@/��#p��@0پ���Y@1ѷ�@2�\�&q@3լ9U�@4ᡞ0��@5�9����@7q<tX�@8-B�N�@9S��z��@:������@;���zB@<�+HG@>.��p>@?uk�\�T@@a][R4�@A6��/@A�?��P@BhsQN��@C��h�@C�U�zG@D�����@EHʧ���@F���z@F���5@G����`@H[5H��Z@I'����@I� �Zu#        ?l�,#���?�$J=1q?�z��F�W?���S??�S$}���?Ӫ�6��?�z�X��?��:���?�`
'vZ�?�0gò'?��+�d�?��w��@,wE��@�8"�Ea@
;�t��@�8�4�@�ԇԇ�@m�q�Q5@Q��{�@l^tO��@����q�@ ��F��@"��w0#@$~�ӄ�q@&�5����@(��ӵHt@+u�%�@-�.�~�0@0����#@1X{5�@2����@4&�� �@5���jU@7,����@8���/@:kO	d�J@<y �7@=ᗺ��`@?���@�[@@����@A�°e��@B���
�O@C�~����@D�Gb�t\@E� )�$�@F󨃂�@H?���.@I9��c�@Jg7�o�:@K��,H�@L���y%�@N5���@Ob<"�
�@PY#���@Q�4t�{@Q���`�{@Re��P�@S�x���@S���s�@T��GT@UQ�
P�@V�}��@Vܺ4H�t        ?t��f�?�0�\΃r?�J�!���?�������?Ϲ��T�?�5�m"^�?���h�?��k��?�t���~D?����ۯ�?���߷@�=K9��@�%�,ɐ@	ɡ7eo�@sV��Co@���(�#@���^}@����S@@�U���@+`4�@_@ ��2�@"�t�;Z�@$��4���@'�w=��@)^���Ch@+��tM�@.H����@0t�9� @1�'?9-@3B��Ճ@4��zS@6I�_$)"@7�Ğ m@9�NN��>@;Cs��9�@=	.	m��@>�u��O�@@`!uŒ�@AX�.�.�@BX���Ov@C_��
@Dm�E���@E�l���?@F��G*c@G����s�@H���@J ��)e�@KY��HN�@L�����?@M����w@O/5}b�5@PB@&��@P�i��0@Q��N�@RWD���@S�k%d@S�'0^�@T�ٝ/P�@UO��^@V�ֲ��@V��8��N@W�����@X~�a�F        ?����_?�b�v��?��+�?� *���?��ޞmB�?�0��Y�@�mg��@��[��v@��a�/@���8g@�_Q��@!��� Õ@%h���;r@)02ր�@-Fnq���@0ՠ8�)D@3/-Z!�1@5���{@8W<㌎�@;%�Ҙ�@>k�db�@@�����@B;�+�O�@C����@E��%�@G��]@I}��.w@K}��y@M�b�R�@O���O�@P���t��@R�j��@SJ��[�:@T�PDH�@U�B�qk�@W`'�@X`�|��i@Y��&��@["`�!t@\��pA��@^@��@_��[sz�@`���y'@aR�� 4@b���]@b�\uRX@c���/|S@d�t���@e�lV���@fd�����@gLA�}��@h8��'L@i($A"Jr@jn'��@k�����@l�xiht@my�t)�@n��.�@o �*�{@pΕ�u@p�Ýt��@q*�e���@q�z-]�        ?u��
��.?��bl(�"?�ߕ<�>G?����:�?Ϋ:��,?כD �o?����_�0?��J2��?���9�?�� ���?��:"�T
?���6`�[@�F�e@6t"B@G�Lg22@
��;@{6zߌU@8��:@S
ca@�	$)@��s��@Z%��v�@�󇪋@�����@!:;�Yf�@"�\Q.�(@$9�t�@%�t�@'u� l,�@)*�%��@*�6�؟@,��1 �9@.�?j��@0J�_���@1K-u���@2S.�R�@3b��Վ_@4y���Kc@5�7M��@6�N�g4�@7���ٔ@9 ��Sh@:]v�L� @;�gsB�J@<�V;��@>?s;DZ@?�}.|-@@}iscDO@A1��z�@A��R0@B�#Ť@Cd=���)@D&�>�@D�('�@E��[S@F�C{��@GU���@H)t�?_@IL�U�@Iܞ`��o@J�e���@K���	eQ@L�>��        ?s*C���?�����?�!��:?�۶�t3?ϛG3���?�(�ک^F?�*��X?�9&���?���R?��H%X�?��_j�@�l��h�@�e�5&�@	�i>��@��3�@�))Tj@���$n�@�$�?B�@��D:�@o�i��?@!�;���@#��	�@%�5+�@'E^�H�c@)��"՛T@+���lv@.}ii��:@0�U�z�@1�7	@3[R�X��@4֟���v@6`�m�@7��^��o@9�g�Ǐ�@;Q4(�R @=�3�@>����S�@@`o�e�@AVc`���@BSR�n�U@CW9l	{�@DbW�q�@Es�!D��@F����Ť@G�]��@H҄U�I�@I��k�ޅ@K3��T�@Lnw ���@M��{|s@N��$�O�@P#K#��@P��x�N�@Q{�k��k@R,�K�@R�	i��	@S�t$ ��@TS���l@U�Cr4@U�r��@V�E����@W\"���@X&���K        ?r6�[�K?�����?����_җ?�U��I?��+�8?ع��*�?�a����9?��qW�2�?�u�đN�?��X�f�?��jN���@��ع�@���p�@
kyu��<@QZ��@Xg����@E�>�?w@qя8�"@��eN�@�;���@!����5�@#�S���@&p�׺	@(_�.�^�@*ظ�F��@-s9�3s@0��Z�3@1�V��5�@3�(u��@4�kP�1Q@67�5�
|@7�9R�	@9���J)@;��2S[@=gz�G��@?^Ě �@@�ξ�	@A�'uA}@B�
<%�L@C�t�]�@Ed%�J�@FE�_�^�@G|�5*�_@H�o�v�@J���@KT�v��@L���[��@N���[(@Ov��1w@Pt���@Q0��@Q����@R����@S���T�@TM*R��;@UV�^3(@U�q3@V̵O;�e@W��ڊ��@X���<�4@YpACG@ZY3�UY@[E���        ?�h��?�K���?��0y�'�?��'�S�?�1�]j�G@B���@����@��@��|�@Ɔ�
@!3G�2?S@$��ZN@(��H�@-Rն��@1�A
@3�w�wH@6Z!�?�k@9G�_f�@<b��J�@?�-�Jq@A�&�w!@Cc���
^@EMV�X@GMY)��G@Idk�J�+@K�E"
q~@M��0�4�@P �hO@QR2����@R��Ʌ��@S�_@UA܆Å�@V���(@X�`��@Y�j ޷�@[!��!n1@\� ��`@^Vp-�
@` �Q�?�@`�7r���@a�^�N�,@b�7%��@c��x�:�@d�����@ez��@fx0kxW@g{<���@h���`Y�@i���@j������@k����'g@lݓ�g&@n��pao@o+>�H�O@p-e:��@p�C���V@qd*S��@r��K�@r���Y$�@sJ��I��@s���]K@t���Es@uH��&        ?z���.�?�V�!��?���ʌ^?�Ǿh��?ҋ�@��?�v�{�X�?�U#�m��?��A��?����@g�?�����?�Hx���@ �3b�@:E�,�@��{#��@�<��@�Q�i�@��΋5�@O&^��2@�A%Q{@\�A�5�@v��o@�ArU�~@ �{?��
@"��+P�@$28���]@%��1'��@'�k*���@)���X�@+i-v7Ш@-_�s���@/f����@0��x#e@1�ޗ� s@2��V�Q�@4�4�:�@5:����z@6m<S
�s@7���/b@8�#y��@:362M @;���?��@<݈fv�@>>��:@?�4{1�@@��\��@AF[�J	�@Bz���@B�7}!@C��,�m@DXek/�_@E%�e�@E����@F���4��@G��O���@H}����@I\=͚ky@J>�J7U@K#ۙ�@Lw����@L��~-H@M��U�>@N�ͣ�u@O�뿅V�        ?v��/�B?��Z*�?���#���?�E@�yM?�ř�H?��z�`�?����p�?�p�y�@?�&��-i�?�ʨ��H?�F�"��@Pm��@on��`%@��U@�0Yo;�@G)G��@E�KG@��1�I�@��A�0�@ Y�@"U�Uj�#@$q��� @&��D��@)
���/@+����a�@.$(�2@0q�VB�@1���Q�.@3`�5|��@4�pO��@6��J �a@8EG����@:���~�@;ܴ�=@=��I�2i@?�C��6@@���|@A�:��@C8�%��@D��5�@EE5��/�@Ft@A��@G��|�p@H�F
�@J5�%5��@K��p >�@L�ǭb��@NF|� L�@O���#@P�5n��@QST��qQ@R�D+0y@R�߭5~3@S�M�)��@T|.r�oy@UQ����@V+K��&�@W	��~r@W�C�&V@X�u�;0@Y�#��@Z�N�,3@[���o��        ?u9�s��?��hM�?���vK��?�b�d�[?�*�z��?ٞ=4'R�?��-�*&�?�^ȊLڭ?��� ��?������?��'�@����<@��R?�@
8��@#�L)@k�>@�ٜ�w�@�UX��@auQ���@��`��@!_�S�o�@#f ��@%��fȇ�@'��QTn@*6b�U5@,��#�@/`�D�@1���X�@2��T$�b@4	.�WO@5�#��Z@7Ag�� \@8�H��@:��Sf4�@<��^���@>xA��T�@@7�إ&@A;�V�;@BG�w8��@C\f;�H@DyO`R+�@E����@F�;^�@HGBY}	@I@�D4p�@J���`,@K��]� @M.��'@N�Z	�&@O�E��D@P���R�@Qq۽���@R3� �@R����#@S�x6ҽ@T����'@Ub�劍�@V9u���j@WJK�@W�[l�Q�@X֦����@Y�)6=ir@Z��>~        ?�!Su��?�2��_~0?��;f�?���Z�p�?�$�#ݬ@	���u�@�qA�mh@csH�N@@G�^��@�x�)��@#�M�AL@'�8P���@,n&ԇ�=@0��*ԥ�@3[Ji�h�@69"N�t�@9I,�HKp@<�,HE@?��Wz��@A����W�@C��	М@E��Y��@G�n[q-�@JLA�d�@L\�5I4@N����dx@P�/D���@Q��~��@S:2��!�@T�k��@V�|N�@Wx�����@X�m�ꝑ@Z�����@\�y�@]��g�%�@_b4���@`�Lh%@akۄ�G@bO��8�-@c9���_v@d(��a��@e�⒯C@f�ǣ{@g��@h�%}�3@i��)(@j+ B���@k< �*�@lQ�O�@mk�YM^�@n���}Z?@o��  ��@pj���G�@q �2q�J@q��^�tU@r3&{���@rϋ!��@sn��@t�+�~@t�6�0��@uU�E˕�@u��Uu�        ?vGUN-�?��q܋�?��9��&}?��wN�I?�a�̓��?�N�`�?�"�ö�?昙|��?�{\��1�?�D7?���/��?�����@ ��bP*@z�]�ve@��5@	�����@��� /:@���!`3@�6��@̩ �z@	Ә ��@c���	�@����J@l��@Q�@ ����"�@!�rN�ي@#g)�"�i@$���|^�@&x����@(/n��:@)��\��m@+z��j�t@-A��[p@/1J�@0|,��@1s����V@2r$E�L@3w5���^@4����1@5�;qb�@6�"�HC�@7͚�e�`@8󞮇�_@: *Ͻ�@;S;���@<�ͮ�j�@=����@?b���+@@0,
0��@@��z�%�@A��a���@B6���W�@B�ڧD�@C�K<@DYpږ̯@E�- h@E�R��Ĳ@F��µ%	@G]cs^nK@H%�d<��@H����@I�rJ3@J��g�WL        ?pn%��?�A��{#�?�K��t(M?��ߤדU?ʷ���?ՀK	�i=?�]w���?氷}yR?\���?� c :�V?�����?���]�N@������@�3��us@���{@f�x�@�>@��c� K@���;�@S�-��@��8j�]@!�s~2�Z@#�Eħ��@%���l%@(3��\@*�`ʫ<�@-	-|�@/�ԕ�@1+�a���@2�P�@4z ,v.@5�g�k�b@7-=FP��@8��ŭ`)@:�g�A�]@<J�bHZ�@>}Rv�@?��B��@@��D:� @A���H��@B���)�@D�t��@E�z�/|@F6�I��v@GY�;3O@H�ERqM�@I�m�sؿ@J�`�\`@L'�׬�@MlfC:U�@N�$&���@P\�@P�Ӝ*�@Qb+��8$@R�� ee@R̎7��@S��� @TDq�X@Un��p@U�Ɲ`G�@V�x$�4�@W\�l�@^@X*���I�        ?q�=�kW?�ng�P�?��Db�?�-C���?́\�,c�?ִsu9�9?��i��n�?�f�x`e?�,YH�?��x� ?���$��@ 0�C�)@�U����@��v��@@�o 	z\@M����@ڦ�]�m@�wx�y@�Qڡg@�Uo�@�Q��@!S�X?M@#6�2�~i@%3��U�@'JE�k�Y@)z��{�@+��x�v@.(�:�S@0R�j�x�@1� ǚ�@2��&�@4Y�:υ�@5�+�^@7F�];�!@8�I ���@:c�D�A@<?��@=�f6/&�@?h.���@@��(���@A}���@Bj!���@C\����@DT��r�@ER�>-B@FU�xOb�@G^M���@Hl7ԭO�@IueK@J��M��@K���s�y@Lؼ���H@N �ϗ׻@O.3�5��@P0O&S�@P�����@QjTWkE[@R �@R�e���@ST++a@�@S�k��V�@T�$���V@UTU���        ?���xN�?�؀�j�*?�Y?ym�?�_Σd�l?��5:7�?�Q�q�@��|7��@��.�@�R�M��@��K��a@2�Ԗd@!��{�k@%�\���@(�W�Y�@,��.2)5@0�5{,@2�r����@5?{>�1d@7�-n�V@:�gL�`�@=q^�z�@@;q�[d@A����@Cx� R�@E3HHu��@F��1��@H��Ed@J�l"��@L�@��� @N�h��r@P����(@Q�7i�A@R�I��VI@S�:dR 0@U-���@Vm��@W����Ti@Y;�B�G@Z^9�$]@[�<�P�@](���e@^��M;��@`
���A@`�ѻ�;@a�>�tw�@bZ̊Z��@c(we��x@c�;$��@d�)~�x@e���w�	@f�����@gi��<�@hO�#4@i9X��{@j&���@kw�P��@lʟ�^�@m�݉�F@n�;*� @o���8@p���E&@p��VQ� @q� ��         ?sǪlr�?�7�>��t?�;��3�?�c@�B�?��X��?շŠ�*�?�6b�� �?�F�m��?��A�y�?��RC��?���X��D?���%�?��E�/�@��|��@���Mv�@�_��F@g�I�@H�� @���@1�jU�@G1n=�S@���k��@�����@�q��@ .�� @!qJ��b @"ބ��@$Y�?���@%�-�
��@'z��̓�@)����@*�&�S@,�UD��@.ccU��@0 #�[Ԃ@1{�z]=@2��P��@3�C@4����S@5/RA�ɷ@6F�S$l@7d�~'Y�@8�߀�v@9�xY5�w@:�y��9@< ���V�@=`	�E��@>���@?���h@@���X\7@AOw�k�@A�c2�a�@B����@Ch�E~��@D"?����@D��,8�\@E���I@Fa�U@�>@G'����@G���@H�����@I�S($f	@J^�J>        ?p�I#�?��@4��t?� �4B�*?��Y`zdB?�H~�(�?���H�?�ZVm.��?��w�k?�@t=`}?�uM/�Y?�(���@ ?P��:@��-��A@�ш��K@oՖ���@���,@�@f\{�@Vi���@���v��@�9�\�@ L�D;�@"@|�@i(@$T�<�^@&�}�s�@(ޤ�?`@+T�����@-�h�V?5@0Q��*��@1�T���@3;��,$@4ɿWݯ�@6h���,�@8O����@9���qf@;�;�RJ�@=�~�C�@?��ci@@�ֽR3#@A�NJZe+@B�9�.r@C��N5@Eg�m>@FJ��6f�@G]�S�!@H�ƣ�@JWY6�@KP�j��@L�_�B&@N���@Ol>���b@Pmܓ��@Q)�8�c@Q�֌�w�@R��f7�@Svkd�TA@TB�~@��@U�Y@@U�HN�g�@V�#���@W�C��@X%�L��@YdH�Z�$@ZM8��        ?p�[d�p?��<�?�Z��4_?���W��?�R�E��g?���2�5'?�3gr֠�?��q�LV?�K�P��?��Q�
�6?�[��&�w?�z�B��@/�p�@���"@@o��@�����@w ����@1�ݾt@!���+C@GX�u@�r���@!�q�c>@"��!�m�@$��<���@'��l0@)P��0�]@+���6M^@.�@X$V@0M,�y@1����"�@2��sA	@4m�f�(@5�ZƢK@7r�v��g@9	�P�g�@:�&)䕺@<`4��8@>����@?���Fr@@�pӸ#@A�0��~@BцqU�@C�jcȌ�@D��S/Z@E紒���@F�u�n$@H�c��@I7����@J_D�У_@K��[Ŋ�@L���d=�@M�+��˺@O;��G�@PA��@P�k0�ie@Q�и�ɉ@R=>#�x�@R��,��@S�<]@TT��35�@U���X�@U�/�Q9�@V�e$���        ?�[\��9�?����?՜tq��?��g���?��Uת�I?�n�#Z�@�K�(�J@��mqj@��a��@��A=7@p����@!�ή��@%WF*Y�@)���H@-3&;ֺ�@0����"D@3%4�%�@5��l�S6@8M_���@;�l���@>��@@�T��+@B7j�@C�t?V@E��{1�@G�]*��@Iz�����@Kz���@M�+ϓ@O��R��@P�=��
9@RߊM��@SJ�F�@T��-@UĊ<?��@WD�[��@Xc4�+>!@Y�Q�h+@[&�<���@\��K6��@^eR�>�@_���@`�,1�|�@aV�hY�=@b%	� v@b��dK�a@cΙ}j�|@d��r>�@e���w��@fm�U|��@gVa�E%@hB��P:�@i3xWq��@j(��g]�@k!��u��@lK�#�f@m � �$@n&�#Ih�@o0�?�%@p\%�#�@p�ry}��@q3�/�r@q���s�        ?v+�\*C?��\M��?��C�2T?¸j�]�?��
M4?ث�� �d?����O?�1�;�?��"���?���*,�?��辍<?����l2�@��i��$@����@j�Rmc@��tD^@�x��Y@�"`�@@��k��@��W�V_@��0@��=6'@@L����@ ��-���@"��/P�@#����z@%*k�r�W@&��ֺwI@(��ga��@*Rz{��i@,)���]�@.��]�@0 '�1�@1�tY+@2��L��@3!��0p@4:����@5[����@6��(c�@7����@8��	���@:)i�T�@;oY��S@<���yB�@>F�p@?m;Q@@h@w{�@A��*D@A�{XpO�@B���9@CSM��Ѥ@D.|��@D޴��6@@E��َr�@Fx���ܝ@GK'O��t@H!C�S�w@H���w�@I�k~k��@J�s�sa�@K��S@L�a�0}@MrB)�m        ?s�
����?�^��K�^?��{�X?�1<u�!?�T�*�?�}���$k?�βˌ��?�J�N��?��gLXL?���q�?��f
M~�@�"(
��@�J��$�@
�ĊQl@Ľ��4�@��m���@ĩ�;��@̂�o6�@&���@����\�@!#2��x@#�畩�@%6����@'m�=�Tc@)�A �J�@,7+uA,�@.Ʉ�~#N@0�%���E@2$�J�@3��qR�@5!h�Z��@6�m�;�@8Z�L}*�@:���1@;����\}@=��[��@?�����@@���l�@A�x(�*�@B���צ\@C��
(A�@Dއ붬�@E�\�*�,@G\�A�@HG|k�@Ix���q@J��3���@K�*�!�@M6Y"��\@N�p���@O�egL��@P�%�Ce@QI��B��@Q�6���@R�|�?��@SpI�6d@T.a���:@T�s�.s@U�Z���@V|.����@WG7Gs�@Xn:p��@X�Ύ%��        ?j=,�Z��?�T�&�?���v�E?�<p�&?ǧ�7��;?�"ʁE�?ܱb�4?�V8h���?���L�?�z�J�?�">��?���2��?@��$u�.@O� r��@	U! z�@�J�Y�@Kp� E@��q*�<@����#;@�Fk��d@skaw@ F�=劭@"!_����@$t�8�@&,Y�U��@(]Fl���@*�m���@-F��@/�3����@1#�'ip@2�E�p!@3�����@5xN/כ�@76I�@8�f���@:U���Q9@<�1�M�@=�BS��@?�%\OR$@@�Ii�5@A�J%g�B@B�TK��@C��Ϣ@D�(���@Fn��)@G>��%�@Hk~ ��@I�Hp��@J��5��:@L!b�3#�@Mm����@N���
��@P�T��{@P��)��=@Qv�j&x�@R0Xn ��@R��z�~@S����6�@Tt�Yf۝@U>DHok@V|x��@Vܗɾ��@W��  A�        ?�ۜ+�t?�/����t?�u�G�¾?�/���K?� z>Z��@ L����i@gYR �?@��J'��@�a-ɔ@��i:@ k�?g�@#����=�@'�����@+�j�»@0@�tX*�@2��Vi@5J|��V@88s=c�@;P� �@>�j��@@���8��@Bj��1T@D8�WڦP@F�K�`@HR����@J#\�4@LF�k>��@N~����*@Pf���7@Q�S�@Rқ��t@Tx�2�@Uh���A@V�aW\]@X'�V!	:@Y���0@[����R@\��ڃ^�@^��mߤ@_��G ��@`���*��@a�T��y�@b[���[t@c;�.bk@d^t>�n@e��	@e������@f�~�%_�@g�FQ�@h��)@i�bnۙK@j�&�e�@k��'��u@m ߵ�@n����E@o/`��� @p&�!��@p��l�-@qL�.��@q�c��@r{�
&�@sp�@s��юP=        ?v9�ab�:?�$+*Y?�$��8��?�C��'E?�;�9T�6?�� 
f�?�=��t�?�r8�&G?���mk�?�jfB��a?� A ��?�q)c$@Q��B�@Wƿn�@��v2	�@8�]_h@���D�@k���D@�R�ҩ�@���7�1@�@:��@�B}@&f贤�@�7 Kذ@!S��-u@"��Z^^�@$NDy��@%��S@'���<�j@)0돹+�@*���"��@,�Y�,ƣ@.���M~�@0;,���@14��5z@24���&@3;�*��@4I��@5\n�@6w.X7+@7���L@8����?�@9����}@;eŤ��@<Y kvd�@=��P��@>�~�PPf@@#f�
@@� >9�g@Ai����@B��/�@B�,��(@C~��Y>�@D6!��M@D�.�x�$@E�"�;�@Flٟ�i�@G/L[x�@G�s
c+�@H�G�Z8(@I��_߮�@JS߇}XS@K#�����        ?oD[O7+?��J�Vq?��0���?�4� ��?�p!�&x?��(TG:6?�1�Cm6?������?��س%?�nD���?��ѡ<�?�ƅ4���@̛�ef�@��FAO<@
ҁo�[�@sk�|@@tv�s@�W�o{@�($e��@G�R@�W/��@!u�J@"�C�6�=@%	S���@'0�媥1@)v�9�@+���R@.Z9�?ʸ@0|�Z�;\@1ےU�QI@3I����4@4�糖��@6S�s��@7���$@9��=�E@;U�Q���@= F��@>��-�M@@q�tzw@An"�L@BrT:n�@C~M��@D�țp/@E��Y]|@F����~�@G�%���@I/!?�"s@Ji쬀��@K���
�9@L��Y�@NI&�X�.@O�&�Ioq@P�w$%z�@Q7=	 ��@Q��^Z@R�h�(s�@Sl��˒�@T1H�V-@T���@U���t@V���@WhN����@X?�V�Ka        ?r��+�ZK?���NE?�]��	C[?��h?z?�_2��I�?�?V
$5_?��5�`�7?�>�.���?� ]�N��?�(�{�C?� �R�@vf�B�@J~L��Z@	�����@F=x�d�@�;z��.@����k@���E76@�b��u@l�r�u@!���h@#:Nn6@%@M>�<@'�tB�h�@)��auF@,j�N�@/�wp^@0�R���@2]�`x��@3����%@5vg}5 @7�	4�@8��&��x@:� �#@<q	Am�@>ZWp�@@*e⧸@A/��T�W@B=��H�@CT�����@Dt-R�gL@E�8���I@F����A@H6�vaM@IH,�l�@J���Zj�@K�*�6�@MA�X+��@N����@P	����@P��U�R7@Q��5b@RG��U��@S�s�S@S�仜@@T�u�V{�@U�V�:D�@VZ�M���@W8ԗU@Xˎ�-�@X��:��@Y�8�H)�@Z�ڐd        ?���K,"?�u��E/?�[���?�E�Oi?�%���3?����b�@L���@]�%j�@�L:#j	@4]�ˮ�@0m�ܳ^@"������@&�׾�@*���2;@.�:�in@1�}��v@4#�p��@6�n��@9�$����@<q�6;@?�![���@Aa ӐP�@C�����@Dױ�/�0@F�.Z�l@H���^@J����@L�W��x@Nн-�:d@P�ؗɑP@Q��x�YG@R�MT��@T��J�@UL��>��@V����;�@W�����4@YA(y�8@Z��QS�@\s�h"�@]�m-Y��@^��oc��@`BY��C�@a��lL�@aӥ�.0@b�u('@cuS����@dL8�o1I@e'��z@f�"ޭ@f���P�@g�J 0=@h��1�|�@i����@j�����@k����F
@l�Zo�#�@m�����@n�MB��@o���{H7@pI͖�N@pυ��P�@qV�9��@q�(�_�B        ?tʔV�?�.��vQ?�p��B��?��Ak��?�	�S�{�?�&B�މ�?����x�?暧�\H�?�4���?�Ì�8E?�9h�QŅ?�+W9Q�%@ �|�u�d@����@���Q�@
b{�㯎@Dz��n@��pd{\@?v��@B\K�|@��J;P@��s}�@��vA�N@9�~ߗt@!K��
�@"t�y�L�@#����5@%�v� ��@'&�Ci�@(�
Y���@*���o�N@,\��~@.6��?f�@0G{��X@1
y*H��@2�}�|"@3F�7N@4&�j��@5>y��W3@6]- xoH@7���1�@8����&@9�}��{�@;Fvm�a@<`	���@=��Bj 
@>�r����@@'��]0@@�N�8�t@A��2/u@B>8&(�&@B�WD��,@C��fu�@Ds�.��@E7K�[͟@E�!�s�f@F�d*��@G���_ @Hg1��ڸ@I;����@J��D�!@J�,^��@K����i        ?t��&��?�Kf߫�?�2G���U?���0�([?���"S�E?�ƨ��&1?��k����?�̮�a?��2	�?�Z9D��&?��U� @)d�Iw@X0����@L <��@�b7�c@ecp�=@w�(ڱ�@�ɋ�5@`H@7@ ��$e@"��5��O@$����c�@'*j{��@)��B��@,4D(��#@.�����@0�5l��@2cT�BP)@3���v�C@5�����@7I��NU@9��Sx'@:�8W@<�ӊ�-8@>���11@@i�&:7
@Ax4.�@B����γ@C������@Dء���@F
S��
�@GDƱ�hR@H��ڄ�j@I�ߟ�k�@K(|K�@L��D��@M�K;��@OZV�%އ@Ph����@Q(�}�=@Q���[I@R�of���@S�;�$�M@TSP��&3@U(��V�a@VR��w!@V�?V֖-@W�t��L�@X��Ê�a@Y���Mi�@Z��\ܨ�@[v9F��[@\m�o��        ?p
��'}�?���c�N?����?�X1q�� ?�;�h�s?կ�gPx?�!HD�6?浠9jH�?����X ?�G�6�?�m��8U�?��#:7��@G����@'Rh&yL@n����@�
@"�@���Gl�@]����@V~`@��!��E@�kE�E�@!D:�N�3@#.mk�B�@%4a8,@'V$��|D@)���3�Y@+�>��K!@.b����@0y��#��@1Ђu��@35,�[�@4�i��@6'� �6=@7��%���@9Q�P��[@:�����@<�IP��@>x��<�+@@%տ��`@A1��C3@B^o.f�@CW_��_@DB���@E���@F-���@GF�P��$@Hfk�o�@I����*(@J��^��@K�)����@M'BG�@Ng�׍�@O�	��ny@P~T$k�@Q([˳�l@Q՗����@R�4\��@S9�' @S�X>5T@T�9d�/�@Ug9�"��@V'Un �t@V���        ?����t�?�]�?�E?�S�?�w8��0?��U���@ )�w7Q�@5_�Έ$@��S'׺@��o,@JG���@ G�v��@#��5M:@'��.җ�@+�zɽ�@0;���E@2��绾�@5 ����@7��X/�@:�`���@=�E�[9�@@��꒺@BN@�i�>@DG��ٱ@E��>��W@G�`7f�@JIH�@@L$U[̉%@N[rf�@PS����L@Q�J�Ul@@R�;s��@T�ZM@UT:`e��@V�4��n9@Xs�5?@Y����@Z��>D��@\|]��0�@^	F�J�@_�D9���@`����)�@av,S @bP��:E4@c0(ܟ,@d�՟@d���@e�>L�`�@f�p�v�;@g׈��̹@hԂ?���@i�Z�b� @j��L�@k��2B@l��B_�@n7b�r@o(A�4�@p#�e)Y@p�fە�@qI��e@q�RL�6�@rygo�wu@s�F�@s��H�Z?        ?o6���w3?�)��ǿX?�����R?�x�:�`�?�૘��?��\��!t?٧/VK\�?���S;?�-��H�?�C;f��?� ����;?��PN?�;����?�������@� ����@�E�|c@e���ٯ@
i�x�@��P>	0@{���@@�����@U4@�|Vt@���;@-~�'��@^u���@���h�f@ ���ɪ@!�*r<�b@"����'@$G�'��8@%��*��@'��8!@(m�U��@)���@+e�o� @,�W:�M@.�/mȎ@0��l�7@0������@1�I;Ƈ�@2��=^4�@3�l��H�@4q*���@5`����@6S���ɖ@7L���@8Ko9 .@9NI\��,@:V�-�ϱ@;c��D�@<vN��S/@=�Ɲ4@>�J�[@?��D��@@y2:�@A����@A�=�E}@BA��X�b@B�3��J@C~߉f%�@D �y�}�@DŌ��        ?l'��V �?��0��?�P��.18?���j�?�;��+��?Ә�l�7?�^�S¡%?�ϕJc�A?�?�i�1�?�s��&?��;c)��?��o7��#@�(��@�I����@	ߊ��@z@`%@��Dj.�@N��7R�@-�� U�@C�|�@��V	V@ ��m�@"e(ƧQ@$]Uݎ�@&q$���
@(��H���@*��fI�@-R�VAbF@/հ���@1:tq�@2�:�1�}@4/�i�@5z���@7x���@8��jY�x@:7�9qq@;�fb�a@=���@?n���F%@@�>Q�T@A��g�Z@B�A�P@C��t�/@D�t�#�x@E�|B���@F���6@G�"���@H��j�@J�Ho��@KE5CK��@Ly��I<@M�W	���@N��+���@Poʸ��@P���v�@Qm�͊�I@R��oX@Rʜ%��i@S}�p�Q@T3����@T����p�@U�7�w@@Vh}�WwE        ?pn�N��C?�܇��(?�7��P)�?����e-?ˍ��IW�?�"^e�ʴ?�~�wJ�?�B�q@�?�p��|Op?�e(P�?�$���gj@ CNF,ӽ@��\��@�g�C@K��c?�@�ZjHju@8e�@@��¶\@)pӖ=j@w*s���@�?��@!�T��?�@#܎�8q[@%��Q̑	@(.s:@*�`{�@,�����T@/�����@1�˩�@2`���a@3����=@5w�_�"�@7
9�$�@8��w��@:\����@<�oؓ�@=�wg���@?�L߄s�@@ڡc�j�@Aح��U@B�L>K��@C�|1R� @E <;�~�@F����@G@`��
@Hk��SN�@I��G�P�@J��Mk8@L�պ7�@Mc��eQ�@N�Gџe�@P�w�$@P��G�@Qhƕ�N)@R�z�@R������@S��6��T@TYPs5�@UP�r`�@U�� q��@V��K'@W�O�s��@XU?�FF        ?�6v֏E?���I~��?ѐ��`�?��<i�J?��0b�b?��~�@EZ�W�n@�0	Am@��U�k@�%g��@X��z0@�Tl�&@!����6�@$���{�@'��*᳼@+�eeP�@/Y��,�r@1��/?��@3�ޒ�I`@6�o��]@8l�g@!@:��>r�-@={���'s@@�;@A~�r:�@B�Ԛ��@Dw��Ŀ@F	Z�ٲ@G�z|�T�@IU���KV@K��lQ@L�`�j@N��k�v�@PI�sEh�@QB��� @RB�JC�,@SI#e:�@TVp�p�f@Uj���pD@V�V��@W���Š@X�-^���@Y�(�#��@[3�s�(&@\p%ԘD�@]�N!�@^����+@`&r��-3@`��x���@a�����@b2���f@b���">�@c�F�/e�@d\dHm�@e���@e�[�i�6@f���#4@gk��/;@h7h_܍L@it�3U&@iة_1+�@j�}f��@k�x�L�        ?x��0^?��d.��?�zD��[�?�j��/k?�{!}js�?�?�*]q(?� */?�kq�)ؔ?���iƯ�?�!��v?��N�f\?� ߌ4~@��T�@��b�@_g�mt5@�Dth@��K�)@��H��'@(䒿��@v���%@����@q餙�q@��sM@ u�x�@!��B��B@#q��.D@%%�>�t@&�8�L�@(`�u%�@*$�~��@+�qOZ�@-�E��\
@/�W�Mu@0�H��C�@1�n#~2�@2�W5�@4#_��G@54���+	@6Zu8�9@7���Di@8�!�F�R@9��
�R@;:�W�!�@<�LaWڡ@=��h�@?/�ty�/@@G�"!�T@@�d�#X1@A���Kש@BmC��@C+�ۚ?@C�G7Y��@D�����@E{;YM\
@FG]�� �@G�3Y
@G��FO�@H�\�l@I��o՞b@Jv��a�@KWB{�@L:�M�@M!�d�1�        ?tf����?����Kx�?�����cD?�g��O�?�*RX~�?ٕg���?��[=I�?�GC	'?���?�ֹ V��?��Z�c*d@ۇ۬��@���*@	��e�@�>@��@����֓@��Km��@��NO�@�1���@m"A�7�@!�v��@#?��@%�U��-@'Qqwr]6@)�8C�)a@,D��Ai@.����y@0�D����@2���@3��.�x@5"eA�2@6������@8<�Τ]@9�q�Ś@;���y@=��>!p�@?`�=���@@���7	@A�MB7)@B�,���m@C��ĨI�@Dҽ;�@E�kF��@G��#�@HB��f�@Iv�az@J��ƛ�@K�jt�xE@MAo!�@N�����x@O��<��k@P�����@Q\!6X�@RF�:�
@R��y��@S���(�@TR�7��@U�M�H@U�U;"!@V������@W�l5R��@XY� Ίj@Y3���        ?u���Q��?����t3�?�m��+��?�>�Q�?�ɓcJ9?ڝ^�W
/?�v�P�?�c�A��S?�[�<�X�?��`0�?������@�)?^�q@��@�bm��@~�9í@�5䈱�@�@�-^@�H��*@"����@¸�$~�@!����S@#�����@&*jE@(W�`�D�@*�US`l�@-P��6�@/��t�@1d͍	��@2�<q�VI@4a�GJ9@5��{6AE@7�����@9Wn؛�m@;>���@<�b���@>��6(Q@@lO��?�@Ap�:��b@B}��	]�@C�R���@D�<?N|�@E�>��nf@GVz9a@H6~
��r@Is�Q�c@J��ukɥ@L+��@M[J�*A@N�i7���@P��X@P�-u&+@Q�d?�@R=�x�`k@S 
����@S���(�@T�e��@U]��9@V/}1�-@W�(��@W�E!���@X�d����@Y�T��]�@Z���J�        ?�}-��J?ź�����?ܨ�-�G�?��|&G?�3'V���@���6nU@
kys>f@�@x^b�@T���@��PϞP@"5M��k@&����@*:_k��X@.����>�@1ۣ�E��@4��p��@7T��'�@:W�(�@=���P�@@s�'��@B9B�_�@D^��@ @F
HAL��@H�f��@J6'v=D@Lm�{@N�s�}�@P�EjE�M@Q͔1y�Q@S��@Ti,�p@U�Sõr@W0I$LA0@X��w���@Z"U7��-@[�G">r�@]>�v[{@^ܪC�qK@`B}^���@a���:@a�Iq��@b����4�@cƒ5�b�@d�YMT�@e�/�N�O@f�snN@g���q��@h���)�~@i��{f7:@j��7��@k�2���@l��8`m�@m� uYM@oI��6�@p�Ѓ@p�gE]�@qE�l��@q�bn}�@ryD����@s��2��@s���7
�@tX��l�L@t�Ʊ_�        ?u1R�l7�?���y��H?�E-$S�?�MZ�\'�?�~�^�zf?֫�$�KG?�9����w?�$�&	K?��M���?�Ag:Z�?�����]?�Y[��10@ K����@%y�R�e@:$��@@	�a �@��h�a@kg��$�@jU>'i@�8�Տ@��<��@����t@�'�U��@s�`�@ aC�;@!ů	-J�@#8y,A�@$��@&I�=��@'��ߊ�O@)���V��@+M:�o�@-��ÆU@.�V�W��@0h���͆@1a񋰪�@2b^�vO�@3iˣl�6@4x0���@5��D�C�@6��Yn��@7�ͣ(�l@8��L�ϒ@:'Q#(,@;^��ȩ�@<��v��@=�L��@?,㴼B@@?t����@@��?��@A�c�R�@BNK�,@C{���@C��f���@Dz�ҡ;@E:�U犍@E�̌f��@F�4v�@G��nV@HZ��C�@I*����0@I��-�b�@J���^S        ?tN�]�p?�}��t?�wi9�W?�$^½?��L�#�,?�?>z!�?�n��V�?��?&Y�?�}`Դ%?�����'?��eal�@��;���@�._�R@
5�PG�@�����@��ѷ2.@��q�R�@�R}a�@)�[��@��D'�-@!;M8�g@#<q��_�@%\v��o@'��Aal�@)��}�)@,wQ��>2@/Ig��@0�aʤ�.@2VjHc�@3�F�1�@5a�/v��@6��l�K�@8���v�@:j����E@<7�DCh@>.���f@@5��c@@�̔�I�@BZ9v�v@C�(�>�@D+S!`@EI���yR@Fp
�j{@G�D���8@H�a�?�9@J]��mq@KX3�1,@L��	@M�Ss�u@OX���-�@P^˭��@Q,��~@Q�jw��@R���5�"@SOrj�@T7����@T��+s�#@U�6H�a@V}i�+�V@WRf ��@X+'�u�y@Y���>@Y��o��c        ?s����>?� �N�o�?�Ihք)?��`v ?ϝ"���?��A?�3C�R�?��88�?�d&^uCL?����Ls�?�����*@�	|R�_@�k�@	��&�@�-�j��@���Ҕ@��02�@�hZ�e@�2G�@hmNؘL@!ǤW��@#~���t@%$�BN��@'\	�^%�@)�#󺒲@,&�+��@.���@0��O���@27��(�@3�j�>:�@5!c��@6�^X�c�@8]%+UV�@:v�O�@;�T6S�@@=���E4@?��'��@@��+X^@A��C�=@B��� @C�Z��@D���?$@F��P�@GDYoa}@Ht���J@I����D@J��u*�D@L4���'x@M�r&n�@N�&���_@P�k*�@P�Q�ٶ@Q����^@RB���j@S~��(@S�P7=�@T�i�O@UU���@V$�j��@V�k<�<�@W̨�x`@X��NV+�@Y��6���        ?�^����'?���ku?ڡ���&�?ꠙ�I??��1\ Ki@hhiN,�@�t���5@�j&��@ ��e�@����@!Y���p^@%	ъ��m@)q��@-~�-%�@1!t��+@3�z9�|�@6o4���'@9Z���~�@<sH��n%@?�i��x�@A�fR[��@Cf��:��@EM�)T��@GJֿ!��@I^�`9�z@K��*�T@Mɇ�[8@PB9�q@QF�g1'@R����6�@SՇf��{@U-q��!@V�aن��@W�O�R�@Yw4�-�J@Z�	9|�3@\�ư�K@^#d��@_��]pB@`��@�c@a����A�@bz�g=�?@cbe���@dOA��
@eAZ�p�c@f8���p�@g5)��N@h6մ.��@i=�*~,@jI����@kZ�X��d@lp�ۉ�X@m�,�l�3@n���D��@o��n�#@p~*��
@q�y�W@q�d�y@rL�bW�@r��%[�"@s�x�j�@t1}�p�@t��y��        ?mi9��?�n�,$�?�#�D�?���d}%?�M�.��i?�`�u�?�"�?.
�?�8ξ_�?�Y�BvD?�����}?��}��|B?��l�ű?��Qqi�+?��0����@Ɂ�Y�@t[FD@M`��y@
S)�T.�@�׷�@r�p?B�@7�F��@�}t��@�Њ�@�YT@!�����@O�"[z?@�� q_�@ sƈ0@!�d'�o�@"杬��@$.U`��@%n�x�@&��dIqQ@(=\۾՝@)���r\@+�lBO�@,�2ޣ��@.%��R�@/��y2v�@0�x��B@1xaLM��@2M���Q@3'Hh;��@4=�e&!@4�P�o(@5�_��@6���Թ@7�61 �@8�`���@9�����@:��R��@;��[��@<�?�\�@=��2Q�:@>�����@?�y24>_@@gK%]!�@@��#C��@A����5�@Baց/w@B�1�@C;����@C��H(l�        ?l�b�o/r?�oS&��?��	��?��̀���?ȸ98�{�?��QN�?�յ�G�U?��&7�?�Kΰp�?���e\A?��-P�.w?��Q��@7b�Je�@�ZbF��@
ck��.@�5��[@�*A+�@d
��@CS����@X�[C�@�$�~o@ �EL���@"pp�Q@$h�J4S�@&|�6��@(�4��X@*���V �@-b�X�b@/�,���@1C���Z\@2�[ͅ��@4�te�@5���9�@7�"�m@8�p�B�t@:NW]���@<=�,'�@=���\�@?��Ӵ�@@���_��@A� 
��@B�	8�@C��@<:@D����qs@E�ND��@F܉lz�@G�r��Z@I�~�J�@JJ$��)@K{� =<�@L��c�@M�~���@O7�Ì�'@PA�%��@P�nvKd@Q����@RE�݊	@R��*�@S�aj3)@Te�8�w�@U!Gq�	@U�Ȍz[�@V�M*ޓR        ?m+�S�?���JOy?��b�Rv?�U�M�\R?�r�ۖ;<?ԃU����?ި  z>^?婮A��?�U0�Z�?�3&��Ѥ?�uX/��?�w*�{��@����5@g'ZDK�@
�@Um_@.���@#ק~F@���1@��0��B@��y�@<�D���@ �&fzq@"��"�#@$������@&��~3%@)(U7|ܽ@+~�5��@-���~@0@����@1�QY��_@2�0U��@4l)J�N0@5�7��X�@7zTù��@9z+o��@:���:k�@<x��6�@>>Ռ���@@	j��"@@�^�;�@A�@��ש@B���@C�Ň��@E_�r#�@F��B9�@G1.�sp@HRXp��/@IzQs�m�@J��g��@Kޓء��@M����@N]����@O�B��@P{�`5�H@Q'-�\@QչK�2@R��y�8@S<��	�.@S��!�@T���4S@Uom���@V1]v�@V�wg"��        ?����_�;?�������?л:�j��?� ��v0?��{�~��?�)�9-�y@ ����d�@��'��|@?UO5��@Ev�|��@��Y��@n�t[n@!c���@$zq�6.@'���A@+d�%<�@/6Srx�Z@1���wj�@3��%�dB@6���@8n1+ͯ�@:콵�y�@=���@@��h�@A��<��@C�s�@D�!xG@F�Hq�2@G����!@Id�g�0[@K�R@L�7JYun@N�ߴ�K@PJ���E@Q@��i��@R<o�'�@S>B�J�K@TFg<@u@US���cj@Vg�2��R@W�q�@X�DM�@YƟ�,m>@Z�0�I�@\#G����@]ZW�%c_@^�2o��@_���2�a@`�+=HG@a8,���@a�Hs�\@b����{O@c>��`�@c�D�$�@d�r�?��@e^�<R��@f�.`+z@f�~����@g�!�k&�@h[�S�֕@i!�����@i��C��O@j��k��        ?{����|?���% һ?���v4F�?�ڤe��?ҋ��T�L?�e�u�d ?�A|�1�?�rck	�?���"X�?��r�N�?��g�d�@ ���$�@#WO@��]s��@W��C.`@bҶN@ٖ���@%*4=1@���gvN@$��ybZ@�7��k(@��+/�m@ ��L���@"_�rZu@#��'Ȕ@%�C^l�@'j	�0D�@)9Oô�@+���g@-��  @/	#�Iw�@0��P��@1�ښv�d@2��T��@3��"N@4�� �P5@6,MKijW@7c��S�@8�q�Q��@9�ٓ�O�@;6�Cnt�@<�׎��5@=�6��3�@?K�e�\@@[R�]!@A����@A�
�ì�@B��@�,@CR�X> �@D>���@D�Ze@E�X�	��@F����@GT��c@H+ڬʌ�@I2/�x@I㾰��|@J�y�l�@K�]���t@L�c��O@My���@Nf�C�@OW�O�        ?ss9���g?�]�᎙X?��³5�?�Xm�h<?Ώ�t=&	?�>��6S�?�����6?��ك��$?���'�5+?��V�o?���̺��@h�Ǯu@���Jj�@�q4,�@;i��#A@�|,@��,D�@�U�
�Q@�8�_u@�.��'@ :N�\?@"9�@$�b�@& iG�c�@(N�'#b�@*�tF�=@,���\�8@/~ n�L�@1�;a@2hu�S�8@3т���@5H��$�@6�\Gk@8]o
'/@9� ���.@;��B�B@=a,��@?'adl�@@}LѾH@Am`�/E@Bcቚ�9@C`�R'W�@Dd;�=1@Em�J���@F}U4�B8@G�V��ٶ@H���L�B@I����&;@J�/��u@L(��{�Q@M]��59@N�gR�1�@O״�0��@P���>@Q4��1�@Q���i��@R��ڑ�&@S8_@W	�@S����$a@T�Du�8�@UUtLA@Vr���r@V�;�;6        ?vo׫3m�?�E�%��?��R⦶�?��b�$9?Ф��\�?�E�S��?�L]�7v?��AS �?��%.S_?�T�K�<?�z�B6O�@;��n �@'��6�@
���x�0@T"-r��@L8s��@)�6�X�@CH���G@��i��%@-����o@!�[��@#�KH�?i@%�//�r@'��ʼ�
@*_K���P@,��F�@/���'�@1+5��� @2�S��F;@4#�� a3@5�"�%@7\�$<6@9˲���@:��FX@<�fo���@>����w@@D	��@AG-�&�@BR~�65@Cf Oo�@D��X��@@E����=@F����@Hs����@ICH�Yl�@J�m��q)@K�����Q@M+��͡(@N��k�aH@O��Qc@P�F��d@Qj��1�@R*=@4��@R��PeB�@S��n��5@T���>�<@UQ�@��@V%�郂9@V�ƨ�֗@W�fUqr@X�M	1T�@Y��zWv#@Z��2=�        ?��NbQ	>?�E2�X�?ޟf��ǯ?�p�y#A?��W �ܚ@�ձ���@Xk~u@�X�@��K@��@GwW��@#JbM-�V@'S�(Ue�@+���x�@0F��JP&@2�P:�@5���$L�@8���T�,@;��!@?�j���@AP�l�1x@C+@�g��@E�E��@G%�Z�@IE�ͳl@K{y'D�@M���k�@P�_�I@QR��,�(@R��n�@S�Q�Ƽ9@UL�4Z�@V���7�@X)�߅_�@Y��*�@[29���h@\�i�B2@^e3IR�@`?gm_@`���7U@a�x����@b�/���@c��Zщ@dyF=�ٌ@ek6x�
@fbk(n؃@g]�B<��@h^0U룒@ib��U>@jlW�Jb/@kz=v|.�@l��&�u�@m�y�2uQ@n�����@o�S�@p��8%�@q9��L@q�s��@rCɕ�2@r�7b�q�@sz�\�P@tJ^g!�@t��*r��@u\�~+�        ?s''���h?���%��?����RI1?���?˳��e?�t���?��3��4)?��y�*?뱸�.	<?�8��r?��J�C�?���4}Z?���}+�@�qf(��@�{���@��\B�@��mx2�@h�4�w@�'&@6*V-�@m�+��h@��S�r\@5qm,��@�X��@ 9Hd�	@!��IN{t@#Wc�V@$��{�@&%�&VT�@'��)_�@)r�k"c�@+.��z�`@,�����3@.�5# �@0[ӫS��@1V
2��@2W4z�x@3_J�E�@4nG1�Lo@5�&S���@6��E'>@7āh`�@8��%�	(@: F�
�@;Xk �Y�@<�a��!�@=�)��<H@?)��4A@@>��o��@@�tŠ�@A�0��~@BP3�P@Cl��z@C�$�gH@D�@�f@EA�!�I@F��G��@F��H;u{@G�hV��5@HiR�Rs@I;���5@J ~c�@J��K�'        ?r?>���h?�8�:"7?�%�n�4K?���E|�?��-��?�I�$/�?��j��?��O�?���1��?� *�?���0��@W_���@$e��O�@	`_۶�@�)B�@��9�0f@a���0�@g�	�y,@���5�)@(Fk�"@ �/~���@"�-����@%[�E��@'F�j �@)��6�6@,���3@.��nZ��@0�n�F��@2&�l�!@3����v@52��2�@6Д;z&@8~��l%�@:=|:NVs@<`����@=뙔��d@?�+�2�@@�SD��@A��^"@C�M�@D��JD@E?q��`�@Fhr����@G��	�	�@H���^�@J�h�Tr@K^����@L��b�h�@NKd�X@Om�Zi@Pl 1��6@Q%�o;�y@Q� ���@R�Ģj�1@Sj~/�ď@T4L���@U,�<�p@U�?�+)@V�+�@W�-yX��@XbG�ڄ`@YDl���@Z*�X��        ?n�xk'�?�K:�Z�?�a���?�����}�?ɨN� }?ԤUl�Ԓ?�Ίx2��?�n�I�?�m?R��G?�@N�Z P?���Nj�?����a{[@�R���@p*��dC@
��C�&7@8��@�(�'�@Ց�b"�@��[$��@�x���@G?)���@ �?:X�@"�	�+)c@$����2@&���n�@)8�|��%@+�x����@.}�p��@0Pf]�E�@1��5`l@3Ϯ+�-@4���.��@6>
L�@7��m��@9E�Ӯ<�@:��f���@<���@1@>����@@3����.@A*s^��x@B(���G@C.TeD��@D;r$���@EPaM�
@Fl�5}@G�����@H����1[@I�.�{�@K'
�l�@Lh�>��@M��.{	�@O�K��@P-�3�@P��U�]�@Q�B�-�@RG��j�s@S|^h]@S�3�;�@T����v�@UIԊ�&@V�DT;7@V�]A� �@W���a��        ?��1<Q�?�	q����?՚��q�P?��6�0�?���@B�?��Or0�@�z�8�@��샏�@��#@��v@�SZ�5f@!���Aq6@%i�� �o@)3�h�`@-M�����@0ۚ���@37��k�y@5���Gb�@8g ���@;9����@>3N�k@@���Ө@BM��D�R@DQ�"H�@E�mt2�@G���xX�@I� ��k@K�_��|@M���R��@O�#67�@Q�Q<�@R8�fI�@Si|=��W@T����N�@U��h���@W3'��r@X�e�p�{@Y�lNF@[M�-3�@\�t@~��@^6!C�b�@_��~_�@`���b�S@aj`�L�j@b86'��@c
eUB�@c���Y��@d��0��@e��e�X@f~�lkV@gfq��r@hR�����@iCG5�1�@j87.�*3@k1��@l/�x�@m1�M��@n7X�u�@oA�s�I@p(o�~�@p��V$@q=շ5�]@q����r        ?zߐh\C?�A���])?���K~�?�x���?�?�'O�?��<�w>:?�����;�?��W���?�����8?�e�6:?���v��@ �g0���@�u㗕�@n�j�R�@1d�	��@;��C3!@��q��@�D���@����@���:@Ї����@��\2@ �c��^b@"f�W��@$	h��wi@%��͸V@'�Q�M�@)[�����@+E[�-f@-?�0�@/L'
�a/@0��'@1�c�hM@2샮{G�@4=e� �@5F��1�@6�ZDH�@7¬ZE�0@9v?%.p@:`�?�@;�X2�@= g�R\@>���h]@@ ։�.h@@�m�'@A�05��/@BIO4�@C,7C��@C�_ᝯ@D��	C��@E�"-�_�@Fi��L��@GIE$��@H,��m�@I��x��@J e�2�@J�#6�&@K��]�#�@Lۊf���@M�'I&#@N֭,ޭ�@O��K��@Pp�%�7�        ?u�^�K?���& V�?��Us;
:?ú��%�?�klrv�?۲)ȹ��?�v��	 �?�D}z4:?�@&�A`0?�	����4?������@� �Đ@� }��@�	�<��@�����@�8��8B@�����t@_�QZ@ᥨ�w@ ���ȁ@#M�I �@%E���o�@'�_����@*p:ъ�@,���I}@/A�6��@12vO�@2�����@4KFB��@5�D��@7���_�@9r��t��@;MZI.�^@=9$��B�@?6&�U�@@�)���@A��J�@B���\�@C겍�.@E�08�L@FE���:�@G�0A��@H�$��S<@J6�}�@K`V��d�@L��H"B�@N�~g�@O�-�b@P�Y�� @Q>��<a�@R<	��
@R����,o@S��Vu��@TaG��c�@U4�+�i@V �Թ@V�����t@W���y%�@X��F5f�@Y���&8@Zz���@[i�ɠ�@\\*�F��        ?tmo����?�>�(��?�S�C�& ?��.S^?ϻ��Յ�?�7�ߝ��?�Ԙ{?�����?�x��9?�²w�?�����0 @�7bZ:�@�z���(@
���"�@��60?@��T�@�Fʮ�@����@9�+O@{@�d�aT@!G�!2ֿ@#K�n�;@%oއ@'�W�̘�@*���@,���G�Q@/<�e�@1 |Q6�@2s�r{�@3���N@5�����@7-�V���@8␒ �P@:�&��@<~���բ@>e����@@.��3@A3]be�+@B@K���@CU��_�@Ds�u�h�@E��l���@FȲ�y֚@G��**�	@I?���@J���@Kذ-<*I@M1�F�g@N���{�N@O��)S^@P���Ǧ@Qu���G]@R7t��t@R�|���@S���yJF@T�S����@Ui%��V@V@=�𥳐@W�
�n�@W�N����@X�Kե�
@YǚNb��@Z�<Q�Z6        ?��a�س.?ƻPAu�0?�&u���?�'��'c�?��%��n@����@:��qS@/�n�@���us@ȸs5��@#�r�0�8@'Նc�e8@,kp?bP�@0��"��@3h�^K�@6PRNC.@9l2%��@<�#'[k@@ cm�@A����$@C����@F��Ԓ@H+��?X�@Jo.�:)@Ļ5��@OC섩�i@P�y�nk�@R?�cǠI@S�Z�H>@U w߈�@V��zB�3@X$T�(@Y�8t�G�@[K��1@\�*����@^��]Pk�@`>P�t@a'�ҁ@b�î�@c9�-d�@d
�})�@e38��@f��Ck@g$���9@h9�:��@iT����@jva]�@k�K ��@lʖ��?@m��2OF@o7;���@p;D��C9@p�����n@q�{�=-q@r,��:@r��i@s��v�_|@t70]�^n@t�^��G@u�k�g�@v\Pԛc�@w�@��@wؗnX�        ?n����?���gҵ?�T\�`$%?����0�'?�b�zYRb?�h$`f?�"j�!��?�0�#��%?�LC��?��*V[v?��l�yq%?��65�?��� I5?�H�`�}R@��w'U�@4ń<�8@ �H��@	�,u�@�	/�@7��~�@��=?�C@�.j�Z�@��l���@�2��`@��汴~@�gn�)�@"�e��@ 9H�1�@!j��*cN@"�|�@#�C���@%9�/�O�@&�1.ƪ�@'��E�|@)^�4�@*ҏ���	@,O��F`@-��iE@/d�ٮ͔@0~~rO!@1N�E���@2#߱� @2�0{|Z�@3���V�D@4����2�@5�tw�`@6�C�g�/@7}ig�%>@8p��%�u@9h���@:d���@;e����@<i�W��,@=rU�X��@>?��r@?�I��@@R��1�|@@�N�෧@Am뼫�@A��\m̩@B�#�� @C%�ۋ�A@C�AaF��        ?n*J��?�C���"?�(F�W�?���Y���?��4�%��?��2�5n�?�WC/<�?�/,kW?�b|�#�?�E=�?�)GJQ�+?�a�N@4����@ ���@y���8@첇^@��5:�@�I�}�@��a#��@�h �@b�8:�@!�l�;��@#�:=B��@%��Y�,@'�শZ�@*3��Z�@,�ǈ.W�@/;g���@0���&]@2_"� C�@3�7g���@5^�0�@6�UQ�Z@8��戮Z@:T�C�y]@<k�P@=�B�7{@?���.�@@��d�j@A�x�{@B���@D
��5<�@E&m>�e@FJPw��@GvZbL5@H���T�@I���o&�@K+�O<@Lxbb�@M�nI���@O*�3,�)@PH"@P��c�5@Q��&g�H@Rys�h@S<G�/��@T�y��@T��*'��@U�p��@Vq�qj�@WI�o2=@X%5!Ϻ@Y� 2�        ?m�^B�n?�S���W�?�@e�^�?�� M.�?��֠?�媔G�)?�;c�+��?��#���?��a��?��sM�?�𘜀,?�����@�Mk7�@�b���U@"���S@�@&��a@y?7F�W@?p���@=O{�|�@s_��ʼ@��0s�@!D�{�p@#5k�7��@%B�Q�B�@'mũ&@)�L	_�@,��om�@.�<��j�@0��i�c�@1��:�9@3g-�Q�@4��@@6l|2�@8)H�@9����*�@;b�B��@='w�6�^@>����i@@n�,!�@AgE�G��@Bg<i��&@Cn��ZR@D}]�I�>@E��=Mf@F��_�4@G���D@It(%��@J691;�x@KqcM�rN@L��9
�@M��U~d@OO6��$@PS�r*}{@Q�Ҧ��@Q���G�1@RoH�~4@S*.�wƁ@S��Q�n�@T�Wr�Vi@Uql���@V;,F�B@W��G��@W٨�ap�        ?��͵ k?���a��?������?�WmmeV?�	r4u�?�_� :�@ ��2@)q15@_V��@R�g�c�@�m>5��@��t@!`�Z@$r:�U3@'3�t@+Qvh�p@/l�k@1����j�@3��1-��@5�T�+@8W3�,��@:��#k@=n�@@�$��V@A|�~eT@B��L�z@D{��_�@F`܃��@G�}eq�@IaA=�8S@K�:��@@L��5d@N��5)y�@PR�}@;�@QK��VY@RJ�v�R@SPi$�<q@T\=w��@UnOfL��@V���gU�@W�	��zS@Xɤ*��@Y�_�dE@[%7��.�@\\&�/��@]�'�e�E@^�6��Z@`�/*�d@`�5TSj!@ad�n�SA@bN�tQ@b��`e�M@cvPR���@d,�yպ=@d�9�q@e�^���@fa��Zך@g#�|��@g�m�'F@h�"� X�@iz����V@jG�һ�@kb�zR        ?s�G�T�y?�&3�'�?�)%�00?�V(�B�?�p�+?լCHӃ�?�%��4?�98��*�?�ɽ�n>?�5��?����*��?�u1vS�?����yz@��F}A�@���Fh@�Z}�S	@#�焵�@�9%�@ϴ��A�@�]���@���W�@6�x��@�G��"@�<ܾw@�3bc�@!Te�^�@"v39��8@#ᝌ�  @%Y}g���@&ݾ5r�o@(nL��@*���Y@+� 0I'@-h��ׂ�@/)�:>@0{is�y@1g�I�A�@2Y�2c��@3R���@4O䦵 �@5S�N�c@6\��~/@7l ��q@8���%!E@9�1��@:�y�@;�o��!@=FZl�@>;~�W�@?q*�p@@U� �z�@@��l�>�@A��Π�u@B=�A�z�@B�z�F�@C���|Xi@D<xK'@D���@E�[�ա@FQv�d�R@G�U��@G�羅�@@H|6[�>        ?n�Xr�?�[�~ń�?����v��?�SZ��D?�C���N?�B���?�)��N�?�@^G ,�?�j�L�z?���۳5:?��(��1?��$fV@,���`@ƃ~�	�@	�q�F@@��п�@����@(�ѿ�@��	K!5@a�r��@=���6@ WwR�y@"*��M�@$�;`��@&"��h�@(GYc���@*�xh��@,�����@/Y���@0�4fa>B@2M9�he�@3�;�@5$����p@6�>ɂXj@83��'��@9��(̏�@;z1�5�@=2_8�N5@>��G-R�@@fQ����@AWb����@BOw(V�J@CN��*W@DT���w`@Ea���{�@Fv5���`@G�����4@H��P�@IݮiU@Ko��Y6@LFX�!a@M�nq&��@N˳�ټ�@P�X1�~@P��uj0z@Qd�
m@Rx�>)�@Rˮ5���@S���	b@TA �5��@U V���@U��c�Zh@V�P橷�        ?rF&�G!�?��
���?�	��:1J?�Ѽy?���h�?���톽?���-�"?�-Z{g,?�ܤ8��W?��ϔ��?��X�V@U�B�9@ �:�B@	Z��	:@� �3�@� "V=9@W��S�r@Y���k]@�c�c�@�Qd@ ��U"�%@"ژ�̜�@$���@''��Fc�@)|[��X@+���s@.��,�Lt@0�\`�*@2����@3{8���@5,ӽ��@6���1@8B?9��)@9�e�4x�@;�N6�@=���'4�@?}h�(M�@@�͸��@A���4�@Bǥ��0@C�c��I@D����@F~`O%`@GA�)�:n@Htu;�Y@I�&�b��@J�f k�@L9�8�G�@M���!U@N��h5@P#;K!�@P�։tgr@Q�]�ԑ�@RLϞ�m�@S+��Å@S�q%��@T���p`@Ue���t@V5�1�`@W	�d.W,@W�S1&C�@X��/[�@Y��[x�        ?�����lI?�^4��?՝#��H;?�ջc�d�?�,@f2?����ʩ;@��j��H@c	le�@�l5P�0@�i`F@8���ر@!�!�P�@%"訒�b@(�/�*@,�xH��@0���(�J@2��6�
@5R�$�/$@7�D��r�@:�dx @�@=���,�@@Cq�RN�@A�Ŝ���@C{�=���@E1��^�@F�f���@H��5�@J�L+�r@L�pb�A"@N�2���@Pm�(��-@Q�����q@R�|eQi@S�41o�@T���Q�@V+~K
b@Wi^䲩G@X���n�@Y��%{��@[Q�&��,@\�魾�[@^�S�h@_�Y��@`y�C���@a7�p�qT@a� JF��@b�dJP@c�ԛ�(@dS-���@e#���@e�����@f͑�%$�@g���5%@h���r@igq8u�9@jLG�ϥ@k4����@l  �ul@m��C�@n]q��@n����@o����y�@pu���7        ?w��J�?�}��sG:?����_�?�0���� ?�g*�jN?�A�m�?��}���?蘎�^�	?�OШg�?�Z8��?�&
�W��?�s��A��@!/<a~:@Hy���@�Q����@UM�?�@/��@.��!~i@_���@�fUh�@by3S@��-V��@S�o��@ �Z��9�@"���@#�G�(0@%��cz@&�s��e�@(d �9>@*!Z��@+��J�9@-�F��p�@/�BA�r@0�,���@1�9z���@2�:-&�@3�"�b>�@5�萗@6!~�9�&@7E� ��@8p��jO@9���Fz@:�9�~,#@<Lu���@=_�:t�@>��?i@?��C�K@@���)�@A[��f=@B�&-+�@Bģ��~@C}�s��@D:1}�@D�c`#@E��W�o@F�/k��e@GI����@H�)�@H�`�d��@I����;�@J��(-$'@K_�Y{8�@L9��� T        ?r>٠*@?���H?�[O��H?���U��F?�ǁg��V?���E�?�Y��G?��2���(?���ο?��6���M?���?��@=�[kd�@	���?~@	E�A8�@��c��@�).�Ĩ@YS�|��@b��%b@�
���*@-�΍t@ ��O�@"��%�W@%���M@'W�v �@)��ş��@,7����@.��.�\J@0�<�
�@2<�S�}�@3��;g��@5Nɹ�	@6�[���R@8�Z���@:d�oT�\@<7�)0��@>+��2@@�W�֞@A	�j�N�@BTݪ�!@C'"�-w�@DB:}��:@Ee�)�n�@F�S<���@G�Y�ʇ@I�"v��@JFh�_��@K�x6	��@L��t��@NF�\��@O��ч?�@P��m��@QIP��@R	|8De@R���
&@S�I���R@Ta��)�@U2|�U�E@Vy:��@V� @W�?%"D@X���(@Y���i@Zp}G�-�        ?qw�K��?��O���h?�v6�iN?���(�?�>��ɣ�?։����M?೉A]�?�p�m/?�,�f��?�v�O_?��ƅw@ *��N@�v^�k@�|����@���	ES@[=a�6�@�Y�pZ@�Q���@��"��K@���n@f��+@!��]Oj@#vU�IZ�@%���o�@'��` 7*@)��I�$@,J�љo�@.�j-A!�@0��5&�@2Vnx@3n�����@4�9@6fѥ��@7�ؕ�\�@9��ߥ'�@;C��?�8@<�z~�@>�3D%�@@N�<.q@AA5��ʱ@B:v�+�A@C:��xK�@DA����@EPL.\K@FeFa�\@G�w��v�@H������@I��b��@K ,���a@L8|��E�@Mw�_G��@N�H0"��@P����,@P�-�DYC@Q^���V@Rd,���@R�S+;��@S|�5m�2@T8߸��x@T��#�]i@U���GvQ@V�{Ȭ�@WLع�hY        ?��̑�Ț?�=Ԅ��?�mǪ�֫?虱h�Q?�K����@ 9"�L\@D���a@�%źh~@���rW�@Bt��=@ = \�@#��'�s	@'s:}��@+�>lz��@/�~B?}v@2[�D�]�@4�FRvB�@7��?%v@:o�M	@=q��;@@M����@A�� "��@C��a�
�@E�ζ�c+@Gg`	�ͩ@I^#� �@Kg��z�@M��x�@O����@P��&�E�@R%A���@SX^3��@T��*�@U���h�J@W(-]�s@X/��q�@Y����$�@[Gb���@\�q�]�b@^2�WO�@_�+����@`�[#��x@ahϿ�A�@b6k�ꋥ@c&�b|,@c��(���@d�ٮ��I@e���C0`@fw���z<@g]n���@hG%�BI@i4�$�p@j& D�(�@kRB5t@lE�%�@m�iJ�@nSR]~�@o]SSoZ@p��V@p�(�Ӭ�@q��`��@q���G5@r/�Q��         ?|fQ�)b�?��y]��S?��m�>�?��Z�<��?ҡУ7�?ܑojo?�g�l"Q?�~tKm�?��蹾�?��B#�j�?�Dd!@_q,s�@e�_� @��v��*@к�N�@�U�3	2@1��e@�|���@�JX@�r!	�N@{qx�y�@h�sd
@!<�?���@"׫��z�@$�LE��@&B����@(Oj�@)�v��@+�O��@-���5�@0@�"@1��?p�@22}Of�@3W���c@4�D�ʸ�@5�u�D�@6�&��@8AO�tұ@9�����_@:���m1�@<Iy껈�@=�c�K�@?#���J@@N��"F@A�K��_@A�ٻ�w@B����@Cl+���h@D=�I��@E�ya��@E� yHQ�@F�:��d�@G��(B%)@H��v"@I�/Y.p@JnX.ݙj@Kae�0]@LW5#@MR�Pp�@NQ��cI@OT���:@P-�{pj@P��Є�        ?q�(�n�$?�ƀ�pr�?�M���?�}�➏�?�� G�bD?�`	���?���k�y�?�^����?�z,�P?��Vd椗?� 2`7q�@ ;�m�U�@��4G:@ȕ��	]@-����-@n��b�@ʝ�e@����c@(!A@K�_&�@ʶ�_6:@!��u�^}@#�q����@%��}�I@(��OW�@*P�o.�@,��ZH�@/DǗ��@0�D���@2T�"�A�@3�p���~@5@C��1@6�,�4 7@8dJ7� @:
����@;����e@=�O��V@?R�����@@�>n%��@A��*�8�@B�i�se{@C��l���@D�M���@E��؀@F��gC%@G���̋�@H�ئ_2d@J*%�6�@KZ�oQ��@L��}�S�@M�6���\@O���T@P.WQ��I@P�\�lK@Q�u�Ja�@R/�Ten@R�ˁ���@S���$�C@TL-_�@UUn��l@U�p�
c@V�zg��<@WFm�[{        ?}lUTd?����P,�?��#)�h?�y��B�L?�]g��w?�Ы)�b_?����?��㹳�?��]��a=?��Պwȑ@��*J@���7�/@�H�4i�@�U�^@�B�;�J@��3K�q@oq���"@Bt��D@!/^���@#bsjb��@%���!��@(8��N@*���N@-�O�'@0JX���6@1�#�}�@3s,o�@5$<[J�@6袬gn�@8�R��@:�R=�z�@<���O)G@>�]f�U\@@p8�ݖ�@A�s��OG@B�_�{Y@C���l��@EIP�7�@F^B�Fk@G��F-�@I18`�O@Ja4!��@Kʨ���@M=�K,�.@N�|ޡ��@P \��g@P�;�/�X@Q��_��V@R�+���1@S\4KF�@T6��Z@UN�I�@U�T��Fd@V���'�S@W�9����@X�
�>@Y�g���"@Z�H�+&�@[���W��@\�|1w��@]��!�z�@^�i??9@_�r�S�Y        ?��ُ�w?Ȋ>Г�?�(��U�?���B�	?�co���@��+X�@
��ի�@g�Ut��@��W�ɳ@ �ZT�8@$�d3%�@)[�d @.@% jK@1��@!p@4�M�_)@7��s�V�@;=��	�@>�T��@A8k�U@C6��)� @EQ��:h@G�eT���@I�!�/�@LI���5Z@N�/��c@P�*� P@R���@S����m@U�$�{�@V��J�W@X*n�C>@Y�q	�{�@[����@]A�~��@_��@@`t���r�@ah��
�@bb�q*��@cc���p�@dk��ԙu@ey�F�@f�(��b�@g�9�0D@h�Ñ�b@i����@k!,8��@lU�[��N@m�0j��@nҹ��M@pJ�gկ@p�]iӛ�@q^��yY�@r�8��|@r�X,^@so��,@t&���,�@t�1(��@u��@v\���d�@w~�e"+@w�G*|*@x�-r�@yy��IE�        ?v�q�2?��_Pe��?�����[,?´��Jp?��?�%?ؚ�i��?�a�X�/?��q�a�?�.�9��?�ؒj��?�Vyx&~�?�n�:o�*@�n �w�@���*��@��`@Az���%@��[��@r�^ƅ2@�A)R��@��kK@ F�FW8@f|�S@��SV�&@�E֊�
@!)�9�a@"�uQ�Ə@#��5'p@%|�pw1�@'�螁�@(�w?�(@*Sm��v<@,
b��Ĩ@-�O:@/�04
V�@0���fe@1���nI@2����/@3�$zS|I@4��X��r@5�BT	��@6��D`	�@7�&��L|@9���o@:G��d*1@;v�`g@<����?@=�~H���@?*�m0I9@@9���V+@@��[Q(@A�}�*��@B9����@B����@C���#��@DT�R�e�@E����9@E˯�V�@F�ɶ~�@GN�t�/�@H��EX@H�jTG@I��Xv@Jy�&P�        ?rDv���\?�sSw�V[?�U�#D?�w�+�?�]Mٻ�$?�<���!}?���}-�?�7���i?���&�ad?� |W�1?��v]@n�\���@@�&�@	��^Qu=@7��s@�`{�O@�;��@�-��	�@���EW�@[TgF��@!���^@#w��͖@%2��{A2@'s~9�ތ@)�UЫ�0@,UH$���@.�yx;��@0���u$@2M���X@3�e}0�@5`��]�@7;�o q@8��؟_@:w�����@<K�%�k�@>0�ퟅ@@�ۣ�@A|���@B �j�Io@C4vG1QE@DP�>4�(@Eu��ƴ@F����2@G׏��@It��#l@J[��o:8@K���d(�@M���q�@Na�O{�@O����@P�4��<@QY��|�@R|��/"@R�sE�M�@S��5���@Tv=���@UG�	�=@V_�aҮ@V�X=���@W�~���@X�����@Y�M0M�@Z��JG�        ?sPN��Ǵ?�Ma�?��(]C�h?�Zl|w��?ξ���`�?�R�\[?� x��`?�h�s\?���#r?�9��o�?�*�U��@v�ؼ�@C���(@	~xN�@@)U,:��@�0���@k I�@mƐ���@��$�`�@%���2@ �'�u��@"�(��/�@%!?��@'95�o�@)��*�b@,��5A@.��FH@j@0�ē��@2����@3�ڧ��@5���@6�w�]�.@8`F�m�@:�U=�@;� �P*b@=��_��@?���x`�@@Ӈz @A�
$�@B��$(,@C�XL�@E��*�@F?�&1�@Gm=�2�#@H��e�ܮ@I�Q\�[�@K%�+#4@Ls�0�@M�&j[�@O%�c�,@PDꀫr@P�'N3@Q�=v�g	@Rs('ċ�@S4�T�*�@S�b�E��@Tæ�) ,@U����+�@Va\�ٺ\@W5��@X��Kp@X鈆��^@Y��SN�$        ?���cS@?���:��?�q�qP?�<�a?�뛤�@ ߥ�S��@)A�Q��@iL��0O@m���@�  @ �/y�M@$Bt�}0�@(D���@,G�3d/@0c�0tu�@2�U��@5]����L@8�ڗ_�@:���5��@=�+:沵@@���_�@B@�婆�@C�čj�j@E͓c�=@G�#��[�@I�l�TT]@K�f��*f@M�"��k@O�=�h�d@Q~w��|@RC�9֚@Su�Fg@T�Zg�#_@U���K�@WC��<��@X������@Y��� ��@[c�Q[�)@\�>![�@^Qt{5�@_��1Zy@`��K~�@a|��W��@bLǌ9ˀ@c!.�"@c��2�Be@d�j��@e��L��@f���&�y@g����~@hx����f@ik�2��@jc�H�!�@k`+��'^@l`�	�p@me�&�@noZ�}�0@o}���@pG��F�1@p��G��@q`��N.@q�y�)��@r����WB        ?q�[��_?��6V���?�/�L\�?��Y���?Ɂ�)og@?��'`��?܉���t?ポ5��?��2��?�O�lS�?�>=�7�?��ل���?�hBn�)#@Q�Ĵ�@%�o��W@0�L/ E@
r{}m�S@�=L珠@���s:@��+��@ɵ,�u�@�@hzw�@1�7A�@��0��@ ��H@ G�%���@!���\9�@"�tc;��@$i�%\<�@%� j;E@'j�㕁2@(��#�b�@*�{h.�"@,IC�wF*@.4�#��@/�2$�<@0ʎ��B�@1�l�4�@2�#�Mx@3�����@4��u�.�@5����ʕ@6�:��FZ@7�?c�[�@8ٿ?��s@9��$�'@;%�3�@<:�8���@=e��)��@>�:�k@?˴�l�@@�NI֭@A#bڌ�@A�`��@Bk[4��@C8���@C��2�0@Dj�Q��@E�OZ@E��H��@F��Ò"�@G7h
��p@G��1-�        ?m$���?�nVZB�&?��J
�?�v8���(?ȱ�(�?��хj9�?��-�i2r?�)���?칡��z?������?�_y��?�
N��@q@fK�|S�@.Iv��@
_��M3�@���@�����@�^�	@�@� �&�@���9 @H�/p>s@ �Ӛr�@"� �m�@$�˦t�@'��8B@)]�n��@+�~�D�@.Cڙd�@0r&G�8@1�v,L�Y@3?� ��@4��ΐ��@6JX���w@7�h�:q�@9��;S8@;LYpZ�@=C��@>�|�A:@@l80D�@Ag��� �@Bk�*���@Cv���@�@D��Δ�@E�
���@F�v(�@G��^!@I �Ț�C@JY� ��@K���� @L�� 1|h@N1 �!��@O���B�	@Pr����@Q%���(Q@Q�)��i�@R�N���@ST.SY}@T�t;7g@Tڧ1�o�@U�\�yK�@Vo�d[�@W?���]@Xd֌�        ?r���q?�p��e�?��BH��0?���(��)?�u��6�`?ׂ�'�$?�l_o0��?�tf���?�u�Ό�5?�p�Y~M�?�1ث"�"@ �UC���@�#[ɍ�@����X�@-\Y�z�@���@�@�f��@@����>@Ϗ�Ĩ�@+��� @ a$c@"IC��x@$N�\���@&qC�,G@(�>�E�y@+�$��@-�N[龓@0�9�P@1kf��@2���^�@4L�T��9@5�m ĥ@7h�#��S@9��y�@:�	��M*@<���b@>O�<��@@
�] �@A|R��r@B:�[@CG-��h@D�D��k@E0IU}2@FK?LK @Gm��*�h@H��L�@I��_�ȋ@K �s@L?^�=s�@M����Ŭ@NӬ�Y��@PGCIp�@P�E2s2�@Qs� tQ!@R(��g)@R�[@ '#@S�[�f�a@T\�%�@U�-���@U���Q/@V�����}@W|��J�J@XML�V��        ?���?���$ߤ?�v�<K#?㶦>h�?��ގ~:?�L�l�J@�{<��@	�~�3�@��vX�@�/	�2�@� ��'@ JHy��@#t���W�@&��/'q@*���tp@.����K�@1u��,u�@3���#@6'� i�"@8���}V�@;d���`Q@>6ɩ��@@�[5�1@B &����@C���
�0@EgƏ��4@G$`(�lX@H�Y΍<g@JΖ�(_�@L�����/@N�c&�@PcY���O@Qq�\�J�@R�9ar9:@S�J�m��@T��t_@U�H���@W.3��@Xj3�[�@Y��V�T�@Z�cB��@\J@�4c@]�0�IR<@_ �P��@`4�f�pS@`���8�@a�b�v�@bc��65�@c$��r�i@c�-ꗖ�@d��L�@e{�8�\@fJOH�o>@g�5]U~@g�贵��@h�w	��@i���8�A@j�/�5�@ke��m^@lJ�ctn@m2"�'9�@n]e# @o��!�c        ?w�b�Դ�?�
�����?���L�4w?ª`G�m?�����o?؅֓�q?ᐨ����?��-����?�:X�g�?���Ăl?�za�T�?��=��yf@��C�x@ǜ%oZ@ �k��@��yDM�@�A���@�%<�{�@ ˑԒ�@K�C��G@����!>@@�D��@�\X�@ YXB �@!�LB��@#P�R��%@$�S�Ռ@&��&�\b@(9Lj�@)���@+̜mh	�@-��?m	I@/�h=�g@0�M����@1�$7[��@2�_��~@3��*���@5�,(M:@6CN�J�@7qb1��a@8�#e�@9�"<�g8@;(�a@<t��F��@=�D�@?#"�8 �@@B�!�e�@@�{G��@A���@Bl	�DT�@C+�\g�j@C�%P���@D�!�@E��.�F�@FN�P�/ @G ��J��@G��J��%@Hη���@I��Q�@J���n�@Kn��P@LT��!O@M>����        ?o�Dr?�ޞ����?���{��:?�U5{�A�?�G��E�w?�(�3ђ?ߛ1�T'?�UW�]�7?�?)Q��?��ޡ`?�<�����?�rJǕ?@:	�<	�@#km�9@wfy�w@�d��@�4��~f@�Gp��>@���J�@�L�׷@DL,K<@!|0�|�@#s,�%$@%����?@'�:�z��@*i�=�@,u!�z�@.�m*��@0ө����@26k�Wi@3���'��@5(SQ��t@6�n���U@8UE���,@:�W�hO@;���D�@=���ol8@?_G�z@@��@A���~*^@B�p���@C�w��m�@D���;��@E���/,@F�n��CA@H�C#*�@I@���O@JtTi���@K�+�H@L�䛆�@N9�7�d�@O��3j�@Pp;��A@Q.��@Qѣ��3=@R���Ĩ@SA>�;@S�6���@T��͐��@U��)o@VJ-I��@WD�EaJ@W��6�T        ?s�ɴN��?�fw�� ?��Vq�:_?�u��
��?���zr?؍AG�ܖ?�%vfV�?�g��d^�?�>{Mu�?�.��A�1?��w�g�@e? ��Q@(��Р@	V����@��EV�@}V��@8�'8Y�@,�I�b]@X�L�h4@����~@ ����V@"���~G@$�<lf�@&Ƿ1x��@)
3b@+i��m3@-�qF��!@0@%�Pބ@1�����@3����@4~����@6�+��@7���u�&@9@�D��@:�=3|@<����Ph@>�mW١�@@1b�Տ@A'��ۓ@B%K��Z&@C)���y�@D5ӿ�7k@EH�ϝ��@Fb��
��@G����"@H�.@I�4�;��@KX�K�[@LNq<>�@M�v��:p@N�b���@P���?J@P����@Qs�9��@R&��G��@R�;�-��@S��ڔ@TTC&Dϕ@U���υ@Uؔ�ytY@V���g @Wj	���@X7�>Y�
        ?���+� Q?�@\M��s?�B��P?�_1)���?����*�@ Y�@{��":@[�*��@��8d6@_M^n�@ B�\�@#�S�U��@'NF��(@+gM�YJ@/՟���@2La����@4�7T�]�@7�&�,n�@:nIz7@=w��ˆ[@@Uu�۔�@B� �X~@C��!aM@E��O�"@G�����@I��3Qܻ@K�I&� @M�3K��@Pʗ\��@Q.37N�@Ra����@S��MJ��@T�u���@V9���H@W��- Qe@X�����@Zk��/@[��\��@]i���@^���>@`G��f�@a@����@a���dX�@b�
���@c�%˚��@d��6@es�0�O�@faj��h@gS-B1m�@hI� s+@iE|�u@jE�=p�-@kJ|��@lS��>�@mbM@nt�Uk@o�Bm/�@pS�i��@p���G@qvx.��y@rпC�@r�����k@s;(���        ?{���y�J?���?�[��9=?�]NFQ%N?����I�?�0���ou?���HG��?�IlF�=�?�s��Q�?�Y��m�>?��o�*Ѣ@t�?��@ɀ/�0^@h�����@S�@C�?4a�@�8�.�@��͝�@q)8@e�,ٷ@�f��@�]O� c@!�t�KR]@#$1��@$��@�%@&�?�"j�@(s����@*]ɻ��@,Z�@JZ@.h���=�@0D�U�m@1^a@2��ۖ�@3��;�I�@4���+�@6Ծ���@7f�ɳ��@8����x@:9ĥ��@;rgpdO@<ݍٯ}@>Q�'F�f@?Λ�4�@@�7��@Aq�QaD�@B=0|�Ka@C/]��Q@C�w��K@D��pX��@E��I)��@Fw��ɬ"@G\��	@HE���C@I2�W�:@J$=ɺ�@KF%��@Lj����@M���9@N��/�@Oh��"�@Pm.u�@P�j�j߉@Q��0��        ?sOF�7fK?��N���t?�5<��)�?��SYZP?Ͻ?���?�A�,� y?�5�!�;?�$ݺ��?�`��C?�אv���?��	��W<@�x�(�@�[/�g�@
(�Ði�@�S+'5@B��Π@�u�*��@�zf��@V3H0 @�ǆ'�@!X��n=�@#^4���;@%��`%0@'��@**���@,�k�݅f@/Q�"���@1
���9~@2|b멼�@3�.��;�@5�$���@71�XȂ�@8��#�,@:����T@<w�'R%@>Y�r��@@%�	��$@A&�~͗�@B/b��[s@C?赺^�@DX73*��@ExB!�@F���m<&@G�Y��Em@IL;�@JD�q�G@K��R4�@L�(�a�Z@N,��İ@O�&^��%@PvS���K@Q+�Bԁ�@Q�ќ��@R�_%[@Sa�����@T%YKϑ@T����@U�w��#K@V��]!`�@WW�t[L@X,���&�@Yf_�Q@Y�s�QG�        ?z����/?�4�dq~?��3����?Ƅ|�ƌ?Ө���X�?��<ݔV?�!}=?�pi�f��?���M�tO?�J���G@����@��;N�@	tt�[?�@`�S���@��]
i�@�^?��@`�Q��@��S���@=�'u�@!��|`�@#�N^��@%�"��B@(bj̢z�@*�m�]�x@-�n��1�@00V����@1���楞@32�"�n9@4��D�;@6}J`u�@8=�Φ"�@:D���@;�4:�@=�)$�I@?�Z�:@A	[�P!@B �>�_8@CA��S��@Dk�@W�@E�x��@F�z۴�0@H"�����@Ir�ʢE�@J�3w9ϔ@L/���&@M�b\!�"@O7("��@PHFrg`�@Q���J@Q���z�@R��c6@Sv��O�
@TM�O� @U*0Ū��@V)��~e@V��:$�@W�_��k@Xʙ���@Y��#�3�@Z�J��QA@[��\ C@\��o��U@]��>��O        ?��c�S$�?ȩx�Gu�?�]�8��?�`��&��?���B@g�m��@�k蹑@ķx�@�J��[@!*Kԙ��@%6<�ny�@)���R@.�+��I@1��d���@4�\u�"�@7�I$j_�@;O[�fL@>�l�`k@AM,BOK@CH��E/f@E`�b�y@G�g�KV�@I��D��@LH���[�@N�9���@P����*O@R{�<�;@S}],V@T�{K�z@Vz����@X�e��@Y��q�+�@[]��4@]�KCa�@^�.\A��@`\w�`{�@aN��,�@bGW+T�@cF�4�i@dL�X�@�@eY�ݺ@fl�9��Z@g��X��@h�bbӓ@i�[���J@j���D�@l/��d�@mi�vSsF@n�Zx3d�@o��A@p��a<�@qH�I���@q�	Ԛ@r���Ç@sW��A�@t�,P8@t��͒�@u�e�\�@v>�$j@v�־9E3@w��f@x���&��@yT����        ?p��RϷ�?����s!D?��DᇶX?�v)I�נ?�Hnd?&o?�d�7�\e?�h�x�d�?�登a�?�fg�T��?��y�py�?���w1�?�R�K8�.?�A$�ݔ@Оk�t@�|��8�@�!V'�@5�q���@ȏ}��L@Ja[�@L�m��@jC���@�m���W@�R�y@lZ#��]@��َ�=@ �s�o;}@"3�����@#�~�V�@% ��-�@&����V,@(DR*@)��pSR@+�ђ-�@-]2jRD@/*��@0��k� @1wWus.@2q����@3s���{}@4{�`� @5��/^h7@6�(nJ3�@7�Oa��@8�	ɭz@:O ZԸ@;8Nb��@<n_ά�#@=�!~b��@>�Z^��@@/S�6@@����@Ao^iw��@B޶x$�@Bϒ��M�@C�w�.[c@D<�П�@D�ƭM��@E�,^���@Fw�<E @G<k�l��@HAQ0��@H�8wL(d@I�N���s        ?rؠL��?����F?�L��z?��V��]?ϣ����?�4���7?�h�k��?�zX�� ?���?��|�y��?��Y�HP@�A�0�W@���}�@
%� <n;@�f�yl[@؃0g@�0&�@?@�ߒ�@Ut���5@�ye+�@!X���]c@#^f)�Y?@%�LgX�J@'ǭ�o@*+�հ�m@,�v~B^�@/S���
@1\����@2}2-��@3�g���@5��H@73)��K�@8�`έ�@:���,�@<z:�a��@>\�
�@@'�l�@@A)pްe�@B3#�C�@CD�p���@D^���@E��B�m�@F����#@G�+G�0?@Ik0w�@JY��|<@K���Q@L�CVZr@NP���CP@O���e�~@P�n$߆@QGw�6�@Rv�\�z@R�g����@S�H[K�@TSZ�|e@U����@U�h΄�@V��~�iQ@W�J�ō@Xy�̩)c@YY��_A@Z=�>'��        ?j��	��?����P�?�<T�U�?��ëb'?�[T��>�?Ӿ�7�z?ݩtA8:�?���?�R~�?�ҁ~�Ʉ?����3�?�"�y(f@p.tM�~@>�~s2�@
x.f�@�3��Z@R�ݨ@��y�@׏�47�@�*��@|���w@!�*��@#���iU@%�Ӡ@'Gmp5��@)� S��v@,[m��@.�A��@0�����@1�C>&�5@3s
��a@4�Y�s/n@6�8��uz@8+����e@9���:��@;�v��Ka@=p�d���@?Q���`�@@�?֐ z@A�j� 2&@B�i��I�@C�<0���@D��j�7�@E�TVU�8@G�P?Y@HF�p�i@I}p�E�@J�Y���@LR�%y@MPZ�D�@N��>�@P��L\m@P�L�0�H@Qj�Ȱ$�@R$���@R��
ɧ@S��sD��@Tj`�(��@U3�c?��@V��@V�-�~ޑ@W��	��@X��D�        ?��(g�?���C��?����l?�g����g?�p���?���pB��@�8PV�@kBbru@�`+�u-@˟�k�@�RKܶ@!��@�"�@%~���|@)U�!R��@-~�s�@0��_Xd�@3cj�v��@5��r"�@8��V��@;��~�@>�N���@@�}?�@B��ZH@DQ����_@F' 0ڂ@HM��@J��e@L:L�@NA !h�@P<9=l��@Qa�:;��@R�}�EH�@S����W@Uı$@VV��Ll�@W�Ξ�D�@Y
o��� @Zr�p�0�@[�=#�@]_g���@^�l��@`9�s�@aԦ��1@a�B��~@b�Xy�<�@c��,"�@dbd+q@eEP&&��@f,�tU|@g��y�@h	�~a�@h�����@i�`,�!@j��qX@@k�HX��@m pp���@nq��@o
�i�f@p9A-}B@p��ٷ4�@q3-JH�g@q��E2@rV����        ?rb�FAKw?�ٚ��i�?��h�$�?�J���.?ʳ&�5T?ԥ?���?ݲ�{�1@?�C [r��?��6�I?������?��w��?�bޑ�w�?�L����@�qf�@�HO��@Ҳ��T�@%!P�@�<�0X@6�@�R@2�=N�@H*�n�$@yQ��mR@�`(�	~@,; �=@��P�u6@ �����@" 9���@#h��R@$�G���@&`��i��@'�2,�@)�o�0��@+7'�Y�8@,�δ�,�@.�YpJx@0@�2x @1/p|��@2$]�TM�@3���O�@4!����@5(�"�b@66˳��@7J�XHH@8e��M
@9�W3Q�@:���H�@;��2f@=
ZI�n@>B�&n�@?��L.@@b�D�V�@A�bm|�@A���y8�@BZ���sr@C\T�9`@C�=o��@Dl��ӰS@E#1Qu�@E܈f�@@F��`L@GW��,�@H�#ɾJ@H��0�        ?r�^�P��?����va?����ٚ�?�^�:QNi?������?�ܦ����?��Bj��?���m.?�AA��d?���.2$?�R�Hţm@?d�I��@J��ಾ@
��Bt�@�Mӕ��@���V}�@�VX�Zn@�E�59@e���1@ n��C�@"�rf�O@$@���&g@&�"�
@(��Ne�@+���rhN@.:�H��@0����A@2���R�@3��{���@58�x���@6�y(�"@8�sh)+�@:��{@<y��O&@>x"{ҟ#@@D��M��@AV?~�*p@Bq@c_(�@C��s,��@D�+��@E������@G:��@H�|��g�@I�&�<f�@K2�/�]@L�7��y@N�؝��@O})�'LW@P~�^��@QC�Ľ@Ro����@Rۂ�+��@S��		�@T�B��!@U`�{�]@VA
��6�@W%��)u1@X��O�
@X�@E�I�@Y�4 ָ@Z�y#O@[�XI_�@\ށL=��        ?o��8?�.D� ?�NRVP�?�t�[S�?�5,Ey'?������?��tI�m?����J�?�ha���?�&|��@�?�G�/~M�?��0�=@SW�C�@���/D�@	���Zs�@V�!i:�@���#"�@�+1��@ޠ'�S@��t"x<@��j�5@ &�1��@!��u���@#���F@%�8��@'�pYߌ@)����@,6��G��@.���|z@0�cL]O@1��qON�@39y3��@4x�36`�@5��u�@7Zхxw�@8���-�@:ms��\H@<�A���@=�7���1@?cyD{'@@�E�A� @Av�^���@Ba�/�F@CR�\D�@DI����a@EFCa�@FH-�u�@GO�;F�T@H]��@Io�J��@J��U�)�@K�OH���@L���@M��b��@O7?��\@P'�	�U@P�`V�>g@Qa��=�@R�t�j@R�� �@SJo���@S�)�n�?@T�6qw�_        ?����!�?���[v�F?�y3�I?�
�eo?�X#X�o?���"�A�@�/:�@X�)�~@��6Nl�@��G<@EE�'x�@!�<�qO@%6t,{@(�߁��@-��y�@0��n7@3��9 �@5|�k��'@88�C�@:㢸��g@=��[�>@@q��U�@B�.{��@C�b��\@E|��>0@GPM7���@I6��,�@K/".Z�@M:�U0@OWR�@P�dO���@Q�6	���@Sb(��@TA�?Z�@U|�c�$�@V��`���@X��2�@Yfk^�@Z���}��@\.O��]"@]�_)K��@_ #:@`M���kx@a.Ү@a��Y�$@b��Je�z@c}Qw�N@dSvvRVZ@e.��#@f؍H�c@f�̥-�R@g���Ķ@h�)���@i���~4I@j�
I�
@k���%� @l�M�W��@m�꧷y@n��5V@o���L��@pW�{-^!@pߒ=��@qio!�t        ?rH
��R?��-R�*�?���r��?�g]H�+?�M?��?��5 ��?�#@+m?�Njb�?��[#�;d?�#	͸Y^?�;�r�i8?��*'�
W?����#�@rB��@/�/�"@+2��w]@��MMF@�ܤ�@u:�#]@w)pj;@��U+�g@�wm�*D@!�;��@����ڿ@��}��@ �f�dq@"B��0�@#��B��@%+�
p��@&�pa���@(J��2�,@)�R@P�@+��X���@-\���T@/'{�}#@0����@1r$��/�@2k�	�2@3jL>j�N@4o����@5{��I@6�Aj%Q�@7����H@8Ÿ�O��@9��!L�@;)��=@<G�.{��@=o3�n,@>�Y�Cu@@ ��	��@@��ζl@AN�l��@A�Iv+�@B����/@CX�<��@D_隁@D�ն˶w@EW��S�@F<捼�s@F���h��@G�-���?@H��ed@�@IQ���҄        ?q<g��@?� ���?���Ӿ�?�*����?�ا)�F?� �G�f�?�5&ea�c?�;�DS�?�[�91�k?�[�i~�V?�%��Ĺ/@ ߺJe{~@�ԉ`�@���d��@L��It�@'�n�r@���^@�}�*�@rFc�^@l,��@ ���C�@"w�F_@$���C��@&�ֽLΆ@(�>�ϠF@+e��o@-�F9C|@0Ia�]�@1�܋f�@3��W�@4�)��H@60��`@7�r�i�j@9�`f��@;?���)@=�C�Q@>�YAS�Q@@m�W���@Alo����@Br�rl+@C��|�i@D���MȚ@E��I���@Fٷ��h�@H��ީ#@I:��ު@Jv����@K�XQ��@@MQĘ��@NWl,@O��7���@P�v p��@Q=�D���@Q�͚�MV@R�y޼	@Sp��*�M@T3Ã�G@T�Z`���@Uč���	@V�Zn9��@Wc����A@X8����@Y.vЈ�        ?l���gyJ?��ς�(�?��@��?�?�R?Um�u?�|R��s�?Ԕ�O�H�?��(�:i?��+(!RS?�*)�?�b%8���?���V"?����wK�@�}|_��@��}�	@
���&�|@��"ym�@`�6��@&#�ɓ@#��7�@ZK9B-�@�q��k�@!:g���6@#,���5�@%=D��x @'k��Gk>@)����@,"�g�-}@.��vO�B@0���B�N@2�%���@3� �u��@5kgs�D@6��Ѱ`@8;�v}+�@9�p��%W@;�`�U�S@=�`T&�@?g|���a@@�`U]��@A�!G�@B��b�p@C��ƽB�@D����DY@F8$_�@G1��i�@Hd��@I��m�@J�E�@� @L,3�@M~Ђ���@N٤���@P=7��[@PӤ��5@Q�\em@RJZ�@S�fe&�@S�� �Q�@T���0��@Uf�>��G@V7�<��@WA���@W�;ӒN@X���tfI        ?�qEv���?��A�L��?��%����?�(�c�F?�,'|KV?�+Q`},�@K�Ѵte@�m��@23;%�@#�l]E@������@!m�|�{�@$�bg��w@(�Z���s@,}u�ډ)@0c����@2��o�U@5 �r>�P@7����ϵ@:v�7���@=Zo�=v�@@2$����@A��7�s�@Ct�">�L@E2�94@G1��^@H��#��W@J�H�ˋ�@L� ��_@N�l����@P�����@Q�����@Rܫ<Lׄ@T[�TV-@UIO'�@V��6�N�@W�]a6�@Y.�Ŏ�@Z��P�d@[�+۪<�@]c�|Y@^�cn��F@`.�<��.@`���Q@a���]8@b��uu@c[�~R�}@d1�L��@e�����@e�HAE�@f̈�wS�@g�@џ�@h�'�X�A@i�;��'Z@j�zN��@kw�դn@lsud?��@ms2́�0@nwNd=�@o3o��@pE��F�@p�����@qXMMk\        ?lu����#?����?���2��?�VX$�M?���
��?�3N�]jk?�喇�?�,��oN?��i&ƍ?��A�$�J?��6��`?���� �p?���o�?�����@�/��`@���]�J@j���԰@
|d�w/�@�S���@�����@e��4�$@Lb���m@I����@^>T��|@�NqJ�@��TE-�@"��V�@ Ȋ9�	�@"
�.R��@#W�Hp�5@$����ּ@&~|��@'C�b*n@(��{|��@*yT�@,�E��@-�/�z�"@/<�&n5@0sԲ��
@1N )�~�@2-K#��@3F��^�@3�5f��@4�x�T�]@5ٓ�ԁd@6�H��)@7ˉL�h@8�F���T@9�q~�@�@:��g�&�@;���?$C@<�ބ��@>tN��@?$z4���@@ �!@@��Ka*�@ADr�\�@A�-խ�]@Bo�����@C�B��@C�]�U@D?��/�`@D�
L���        ?la~8$�?�7��M�?��x/<��?�_ր��g?ȩ2����?����{�?��d!L�?�*B��?�?��-"?���+G=V?��g�t?�����)@T'Ψ�]@"���@
3�r>?@�{~D�@�|&�	@�0R՞�@h!Ec@��8D�@�2O�i@ ��t}�@"�r��@$�3�
tl@&�<���@(Ó��O�@+9HJ�;@-t+V��@/�bH�@1H�rc�(@2��"�Z7@4ǿ��@5����@7	k"�n~@8�G�>�@::����@;�?��L�@=�Ko<E@?h�2#�@@����ޑ@A����h�@B�Nq��@C��!�E�@D�mV��3@E���)�@F��+��@G���%OD@H���:f�@J����p@K2���H@Le>�}�@M�����O@NޚLB(t@P��*�@P���@Qb�c|@R� �@R��K	�@Ss|��B@T*D:l�@T�����@U��3`�Z@V`�?@fj        ?l�<�(�?��>�+�?���IX�?��$�'Y?ɺ ���y?�̿r�z�?�*�{��?�:�m��?��I�ٵ?��JO?�!�� �?�=��0�@u��i�@�t�+<@V_C_ �@
��_$@�K�5�@o��r�@w��U��@�����@4U
׈@!uI�H#e@#n	���@%��eɖ�@'�CF���@*���@,}R�K@/�'�@0ݮ�SuH@2D4�mF�@3� �d/R@5?{ X�q@6�JR{ @8x��E@:,Uz.@;���P@=�Q�#�j@?���џ/@@��Ǹ@A˶����@B����@C���@D��[��@FJ��G�@GBp���@HqB��@I��a�T@J��5��@L+��S#�@Mx�K}@N�����@P췹@P���L@Q|���@R6=���@R�b�4Ǩ@S�8i���@Tx�8?��@U@�䯗@V��5��@V��"�@W��@X���x7n        ?��G`?�b�s9��?���"!?�o\+�?�.�U ^?�RL%[@ .D밑�@7)+���@C���ٵ@�j?B��@1cP[ɲ@8�Fw��@ �u����@#�[E�.�@'!�2Y�@*�%��M�@.\B��a@1*��@3E�H��@5Zg�x@7־M�2�@:K�im��@<ު�.!j@?���(��@A-�?ju@B�Z��)@D&o��آ@E�ך[�@GWۤ�\@I��\�@J�[~�M�@L���H�@Nb ��e@P#Y�z�@QhL���@RE��@S"`�~\@T/&� �@UBY��z�@V[�(@W{�F;�@X��7@_�@Y��m:@[ dI�U@\8Ķ�U�@]w �i�@^�e|͂r@`�����@`���F,�@aU~F��F@b����@b�v�! @cf��E�@d\�H?�@d�կM��@e��P�	@fM���?@g{�@g���I�@h�zr�F�@i^�L��@j)5^U@j�2^3}R