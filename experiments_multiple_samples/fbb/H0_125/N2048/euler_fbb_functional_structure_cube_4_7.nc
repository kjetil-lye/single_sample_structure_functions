CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T115235        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?TҔ Fc?�a8-b?��N����?��E���?�^>����?��J�0	?ԤS�m �?ܶ���4?�*ua5?�PuǊ|?��G����?���ޥ|�?��y��_�?�J��=�.@ '16�@��U�nw@�R��<I@��6��@�Y���@���@����s@�{���@����Xd@F?c�vP@��'xi�@S�u@ ��s,�@!x��B�@"��*&_@$��uԸ@&?A���o@'��:�8�@)җY+��@+�m(��@-�hA}?�@/̾n�m#@0�΄��!@2f���@3DPtB�@4y����*@5��Fh�@7}����@8\]`e��@9����e�@;,�Ok��@<�@��E�@>,T�@?��b�@@�WGٵ4@A���>��@B`���@CB���M�@D+�ב'b@E���m�@F��$q@G�@H���9�@I#��)@J93��@KVJ���@L{��Q�@M�bz��@N߅HEM�        ?7צ	� !?j�"����?��I-ta?��@��?����i?��=�v
?͍ou`<�?�	 ��/?���=?�{+�7?���!ƍ�?��#��ׂ@zᲐz@	v��je7@����46@o.N!i]@!%A�1�@ �Н�@$�Uq�V�@)W}����@.|���p�@2'��T@5k�n��,@9(Y̌@=�`�g�@@�'��@C,ViQ�@Eʹ��0@H��N�p@K��#O@O�ά�A@QDQn��@S$�/M�@U#�B8��@WAڡ�B@Y}���@[�z;Nq�@^UK�U�i@`x�!�V@a�	Ŀ�n@cE��s�[@d�U?gpR@fU�^�c1@g��Q�_�@i�}�/s@kl����@mA|�^�@o'����@p���O@q��(@r�$X�j�@s�KY;�@tڣ�F�z@vD�G��@w7G}P��@xs�t*]G@y��_�;@{	��Cn�@|cC���@}�β>]l@4g�<�@�V��+�@�#
�        ?;e���X�?m�O`�?��铯(?�L?|�3?�n@�m�?�J����?��*	y�?��{N&3�?�v�\N�?���;j��?�;Qޙh4@����"�@	�u�Ɩ@d�^�@�u�f��@гbW�D@#Q�K�{@'ۃ�S��@-�[�e�@2V��n@5�MO��@:��F1@>��F=q`@B����@E�ԨK�@H\��x�@K����]�@O�$�h�@R�n�:@T^>���*@V�.�׳M@Y���a�@\\���3�@_hcG��=@aS@/²p@cS�ԗj@d��>�J@f�@��&@h�z鹊�@k{I�p @mG�w)@@o����b@q���E@rh�:c�@s�J)�|@u:�d.�@v�f"��@xQ?�Ľ@y�,�ԦF@{�1�{��@}vso'x�@RPCu�@���W�4@���Y��@���ѿ�@����dSV@���ç�@�
�)��@�?In�@�~�&���@���v>�=@���ҩm@�{��,        ?��X�H?�lu}�@	;O��@�$	.˨@*v!>OE@5aw�M�@?���Ʊ@F���s�@Mt���@S���2�@W�o##@]y�g=�@a�t8
��@eX=-\�c@i4r�
h@mu��r�@q��=>�@s�W���@v[��3@yW\�l^@|��y��@��?Y�x@���|DHh@�֓�*�@���/��@�1t�6ٰ@��^K;�!@�kD��@��{Bb�n@�J����@�ơ_�9�@�Vs`Ɩ@���H��@���!��@��
�e*1@�e�q�B@�_�l6@�n���t@��e�á�@�槆���@��d��L@�A�Am��@���QS@�Ⱥ.N�,@�����@�{l���E@��Z�C&@�ZkK���@�ک.6R�@�f�e<�@�~_��\�@�OO��\�@�%�ǆ�_@�%z�U@��3!9��@��(b���@��%���@��I'���@������n@���A�"@���*)&U@���0SA@�Ӗ��        ?Im]�i��?{mg۟��?�WWX卐?���m��?�@Y�?�?�o��"1�?̓w�o?��Ǔ�V?�3i�8ڪ?��(C�Q�?��]�  ?��gg��?��e���?�BÛ�%�?�`*pik�?��&�B��?�m�U�<�@ 1tkf�@Q_�qv�@���2|:@���1@	��r8mD@e>/Q�c@TD�wi�@7� ��@�{���'@�`��9@l&�1�\@XjJm8@]��N��@|���Wd@��7��@ ����{8@!��`B��@#n���s@$Y�� �@%�����;@'13]xw�@(�u�̚@*G����#@+뗨���@-�@C�@/e���j�@0�7Iތ�@1�`_���@2�g+dw.@3�dX�c�@4�m�N\�@5���2�@6�����@8�E�$ @9<cJŮ@:y�1�@;�4���D@=FuŽ	@>i�R��.@?����@@���u�3@AX7�rY�@Be�Ӆ@B݄�(�@C��ȝ~�@Dvφ��        ?36;(��!?g$�@��O?���-��?�(����=?�Q=��z?����)?�~G��ǥ?ٙ�0���?�\���?��3�X�?������}@ 	���\�@��'�@�v�wJo@m-�f�@�¯A�@�xÇ��@#����V@( V�>!f@-:��$.�@1�(=JR@4��5k%@8]�nސ�@<^�.��@@cR���@B̨K�0F@Em$�/��@HF���@KZ��]Y�@N���@Q�|@S�C��8@Uv\�s2@W4�p$;@Y���zj@[��E㹁@^X��!s@`��kpk"@b�����@c������@e~â�+@f���g@hz	�Zd@jG;�5�@l(Z.*h-@n��'z@p�  g.@q"�KO�X@r<Ik��@s`Q-�\�@t��yU_@u�Q�� 
@w��f�{@x[�mC@y����@{#/cS�@|����"@~��ځ|@�TT�u@��B�k6P@�`�$�Q`@�6'�@�h@���{�        ?0�M;���?b+FD?����+�?�!L�yC�?��7AR��?��gg\��?�!��7�?������?�>b)4�E?�pFd�G?�G��a?�����D@��`�c`@
i�����@Q ��%@E 9�6�@&R_@@!���4��@%�'٭S@*�c��V@/?��qDx@2��}U2�@5��#Q@9dI�P�~@=\8��@@�G�\�@C8YMX�*@E�����I@H��1��@K�mQE@�@N�� `G�@Q��I@R���A��@T��?>�@V��]C@YĈ�-@[n�����@]�s��!@`9�q�*�@a��Rd	�@c��B�*@d��Gx2@f�D��@g�b�+
@ijP��g�@k3�H�V@m�8Hw�@o;ҚmX@p�3�@q��k'QI@r��ڼ�3@s�T� >@t��!���@v,��@wn���bQ@x�V:���@z�n�iP@{z�� ��@|�n,8�^@~hN%�+W@�f��a@��sx�~@��~-U��        ?��$=�?� o�ՃZ?���(V�Q@ٹ\L@��\g��@)a�ʖ�@2��|P�@:?�l��M@Az�Z@F��B�W�@L<JJI�3@QWH��Y@T��J��3@X�R�qp@]DmO$C@a�(�*P@c�E�8��@fgO,��@ilk���p@l�.{{�g@p����0@q��S���@s�K%  @v�{X,@x=]�ƈ@z�z�.9@}�R$]@�l�"t@�>f�vMZ@���cp;�@�9�e��@���.���@������@�C��R/�@�5��@���$��@�rM�'@���$�!�@����;@���ǵ�@���+�@�3�̰�2@�{S��`@��q a��@�0c�V	C@��V�!�&@�k
�^�@���z���@�7WR<�@�m&���@�ER�8��@�$3��Ɛ@�	��tB�@���1b @��0�,'(@����+�@�㞊��*@�� �N@��-➆�@�'�a@�)���@�L���@�ve�a         ?T'��8N?�,X�8�b?�1�%�S?�{ c(vi?��QF8D?�sT�-|?�g&=�|?әU-��#?���	��?�-)��?��ךq�.?�u���Z?������?�[��qQ?���]U?�)�3V?�%y�@ �>��@�S�k�9@j`�K9�@�k�oM@
��2�T@ )��B@����9L@^� �φ@6�	!4h@+P
�@<Pn&�A@j�P)�@���k@!U|��H@ �q�{1$@")��*@#�����,@%��r��@&�����@( �B�@)�')���@+��~�m@-P"��O*@//{N�N@0�L�E�@1�e@s��@2��8Y�M@3�ӫՄ?@4�=Ўa*@5�.��j�@7*��ь�@8e�(8#7@9��Tq@:�Ǯ�؅@<R�y���@=����O@?"��kSm@@M�i�@A���@A�$�1�@B�u<�@CpF͉��@DF�/�2@E"g,��@F��9J�@F�	�D��        ?ZGR[�k�?�O�����?���ځSn?�����#?�Խ�AB?��\a�B?ݻ�[�+�?獣u	|�?��H;��?�=���U@�y��)L@	�K�0�	@����@H��i@U�h�@#nd"r�[@(�,���@.���d75@2���M��@6ʨN7Bs@;g�®y@@Q�}k�@CC�Hb�@F��i�@J3�y��6@N:�e�@QSx#��@S���`� @V]m��3@Y4����@\E0)T�@_�8,���@a����/@cn%7�2@ep0t�� @g��~�$�@i�)�)�@l;��SR@n���*�U@p��
|=�@r��.�@s��w�f@u(=�S�@v�f��o@x~x�H!�@zG��oB@|&&}6�$@~����@�}\YI@�!A��@�<c��y@�c1�Ƣ@���^�`r@��V�I`.@�D��*@�v�Ȇ>�@���j|�h@�K�Rބ�@�ɼ$�B@�T�-ý�@��dtV@�ɩ��k@��hH���        ?@Y�j��F?p��Gu}�?���IFr�?���!�m�?�Y�L\ӭ?������?��9���?٬����?��%]&?�	�W�d�?���q�!?����T��@�y�9��@	���\V@�F�	@�ىEX@+�g5,�@ ׻L	�@$��p�!3@(���E�@-�y�_�q@1�3\|@4��?W�i@7���x@;��@�@?���X�@A� ��Q�@DU"��d�@F���@I�	h�2@Li���@Ov�2�)�@QY���~�@SȬ�1%@T�9���^@V�F<u@X�RIG�K@Z��%���@]鑧�@__��~@`��E�h�@b%}�ȸY@ct���7@@d���U�@f<�n:@g��Ul�@i=!Ь�@jҜ���Z@lvl�B!�@n(���1�@o�W4���@p�HSǡ@@q�0( �@r�j-���@s���^?\@t���v'@u�O��|k@v�w��@w�g/�{�@y"1�)�L@zL�u�@{~k,��@|��U��        ?��=�9�?��]��@
2T���@�;�� T@)�w�g�U@4i�ZJ��@=���@D�G��@4@K`B}.��@Q���Q@V �d@[
L�|n@`T��(@csa�2@f�"�Q�=@j�/q���@n�RB�y�@q��R�I}@t'sx�T@v���wֆ@y��"�z�@|�*����@�
����@�ϋ�\��@��n��Q�@������@��2�R��@��}��@�x���#�@��d����@��*�{��@�5�d�1�@����r�@�4\/�7 @�ϋ�}>@�}�E�i�@�?ץ�Q@���`]@� j%�!@�����C�@�	�k��&@���n�@�=�\���@�g��=�@��1�@�۾���@�&Q�>��@�|
yĠ�@��odE�@�Ii�e
�@��R��jm@�D��{��@�j�٧@�7���`@�P�
*@���kz@�ĭ�a��@���~,w'@���m�4�@�����L�@��`��@��0��c@��NI:�"        ?Dr�ݼ�?s���C�?��A�.�G?��]v�?��щ�)?�� �?�<X���?�yط��s?�11;���?�
�t�9?��ׁ `?��5���?�Yt_���?�sC9vb?�_G�Lm?��>U���?�f� c?�\�u��@ \��U@�_�X[@^	_N[y@5cpǀ@I�(o'@���ڂ�@W^9t*@�|�@�@'��S@E�[z��@�7�t�X@�)��]@�Ûłu@ �ԏ�T9@".��0�@#�\C�Ck@%Nw���@&��u��@(�֓�ը@*��M[G�@,i&���@.[�����@0/א�i@19�����@2L22�,�@3fO
 ��@4�$�+�1@5���d&e@6�T��2�@8am�@9Y�����@:��:�2@;욵٪H@=@@�@u*@>�{�b��@?�2���B@@�'G��^@Ag�(��_@B!�Pj�J@Bޕg�j�@C�����@Daf�tt�@E';���@E���%�W@F����        ?#r�hO�?Y3GKM�?}�e%?�^�-QS?�M|
�?��Y�[�?��
�;`?�L�!�??������?�Eu6�?��Ŏ[?������@w�T-:@�����@$tNe�@���E�$@��S��Y@#�T�|mB@([����@-�l��@1� �:�3@5^k���8@9C�N$ro@=�����X@A9YV0�@C���:I@FѱE7��@J��[�@M�#_�	@P���r@R�_���@T�xm���@W7s��J@Y�}����@\j�[�`^@_FW4��z@a'��rp@b�w%o�@dwƙq�@fB��R-X@h'W�&�@j%P��#@l<^�R
@nm�a��z@p\�q @q��V�@r���h@tE��g�@u{���T@v���R@x^�?ô6@y�҉�@{{$z�*�@}5��@~�<�:@�I�Dg�@�2N�Lj6@�"P���@���Q/�@�a�*,L@� ���|e@�/��\@�Fj�?X�        ?/����c�?a͚� m�?�	��k�[?��I���?����E?�lN���?�ç_�j�?��|�0�x?�g�pB�?��Kn��?�O�>\�@ k�T�@KU@>Q�NZ�@ 5,@5P,��@ �t�p�@$ܪ���@)��}`<@/��v�4�@3�|�<S@6�6����@:�Ŗ�k@?�g.u�@B^�|�%@E7h���@HV66VVy@K�ދ&�F@Op���97@Q���hK�@S�n۞�;@V1�M��@X�R�{�@[P���@^ (s�&@`�.T@�C@b"��0|�@c�!hcJX@e������@gj�A�i@i]��!�@kg��?��@m��Ռ�P@o�!�w��@qv���@rFH����@s�6p��@t�m_�+R@v=0���@w�l�x G@y%��Q�c@z��|m�@|E�4�B@}���L@��%oj�@��E�M��@��	5�@��v&�=;@��k%c��@��b�p�@�����@���EI*�@��,$�s~        ?���,2��?�Qo$�7^?�NF��9�@������@[��� @!�J����@*�9$�no@3�_��@:�C��@A/��?@F�A?��@K�q�Q��@Q.jݾ'5@T�?w��,@Y9?�
@^�1��2@a���Sz@d�IծZ@h��J�@k�L�y�@o�	�y��@r�`�	U@t{ǁ|ɞ@w���U@y��1���@|���`GS@�����@������@���75�@���3�|�@����S@�ߔ����@�-�V�@���"�@������@����]�@�B���b�@����a�@�+O�B��@�����.v@�FK$��@��&���@��+	�@�E�w�@�X,�A@��[��|�@��aP��@����b)?@���{N@��տ��@��~�#@��R#4U`@��%rd�3@���6��`@��=���@��K�8V.@���Q���@�� ���@������	@��e�Ҿ�@�ޗ-�@�y���Y@������        ?v{ ���J?�'[��?��R߄R?��{����?ؐ	j5�N?�Me�=�?�X;�X7�?�]s�!�?��D���?�h�)�R5@Yo�e�@�4���@�

�B@�M�.�@u�Il�@Ƹvd��@>��Q�@��%i�-@� �vMC@�ox'@ SSd�~�@!���4�@#�'����@%l�Q�D�@'I�Ȗ�@@);�@���@+C����@-ao�.@/��9F'@0��+0a�@2"�E>��@3`��I��@4���m��@6��ՙ@7h~7��@8��@#�@:Zɚ���@;�OuD
�@=�}Py�@?,V/5Cj@@qk`�@AS}M:m@B<_���@C,$�f@D"�	�vM@E 3ߧ\�@F$�W�;�@G0bJ)9�@HC:�_$�@I]\�yM�@J~�jF�@@K����ǈ@L��L"@N�]O�@ON�XI~�@PJ�k�@P�ǝ�@Q�Z�!�@RK �@R���]�@S�W�;�@To�U�y<@U.7,��        ?T3O���j?��ʪ/��?��-Ђ$?�Hn)j�,?�SttC k?�H#�n�?ܤ�j�7?�vx��?�����\?����r�@C|"p(@��F�/K@���@�̢�@"��h&!@!D�	��@%����@*��E��@0b�5l��@3�?�^@7��5�@<z�5ˎ@@���w@CD/�ز�@FL�Z��@I�uW�^@MHp͇��@P���M�@R�5��V�@U���_�@W�l�>�_@ZM��ΰx@].y	�(@` Ip���@aª\u��@c~�%:.�@eU³�Y@gG��Q�n@iU6����@k:C9@m����7�@p�L��G@qV���@r�~�.+�@t����@uvX�^�j@v�Cs`�K@x�y�IF_@z'4���/@{حl���@}���-@n����}@���~��l@��j׉q@���E�4@���WQ"�@��|�#(�@����s#x@���Pf@�L����@�����Fr@��xX�_@�$����)        ?X7��R?�''|:
?�b~�΄?�
(Y��?�[�ƥ}?�#�O>2?�kO��8?�8��h?�u_�ݍ�?�=?h�a?�P�G�B�@�H@jE@)�=�*o@�b��@T�e��@�-3@l@��!J�W@"�[p�_@%�n�Y�@*+����|@/�����@2;D���@5@��(�#@8�;�16.@<A�.�@@!�Ȩ@BO��#�k@D��-u@G8���@I��,0.r@L�Q@��@PC>�M�@Q��~��@S�vg @Uf�G�}�@Wk�� ��@Y���g�@[еuY��@^2���P�@`Z���~@a�Yjb��@c�}@d���߻@f�H�Z]@g����>&@iI}^�A<@kf~�{@l�S��@n��Zw`�@pU?s�O�@qYy�� �@rg�n�@s���[�@t�]�� �@u�:Q�/�@w���D�@xH�9]G@y�����@z�]�U�_@|PAr>@}�S��T@7��Tl�@�^6�2X        ?��v�@-$b@B�@)�o��@;��D�@Gp�/z�@RU'V��@Y��&}�@aVIɝ�@f}n=&��@lL�#��@qb_i�1@t��p8/@x׭zgmM@}����@�� �X;@�Dx7%�@����>È@����
y@��n���@��K%Ǘ@��i��@��K���@��#.�HP@���Q=C�@��5�H��@��{�Tf�@�!P�b:L@�Hou%�@������F@�G�L���@��@x##@�	�R� �@���j;�j@�	���!A@���F�G@�H�G�<5@� �ʽ��@��U��\5@�Q�Gc@�E�&(z@�B��Ok�@�G��{��@�T�����@�j���@��L�H��@��sI�@��d�U�@�&���@�S�v@��o�@�@����٪@�H*���@@�U�q��@�"��!@��Ls��@���є@�KIޗsL@���h`z@��AIu�?@Ŷ��5^@ƏX*���@�l�c[��@�O����        ?G�8i?u)�),?���!I�p?�P(#.?��1}���?�П��D?���y�?�94��% ?�ֵ���?�i���F�?������?�R6@{F�?�4�6 �*?�W���hY?�e�z2. ?���8w?��{s�S?����.3@�N֍P�@@��\f@��ŉJL@	�j<��@�䭟5�@rKiqe@���ol@�°��h@��łk�@�Z���@x��3}@���HxN@��l���@!Dɵ?%@"�8�sD�@$_��+�j@&��k��@'�t9n##@)��J)g@+�qx�+K@-����@/�Y�DE@1W
k�s@2BH�{�@3~�)��@4ȩwͥ"@6 U�[[�@7��K~r@8�+\Ѝ@:z����6@<
���@=��߾�Q@?S�+(��@@�J�e�
@Ak�S�<�@BW�oZ�O@CK./a�s@DE��o��@EH?�N@FR�YBN@Gc���@H|��Z{@I�f����@J�欖�=@K�'v���        ? ��	4�v?T*��ւ?vӆ\�	?���{�%!?����	,?�80���?�&-^an?�x�H�?�	�W?���U�?��2�[�?�8S�m%@N���@
Ԯ)d�@Z.@�4L@���/�@7��p�@"[_���@&��9M@,���y@1
���Y@4{"�4��@8ak����@<Ÿ��e@@�Ѭzi@C�Z�T�g@F�ӎ��4@I���B@M�̦���@P�U$�:�@R�8�I[@U]82C�_@W�~q3��@Z�9���@]����g*@`r�Px�@b*�w�8@d��YVX@e���&�W@h����@jG^�c�@l��@"�c@o!D��?�@p�=�t]�@rF�^�-@s�����@uHܵS,�@v糳M!d@x�Գi2@zb���u�@|?`����@~1xr�w@���ﵮ@�+s�j/@�Ek���5@�j����@��Rl @�ׇ���@�n�� @�s'wu8@������@�>��'�@����f�        ?;OI͆�T?j�`��d?�I�և+?�s��;]?�}
��2?�gZ����?�C����q?��k���%?�<P�Ҷ?�$���n%?����?� �A��@�Qx�L<@���@�@��!�o5@�&����@����@A|���@#?�]�m�@'q�ͤ�C@,B��kx�@0�삚$�@3���;�@7w�U�Q�@;]~bʎ,@?�Ҁ=>�@B=]���@D�
���@G��]�@J�
�j@NNꭓ>�@Q O��|D@R�P�nR@U"�q
�@WnC�C�@Y�Lw��D@\�XT�@_GAФ۲@a���S�@b�8e��s@dQ�2�OY@fFw�@g�8���@i˼��n@k��P��@m�ф��$@p�A��@q2,�kX@rc��C@s��D��J@t��U� �@vB��'�@w�����P@y�lx7�@z�N��@|:��?@}�N7���@YjQ<�N@��O��u3@�d~��x�@�JJ��9�@�6�p��@�)�+	A�        ?��kj�F?�ۿ�n�v?�{�ǅ��@�/�0,5@� ��� @&���� @1$��`@8	�p�?@@7��K�.@E&�S�V@J���u5@P��H�@Tm!��D@X�D�"�@]S��,�@aJE�)�@d4[��ʄ@gm@���@j��sA"�@n��%��]@q�
W���@s�/��@v]�3�P0@y���p@| �K�j�@' ��9@�D�y�c�@��aG��@����0@��t<�X@�J���?�@��_��+~@��u�Ǽ@�`4yZ�@��~_��`@�<�V�zz@��*�"�@�j�*�2&@�!*� ��@�틒�N@���;}�@��M���@��因ϝ@����Wۣ@����}@�I�n>в@��m/X�@�����@��.�@�l�EFD�@�ԇ#A"Y@�H�����@�ɣ�	e�@�W��pR�@��Qo�@��l��C@��K�/>@����^\@�r��_�@�b�,@�X���ٕ@�VW�_�@�[82ɴ�        ?_� �M?���9�/$?����*4�?������?����N�?���dc�?��E>e�?طQ�<)<?�D�|g?��`3��?���*˄_?�,�p�?��/�k�?�v��;�X?�S�?��?��e�q�@��rގ~@�_��`@�n�!W@	â���z@�z}�^@,�t�g@ ��@���3@��.+@D<4i�@��:�3@"��ۊ�@��jAS@!KǢ7c�@"�{H��@$U�G�0@%�`k�Ԓ@'��QX��@)��ڍ��@+g�� �@-d^[�M@/x�Z���@0�To��@1�+��@3#N2c�@4^*�:�@5�#d��@6�)��@8]0��vb@9̕�X��@;IO���@<�v���[@>k*(�1�@@FX�@@��ޭ�@A��!�@B�<;��M@C�5�H�@D�;���0@E���؜�@F�^�BZ@G�w3_�@H���l��@I��Q��@J�Ew@�@Lu�@MI^�ꀪ        ?6�)xH?jf-�ʱ�?��3���?�YoPߵ!?�
��ܮ�?�B��?Ѕ|L5�e?�ş��T�?䙽�v?�k�Lc�0?���dސq?�"����@W3��y�@
�&���@r�X�,@>�'�L�@�-4�8�@!F[db�i@%#��@)}���@.tƙF�M@2>���@5"�3>��@8�!�2��@<e'PEd@@G����"@B�R�K��@E�b��@G��PQD&@J�y�&��@M�׻��@Pq�T �@R/���@T
ݿ�w@V�UG�@X��@ZGAM��@\�#�3@_��	 @`�D4a@b�c�@c��P�W�@d�����t@f|7����@h`�i{@i���M;�@kra��@m<+���$@o^��Mz@p�}�L8@q�3EړF@r����@s��$ڵW@t���a��@u�$�;I@w���@xYqvb�@y��w�@z�OlTۣ@|T%�q�@}���@r[@4�S�Ie@�[�kQ��        ?*��&"?\X��@��?}�˔�N?�E�,D3?�vVU��?����8?��Z�w#�?�[��o��?�3_����?�+�S��?��əv�?��uWT� @�O���@1���ģ@�Z�@:#c���@�+�%��@#fW�b�q@(Ϗ�@-a�v{[@1��]V�O@5DDJ�v�@99�=��@=������@AN�B@D54���@G$��u�@JjD�1B@N ���@QY���;@S(�+9k�@U{���}@W�`rR�{@Z�jN�h!@]�x��U@`Rm@��@a�h���a@c�Ό`4�@e�?$��@g�^'�/@i�����@k�N+c@n~g��*@p=��@q��Q�{@rֹ?���@t;�)�a@u�����@w8P ��@x�jU�@�@zz5��1�@|6���@~4&[4X@�D=�I@��rvs�9@���u\@��i�nT�@�śe�@�6@� )�@�bnI��@��-���@���HҖ@�$Z���        ?�k���i?�0�U��x@�F[�U@"&6���@%�_(��M@1y2y�Ac@9��8@BqyB�J@H"���y�@OH����#@S�"��@Xx�e���@]˽�t=V@a�J�|[@e9�t_=@h�2�k�@m�9@p�2���@s?�-��@u�}���9@x汶#
�@|k,"@��i���@���?}��@��a��[@�ЙC��w@����@��U��l@�7��g�@���T<C@�|�L=
�@����<�@����υ@�w�rK"�@�PfE�!@�A���_�@�Ld�n�@�q�ʼ@�X!o�_@��G��q@��@b�?(@�	S��&�@�`���n@����8@�;�����@��))�!�@�S�H,sF@��׭�c@����_@�6�
���@� Ne�@�{%��@�0 GN�@�����@�Џ~#�@�2	�wa@�Pd����@�x),,E@���:}�@��=f�@�'����D@�u�
/��@��V]        ?P�|�6�?��s�� ?��Q�� ?��R�`�?�zr~3?Ϸ�l3{Z?ך	`�l�?��	5��?��u?����m?��k��n?��"�&?��K��?�������@���56@~X�@	�n���E@Q��W]@���\��@�}�-�@n�We%�@r�l@��Û��@�/|$�@ �
�R�S@"F��×@$#;��@&��f�5@(:��ϩ@*/���a@,oXi��#@.ˏ$���@0�YBU:6@1�Bs�@3G��sI
@4���zO�@6(֝�N�@7��1�z@9Hq��+@: ��@<�3��8@>o2+�ȳ@@#撞�w@A�nj6�@B�����@Cң��@D*��%� @EB��	��@Fd2`Ų@G���Qe@H����@J ��D>�@KH����Y@L�v
}z@M��&0�@OZ�(-I�@Pe��@Q!���T@Q�Z���@R��o?��@Sumxi�S@TE�"-�,@Ua�K��        ?D�+栯?z��.�A?��/F0�?����ʦ?�(���:I?˚�j���?ֆ�m\�?�^���e�?鯤���K?�_���f?��M�V0�@^0r<�@�:�y@,�+��@^G��Ȉ@{��Y�@��F=7@"�eb�hL@&Ω���@+k����@0Q�X2��@3?��}@6����C�@:2��U�@>-zC��@A6~�M^j@C������@F$��c�4@H��=ef@K��g3�@Oδ��G@QA�Ȗ'O@S�ګ!�@Uf��Q�@W�y���@YB��@�U@[�y|�@]���	Z@`F偍x+@a�H1��j@c�: @d����D�@f~����@g�P���@i`�$��<@k$���@l�����@n��~;u�@pq�����@q{�t�@r�?�f�@s��Ի��@t��<x�
@v��M�l@wD4}J�@x��
?�H@y��v���@{?�aU�M@|�[(^��@~ ���v@��5�q@���d�;f@�e��|�        ?6#΢o�?h�3ܩ�?�>��|s?�c��7��?�)0q��?��=�
^p?���5g�6?������?�T��?�@"�>��?���= @ �ѺC-@_�����@x���@�h{:o@��c��@ �S�q��@%0�P}��@*�����@/�c��Py@3�.{��@6�e�P��@:�����{@?����}@A���PI@D���bj@G�n=3�@J��
�@N��ý@P⚵_@R�;�@T�"��%�@W.z�<��@Y���Ӏ-@\I�h�A@^�SjCh@`�h�%��@bD�~]�6@c��	u@ey�n���@g3���T@i�=5�2@j�\��@l�����@n�<��<@p��W��@q�/���@rӑA)�@t	�h���@uL}�SJi@v���۵8@w�pmo�@y`fh��*@z���#�@|Zֱ�N"@}����@�k�)�@��H�_�@�}[t�V�@�dst�@�R���
�@�I%��>�@�G�o0��        ?��gi(/?��2B���@����r�@%��h���@4r?���@@��r�.�@H��VUP@Q"�c�@V��b�y~@]Cb��i @bN�gDaN@fl����@j��8�@p�Ϫ~P@rī�;@u�z�L@y
����\@|��'��@�2���@�@q�IZ@�s�\c��@��p�?@�O�Eر@������@�ͮ��D�@���g��k@�y�T7p{@�#����@��p3ώ:@��>݃�@�����z�@�����a�@�����$@����ri�@� ��o$@�S9%���@��t
4�@���i��@�9���@��'��@�^�0��@��
{K�@�/to~H�@������@������ @�����x@��"9��<@�{�`�[�@�t��y�@�v���@��y�S�@��@� �@��$3��J@�����"�@���J��-@�3� �@�q�rܬ@�����#X@�	k),@�1l��u"@��Tu�@��c�C�}@�R��\!�        ?M�B,{�?{s�s�1?�h!�4a�?��t�?��;+�Ze?�(��{ۿ?��X�n�?ҟ7N	?�� � U�?���.�.g?�C��D�?踖��p�?���YKt�?�ޒY@~�?�.M_:?����?�?�� ���^@ f��'e�@��,8n�@:��w�@�k� `�@
���T@�S��@��B@t��ϝ@[�9o@a�B�ju@���(@̍�1@2�V�T@�Ҳ�<�@!2�F�Z@"�Z�yJ@$흚�@%���7�@':���k@(�����@*����@,�Z��@.mѯ��@05JL�@1=\ �@2O)}�;@3j���M@4�����@5�Q�-Bn@6�e���@8;\���\@9�7���2@:���M�@<?��n��@=��w9@?Q㨫l@@N</��-@A?��+�@A�:!؊�@B�4`#�@C|;;9�@DT]����@E1�w�@FC��@9@F�-��s@G�嚳        ?#�G2�E�?X���v�?z_k����?�-@�Q�z?�j [��E?�ʗ����?��>�ܧ?��Z�"�?�/�`��??括���?�9���%?�'!�@ �m��.@����N�@\c���@͙Q�2o@b�&r�$@ X�*�.@#���߄@(|���+@-��
i2Y@1����@5Hf.�6@9<���@=j����@A1� @C�7��@F�.�is�@I׳���@MR��D�@P�eߘ��@R��FɿQ@T�e���@W/@�_�g@Y�U�?~V@\tw��@_[�Q��Y@a9�Jg}@b�Rh�OU@d�b� �@fl�=W�~@hZ�߸[@jbH�u�@l��@�b@n���Q�@p�$�!A]@q��s\}@s
(A��@t^7��@u�/�4� @w08g�k@x�|3/ζ@z;'~،c@{�h��@}�p�-gR@9p���@������@�l��W)�@�`!���@�[�����@�_G�C@�j�/~k@�~_�        ?$��6��?W�W|3(O?y `Gõ�?��(�U_l?�W[�7�??�C��<��?��k�9v?�BVrM?�-�6�?�E�c�?��,��?� [v/�@DL�o@ཌ���@��.l@�Z�h0�@�"�n �@!l�^}�@%���>�@*���s�b@0}��!�@3Rp���*@6�e��@;ז��F@?��K���@BT� ��@Ep��D@H*��@K~t~E�e@O.���@Q�WXK{�@S�Xp$�@U�aq,��@XE#�Ī�@Z�?&f��@]�@&��@`9�t���@a�i��UO@c\����@e ��ӫ@f�I�?=@h�V?<j@j�m`1�s@l�~��@n�[���m@p{�R��[@q����y�@r�q_g�@t
���d@uO���4@v��EN��@w�q4P��@yeS��;�@zطv���@|W����@}�S��O@x�g���@��ug�cL@�d��O@�A�. @�$�ʨ?�@�٩D�b@��'�Re        ?����6��?���GL#�?�	�a^R@�!�D��@j�A8�@&>2���@0��4Ue@7:��#�@?*�m���@D9py�}@I�i4�dJ@O�0\���@SP$�`�@W7�?��@[��(\.�@`:JP�O@b�l�E@7@e�B�a�O@i(.G��@l�j��b�@pL�zF@rf��}��@t���r��@w���$@y�����@|���{ĺ@�v�[z�@�^�He�!@�/0�@��3�E�@��Б���@��~����@���	�@�\�?]�@�r�*U�A@��%��@�;�]X�=@���g��@����N��@�objA�u@������@��E�^�@�-[�@��Y<� @���d�@�<�'�@�-�tr�@�'�xf@�(\x��k@�1��v'@�B��n�@�[�D5%�@�|��7�Y@��}�E�l@��@06��@�� �d�@�O�L�u�@��@�<y/@���y@� �_s�@��SR�1�@�����@�>�gS�W        ?J6f�I?w3)���K?�=eR�?��*�,?�*X"�\?�M���ys?�.�yo�R?��a�%�?֌Jd���?�����#?�M<͑�?���a�?�@��­?�@X_���?�&��3m?�W�
��x?��IZ��|?��m�&@ ���q��@$f��@@���>�@+�/2��@
���2��@��A�@�8����@C���Z@�&��@�7r��@��Qڻ@��@K�;@�|���s@ �s�m<�@!�;:���@#!=�n}(@$���	�@%��)��@'t�yK��@)���M@*��_H}@,O#-��@.
՘�)@/؎�I�@0�kEBT@1Ѓ��q#@2Ρ��i�@3�����@4�+�A�@5��h�X@7~E˥�@8?�.A��@9oj��@:��$�t�@;� LNO-@=/�,��g@>���V�@?��Ib�@@��V@AS'�� 4@B|�L�?@B��K�]@C��ܙ�w@DQ���        ?MZ��v�?{��ח
?��W��ǁ?���CL?���x��N?ɵ�ޟHY?�c��?�k1dUA�?�|�iS'?�YwTpR?��7 %,�@ ���ȇ@��!��@����k�@=�h�߸@ug>.�V@�#�rE�@"�W��I�@'*�4�\b@,��A{@0�h���e@3ߪ�v��@7]�\�^�@;B_���@?���D0�@B(�Yʺ@D�����@G��ni1�@J��CMm&@N�5���@P�m�:��@R��?��@T���X@W�1��f@Y[�	��@[��]��{@^}����4@`���{�(@b��U�K@c�NYNV@eFr!d0�@f�O:xd@h���S�@j��`o�@l� N�aP@n��}���@pQ(��@qf_2��W@r��k;�@s������@t�$*�s7@vT�tW�@wfugi'�@x���m[L@zs�ݵD@{wK1cfx@|��VZm@~^��H�@�8���@���#�T�@��w�i@�RV(^-�@�'��$        ?5��c�<?e��+)?�һ�ӕ?��)h��/?��N��m�?�S�.(Q�?��1��*?�@���?�5KH@d?�YjeAg?�%Bpn�?��3�k}@��H�K�@���f@��j�@�+��@]X�#�@�ⷧ5I@#�Zi.��@'��s��@,Ј����@12��@4V����3@7�K�&�@;�jо��@@>`[~�@B[bˠ�@D�52�@G�ȓ�(O@J��^�8�@M�3 �q�@P�����@R��^Hg@T�إ�?u@V����@X�(���@[%sen�@]������@`��b�@au�Z��@b�#��C@d_���`\@e����n@g�<ֽ^@i=�en��@j��R�xa@l�gt�@n����@pW��´�@q\g&ԗ�@rjo^��@s��;e�1@t�΍�(@uʳ%KƷ@v��)7��@x:��6�9@y����u�@z҆�\�C@|-�܃�#@}�)ꌚ�@F�d�@�?0u�@��TC�        ?�ӣ��o?�Ŗcf��@p$l���@i��Ɉ@&u�5��@2��@:ҙN�A�@B��.�y(@H�qbH�@O�ΡlM�@T�`a��@X��Mǥ1@]������@a�V­i@d���[�@g���f�@k��=u@o�{�!/@q�*�Ƅ�@t0�@v��	:@yPٷ�@|'V?���@.I�Ft�@�3sj�!a@��!��h�@����w�@��z*)@���V��@�Ʀ��jn@���=@�Y���@�����S�@�/���P�@���J?@��_�8�K@�b�[�.�@���T��@�zgbC9�@��RZ(E@�Ή
O@��7����@�/Td��@�����@�*n��@��E��@�z���@�)��S @�@DK	�@�^�m<^!@���)��&@��x�52@��8��A@�(ϐ6l-@�o���6@����j�M@�
�лg�@��5��@�m�'��@�#����=@��c��@��o{p��@�^?eŶ        ?e�����?���, .?������?�Ǎ�y{?���C�Ͷ?�^��@y�?�im~�?�ϵ/=w?��aҼ�?��zB�?�A����@ ����S�@!��4ho@�HB@�c��x@Ys���E@�
�@�����@~�nP�x@�U�r�(@'�;��@!X���@#J�^L�@%],x�Vs@'�S�YK	@)���X�0@,a��rA@.��S�@0���N�@2U�,��@3��\��@5v�ym/�@7%��z+�@8�5M��@:�AQ�;t@<����@>���q�@@j�yŲ�@A� =b�{@B�_w�4�@C�">��@E)4'�@Fb>�q�3@G�F�*zY@I@!TPq@J|A�em�@K�x���(@Mp!�R�I@N�~��j�@PId]�4�@Q&/��@Q��ʄ}d@R�n�ü�@S� b�a�@T�c�]�@U���t�$@V�a�i�R@W{�0=��@X|*�F{@Y�A��]@Z��6;�5@[���s��@\��}�e        ?[,���?��^�0?�|��8�?���(w"?��v���?�]��z2�?�Ը*Xy~?���5#?��?�Р?�|'rr�@�@�K�%@	&m[1�@z����A@5�=���@�WE�@ �bD���@$�h���@)g��J�@.-�U#j@1����@5,�˳�G@8�Tg�P�@<��_��@@�,�5�@B�kl}�@Ex Q��V@HC�d��@KF�|�/�@N���W��@P�H��a@R�3*��@T���>1,@V�o�IE@Y1��0�@[�r��n�@^��s��@``>s
)@aǌ�H̵@cBp{�}�@d�El�@ft���@h,�1@��@i�ˠ�@k�����@m�Z����@o�}$�@q
#".��@r*ƅ��@sW�q�V�@t��s��@u��J�@w*����@x�YN@y��J��@{sy���@|��-@~��1�|#@�T�M>@����v�@����ּ�@��b1i�@��Н_�@��1���        ?dȕ]8��?�4�W?O?����(Q�?��c�vh�?̐Z�C34?׾��W�?�}�D*��?딨�#�i?��l���?����@A��2A@	�U7��|@咒M@2����@On~���@!�4��"�@%����� @*�X�kK@03�F�N1@3R���@6�$ޕ�@:�����@>ᜀ�*�@A�M\�S�@D?���]�@F��o@I��[�o�@L���=@P ���o}@Q�)��i,@S�q���@U�7�v�@W��o7\i@Y�1��@\M'�A�m@^���ɂ@`�	I��S@a��	k�@cX,O�@d��c0�W@fMm���@g��1�w�@i���>n2@k5����M@l�5�ў@n�v�E�@pYq���w@qT҃�?@rY���@sf&�ab@t|i�ّ&@u��{��Q@v���B�o@w��J�A�@y4$aƇ�@zz��oI�@{�~ �&@}&��n!�@~��+���@��uvBx@���Q�D@��y@F
@�I����h        ?�nf���@���p<@)�zkL�@<e��e�@IfmWKG@T�sl�@]H�W��@c�tN��@jd�7A@p�,�.��@t���D�y@y�x���@~
�΃2@��|�Y�@���h걺@���F��@�}��q.@�Ib���@��9V���@��^%Z�@�5�	:�u@����R��@�Y��x@�)�1~�@���"D�U@�"���Ѝ@������@���gUH@�ZN�J�@�Dc��h
@�E��"۾@�_q&�R(@��6�&j@�蓼h�^@�$�@�f��l��@���[{��@��(��@��&� iQ@�n+�@��	���@�=eV��@���af�@��/I]�^@��v낯�@���D��@T.x��@Ì��&W4@ČU �ww@Œ��zW�@Ơ4�W@Ǵt� ��@��޺�D@��C�v�@����0�@�K˯��V@͂�}��@�����!B@��S�F�@Шm�e�@�Q��� �@��(��@ҭ�?[&        ?E�&5g`?u>f/��?�	hR��?�֚M�3�?�m�󆄶?�͎]V�k?���(��5?��-���?��=� �?��h<�?�:]�Z?��j�c�?�V)k3B?�7����?�ރ�
d�?��%"q�?��J,�@ �b�U�@�����%@�LI;�:@p�'c�@{�j��@��D;@�{�`�@�K�D @�Ưy�@�gFgj@%�&}@mC���_@дi�&y@ 'h��aj@!s�2@"̉��(k@$2-�S�g@%�U�WM�@'"�E���@(�-a�@*E�Rɣ�@+�|�;;@-�BƇ�@/[�ЋD�@0�K���-@1��isǟ@2v��ܰ@3seM��c@4w�k,@5���(��@6�����@7����\@8�e�Hg@:�)�>@;;�O�y@<z��$��@=õ���Y@?7�MR@@9i ��@@��ދ�@A��ݕ<i@Bd��^E@C'�>;�@C�	0/N@D���djT@E�O邍�        ?*[��I�?_A,�$?��ni���?�;*W$?�on�O8,?����(p?���WwYR?�,�m�?���Ԁ��?�#*�B�?���5�%#?�/�f�v�@����^�@�iI�>@�����@�N}�l�@ ���#�Q@$�B��@)�:p @/�3�zH@3cIq�E�@7Jn*��5@;�$i-�@@UUd�]�@C_��@F*���(@I�׵��@M>��L��@P�V��S�@Rռ㬆I@U4����@W�؜Y��@Z��`�Ͳ@]o���m~@`Hd����@a�=ξN}@c��"��@e��f���@g��Y@q�@i�<�c�y@k˴ҹ,�@n% �`@p;�Og@q{/v�@r�"8P,`@t"�ĕ�=@u�έ���@w v�)@x��\k�@z�Xʜ@{��1��.@}]>xg�@H_�8{@�mH����@�Vi3.K@�E�Dtn@�;�+Jg#@�8I����@�:���K @�C�;��^@�S��'@�h�A��@��.D&g        ?/����'|?aM��h?�2=֕�<?��ӥUC?�� 67�?�0E��H?Ǟ3�b�?��l��?߼3����?�39�۟?��?���?�@/�I��@q��5�@��AQ�Q@2w�y�@�J��h@}(:�U�@�K�.-@#��c3�T@( �"��@,�?ܧ@1?���w�@4aGT��C@7߳!�qR@;�?�S�@@0���@BX�n��g@D�V�2�@G���~P�@J���}�	@M䙛+@P�dyE?@R�6&��G@T�O�_��@V�4�7@X�]��@[,3�z��@]�Ҟ�@`!����@a����@b���q��@dq��ҷ�@f��֝P@g��\�E@i[��ʇ�@k!�3�}@l�KQč@n�P�Z[3@pnq���~@qt����@r�u���@s�?a�'@t��ȃ��@u�p�(�@wj~@xS�4�jY@y�/.�ş@z��ߨ�P@|<{hI��@}�Op�/6@S|���@�;˭���@����㥃        ?���W ;?�B�I���?����	��@g%c�RZ@!AY;�j�@,W4�w)@5S�����@>3�(���@Dtw��M+@Jɠ�Q��@Q_�e��@UUb [3�@Z/L*���@_��o!�7@b��@fg/.�=@jD+)Q_?@n��T}GJ@q����;@t<�d�s@wj^4��@z,ka~a@}���rU@��E�.�@��^����@��Ŭ2N@��X��h#@�#�#�J�@��:d��@�5A��/@�v�A��#@��l
�}@�\F'��@���A��.@�{��U\�@� �%"��@��l&��o@��d��h�@�c����@�A��H�.@��J@J�@�����t2@���T]8�@��n=gC@����f�N@�ᴂo1+@�
�+��{@�=�R���@�z��@���U&��@����V@�m=��=@����]@�#2A�H@��O�:]�@������O@�s�T�@�E
ݝ�@��GU�@���e�0@����0�@�ϯK�{"@�Þ�/.�        ?[4Pia��?�]}��v?����3|D?�y!���?���Q@�?��b�-�S?�h��{��?�;����6?ⷾ&���?�[W�?�	J��K?�n�,;Ru?�7+�f�?�f[��j?���ˆg@ �s�I	@��m��@�)�n*�@
�5���@;�ح)�@?�-@ݨ��%-@�m#-EP@s�
�@e:c���@�>ܭUA@`O��@ ���n��@!�{��w@#i�(��
@$���EDC@&�Dl�_@(CC��Q�@*�0��R@+�U^�~@-�����@/��`�i�@0��݃T@1���+�@3��]��@4< ���@5m�}5@6�����@7�c��@9AV��@:��R�y(@<m�!@={�р0�@>��н�@@D���@A�v�@A�J�VE@B�W��w@C�C񷦍@D�I��u@Ex7���@Fn �V-@Gk>XDr@Ho*}���@IzrΪe+@J��j��@K���L;�@L�S�p        ?/ �.w�?a��\w��?��'�Ѣ�?�X���H�?�!��;�?��\l`5�?Ϊ�ߞ��?�Y\�%�?�OkEwI�?�f��t?�9�>�;@E ��@�^<=@��fԎ@/��eR@T�1?��@!O�롆F@%�P���@*���b&�@0���=�@3BMh�{@6�Ivf�@:�An��@?,���W@A��u	�@D��P��@Gl��Ԏ@Jx�,�hF@M�5��=�@P�IIBz�@Rxb��@To����@V����B�@X�>fc�)@Z�ěC�w@]e؝Ћ�@_�:؅Y�@aB�?V�,@b���烶@dy
���@e5I�!�@g#��g�@h�;w�d@j2{���@k���#�@m���kAS@o\���@p�d@q�L�(;@r�kw�@s~O��@t�X�͜y@u��#�q@v�D���@w�"�*@x�m�ϙ@z
E2ho@{;�g�hB@|u(=I�"@}���R@~���r�@�(�e�l@��I@��        ?B�l-hf�?p晞���?��;�.��?�Ih7�?�H�	�N�?�	WБʾ?�Z$$�?�>?��?��r��2?�Fo�̡?�c6{�/�@ N� ��@'���@i��2&�@ ~���@l��k@���@"���%u@'1����@+�,>;uY@0�q3{��@3�3���@7E��@:� �}�U@>��a��@A����@D-�w�@F�K���@IVՁ�Bz@LH!^s��@Oip�{�J@Q]|U(�@Sp��&@T���϶�@V�4$7!�@X�!�1|@[�H�@]Pc�Vq�@_���)!@a��v@bJs_��@c�WQ:��@d��q��@f\�v߆@g�\���@iRƾ��0@j�0|�@l|`�a�@n$�b��E@oڍkzl@p��s9
Z@q�B�iM@r����ɵ@s��*�@t�4|>�x@u���=,�@v����h�@w���ӊ@x؂f&�O@y��5�g=@{$��b��@|V���0@}�FЏ}�        ?���ʩ ?�^��&�@� 4�o�@h��f��@']w�-@2_e�c�@:�]���@B�ԊX�@H���h,1@O��%��#@Sݷܾ?@XV��W��@]QkJ���@aix�G;@dp=/���@g���v�5@k[	�{�@oD��{K@q��
��(@t��I�X@vxW���@y�Q��L@{��d�,@~���S��@� �|��@��v�w��@�o ��@�Kw�P0+@�@��1��@�P*Aس�@�y����@���d��6@��PG`l}@�˅n��@���S(�@�o�,F�@�ֱt_��@�LI���@���K�!�@�bzi��@��֚"�@��I����@�tI�E�@�����M@��5�B��@���0�@���m6с@��$nl��@��+���@��+��f@��5}*:F@��[E@�BT~@��9���@��q�ĥ�@� �|7h�@�IO]0�@�s����&@�-n�亊@��oD�@���C��@�x�DZz_@�F�5�L�        ?<4�e��?j�Թ�p�?�5��Af!?�@�v��G?���+��?�)Bo�W�?����]b)?�z��\�V?�PT]8�?ӽ��f|?��I�l?�	�üo1?��R�%�?�����?��0`?�m��o�?�[=��?�'���?�3�J��?���KQ?��3y�@uN����@�i��bS@��R�@J�ɟ]@
�W�ϖ@H(U3�@Oˆ�g@��f���@%��V?�@��x'1'@�E|�@mej�ϟ@]�4E��@e}�FP@�g�K�)@ ^���<@!��ȂЎ@"�!V��@$y�e|@%R�CTP@&�#��@(��uU�@)�G�H@+'A�k��@,�����@.k�P�@0�4��@0�a�T�B@1�6q�z@2���@3�1۞%@4ױ�Tݚ@5�x'�H@6�����W@8DӺ|�@9=�ՠ�?@:l���,U@;�p.oY@<�\q_�@>/rb_)�@?����@@o�}K(�        ?���V
?P��n�ݺ?r�i1?���yBwZ?�7��VbY?�N��O�:?�\]�%?��,��-?�x~���d?�$��X{?��/���?�bj�:�?�cLۂ �@o��Ϣ@�ˋ^F@�RYWj3@���3@pv��@"�'���@'[�����@,j�Ri@1ݙ��@4b�
] �@8���N�@<9:`��@@i����@B�ԓ='@E��2�C@HБ��*@L&8����@O�6���@Q�^V�G@S��[ŭ@V2�;�m�@X���wo@[/xAϒ�@]�Xq�@`i�oy�@a�z�$�@c�����@eF����@g�&C�@h�%�X�@j_��@l��O�|@o(��C@p�:����@q�|J�<@s�9+��@t]�O��@u��^�I@w⻱Pu@xw�_��@y��}�@{s�4��@}C'��@~�N�i>�@�(kC2��@���e�y@��{��@��yNR#@�Ƅq�MI@�����\        ?-g9��*?]�(Ib��?}�m�&?��4+�n�?�?��8?���D�N?ĝe�kA�?�T�|�=?۠8� T?���L��?��wg]1�?��!HLz?�� �sd�@��ƣ=@_2���
@��I�u	@�.RK�@}�^`�\@!��:�@%���7��@*��b@/5�S�2�@2{sU	G@5��p�ga@9A$�Kp�@=,܇�ɫ@@���3U@C�O�@E�JU|��@HUoi�f3@KDlo�1@Nhc�n@P���6oX@R��^��+@T�Ö�V&@V�X�P@X�1Y�0p@Z�Wܮc�@]+�Wl�@_���~9�@a2d��3@bg��2�x@cʈ$�@e<I�@��@f���4Z1@hL�:�:@i�%�&j@k���a�l@mW���0p@o%H�V@@p�Z�z3}@qx��4�@rw �G8@s~$��(@t���,@u��6 �@v�Zmv�@w�F��b�@y!?����@z\�C�/@{��E_�e@|���o�@~C.�C��        ?���X�F�?���%���?�$�S5C@ �VU�Rb@�I+��@��y��,@$U��C@,�j$\~@3�D ��@9�� �{ @@��f��[@D��F��@Itl���@N�`�睅@Rs�U�@U� m��@Y�)��5@]�_�u��@a+����@c��z2.T@fe c��@iY-�:@l��:3�@o�־g��@q��|x>@s΂�4�\@u��q�y�@x(/���@z�ڰV��@}��6@�Ժ;�@�D��-�@���.8	@�L��	{�@��}{���@����c��@�j_�`.9@�G���8@�8{:'7�@�>����@��p��<|@��M̨��@��=H1@�k�7@�T�ڙ�@��8�7c�@��5Ƭin@�J+��yd@��J��@�*ß��q@���ׄ��@�=����@�m(�,��@�B!�(��@�ϙ���@� PϾz�@���4��@��C����@���-*@��܁i��@��+؆�i@������@��^�za        ?c�/���C?�v�I�e�?���;��?���d�-!?�0���!?����� ?��<MR7�?�f�]$�?�D�ɦXs?���Fr�?�km�-�
?�rkR(:�?���[ga}?�ѽ�
��@��Ӗ?�@�^d���@����z@�3�@����vw@�Sf�@����]@1�2�q@�TU
C@F�8��@����a\@ Iڲq1�@!�~�\X�@#R-~)@$�����@&�!���@(n�6��@*J�B��@,:�F��k@.?$�(ٗ@0,"�+o@1C$&o;@2d��}�@3�ǷNm@4Ǌ�|'�@6	ko$@7UB���@8�\"S�%@:d,��u@;{qך#g@<�zC�@>w
O��j@@痰��@@���m�@A���o3@B{�Ϊ�A@CY�K�@D>΋�E@E'����@Fw>��@G�<��@H�@�c�@IIŜ��@J�m�|@K�5 @L,�I��@MD0��'�@Na�;7��@O���H        ?)�ɞ��?_��i�#�?��t��vt?�5���,�?��T=2]?�m���3?Ȥ�$E?ԖAk8V?�A����?��"ҩ%?���(�pi?�'Nh�N@@��jy@���0=@Z1 �d@��&ƶ�@�ճ��@'����@##�DIV@'UZ9�Խ@,#�H�º@0̂�,�c@3��G�U@7P���,�@;#7]��@?[�b��@A��(\��@D�SIN?@GE�a���@J>�U�#@Mr$r3@Pp��j�i@RFf�)i@T:���m�@VN|�K;B@X�x�=le@Z�(?�W�@]F˴f8�@_ٙ�)
:@aF_%>��@b�,{c�}@d*?�%��@e��:�o�@gOLU�r�@h�EM�3�@j����5@l���)�@n\�����@p$V�@q"`�ry�@r(|���N@s6�-�+�@tL�~�)�@uk)_��@v���l_�@w��| 	n@x����/�@z56��v�@{| [!w7@|�K �B�@~"�w�e:@���Zc�@�us��H�        ?T��-b�?�iGVB�?���4D�?�[Ŋ�3�?�,��!Y3?��� ��=?�V��{?�O�wpj?�6 @��?�WZ��em@}<Aπ�@	K=n��@�&W)��@,��P�7@��"�/P@"Յ�"%@&�*Y�i@+�j#�4�@0�P$U��@4}�*�Q�@8w�Xi�@<��	�l�@@�2�q@C���n�@F䙤vuX@JNg+E57@N� �@Q�Eh�V@SF��p @U�c�إ@XA��bu@[%P�z@^F�dQ@`�3� ��@bHp�K@d�֚@e��?���@h�h@j%`m
'@le�gip^@n�l�a@p�͋x%g@q�d��@sP�LyΒ@t���e?�@vB�b'y@wԞ|�<�@yxƲ�p7@{.޺i�@|�3�)�V@~��->@�_���o�@�`:�
��@�jBU];N@�~�_V@���%�a[@�Ç2���@��g&j��@�1��˗�@�x���>@���&�@�$^���@����Wf�        ?�x��r?��۪l	|@ۉ���0@%q]�Y�@3S1�B@>Mɹ -O@F2N���^@N�X�2@Tl=�Ή�@ZG�7VvI@`|Y�1D@dC�Z�m&@h~��:i<@m1�̲Q@q0���ɝ@t	��~�k@w&�xpC@z�yh)��@~7���h�@�9-MF@�;��d�P@��`��M@���)��@�����u@�d:�!C3@�,��9N0@��Sd�
p@�d���A�@�"���s
@��@�D�@����G��@���2F�@�X5ވ@�=we���@��V2�w@�����m,@�;���5R@��ͧ��@���"�@�M3��p@���B�@�E��o�@�֞Z���@�u"�|KT@�!�j8�@�n�쨖@�R�[r��@�>?�98@�1<*��@�+�J��|@�-e�E�b@�6�Ѝf8@�G���@�_�Xm�@��Q��H@���N��@��sVB�@�F9Dvb@�MQ���@��BG�ل@�q���@�	���\@�̌A�Q�        ?R�z�Q\?��=�[R?��,�d-Q?�OǾ��?�����?�nد��?�o[���?�g�c��?�S��<�?��L�?�G	��?�S�3��?�M�̧?�}���n6?���C�C@ p	5Q@�($��@(��
B�@�eu@z9�@iY��N@�9��`�@��o\a@�v�@	X� ��@P���@��O���@G�K��@ |Z�>��@!��A�x�@#c^}/�?@$�<9�l�@&��ƷX@(G�X?�@*~L-o;@+�����@-���4@/���{�@0���p�@2�V*�@3,��`X�@4V� ���@5�ė�]�@6�A��y@8! ;@A@9eoI+Gw@:�9L�_@<+��C�}@=�t�oo @??�@@R-�dL�@A�Ƶ��@A�б.t@B�^�/@C�x�!R@Dy)�o��@E^+�i@FI�$��@G:GB��@H0��BM @I-)���c@J/aLX�@K7��>��        ?B}}&)|?s�A�\a?���:�m?��G3v�L?���Mk<�?�{Q+9�?���vf��?�g�"�l�?����c�Y?�]�	
?��M�B`@ �ܨ��@Ȝ���f@t�E*z@n`��)y@���32@ }7�@&@#+��w�@'l���@,L' ��@0�յ�r@4�7�@�@7��$��:@;vJ� C@?�����@BE�#@"W@D�p�V6y@G��~d@JГ锝k@N(X�`~x@P�xBf@R�"��y~@T��l��@W5�m�@YwXH|�@[�L��'�@^��xJ�@`��K��3@b4�T�2�@c��k0��@ei�bN'�@g#z�\� @h�:x�W�@j�F<ܩ/@l�β%�@n��:a<�@p��#���@q�w{zd@r���X��@s��
���@u:G,���@v�2wԹW@w�[���@y9�X�ߕ@z���$�/@|���@}�tP@�@-�����@�c�nk�~@�6X�LTK@��e�+@��R�-L@�Ѷ���x        ?O��{�] ?~�A�ʖ�?��EY�Ө?�Heg�?�kS���e?���>�x�?��T�.!�?��4��?����9�?�~u�nv�?���uWϚ@�W��k�@U��=@	۹y��@	�I5EH@�t!�\<@b�n���@!��.䪲@%���� �@)�竼0@.� ��@2��n�@5�1�@8h��1�`@<�7�@@ ����@BJ	GAr@D�*�sZ3@GPR�)��@J#8���@M-}�Bw@P8Y��Qb@Q�-�[��@S��n�@U�i�HT�@W�<W�?@Z%��@\���\�e@^��9E��@`�xfl@b/lvU��@c��4Z@e&�IH�K@f��e��@hg�g� @j$��|�@k�%��'@m�5�a�@o�r��@�@p��}b�@q���.��@s��L�@tA�<�P@uq��I��@v��h�t@w��$�H@yGuie�@z�|���r@|>vV u@}��'i@��6k\@�Jen(�@��,�h&        ?�"�)��?�Y�a�
@%��a�@ q��>�@.��pԸ@9X:!�c"@B�g�-��@J�AG'@Q恽e#<@W,F��U�@],�{?��@a��Q�@e�L3u�@i���T�@ngR�l*@q��[��%@t^Z���@wE�o�@zfL]��@}�%D��@�����@����^�@��Bܸ�S@�̳O�N�@��gEo�@����1@��}�vV@�k����@����#s0@�[���<�@��hRBA�@������@�TX�G�6@�#�NÛ.@��`6�@���|�s@�D����@�.L}uB@�2�+�c@@�X�
xQ�@����r>@�ŏ[���@�*��@�]�T Iw@��D�k��@�!�68�@��ބ�B�@� ��@���{��@��A�N�@�i�.�?s@�@��@����!-@����sa@��ɤ�Uq@�ֲJl�)@���q��@��}�� �@�ɇ�Y�8@����E@��9�H�i@������O@�m�wb�        ?hZ��10�?�_R�ua�?�*jf��T?�%��ޭ?�%��U��?���()�?�
3H@uV?��;�?�*��?���ؼ?����f��@���S�X@r�S;��@
��_�$@^Gw�(@6=kY@��(��@���^@�i�g
(@�wj<@ ��MT��@"�:Z�aI@$�����@&��q�@(�%���@+���g@-��癭^@0+d���@1k����A@2�N4@4T����@5�q�>�@7�#�}J@9<M��E@;ƪЏ)@<�^�G@>�$2^�@@i��2s�@Au%�G��@B��f�@C��d͘�@D�Q�E@F$U�D@GCpUP@H��'6�@I��xb��@K3���V@L�P>�T@N97"K�@Oz���>�@P}�z��@QA�粥@R
�� �@Rئ��p@S�07��@T�p.�@U^o�$�@V?5�d~@W$�¹
j@X0�A�@X�s��@Y�Ժ�]@Z��4�9        ?E���9Jb?x�i���E?�v���>?�n�|�j�?����S��?����˦?�g=���?�Ӛ q�,?��{Y�M?첂l�c?�$�%��?��{�B�@��37�@�?'�
@��V8�@Oe 8Y�@���:�@��j�]�@#�g'8��@'�6|<�*@,�PNz֒@1 ˫�l@4Fk���`@7�]P��@;���-�@@�s\s@B�~\��@E/b�[�/@H���%@KN��ɬT@N�@�T��@QD� ��@SK��;;}@Uzc*[�N@Wфl�>B@ZRrb��i@\�Vj��@_�P4u�g@am��#�@cg�	�j@d���W@f����@hc�u���@j^�V�w;@lr� �q@n���pף@pt/���6@q�8���@r�3@t/>k��t@u�s?���@v�>\�sl@xc�=m�@y���6��@{u��Vg�@}�M�@~�4���B@�<R�-! @���i @�
�n��@��� �H�@��I�$�@��y#�        ?Cx#fw�?q��I�?��{!���?��?3�l�?�|��� �?¾�S���?ϥ�tm,?�3$z}�?�-�?9yG?�"�_�@B?���x��?��	�A��@�  u�@�2�T�@.���T@���Ж�@�Q<-�@ ��
�@#�C��dy@'���.�k@,���@1�����@4���[]@7�97,�@;I��h�@?uS��@B%�ʭ�@D���Y�@GA�[0n@J7�cTbo@Ml�ғ�@Po��5N@RJ�1��`@TG����;@Vg5���@X��Yy7�@[�y�a @]�4��W0@`*d���@a��
���@c�k�@d��9�=@fY&�X��@h����@i�(��@k�]��@m�j%�f�@o폋��@qLI7g@r.�w�@s[mq;)@t��ճ��@u׬֖�H@w'.t!��@x�\���*@y�F.1)W@{[�(\��@|�pD��@~d�h7�@�@
��"@���P�� @���d��@��-�#p        ?ц�}�de@	�l
�@&�J�@/p�,^�@<bZ�K�F@F��@���@Po�,�U@V�#P`3@]մg�|>@c�k��@g�L�ޚ@l�U�@qR\G �@tx��z0�@w粝�)�@{�L"�@���eIi@���T
�G@�H�Ixŉ@����a��@�\�����@�"�VnA@��3��@����@���
�o@�q��]@�A��p@�*;S$*�@�+�whZ�@�F�n���@�{�
ɭ�@�e�(�@���,?{�@��J�\�[@�-��bQ8@�����oz@��\���@�p�ݺ@��;�U�}@��<?�f�@�/�9��@��9S�4@�NЪ���@�4H�`��@� ]P�h�@��]�@�䋩@��K�i�@��[�H@��ΐ��@�0l]x@�H�9O+I@�gO1���@����F@����ܽX@�� ��0:@�5�N�j@�.T�Tt@��4ӛt�@�uG�P�8@���b,�@��=����@�xC�A#        ??
:���|?p�5��F;?�S���?�Q����?�T1��,�?��lWv�N?�;�Gw?�Q-8 ?�
��E},?ؼ\HZ�?�Fo���?�X��?��a��?�$}���?�:1�|A?�r����?��}���?��ͯ��?�}�ĕc\@ �Γ��e@�@���@�'~El@s|���D@
�|i+!@�}��@�V�F�@[^�*G@��.F��@�H��{�@�X@���@l[���b@n��?��@�ҝ���@Êa]!@@ �`�l�@!��Ƀ-@#	+(I�@$]܄�@%��!&B-@'4��lh�@(�}.�~@*KMi �@+��6�@-���B@/iv�ĸ�@0�5�fՏ@1�fW�F@2�a�W@3�=r@4�Лe�@5�:�1@6�`h�'V@8
�}Y0@9>n���@:|x��'@;�X�"��@=*�M�@>r
�m/@?�h��z@@�3`4��@Aa�<Z��@B$ U��@B���>�        ?3��e'�?g�
ʺ�?��v5��?�<�@�Mm?��Z���?�<��0�?�mA��W?�(#� �?�Ĺ6 �?���P�?��T��?���܊@0:�@Z��I�o@��31@"�l#�L@�����@@#4�5׃@'�`�$q@,�%t�@1n�8r��@4˨%D�@8��S�Y@<�:�@@�K�:��@CD�}���@FK�9@I�_-@Ld<}��2@O�+��i@Q�m��3@S����|@VT8/��@Xe���@Z��(4��@]qAr�D@`p���@a�({���@cp�@d�y���@fR��x��@hח��5@i�Xh�c^@k�g!���@m�B�Q;�@o�)k�@q���p\@r#���H�@sML�u��@t��ga@u�� :�@wo)�5@xdM9LG�@y��ne�:@{5^X\L�@|��:�n�@~6�ܹ?I@�jn�@��Z�C[@���u�U@�iOa�a @�M\U�<�@�8Jd��9        ?%;?�?W����?A?x��ӵ�I?�U^��y?�Y0���?�^s��1?ç7jG�?��/�cs�?��d�<�?�͞^kI�?��k�u&?���dF �?�rv�X�@���n@:�����@�1J�td@}1�6��@3'��5@!n��ޖ@%E<���@)��=p6�@.��7e�Y@2��_!@52^�51@8�/�z#@<j��p�@@H�r��@B��a���@D��Y�р@G�Dd��@J��[ч�@M���\@Pp�t�G@R3�T��7@Tm�a@V�ĩf@X1e(���@Zo�Ud��@\��E�g�@_OR�2��@`�	��u�@b[�	�>�@cЊ��@eWc��v�@f�ɯ�M�@h�M�
�@j\�r�:�@l/�L_ �@nBw��@p	y��@q�W(f?@r$I���@sB�:@tjz���R@u�q2u�@v��Y�%�@x'��"R@y|�bCk@z�V�\�@|K�V �f@}�.��h@JŶ-�1@�nS�q��        ?��o_�`�?��L:1�?��(����@D$��m@��;ѡ�@'[��mR�@1w M��@8����@@l�H�߉@ECi����@Jʹ�$\�@P��*�d�@T��r�@W���Xp*@\*ߏ�9@`m�y�M@b��f��P@e��^��@h���t@l��.��@o{{�eJq@q��L�@s��-T�@u�E��L@w�B�V�
@z[��1�@|�ϧ�	�@��h�@�6��v�@������@�J�&��R@���Fh	@��=Q�A�@���]�X@�v��5:�@�z= ���@��s�]|@��[���=@�
B�_@�<���jy@�{�s`s@��"�K�%@�!����@������@��A��b�@��g �h@�'F�P�@���C^�@�-�X�Mi@�rd�@��t�jx�@���)4@���%�@�̸>sp@��:w�1�@�ۚ-J��@���ע�d@�
P�i�$@�-�P�Z@�Y�{%�B@������@��n�@��_���        ?dv�)~�i?��Y��?����?����m�8?��aۅ"-?ӓf��3�?�}5D[�k?�7�~e�?��P��v�?�mx�1Us?�l+P�t�?���P���?��w=��[@��U�Cp@��!d��@��>(Z@Y��'�@�cS1��@T�M��@gdϤ�@�U�=�V@�kTo@a��K�u@�iGC=@��\Z�@!EQ��Q@"ģ�3-#@$U�<D.�@%�O	;��@'�焞�6@)v�	0E�@+Q�[v@-=�ua��@/=&J]h�@0��
D3@1���@�@2խT���@3����Ƴ@5)�q�F@6bzc���@7����@8�$��@:GaDq`@;�	�L�@=Ju$�@>�V��-@@0��`�@@�Kd�uH@A�z��{@Bh�����@C?�$�@D�s��`@D���h�@E�MH'�(@F����ug@G�^���@H�ȹ�\@I�'�t4@J̃�;��@K���@L�mPGu�@N�_@O#	K�z        ?FБ}���?x-��A��?�Ob�&|�?��W���?��
�O{z?�:�T�/?���<�b�?�d	{�J?�JQM|c?�&W��y?�
`���@�k6�@�=)/Q@d�ج �@&M��@�q���@ ��T���@$��k���@)3bbYM@.\Ј�ځ@2j~I?@5f	�@9`W�>�@=(MOn$�@@Զ���@CM�ԛ�j@F �r_@H�h��@LD��J@O���t@Q��9g�@S��ޤR�@U��'�4D@W��an�@ZHN��@\���� @_o\�c<Z@a8�Nz@b�π�9^@d�*��)@e��BL�]@gc��5�z@i#qa�~K@j�Y̞c:@lن���v@n��yRd @pl5���@qy|#���@r���7��@s���Hj.@t��:H@v�G��@wAs�I<T@x�Ᏹ��@y��b��@{"����W@|�E)}@}��O�@S4�x�@�e�@�$�	֐�@��X�7�s@��/����        ?D0�C��?q`h?K�?�5@�D?��;��?��0[?�? ���R?�����?�����?�1��+C�?�B�4]?��4��=F?�t�
IX�@�ġ#X@�+�]�@>UD�˩@}���@��"@"�P�-�4@&��*k��@+�$q+�@0Ρ����@4%�73@7�C��@;�.��%@@(�a"��@B�5���/@En��f�]@Hvu�:�M@KųP�pM@O_�TJ�@Q�23���@S�Y��a@V	��v�@X}!�|��@[Z[U�@]�5}P�@`y�t��@b9�s!�@c��إ��@e�����E@g��x�cO@i�Z��"@k����@m�=��@p)�_�')@qjZ�$@r�<.M5�@t���[�@u�,��DB@w����@x��ID��@zHY����@| ]9���@}��!��@���r<�@���C��b@��-�(�@�ۧ�(@��l���@�����@�?�\���@�v��rt@���9�~/        ?�o�HOy�?�	�N�2=@�u�4@&Ȅ�� @4w͞��@@0�&y��@G�VK�uX@P,�K�JQ@UHJ���T@[�?�j@`ԁ�V�@dx��=YL@h{.Cfq@l݅5&��@p�d���?@scw�͕@v'�U�k@yL L<�@|G�c�`@����c@���J@�}��2ͨ@�z���M@��J4�Y�@����{�@��6O�@�|"�D�@����H�@��=���@�/�.j@���0G@�v�F@����t�@�9�B�0@���a>�@��2�~K@�Y�y��@��$��@����#�@���(f�s@����?�Z@���=Y@�Faç�@�,I��c@�KIb�q@�rh���@���E�E�@���}�@����}@�b]��+�@������@�ʴ[�}@��6�u@�m�}�9R@�'���#@���,�%@������m@�qD��e�@�=~=)@�Y��͙@����Ǵ�@����n@���        ?H�n{��e?v|�燐?��$ T�?���p��?��'+�	?�=O��̘?�4��=?����e�?��:��+x?ݑ�(d��?�T�a�?�ԨB��?��-�v�?����?���a�c)?�6Z�x>�?�� Z,�e?��LM[j@���:Xr@�9�*@�3�-�@	Q�wT:�@F�1���@q��x"D@i�_��#@7^|Ͻ�@!��RU\@*{��cl@Q�+�D�@���S�@��w��a@ A���xe@!�D��@"�=��@$m�x��@%����@'��E��@)2���&@*�3E�@,�L����@.�&zWk@0A3�<]@1A?�E�w@2J)���@3[�A��C@4v��i�@5�D��7@6��7\�{@7�9x�(�@9:��Z��@:���:�@;�J70C@=+��	W@>�R:()e@?�!7%@@��{b<@AvՈ{�L@B:��ZA�@Ctd�F�@C��� e�@D�;��K@Ezl^2@FV��v��        ?9
����?n$*c���?��O�N?����It?�}L�W��?�p0(�I?�<��� ?۴,]Dr?�4��Ύ�?�8P�~.s?�?��?�պY��@��G�P@��d8@���dvM@����Ě@��P�@!���d@%�۷�p�@*��|/��@/�jl(�@2�d��@6V�����@:�K��/@>F1-�b�@ApS���@C�	���@F�����@I��͓��@L�ur�]�@P>s�=��@R!��aO-@T'r�́�@VP�sg�R@X����s@[����M@]�ɏ�@`4��N�@a����f@c.��~"@dɮ�|k�@fy/߭�@h=]���@jzT�-@l���{O@ni��@p�,b�@q(Y,4��@rJ�آ�\@sxb>.J+@t����@u������@wD	�S�@x�w�,��@zDX���@{u{�c�@|�*G%Jg@~z[�x�p@��E|'@�ֻR���@��<�5@���7��@�hА���        ?3%�v�?b��{�?�>!�y�E?�b����P?�&N5-0?����Q	?�_����q?����?ߧ����?�:�l}��?���Ǎ�p?�p��v�M@�����@�R�J��@z��t�"@g�i��@���@ N��}�@$+����9@(���β�@-�Nȣ`~@1ĺ��r�@5+@�8�@8�hw�ѥ@<�.#J�@@��e�@C����[@E� �E�'@H�o��@K����z^@O(g[Y*@Qg%�Gi�@S[��i@UrT�`@W��F�@Z	�4��@\�fO*�?@_0��J^Y@`�1R�0_@bw4��U@d=� �$@e����@gVf��}�@i�ӛ?�@j�~�a�@l�γ�J@n�Dx��@p��_�P@q���W� @r�x/���@s���� @u�e'�@vaC�Z)/@w�����&@y���[@zg`�T�@{ԸY���@}M-L]��@~�ԉQ~$@�/�#(8@���<Ο@���&*d @������l        ?��;�5}�?��t&�8?�:aX@9���i@!ksZ@+��I�@4�H4�9�@=~>���@C��;z/�@I��m��@PV7/`@T?!��@@X���i�@]�m�H\@a��V��
@d��z�'?@g�b��gN@k���W �@o�w��@r�,��@tf�M-!@v�ƻ<z@y�"z��@|�X&r��@�����@��s�JS�@��^�Pi�@�w���
y@��n�;�@�������@���n�_@�m���|�@�|�ʚ�I@�����O�@�8����@��tb�'�@�6o���@��)*Z�@�v��I��@�/�G;��@��p	�xg@��G�>�@�a��C�k@�aQj x�@�i�o]��@�{UU�`@���#cg@��	%���@��b��k<@�2rCڲ@�^����	@�����@���I���@�Zl��m+@��]�E
U@�A�O�@��~���@���&
�@�d���G(@�2�dH&�@�b�ls�@��k首�@����i        ?c8�f)+�?�wh�S��?��/�I$?��L�L�X?�4b^H�?���H��?�媊�b�?�sש=�n?�ig��z?�V����y?���n\ �?�,�Y��@ �ӿItn@+b��d�@��	�v�@w�=�"@��W���@���@j8Qc}@�e���d@��M{�@�q�;d<@�߬���@!{����@#3*�� �@%hM�8�@&�yx
�%@(��$B@*�&�Y�@-![�9�@/d�x_y�@0�	�6�@2 �*g�@3`��؍�@4��5��@6Z�/d�@7��K�e9@8���~�@:���1@<I��S�@=��N�'�@?rX�Bk/@@��9�9h@A�*#S@Bq�ۤǀ@Ci���f[@DiuY�&@Eq�ҍTr@F�:,�j�@G���d @H��pb��@I�3�:�@K�[��@L[�����@M�y��@N���ڙ�@P'�T4+@P�<�Ҡ@Q��V�w�@RM�R��n@S�v��@S�>�U��@T�}Q�        ?:J�jh?la�VX��?� ���&4?�2�a��X?�F�<8i?������?أ;�3U�?���=wW?�����X?��І0@�_����@������@�!��l�@+%��@�N�}�
@"��@&`�#�=@+f
tp]@0�onL��@3�Uƶ��@7l];��#@;x!pqGS@?�3Jl@Bs	9'�@E)�L$�@H cyW{�@KZ����@N�+����@QP6�\@SX���˙@U��ޑ�@W�!@Z]Z��@]^�T@�@_�۸��@ak*1ҕ@b���KF@d�:�/&m@fmV;��@hE��@j5ʒ�e/@l=�^O@n[�����@pI6���@qpr�>J�@r������@s�����@u.�(z[A@v�3���v@w���gs6@yY�$Zi�@z��W�9s@|]����U@}���ּ�@��3��@��Ω�R@�z�t3W@�\y��@�CN���d@�0MT���@�"�io�@�W��@�Z_�>�        ?K3{��
?xm�{{!?���O���?����o�?���^�f?����P�?���wr��?�<u�?��j}�5?��x��?�Q4Pm�s@U=����@��n��@:#w+7@���K7D@>����@#m�l��@'�����@,�wP�o�@1|ťD��@4�ڔrO�@8�jAq�@=GY����@Aժ�8@C�%gc�@F�έ��~@J�ď�@M�V+�YH@P�{�N��@R黵
;@U1��p1^@W�����@ZF����@]�	�L�@`
Q~ќ�@a�殁�@cRD\���@e�B�J@f�y�aN�@h�\&%+�@kU�C=@mJ:�'ة@o�7,<I�@qH'��4@rG�+w�E@s�(S�K@t�WwPЂ@vn��1�e@w�h��z@y�86�@{�'�:�@|�;J �@~��\2@�0�h�S�@�!�G�z�@���I��@��Jd@�'��r�@�:�CF@�UڅRP@�z��9z+@��8���@�޺�Q        ?��(S4�?����s�@9��>I@"SV�a�@0�0w��6@;p��Z�@C����@K����@Rr�}���@W�RڊK�@]��tA�E@b?��(�@@fSp�@j)�� (�@n���o��@q�mw@�#@t���B�E@ws�-�@z���u�@}�_�I4@�£P�I1@��h2�L�@���,�q�@�ҳB��@���j�@�rz
�*�@����o@�E��4�@��1��X)@�"���@�����k�@�)�~�@�����@�a���l�@���@�@��$�@��1�w�@�\�A���@�]�y�_@�fExf@�x���"�@��$R��|@��<�MP@��Y*�@�!���j@�d}Cy�1@���r�}q@��Eh��@�p�h�aB@���׈X@�.�An@��_��@����5D�@��NZQ@�eg�4eW@�B�>�`V@�&��ո@�*aXI�@����S@���^F�9@��ۖ5py@���_�v.@���uM�        ?mK:�b~?���i�X?��,c'��?�&ҏ��?�+{!r�?�Lre?�	U�֯�?��*�9�?������?��m;"�?��Q��@��Ɩ�@4c'�@
���B��@���t]B@��ז�[@��G�97@��] !g@,l�"y�@�%6�@!�&�?�@$!�"��@&p� UA�@(戚�9|@+��Lyc@.Jv�5D@0�CXZ}@2*�%��@3��:S�@5�yܚ��@7W��-=@9?�6��l@;?��ue�@=W�q�%@?�z���%@@�O�$�@B8�a�@CZ0�m:'@D�q�B{�@F 9uZ�@GgŻ�@H�Q(�@JaӦ�@K�/ص�z@M��d0�f@OC$^q��@P���!��@Qg���@RT�C-��@SJ0�w�@TGD�@UKpfҸ�@VWto�0�@Wk!(��@X��aلn@Y��b���@ZԦ�\L�@\���P�@]BJi9�@^��^@_��Q��@`�v��f�@a?��C        ?0r��*B?`�m� R�?���� Yr?��<��:?�H�����?��t�ߖ.?�u��J�?��IIE?�%̘E�?��H�Q��?�� m?��
��>O@ �tz��p@9��qS�@Gxnzo@�F����@	�+&��@�X�@"�F�#@&�����}@+]R���@0Z�Ϳ)@3_�O��@6Þ�X=g@:�[�Ț�@>��X�]@A�aS��@D=��\�B@G�~Y�A@J`�Ia�@M]��aw@Pwߥ�U@Rd�0A�@Tv����@V�F��� @Y�[��@[��kG7@^L�B�xp@`��>�!@b�� @c�9�ń@end��@g;Y>��@i!�^�m&@k!>��O�@m;F�8@oo�w��@p߹�柘@r�{�rt@sY�p��@t��C���@v.m�Y�@w}]_�]<@x����,�@z���,�m@|*�#�m@}ٔ�g�@���[r@��}��y�@��_��`@��7�n
B@��6���c@��'ӪF�        ?U�D�Х�?���D�T�?��00ej?������?�`���`�?ε�ܯ��?�0�A>0?�"ͦ�?�4<B�J?���kJK?�w�{�N,@	�f'@
ܥ��q�@�V8�@�TJn��@����t�@!�	H�Y@%�#�f��@*�@z�@/�T�K,@2��v)�@6X��٩x@:�z|� @>9%rc�3@Aa���Y@Cܫ2bC!@F��.��^@I|�9:C�@L�z�P�(@PJ�T�@Q���	@S��Ddg@U�	����@X(Qw�R[@Z� (�@]�&�@_�ƈ�@aQ4kC_&@bԒ�q�|@dn7����@fܷ�Y�@g�:�V4i@i�
[,pU@k�O�+@m��:�ъ@pH@q&�G�9�@rY�M���@s��9�~@t��wD.@vIIb�E	@w�4����@y4�+�@z���!�@|_A�5��@~�]6��@�1(��"@��$���@��8�d@���pI�@@��p��@������@��)�+��        ?��K�%�?��yv�n@J�߹@+鞟x8@9+�"n$@D����@Mla\|� @Tb�L��?@[�;���@amok4p�@e�?��@j�kd �
@pF�K&�@sl6o���@v����-9@z���H�@~�4Je@��e�~^@�>­�@��0K
@�@��}�g�J@��~ɷY�@�%~����@����q�@�֛��|�@�ݞ9'��@������@�L�`a��@��L�F�;@�B��Z8>@�� b��@�c"2��@�ߺ�eQ@�oT	�V�@�[*�a@��9P�!@��Z�j@�t+p=<_@�iו{@�9�Ȕ�@�J��q@�e�H�@���q<?@��)v���@���P.p@�H��x@����Z�@����@�q%�jf�@��c]gk@�v��<N�@�e2Ʃ@��*j(� @���Ŀ��@����@�vBN at@�c~0���@�Wȥ]��@�S3;I@�U��;@�_���|�@�p�:]@ʉ��F|        ?AeZ�7(!?s��:X�b?�_��T?�?��o9?��'r�\/?���[�?��Rrlnp?��5o+H�?�IA��x�?ۅNiQk+?�T��=5?�]�~[�?��Mu"��?���lW�?�?�� ��?�N�&C 3?����iB?�F��
~@ &�"@59�N(�@x�/%OY@�!e@	y/�%�@9-�ó�@%i�=��@��3�n@����@�%��@TTJ��@AS�Y�@G=|s�[@fT�͇�@�ף�B�@ x�l�B@!���Nd!@"�<p@$A��=@%�� V�@'
�����@(��Xp�@*
�*���@+��n��@-Ch�@.��#�Ԃ@0Z{���@1A���(@20w��a
@3&I�ߓ�@4#H�4�=@5'k�Ӊ�@62��	��@7Ep���@8^�fo�V@9hK@��@:�Fz��@;����6�@=#j;@>L�b���@?��_ٱ@@p���E@A�e�y�@A�.�Z�@B~p�Ʀ�        ?E��~#�?y0GJa��?���ɜ�?��X_��?�_ك3��?�Wo�?�����"?��݅sr?�(ꇴ4�?���V��Y?��\��@ �ʸ��W@�f]�@��E���@B9���@�@lOa�@{p�UE@!v�Pi��@%/���:@)s�Ӽ�@.M�j/s�@1�&��T�@4��<�y�@8d�d�|�@<2���@@2P��\@B���7O@E+�$�@GŚe��[@J�:ho#�@M�h��J3@P�=�YN�@R�`a�@T�;�wc�@V�窗�@Yr�+@[|�-˝�@^0{I:�@`i��W��@aݔ���|@cfO����@eE�<j�@f��d�V@h�����L@ja�ߠ�w@lX�T��@nf�
	�@pF((�}�@qd�	;h�@r��yU8@s�)�V�@u
���@v[X&x}L@w���/ga@y"�u�|@z�Y�b9@|-$�o>@}��FD�@Q�܏~@�؍O�@�]�;4@�C&���@�/��݃z        ?U�O[P|?S���9\�?v����?��o�s�?��`��?�0�;��?�'���1?�vu%�s=?�����,�?����E�b?�h���?��ݻ�_<@[�_�e�@�`@���@<�؎.@�Z+��k@Ug�$�z@ T�k��@#�#r���@(/I
<u@,�����b@0�F�ڽ@3�6���+@6��	ߙ�@:M���@>���ɋ@A	fָ�@C9��qU@E�c��M@HI�@JԦbB(�@M���w�@Pk�q�@R���j�@S��`���@U�k㰗+@W� %�{@Y�lo@[�(�+��@^G�{U��@`[Ѳ4C�@a����U@b���n@d`j4��[@eָ1> �@g\�g14>@h�K 5��@j��J�ys@lP����`@n�e��@o��F�/@p�S�'7�@q�,іb�@r����@s��n�d�@u�̤�@v3q�p�@w\P����@x�]���.@yɼ{��o@{��"�#@|]�LM@}�=�Ts�        ?��]���?� �k@�  �k�@�<���f@%#yle��@1�u�@9GW��@A�&P�E@GQ���@M�'~�ݛ@R�vQh�@V㇧b޹@[�O��@`Q��>@cHH��@f(�G�@ir�2-C@l��K��@pe �@��@rl�[0�@t��AW �@vߖ��0v@yM��Q�@{�L�u��@~�̆m��@����ր@�9��z@��m[f>�@�v��K��@�2�c�k@�]O�@�����@���\��u@��r�ys@��1�.�|@��EF$�@���%��E@�	%��t�@�J�3ԧ-@��0�?e@��sWܔ�@�Y��Y�@�͏�^�o@�N�F�L@���&n�@�x�����@���Y�A@�k�0��t@�MC��@�5@ݡG]@�#���s�@�psD�@���C@���1X@��rծ@�+8�]��@�?� 3�@�[ER��T@�}.��l@���i�s�@��7�8iE@����2@��m��o%        ?;آ֭�?l>VI?��x�t?���l�ʸ?� ԔA?�&��"?����b��?�^
zpD?�e��l�@?�]e'�?ٴ�!�?߽螏�?�AC��++?��ݿ��?�,��&o�?�j��?�^T��l�?�J �i{?��S��?�7��	�?����ED@(�n�@W0��@6����@o���ֹ@	���1��@F�14}@�V�^�@�ǁ2/�@D��\@�d?M�@]�e$��@b��@�/��N�@�����h@j��֧�@]b.|�@ 1�#�0@!>�����@"V9M��N@#w�]6��@$���,��@%�z��_"@'ǟ �Z@(g����D@)��<�\@+!KZ��n@,�����`@.'^B�@/����@0���f��@1Y�@d��@2,hl�`@3�piB@3�v��a�@4�Y�xv@5�\�x@�@6���a
�@7��ӫ
@8�����@9�j�@:�~9|�@;�g�Y�        ?'��ܜ5�?\>J�*��?}���j��?�6]H!Ȟ?��@qϕ?��]EI�?���|w?Ӡ8&l��?��2�ِ?�u��e�?�NT(3+�?�WNk��@i$�I�@	�h��@���~@c@��b�dH@���g�@!�=��˦@&�w~h~@+$���@0}�(��@3���s�$@7���r�@;Հy*s@@Gȭ�g�@B�^Fgs�@E�?�B��@H����>�@Le�qZ�@P<�l@R��B��@TE){���@V���s[�@Y7�K�@[�8+e�@@^�2w8
"@`����\@b[Aо�@d.􍠅@e��v,@g���F*�@i�.83@kR[<Y@m��l�@o�2�F`7@p��j�I@r)k̂kG@s^�j�a�@t�S��@u衇�@w=p��@x���}��@z\$�'@{z\f1@|��h��@~�,��@�	��b�I@��YGz�@��˕��x@��?����@�a�\�3:@�D�G��@�+`;�*        ?Nh�4�_?~L�CW��?�v>Q�?�	X~�Ԁ?��ba��#?��.K?ݤt�?��I��w?��j�g��?���� ��@ A^�c�z@��əz�@�X�׻@c��T
�@R��B@*~֪Ā@"� N��@%�E���@*��:Pl@/�-�ܗ�@2��g��@6*�V@9�jb2�r@>���a�@AI��װ@C̷f�5�@F��
`=@I��1~b�@L�Q~���@P+z�u4 @R4<6�@T ,����@VS�LA;@X�RR`Т@[4M�7@]�"R�"�@``%��z@a�!<�xa@c�ƺ�2@e6؏F|@g�kU�@h�V�Y��@j�S�Ҝ@m���[�@oI�	��}@p��JO��@r��k�e@sVkegD@t��ҧ��@vC����@w�|�(�@y"�b�-h@z��j@|pK�HV@~2V��s@�� �+�@����quZ@��fS�a�@��C�8��@�e\�K�@�,��@�S^��ތ@���9]�r        ?�[���s(?�n�H�`�?���e^OH@�2.�@!*�Y�@,�/f<��@5���@>�yF&'@D�^��v@KfE6���@Qc8�P�@U�6�Jw@ZMq⺧@_�o6�@b�0�,F�@e�\fe�@i���@mo��,�L@p����@s&er]�@u�̲[�?@xT�o�X�@{7IZ�@~No9�@��/ph��@������@�lM����@�f�[EL�@�~T�DX�@��+��(@��8��@�}#�Psq@��-ޟ�@�c����@���v��D@�M�`pN�@��l�EB�@��=(�@�59�!�L@��=�N��@��LMb�@��޺d��@��P/׆@���et@����$,@�4��k1@�d��"�\@���)G@�����K4@�:���@��c� )�@��C/N@�} �
�B@��#9�{@�Ik�w��@�tg�%@����׿V@��P�=�@������m@���ţF@���~��@�}ZԳ@�z�neZ        ?7.�a���?h��`f�?����V?���Z�?��,���?��/���m?��N�\ز?���	��Y?�8��M�M?�?T=SA�?�
��׀n?��u�
b?�.K
�{?�،�n�?�_^�-?�C��BP?������?�?�E|�?��0�HP?�qa��� @D��p-@}�,x�@�?7,�@}A된�@G~L��@E�wo��@��9��'@rg��n@Dy�FH@3ʽp[@A!��X%@mE\+�'@����s@%	�J@ �Μ��@"0��O6@#�)q%u@%h��J�@&��3˸@(>!��ʒ@)�V縒�@+��(Y0�@-�M��<C@/vև�8�@0�N����@1Ň�̂@2�M�[@3��}��@5$�<U^@6Zj({�z@7���ʛK@8����X@:A|�d5�@;� ��D@=f
�@>���]��@@�׃^@@׶;���@A����@B~,���@CZv��,�@D<�~?�@E%!��        ?&��8���?[�{�)�?|���+?���p��j?�J��_��?������f?ƯCD�DB?�`@���+?�77�輋?���y���?����Q?�:>,X!O@y'��Zy@���!]@*?*Ĳ�@.
W���@��<8�@ )�@�@#�uX.t@(Cl�~@-ECl⛿@1y�e*p�@4�QT�p@8<�z�:k@<2��~N@@H�u]N�@B�x���@EL�ۺ��@H%�:8�@K;K`�@N�m��\@Q�%��:@R���ODh@U	hS�Y�@W9���@Y�X�XV�@\*Z~�%@^�dr$S@`�tw@b'�����@c�,�8�j@eO��?@g�1P�@h��qY.@j��6�ɠ@l����@n�ĥP��@pd]�6!@q�!.Z�@r��� ?@s��4��@u d��Q�@vn�y&�@wɱ�k��@y2���@z�ǚ (�@|+CXv@}��!�@\r�@��X���@�c�[Ҍ@�I��6��@�7�j�
        ?<�5�窙?l�aZ��?�2�%�g?�݃���?��s5�'�?��*(���?��:�Ή?���]v?�0��k9?��K�U�?�����R�?�=Û��@�iډ@�@��R;�/@�-5��@��b��@�����U@����!@"�Z���@&���>_�@+z����'@0Y0���@3GC��@6�e�b�@:,��t#@>+���VW@AG#I7J�@C���$�@FEr�[q�@IB-���@L�2���@Od$'<X�@Qr]��Y�@SQ�՞��@UP�;,�@Wp��)@Y�m����@\Z�n{k@^�z���@`�K>�.@b8ۑ�@c�䔪b�@e�D�8@f����<@hj�YBy�@j3�w�w7@lDz�[�@nO���@p#;[@q7/���@r,����@sO�!�*8@t~i\�@u�E��A@v�q]p
�@xN�]�@y�UI�+�@{_��e@|�Zn�C*@~p�+q�@���w^2@���O�v@�hy_�        ?���o6o
?����Ip?����2��@	w�%�j@8��c2^@$C#IU�a@.��U�_�@5�����@=���TM@Cj�ri�n@H� ���@N��E�@}@R����@Vl��ޢ@Z��Ԗ'�@_1]R�-@bL̳�
@d�8�\$O@g���@�@k&� ���@n�z�^OJ@q=B�u5@sG��+P�@uwbӭ&[@w�y�	s~@zJ� cF�@|�L����@���e	�@�[w, �m@��� �@c@�����8�@�P�Iy��@�#���4*@�O��~8@����d�@�%#���@�)���Q�@�M)�*k@�|n��r�@�����a`@� ���@�U GÎ�@���Οbl@�&L��I@��3�Ϯ@�-���|C@������@�n�F �@��n��X@�t�e��=@�^���e�@�P�M���@�J_�7̎@�L�C@�U�B�@�gT�-r@����@��®���@�̙���@���|�%�@�8�;i��@�z�V�@��W��ft        ??����8;?m�q�� �?�����ا?�����*?�.>���?�.�ي�?�v@���?Ȼo�
�x?н�����?��xH�k?��bC��?�_�Tnͬ?�D4~m�)?�st�S9?��)�?���v6��?�����7J?�OƗ��?��8쨘@?��]`T@��Қ�@y	��@�>;x@	�~��	@��G��@�bO���@�.�TJ�@j�=�
@S�x�>@Z���b@�
�~I@�ɦ��@'h�v'�@ Ufp���@!�c�V]@#	��:��@$}c�.@&���`@'�؁u�!@)?^�6��@*����@,�6N��@.�	��\@0ID�`}�@1KD��@2V��]��@3l)��C@4��8�Pz@5���"Ik@6�a,	�@8)�'�{@9s���nB@:�ÄڜV@<(��80�@=���]@?
=��5=@@E�/d�@A�H�5g@Aהn���@B��z�Zo@C?�K0�@D[9�d�@E<����7        ?"۳�ǐ
?XHї�<?z��1;u?����D�?��~�?�V��@Q?�f���??�4�[%w�?�7ߒ���?�]V.l��?�u�?� ?�p[웯@ 8j��@�g\tp@�^Sv^�@���`�@�O��a@��%dZ�@"�q���@&�� X��@+K��RI�@0O2��`@3N;�`�@6�~.-��@:_F�Ͻb@>y�lvBm@A}19�a@C�����@F�{@��%@I��U蝹@L�-ǐ�y@O��j~F�@QƇ����@S�Nj5�n@U�'H�6�@Wޏ�Mc�@Z& �8�@\����w@_�M0�}@`��!��(@bF�ԑ}[@c��wCj@eF�^4�-@f�#KN@h�P��X@jMa��� @l�=�@n��@o����\�@q�պھ@rk3H�]@s-=��\@tQNY�a@u¼�5E@v��m�?�@w�g�,�@yJ�g
T�@z�Cî7�@|���-_@}xX���
@~�D�]*�@�<��y�@�����        ?*�$Ct?[�^�]ƍ?{c��҇?��XI�?�6(��?��nfh�?����j�?�.=��l?ٯ���ͤ?�焧-W?��m�'�?�:����?�iﵷg+@(���@	E!�CF@W�W���@Ť�*�@�r�\�@ 	��u��@#�y�R@'�D��@,`
��@0��1$& @3i����@6��r�S�@:����#@=�9R��=@@�k�u�#@C70��:[@E���=y@HB�v	 @K�p��"@NS���@P�F/��@R\�!
�y@T.��8W�@V@�%O@X(��Ĩg@ZQxn���@\��е9@^������@`�=��G@b4��"@cx�70�@d���� @fq�7�}�@h��d�@i������@kkm���O@m8D�v�@oۛ��@p�F�u.@q�XR�\�@r�R�\�@s�cC�ֿ@t͹���W@u���P�@w/�jJT�@xqCB�i~@y��!z��@{-�R�@@|x5�j�@}��`B�e        ?��1)J?�hd�{�?�{�m�A�@�by�*�@�� @!�.�5@)Я�/�L@2Nچ�G�@8�����@@<@��@D�z�v&@I�!,�+d@O���.�@S	�F@V�����.@Z��x�GM@_0����@bUy�%(@d��u]�@g��JX�C@j����@n_�>D��@qu>��@s���j�@u=gu�@w���@zP��j@|��B�@l�0��@�/+�V@���e���@�a��(�@�R��>!@��]�j/@��f��x!@����l|�@���f�E@���g,�@�1?��P�@�aJF�9�@���O=@���
@!e@�<�u1�@��&�ȝM@��#)�@���r�q/@��kN�@�����A�@�S\��2.@��km���@�d2�@�i@�L��ۚ@�;-(x�@�1�p�7z@�/!�u@�4��L@�@f�QJ@�T�K�v@�o$^l׬@����HY�@��_��Od@��WXX(@�%ܐ..        ?L�b��?{?���4?��0cDR?��Y����?��礒�?�HM�"7�?̌�0,�?�琖v�&?ڏ@���P?�#<P?�?�7Z�*?���r?�-�K��?�"�,�f?���gӿ�?�LRW��;?�f2�H�@n�W�l�@�̗[��@{�阖T@	P��2@[P$o�@�9.�d�@��2>�@k���W@gYA���@���S�@�#v#b5@C����@��*�@ ��� ��@"5�z�]@#xD�g�@%���cZ@&��ޔ�@(Q����@*�P{�@+��.}:�@-�7�=@/�h�T"@1�;V
K@2,L�tK�@3WP�/!M@4�i{�+@5��'_|@7%ЦE��@8��@@9��q��@;l�E�i@<�-�Ѧ@>�!3s@@��M@@���ܫ@AԵl���@B��߁@C�9��@D��E��A@E�v{]ĭ@F���ޤ@G�l��@H����jP@I�}gH&@K"<3Rm�        ?6����M?k+G4�?�x�Z}�?�d��#_H?�p5Z;n?�)�d��?�P�dN�?ׇ�G�a?�����?� G	?��+�w?�*���$�@�T,2ec@kL�	r@h� dD+@h����@eF{�7@=�2�W@"���q��@&e<�t@*��#��o@/����@2��hS&O@5�n��i7@9=$i��@=��5�z@@���[��@B��&�@�@EG=��	@G�io"�@J�)C���@M�!*�1@P����J�@RO�J��b@T-��5��@V*F��@XEz�%��@Z���ㆷ@\�n�Ro�@_Y���r@`�Wv>�@b]^��|@c�;_@�]@eUX$9�@f� GJ;�@h����I@jVp��O@l(�ps�@n¨��@p˃�V9@qk�.�@r"����@s@�*���@tk�s.l@u� � 3(@v��诫@x1	y͔<@y���G@z�����9@|g�c�)@}�v��q�@w?��p�@���3�        ?5��lDG?e���x!W?��6�gF?���)2�?�a�&�h?�I+ҁbs?��:c�=Q?�V�k_?ๆ�A�,?��|�?�4/jA�??���Xh&�@�C��X�@d��e8n@��F7|>@��O��5@��6��@L���@#�/�ו@'90|��P@+�уc��@0�#�U@3�����@7�C̔�@:ì3F@>���|[�@A���7�@D=��S��@F�t�@�@I�"Y�@M-@x�|@PUL�1�@R6�}�F@T<�G�a@Vh�a\k�@X��k�j�@[6�;���@]�%Ыw@`VP_�(@a�ڲ��@cj^��vQ@e�x&B#@f�zq�@h�� ���@j��R�v@l�D�u_�@n��FV��@p������@q�I6�@s���Y@tcR�2�s@u���(\8@w2=��@x�~2n#@zA�� 1@{�a�2<�@}��U8��@U~nW(#@���3��@��S�""�@���e�.@������@��Pym        ?�����w?��ȯD@iD���@�{?�r�@"3W��[�@-r?��@5���/@>bv��@D>o��@J��Ŗ@P_��'�@T"0Bl��@XW�sa+@]�Ř/@a��+9@c�g����@g*2��@jp����@n"G),�@q�Ϥ55@s;��@u�%���@x`z���@z��4���@}�'��\4@�R�A?@�����@���K�@�{O]��@�h�p�th@�qb��o�@���(��@��Vf�M@�����@�\�yd�@�������@�d/�G�@�/�י@��`�N�@���I�J@�?~�UH�@���Kj�D@��:qSK@���.��@����(��@����,�G@���{�h�@��)g��@@���c��@�G�/c�@�����@��˓�@�����@�jE$AU@�� �o��@�?��w'@��3�2H@��1R6>@�l^>yj�@�<��s��@��A�6�@��/���z@�ћ���        ?Xm�oS�?��>���?���S#0?�d�Re�?ö�Q+�x?��)�J�?ן�m�M�?�u(G��N?��H�&��?�.��=�?��ICD=?�����<?���r=�?��ឡ�:@q��@���\��@8�V�@e3b���@�|��@g�5�wd@ro�w>@����`Z@��K٭@Z?{��9@���@��U��'@!?~�n\s@"��v8Ҫ@$S��O��@%����"@'�~�b�@)�AT ��@+g#~��h@-^J�� �@/i�n��@0� 9Wn@1�syZ�@3^�H<@43��f@5n���@6���0�@8���[{@9]U��~"@:���r��@<3��^�$@=�8vi~@?5��y8�@@c��H@A2L��a@Bǂj#�@B�DQX�@C�ό�{C@D�(d�oX@E� ���'@F{ȟ�x�@Gq1 ���@Hlj��Sy@Im�h�N@Jt�\{��@K�zHb�@L�a�ts`@M�:�y�@N�lf�        ?A��s<&?u�$U?�y�sW?�ps��?�M$��Ul?�H-^1߽?�)74v¹?�]*��q?퍰}jr?��>�e�?��og���@5F�ލ�@����z@����{@-c�㠤@�!PU#f@#�V6�@'o�mh@,kz@$-�@1U�[@44Q�^@7�<>���@;��)w�@?�����@BX�R.{@D�%��k@G���d�G@J�޺��@M����9y@P��D)@R����E@T������@V�g��2+@X�3'���@[:���Q�@]�Ԫ��@`%{�-�o@a��B)��@b��Л@di�7��@e�ԁ�J@g��|��@i=�]�;@j��dg@�@l�L��h?@n��fd�@pE��p�@qC9�tF�@rHkdߴ�@sUs���B@tjY����@u�'s�#�@v���>\�@wؽP�-@y���T�@zJ蛁�N@{��1�H@|ް�"�@~5�/��@�u��@�=>��r@�8to�@���A�        ?P�h%�/y?�6�n6�?�Պ(�p�?��x#�S?����W�?��Zo0��?ۢm��b�?�=H\��0?�<�CX�?�1qkI�B?��e��cy@�z	ݺ�@S0�s^�@�kmL�9@���%@g��		@!�}�Tv@%�mo+3
@*�D�\@/;+&��@2���~41@5���+Qv@9e�چ�e@=eǿ�B�@@�c;e�@CM	�= �@E�K3`>@H�c���@Kϟς�@O���*@QP[�m��@S2��+l�@U4�� d@WV����@Y�*9��!@[���6@^�-^ӣF@`�&aV-@a�eﾦ@cx�{ߕ@e��K@f����@hSU��Q�@j?�j�@k���~@m�̭k�=@o�����@p����y�@rJ�)�'@s0��R�@t\����@u���Әj@v�K��i@x!�g;@yz^lC�@z���"@|O�8�ͅ@}̛����@UߞL.B@�u�]�p_@�G-Z��b@���#�3@��d�V7        ?�L��,�J?���ȗ�_@)�S��+@%E/����@3�����@@[��@Hpe�q�@Q��w%Z@V޵,�@]|���;@b}e��@S@f��b;�y@kQo	�x@p4|�n�@r��{Dl�@u�g�f&�@y>7K2@|�`ӶP�@�;�s�n@�9��E�@�X��5@���w���@����!i�@�~�����@�'�}�L�@�z�l�?�@��e��f@��a�x]�@�!�#x�D@��]��l�@���g� �@�{��9�L@�l�f��@�r���K�@�F�0�@�^^���@����P�[@��p#T:	@����g�@�'#-�@�t'l3g�@��(���@�.�F�@��*k%@�!���@����3�|@�Yv���@���	5��@��|��F�@��p�4e@�d�ig}f@�E�>+��@�,��8Nv@�=�z��@�	#Ũ�7@��3[f�@��i~��@�������@� 6��'v@�
�S�@�]0?;=@�/-�:@�H���}�        ?F��'��7?u|��%�?�����?�܅�(�)?�0,��?�^a��ܢ?�ϙ�8]�?΋���?�{���?ڑ��!i?��bS�?�ǝy�g�?�F�y��?�MՅIχ?��0��O�?�	Ox��?�o�w�p#?�+��V�@  >R�EL@Y�طN@ģ�4ˡ@b�8#(f@
6��x�@B�)�@CQ&�@+�	�0@����@�BH	6@�kC�С@=Z�L@�! ��p@$�|ā�@ ����@"Ph��E�@#��%؇@%]��1e@'n�E�@(��[t%3@*�r_��M@,�1�[@.��@�ʟ@0O�:�Ɠ@1jY��|@2��գ@3�<4��{@5����@6VBf���@7�6�!��@9��k^@:��M�@<mD�ʊ@=���v@?N&\��P@@pU���@A_1�&�X@BFfNS�@C5����@D+T�l׋@E)�aB	@F.w�~̅@G;h����@HO����@Il ���n        ?2<WZx�?hh��6�?��P��Yx?�t���N?��f�|	?�� M���?���w���?��H��,?�����|?���]�%?���[�C?���ۛ��@ɧ!��@�"�Œ�@*+�+�@��f��4@���%��@ &8�N@#�[,��m@'�Q�*�@,��Z�@0�&v���@3��Qv@7/h7��@:�&�}<@>����O�@A���d	@DSJ�@F������@Ii�[�K�@Lp��4�@O�Tvt��@Q�Ѽ�@Sv)�(*@Utr��@W�����R@Yպ���@\:�U���@^�"�Y@`�N�uǴ@b#��a��@c��p�\@e3�vSss@f�ĔSN�@h����6X@jh~א��@lP�i!�A@nO}]��v@p3����@qJ`��@rn&����@s��M�U@t��16@v&�c�#@wb"��@x�*m�9@zY_8�@{������@}m;Հ�X@s�ĕ@�^s�sT�@�=��/�+@�%RFjTB        ?#�W�CV�?WMp]x�?y
B�$ـ?�6d��H?�0�ǑF/?�_I`�{?Ã�?��?Ѝ=h�?ڀ�����?�?Y�2~�?��%$���?�&ah0k�?�8Um�5�@�1��@	�y�A7@�|��^2@R`�K�@��\5@ tj_���@$1�\hY@("�i4�L@,��$�w�@0��'�B�@3��#�{@7��w@:��@ �@>S�s��N@A;��Ey�@Cx��d@E�:�߉E@Hu��f�@K7.b�r;@N'u��S�@P�J��(�@RJ�J"x�@T
�Ԁ�@U�`���@W�����'@Y��0(@\ �X�@^>��l6�@`K�c���@a��ҤS@b�C\�;�@d#y��@e�f��)�@f�����@h|����@j�i8��@k��_w@mb����f@o&�o1�@p}K4>�@qpmK7K�@rl���t�@sr<�w�@t�\f��@u�A�/n@v�$�k+@w�<�	��@y!����@zc�'���@{�ӛ��        ?��Ϯ�T�?٘�� ,?�t{�X�r@
��Jz�@'���6:@$���2@/�^Jm;�@6h>aA��@>d�I�!�@C��/�@I\[m��k@O�pz(��@S[)(y�@WYЛ�@�@[�TM��@`d^�[��@c#Ū�z@f*΁pJ@i}x�3�Z@m���s�@p��_�RM@r�2�#��@u3�wK@w����ч@z='��6�@}$����@� ��ח@��	��>9@������t@�r����@�s�|<@��T�@y@����
�@�7g�֫F@�^6>�t�@����w|S@���oji@��{+>b[@� �}�@�a�@�x�#_T@�Ct}|6�@�#��7o�@�����@������@����֠K@��N􃍽@��T(�o@��ė @�Vh!V�@���k�@�������@�Z����@���a��@�E�<���@��K�1l�@�1��e�@�.P��@��v/ R@��4��r�@����k��@��:Zt�@�s�<&q        ?Fe�Jm�?t�9��?���	�?�o'
���?�)�%a?�t�[l�?ǥ�4h�?з����?֚<\�?ݍJ��
?�ӥ�[�?��`J)?��v5փ?񁬍�h?�����?���T�Ԁ?�>��$S8@	��X�@�xtd[@�~�i-@	�Ԛ���@<����<@{�yc��@~H7��@�8��@�����`@qd�;;@��a@�*�T@ ��^��@"�F0
@$/��ʑ@%�%�F@'�b|��+@)���Xm@+�:�yp'@-�1�@0#]�k@1Eq�=��@2~�rX�"@3���rc�@53�j<�@6|y�̦@7��C���@9ke�J�@:��c��1@<��9��@>?��ۭ�@?�/�$2�@@�.q�[A@A�+!� @B����c@C�e3e�@D��9�o�@E��QU�+@F��72q@H	e�S@I*<�iVJ@JW��:�@K�۾��@L�>���@N��fS�@O]G��         ?=��0w��?pd�j�?�Z}�� ?�I׹3�?�����h?��'��q.?�3,�$l?�6r�z�?�3����?������?�T��v�@Y����@><��@��Ɋ֖@�(�_u�@ i���Y@$�[,�I@)����e�@/��#��U@3M���@6�q�w@; T���@?�nNL$�@Bs�w�*@ELV�.%@Hh�T�@�@K�fcZ��@OuD���@Q��}��8@S���ԅp@V�(�g+@X�nj"N@[;c�E@]��b��/@`S� ��@a�r�ž�@co�|���@e�)c@fݓ��н@h�(���@j�*�y>~@l��|!@n��w���@ps�ɞj�@q�uڰ�P@r�|�'�@s�Ej=<�@uC����@v�ƒ��I@w�� s��@y^����@z�ϭ@|Y�(���@}�76)@�����@����gj8@�wj�"(5@�Z�\���@�EY��@�6��X��@�/%i>\@�.�����@�5J�(��        ?5�U�߄?f�~��Se?�餏��v?�(eKV��?�ҧ��*?��q�n�3?�!�0�R?ް�.mt�?�P`fK�?���=�?�l٩D�x@u0��J@
����@[`��@���qk�@��A_YP@#lН�	�@(@�iFx�@-�V���@2%���@p@5�l"��#@9�g-��}@>���k@AԹ��m@D��7	�@G�{~`=�@KĤ_e�@N�g
-)@QY��R�@SwU��n@U���C�@X$7ʈ��@Z�Z�͒$@]ka�u:�@`$��w�@a��~>'<@c>DH�e@d���k@f��$���@hz���@jb]��@l^�ߺ��@no��|h`@pKD����@qibJ�L@r��
�z�@s���D@u�)e@vR�����@w���(]{@yx� W@z�=�G��@{��d�S�@}���'��@$td?��@�fH4g�@�A�B�F�@�$~�h�@�9g@�X��)�@����yܖ@��3��$d@�	
Mf�1        ?�"h��,�?�50��֏?�\��S@��[��@�M��@�@*�.���@4![uy@<����Y@C�gY�@I���`@Phշ�@T�Czg�@Ya1P���@^�5�O�@b�FXw9�@f�{�@j����M@n`�vs��@q�����@t:��C�@wŴ�g@z:��d�@}���d,y@��A�6@���-�<�@���%N�6@��#zey@�D�Ӟ��@���_�C@�xr/M�@��Z�r�@�$��R�:@��{�;�@�^�P	sp@�LW
u@���L���@��/�I�@��grX@���@�@������@����,�>@�՘��S{@��#
t�@�TAlH4@���@�FE@��ۡ�r@�rni��@��´��@�t��q�5@�
���{/@���a� H@����XNr@���u�Y@�x�Zg6,@�gja|�@�]X|Ha�@�Zmp�NR@�^����@�j��z@�|����@��]�a�@�����BN@�޾]�O        ?M0��9F�?|����d?�WA�M��?��f�eI�?�gc�`�?°��V��?˃�O��5?����?�}g�=J]?�r��W-??�,9�?�N��pJ?���C!o�?�s���?��4[��?�l�$ D?�k#К�@ �վ�AG@<�('J�@�]�Z�@�C��1:@q���)1@�@�*�@�O���@�C
���@��>�;|@��+�@���p�@��ܐ@b+�@�{%�,~@!?����a@"���v�@$D���@%��5A�*@'$-�Q˝@(�ӊMi�@*|ҳ܎@,CTEz'�@.�Z��@0�����@1 �W��g@2���̍@3�s���@41M4�@5S�g�%@6���M@7�i>@b�@8�K9ێ~@:<���:@;��.X�'@<��݄@>O!��ʄ@?��a�L=@@��r�@A[� �@B!�����@B�'[
��@C�y���@D���0�@Eh��Y@FFp,�@G)&�l\        ?3�c���\?e<L��k�?����g�0?�nR���?�У;�G?���9Mhw?�^�/�?ش��V�D?��(Mm�?�\D�c$%?�Xw��?��L�.��@�%�%@��U2�@l���@	���V(@��J�j�@#��E�@(>���y@-e�⽚�@1�;��a@4���j�@8�|rQ�X@<�:��8@@��G5m@Cq��@E����F�@H�\�O�@K܄m��t@OP�U���@Q�ʈ���@S��?�y@U�,�\md@W�t�R@Zu��6�@]?Q�p	@_�Bf���@ao}�	E@c��O@d���A�C@fru>\~�@hOT���@jE��W��@lVP�^K�@n��4*�@pd��8w@q�@�T8@rԝX,@t"h��J@u~��g��@v�T.���@xd��W�@y� T�(2@{����-�@}2[��#�@~�"')�X@�[$
'�@�H�:6a@�>OfG��@�<��qI@�C�AS�@�SgP/�@�l��ii        ?,�3�%Գ?`D�e��	?�&��מi?�MY��\?�/T�$ ?�x$��b?ư�s��?�6���?��-榕@?疩�?��?�c� �?����h��@/�VH�@:=��	F@�Ud�X@�(��@R����a@��`��!@#����g�@'�Lts@,̂�6@1+�t7�@4G=��u�@7��ݼ@;�ݔ��@?�{��@B0�p��M@D�fl-�d@Gj_�K@JY��|O@M�+�Ps@Pq�y?��@RA?W�@T.�_o9�@V<8���T@Xi�gL�@Z��#��5@]' vA,B@_�ǧew@a6��@b����c@d �T \@e��j-��@gU#�Sb�@i �2@j֘��C@l�Dsh��@n�s\x��@pXIj�)]@qg	g�N�@r�����@s��P��d@tհ��q@v~�`��@wY*�g��@x����@z�\��@{y�4]��@|�R��!@~zY���@�Bp�cE@��($��@���ݧP!        ?�$���?�^�Ϻ��?�WD�$@�}���@`�W�@%X���"�@/�3�F�@6Nlu�&1@=�W����@C����)�@H�g�$]�@N�n��y�@R�����@V�Ȃ�0�@Z�N�;_@_]����@b>���@e
��n��@hyB�?G@kfF �#J@n��"��@qi�p'�@s|eH�@u���ꁠ@x3�3ʤ@z�Z&/�@}T�~}�N@�5��9@��Μ�@�BǶ>@�������@�ɣ��j@���)Ҥ�@���z���@��k�w�@��-M/@���y�@��)x�@�&�3ux�@�x+�6��@��]�_��@�D���*�@����@�I>ʸ �@���tG�@��U#���@�<;��(S@��m��@�i@%�@�Z��@�R��p�@�R�-D��@�Z�5S��@�j����@�����\@���
��@�ʛcO~�@���ӗD�@�2�	ꨨ@�sy�́@��L�{�|@����*@���Ob��        ?M��bav'?x�,:�<?�@�<�r?��]�:=?��n�?��?���E�3<?ǈ�2m�?�v79C{n?����?ܒR�o��?��]���?�F���&�?�
���1?�,x�x��?���(z�?�SEf8�<?�ך�:U?��[�{j @ ���EX@"����@�e���@��4@
�	.;�>@�	 ���@zHtw�@%� �
�@��i�@ˑ<,�\@ǣ�c�S@���@}@�r@g�O�@ l���@!�\h��@#
 #gWX@$pNG�@%�=DQ�@'j�3��<@(�� ,~s@*����b@,Y�ٷ�q@.n�K�A@/�R�p��@0�(�$��@1��u@2�f��/@3�3��� @5,���@6"^}��@7E���@8q�PA�:@9�[�@:�K�\yZ@<'A�rf�@=t���u^@>ʉ�KL�@@p�H�@@�ٵ�a@A���@B;lX�4f@B��d@C�>��
@D��t��        ?9�W�"�?ms�5A�?�ڔ�`?�x]So�!?�3��2�)?�Y����?����3Y?ݲ�57?�h��+�?��=OL�?�����-�@iz��@	y��6��@8�M���@ϱȽ��@�\�'��@"�x�Dݝ@'��q�'@-���K��@29=�3@6���7�@:�fR�}x@?�	�|�r@B��X�M]@E�U˴0b@IU'O���@M9����@P�{z�;r@S��^~�@U��	�z:@Xh���@[fBZ��@^����(@a	ЁǸ�@b�M����@d܄�Vw�@f��&�@i0�U�V
@k��6�@n}VE�@pVYW��@q�����@s,�����@t��3h@n@vKwH���@w����
�@y��b��m@{��U�>D@}i�\���@a�8�&�@�����V@��Z��ܢ@��@�_$�@�g"�@�2�V3��@�k��O�@����,o@�����@�W]�G��@����E�@�+"�0�c@��֑��@��ƈ��        ?$����E|?W54nW?x���+?�3���(�?���o���?���H�?�Dߢ�&?�^�nl�?�?�<F��?炐B���?�Ԅ�FE?�-���m@��f��@�J%�И@���Jn@�1��/@8�:�w�@ x�줆�@$f�6'@(�9_>-G@."�a�@2䏶ð@5UAr��X@9
I���@='���4j@@����@CVp^<�6@FX�O��@Iq��E@L4h�{@O��}[��@Q�����@S�k�Z�U@U��;�@XLo���@Zc$���@\��P5�@_�῝@a1Y9P�@b�sb�}7@d9S�'�@e��+�@g��'p�+@iV�آ�e@k3p�F��@m$��b�@o)#�%@p�Ps��@q�Y�Į�@rٺg�j@t�y���@u;����{@v|yjeZ�@w��~-�Z@y��]l@z~��?(@{�:��B*@}`�u�L^@~⊍�\�@�7�յt@�����@��ұ���@���$���        ?�	��?S?�'��ڹ?��(r2E�@	�iq��@F7>�\@#�]��U@-i� ]�h@4�4�vZ@;�U��@B4�S ��@G	|*%@L��0J�@Q|7UF�u@U���'�@X��eV�.@];��c�)@`���FV@c���Xi@f_&�#m8@ih�}m�@l�(��@p�C���@q�Q!��l@t��Ʌ@v,����f@xz��Z�@z쳊^�/@}�����@�#}���@��o��@�"S�u��@���A�@�v���ؚ@�B#,f��@�$��	@��\ 7@�,h(��r@�)�����@�H�Q@�t��J@��+'�b@��YW�d@�=��UJ@��_x�@�iT�C@�u����@���O�@�������@�iě�a@�cu��_]@�=��`�o@�����@��J�*�@������x@��a�ANp@�㑔�@��d���@��ݸaZO@�� 庇�@��Y�,5@�/VF�%�@�R�P�@�|�-ª